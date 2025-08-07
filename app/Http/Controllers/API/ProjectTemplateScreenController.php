<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\ProjectTemplateScreen;
use App\Http\Resources\ProjectTemplateScreenResource;


class ProjectTemplateScreenController extends Controller
{
    public function projectTemplateScreenList(Request $request)
    {
        $list_query = new ProjectTemplateScreen;
        
        if($request->has('project_template_id') && !empty($request->project_template_id)){
            $list_query = $list_query->where('project_template_id',$request->project_template_id);
        }

        if($request->has('status') && isset($request->status) ){
            $list_query = $list_query->where('status',$request->status);
        }

        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $list_query->count();
            }
        }

        $project_template_screen_list = $list_query->orderBy('created_at','desc')->paginate($per_page);
        $items = ProjectTemplateScreenResource::collection($project_template_screen_list);

        $response = [
            'status' => true ,
            'message' => 'list',
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
        
        $result = ProjectTemplateScreen::updateOrCreate(['id' => $request->id], $data);

        $message = "Project template screen has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Project template screen has been added successfully";
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
        $project_template = ProjectTemplateScreen::find($request->id);
        
        $message = "Project template screen not found";
        $status = false;
        if($project_template!='') {
            $project_template->delete();
            $message = "Project template screen has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
}