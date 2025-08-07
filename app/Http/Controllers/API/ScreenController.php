<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Screen;
use App\Http\Resources\ScreenResource;


class ScreenController extends Controller
{
    public function screenList(Request $request)
    {
        $screen_list = new Screen;
        
        if($request->has('user_id') && !empty($request->user_id) ){
            $screen_list = $screen_list->where('user_id',$request->user_id);
        }

        if($request->has('project_id') && !empty($request->project_id)){
            $screen_list = $screen_list->where('project_id',$request->project_id);
        }

        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $screen_list->count();
            }
        }
        $screen_list = $screen_list->orderBy('created_at','desc')->paginate($per_page);
        $items = ScreenResource::collection($screen_list);

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


    public function Delete(Request $request)
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
    
}