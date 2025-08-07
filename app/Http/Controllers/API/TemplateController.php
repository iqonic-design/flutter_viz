<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Template;
Use Auth;
use App\Http\Resources\TemplateResource;


class TemplateController extends Controller
{
    public function templateList(Request $request)
    {
        $template_list = Template::with('category');
        
        if($request->has('category_id')){
            $template_list = $template_list->where('category_id',$request->category_id);
        }
        
        if(auth()->user()->user_type != 'admin'){
            $template_list = $template_list->where('status',1);
        }
        $template_list = $template_list->orderBy('created_at','desc')->paginate(10);
        $items = TemplateResource::collection($template_list);

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
        
        $result = Template::updateOrCreate(['id' => $request->id], $data);

        $message = "Template has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Template has been added successfully";
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
        $template = Template::find($request->id);
        
        $message = "Template not found";
        $status = false;
        if($template!='') {
            $template->delete();
            $message = "Template has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
}