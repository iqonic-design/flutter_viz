<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\UserMedia;
Use Auth;
use App\Http\Resources\UserMediaResource;

class UserMediaController extends Controller
{

    public function usermediaList(Request $request)
    {
        $usermedia_list = UserMedia::myAttachment()->with('user');

        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $usermedia_list->count();
            }
        }

        $usermedia_list = $usermedia_list->orderBy('created_at','desc')->paginate($per_page);
        $items = UserMediaResource::collection($usermedia_list);

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

    public function store(Request $request)
    {
        $data = $request->all();
        $data['user_id'] = auth()->user()->id;

        if($request->has('attachment_count')) {
            for($i = 0 ; $i < $request->attachment_count ; $i++){
                $attachment = "user_attachment_".$i;
                $result = UserMedia::updateOrCreate(['id' => $request->id], $data);
                if($request->$attachment != null){
                    // $file[] = $request->$attachment;
                    storeMediaFile($result,$request->$attachment, 'user_attachment');
                }
            }
        }
        $message = "Media has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Media has been added successfully";
        }

        $response = [
            'status' => true,
            'message' => $message,
        ];
        return response()->json($response);
    }


    public function Delete(Request $request)
    {
        $usermedia = UserMedia::find($request->id);

        $message = "Media not found";
        $status = false;
        if($usermedia != '') {
            $usermedia->clearMediaCollection('user_attachment');
            $usermedia->delete();
            $message = "Media has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }

}
