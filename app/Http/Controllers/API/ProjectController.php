<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Project;
use App\Http\Resources\ProjectResource;
use Carbon\Carbon;

class ProjectController extends Controller
{
    public function projectList(Request $request)
    {
        $project_list = new Project;
        
        if($request->has('user_id') && !empty($request->user_id)){
            $project_list = $project_list->where('user_id',$request->user_id);
        }

        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $project_list->count();
            }
        }

        $project_list = $project_list->orderBy('created_at','desc')->paginate($per_page);
        $items = ProjectResource::collection($project_list);

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

    public function store(Request $request){
        $data = $request->all();
        
        $result = Project::updateOrCreate(['id' => $request->id], $data);

        $message = "Project has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Project has been added successfully";
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


    public function Delete(Request $request)
    {
        $project = Project::find($request->id);
        
        $message = "Project not found";
        $status = false;
        if($project!='') {
            $project->delete();
            $message = "Project has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
    public function projectClone(Request $request)
    {
        $user = \Auth::user();
        $user_id = $user->id;

        $project = Project::where('id',$request->project_id)->first();

        $message = 'Project not found';

        if($project == null)
        {
            return response()->json([ 'status' => false , 'message' => $message ]);
        }
        $project_data = [
            'id' => null,
            'name' => $request->name,
            'user_id' => $user_id,
        ];
        
        $result = Project::updateOrCreate(['id' => $project_data['id']], $project_data);

        $project_screen = $project->projectScreen;

        if(count($project_screen) > 0) {
            foreach($project_screen as $screen) {
                $project_screen_data = [
                    'project_id'    => $result->id,
                    'user_id'       => $result->user_id,
                    'name'          => $screen->name,
                    'data'          => $screen->data,
                ];
                $result->projectScreen()->insert($project_screen_data);
            }
        }
        $message = "Project has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Project has been added successfully";
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

    public function projectLastTime(Request $request){
        $project_data = Project::find($request->project_id);
        $project_data->updated_at = $request->updated_at ? $request->updated_at : Carbon::now()->timestamp;    
        $save = $project_data->save();
        if($save){
            $message = "Project has been updated successfully";
            $status = true;
        }else {
            $message = "Project has not been updated";
            $status = false;

        }
        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
}