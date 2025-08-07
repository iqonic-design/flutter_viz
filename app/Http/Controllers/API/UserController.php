<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Screen;
use Validator;
use Hash;
Use Auth;
Use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Password;
use \Illuminate\Support\Facades\Storage;

class UserController extends Controller
{

    public function register(Request $request)
    {
        $input = $request->all();

        $validator= \Validator::make($request->all(), [
            'name'  => 'required|string',
            'email' => 'required|email|max:255|unique:users,email',
            'password' => 'required|min:6|max:255',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false,'message' => $validator->errors()->first()],400);
        }
        $password = $input['password'];
        $input['password'] = Hash::make($password);
        $user_data = User::create($input);

        $user_data['api_token'] = $user_data->createToken('auth_token')->plainTextToken;

        $message = 'User saved successfully';

        $response = [
            'status' => true,
            'message' => $message,
            'data' => $user_data
        ];
        return response()->json($response);
    }

    public function googleRegister(Request $request)
    {
        $input = $request->all();

        $user_data = User::where('email',$input['email'])->first();

        if( $user_data != null ) {
            $message = 'User login successfully';
        } else {
            $password = $input['email'];
            $input['password'] = Hash::make($password);
            $user_data = User::create($input);

            $message = 'User saved successfully';
        }
        $user_data['api_token'] = $user_data->createToken('auth_token')->plainTextToken;
        $response = [
            'status' => true,
            'message' => $message,
            'data' => $user_data
        ];
        return response()->json($response);
    }

    public function login()
    {
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){

            $user = Auth::user();
            $user_id = $user->id;
            // $user->save();

            $success = new UserResource($user);

            $success = collect($success)->toArray();
            $success['api_token'] = $user->createToken('auth_token')->plainTextToken;

            $success['login_at'] = $user->lastLoginAt();
            $success['previous_login_at'] = $user->previousLoginAt();
            return response()->json([ 'status' => true, 'message' => 'success' ,'data' => $success ], 200 );
        }
        else{
            $message = trans('auth.failed');

            return response()->json([ 'message' => $message ] ,400);
        }
    }

    public function userList(Request $request)
    {
        $user = User::where('user_type','user');
        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === 'all' ){
                $per_page = $user->count();
            }
        }
        $user = $user->orderBy('id','desc')->paginate($per_page);
        $items = UserResource::collection($user);

        $response = [
            'status' => true ,
            'message' => 'list' ,
            'pagination' => [
                'total_items' => $items->total(),
                'per_page' => $items->perPage(),
                'currentPage' => $items->currentPage(),
                'totalPages' => $items->lastPage(),
                'from' => $items->firstItem(),
                'to' => $items->lastItem(),
                'next_page' => $items->nextPageUrl(),
                'previous_page' => $items->previousPageUrl(),
            ],
            'data' => $items,
        ];
        return response()->json($response);
    }
/*
    public function screenList(Request $request)
    {
        $screen_list = Screen::where('user_id',$request->user_id)->get();

        return response()->json([ 'status' => true , 'message' => 'list' ,'data' => $screen_list ]);
    }

    public function screenSave(Request $request)
    {
        $data = $request->all();

        $result = Screen::updateOrCreate(['id' => $request->id], $data);

        $message = "Screen has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Screen has been added successfully";
        }

        $response = [
            'status' => true,
            'message' => $message,
            'data' =>  (object) [
                'id' => $result->id
            ]
        ];
        return response()->json($response);
    }


    public function screenDelete(Request $request)
    {
        $screen = Screen::find($request->id);

        $message = "Screen not found";
        $status = false;
        if($screen!='') {
            $screen->delete();
            $message = "Screen has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
 */
    public function updateProfile(Request $request)
    {
        $data = $request->all();
        $id =  !empty($request->id) ? $request->id : \Auth::user()->id;
        $user =  User::find($id);
       /*
        $user = User::where('email',$request->email)->first();
        if($user == null){
            return response()->json([ 'message' => 'Record not found'],400);
        }
        */
        if($user == null){
            return response()->json([ 'message' => 'Record not found'],400);
        }

        $rules = [
            // 'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email','max:255','unique:users,email,'.$user->id ]
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            return response()->json([ 'message' => $validator->getMessageBag()->first() ],400);
        }

        $user->fill($data)->update();

        // Save user Profile data...
        // dd( empty($user->userProfile) ? 'true' : 'false' );

        empty($user->userProfile) ? $user->userProfile()->create($request->all()) : $user->userProfile->fill($request->all())->update();

        $message = 'Profile updated';

        $user_data = User::find($user->id);
        $user_detail = new UserResource($user_data);
        return response()->json([ 'status' => true, 'message' => $message, 'data' => $user_detail ]);
    }

    public function changePassword(Request $request){
        $user = User::where('id',\Auth::user()->id)->first();

        if($user == "") {
            $message = trans('auth.user_not_found');
            return response()->json([ 'message' => $message ] ,400);
        }

        $hashedPassword = $user->password;

        $match = Hash::check($request->old_password, $hashedPassword);

        $same_exits = Hash::check($request->new_password, $hashedPassword);
        if ($match)
        {
            if($same_exits){
                $message = trans('auth.old_new_pass_same');
                return response()->json([ 'message' => $message ] ,400);
            }

			$user->fill([
                'password' => Hash::make($request->new_password)
            ])->save();

            $message = trans('auth.password_change');
            return response()->json([ 'message' => $message ] ,200);
        }
        else
        {
            $message = trans('auth.valid_password');
            return response()->json([ 'message' => $message ]);
        }
    }
    public function forgot() {
        $credentials = request()->validate(['email' => 'required|email']);

        Password::sendResetLink($credentials);
        $message = trans('auth.reset_password');
        return response()->json([ 'message' => $message ] ,200);
    }

    public function saveUserFiles(Request $request)
    {
        $user = \Auth::user();
        $user_id = $user->id;
        $filename = $request->file_name;
        $file_content = $request->file_content;
        $project_name = $request->project_name;

        $user_folder_naming = $user_id.'/'.$project_name; //only naming the folder name like 3/project
 
        $dir = Storage::disk('public')->makeDirectory($user_folder_naming); //storing file in storage/app/public

        $user_project_created_path = storage_path('app/public/'.$user_folder_naming); // /srv/http/mobile/fluttervizapi/storage/app/public/3/NewStart
      
        $message = 'File Saved';

        $default_project_structure = storage_path('app/public/flutterviz');
        
        $user_project_folder = storage_path('app/public/'.$user_folder_naming);

        \File::copyDirectory($default_project_structure,$user_project_folder); // it copy base statuture in user project stuture and copy perfectly fine.
        if($request->is_project_delete == true)
        {
            // delete project zip and remove all file from folder
            if (file_exists($user_project_created_path.'.zip')) {
                unlink($user_project_created_path.'.zip');
            }
            if(is_dir($dir)){
                Storage::deleteDirectory('public/')->deleteDirectory($dir);
            }
            $message = 'File deleted';
        }
        Storage::disk('public')->put($user_folder_naming.'/lib/'.$filename, $file_content);

        $url = '';
        if($request->is_project_zip == true)
        {
            // create zip of project_name folder, return zip url
            createFolderZip($user_id, $project_name);
            $url = asset('storage/'.$user_id.'/'.$project_name.'.zip');
            $message = 'File created';
        }
        $response = [
            'message' => $message,
            'url' => $url,
        ];
        return response()->json($response);
    }
    
    public function downloadUserProject(Request $request)
    {
        $user = \Auth::user();
        $user_id = $user->id;
        $filename = $request->file_name;
        $file_content = $request->file_content;
        $project_name = $request->project_name.'_'.time();

        $user_folder_naming = $user_id.'/'.$project_name; //only naming the folder name like 3/project
 
        Storage::disk('public')->makeDirectory($user_folder_naming); //storing file in storage/app/public

        $user_project_created_path = storage_path('app/public/'.$user_folder_naming); // /srv/http/mobile/fluttervizapi/storage/app/public/3/NewStart
      
        $message = 'File Saved';

        $default_project_structure = storage_path('app/public/flutterviz');
        
        $user_project_folder = storage_path('app/public/'.$user_folder_naming);
        if(is_dir(storage_path('app/public/'.$user_id))){
            deleteDirectory(storage_path('app/public/'.$user_id));
        }
        \File::copyDirectory($default_project_structure,$user_project_folder); // it copy base statuture in user project stuture and copy perfectly fine.
        
        foreach ($request->contents as $value) {
            Storage::disk('public')->put($user_folder_naming.'/lib/'.$value['file_name'], $value['file_content']);
        }

        $url = '';
        if($request->is_project_zip == true)
        {
            // create zip of project_name folder, return zip url
            createFolderZip($user_id, $project_name);
            $url = asset('storage/'.$user_id.'/'.$project_name.'.zip');
            $message = 'File created';
        }
        $response = [
            'message' => $message,
            'url' => $url,
        ];
        return response()->json($response);
    }
    public function updateProfileImage(Request $request){
        $user = \Auth::user();
        if($request->has('id') && !empty($request->id)){
            $user = User::where('id',$request->id)->first();
        }
        if($user == null){
            $message = "No Record Found";
            return response()->json([ 'status' => false, 'message' => $message]);
        }
        if(isset($request->profile_image) && $request->profile_image != null ) {
            $user->clearMediaCollection('profile_image');
            $user->addMediaFromRequest('profile_image')->toMediaCollection('profile_image');
        }
        $user_data = User::find($user->id);

        $message = "Profile image updated successfully";
        $user_data['profile_image'] = getSingleMedia($user_data,'profile_image',null);
        return response()->json([ 'status' => true, 'message' => $message, 'data' => $user_data ]);
    }
}
