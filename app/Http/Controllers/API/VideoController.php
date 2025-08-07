<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Video;
Use Auth;
use App\Http\Resources\VideoResource;


class VideoController extends Controller
{
    public function videoList(Request $request)
    {
        $video_list = Video::orderBy('created_at','desc');
        
        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $video_list->count();
            }
        }

        $video_list = $video_list->paginate($per_page);
        $items = VideoResource::collection($video_list);

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
        
        $result = Video::updateOrCreate(['id' => $request->id], $data);

        $message = "Video has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Video has been added successfully";
        }

        $response = [
            'status' => true,
            'message' => $message,
        ];
        return response()->json($response);
    }


    public function Delete(Request $request)
    {
        $video = Video::find($request->id);
        
        $message = "Video not found";
        $status = false;
        if($video!='') {
            $video->delete();
            $message = "Video has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
}