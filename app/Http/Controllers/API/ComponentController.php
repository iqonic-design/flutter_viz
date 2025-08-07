<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\Category;
use App\Component;
use App\Http\Resources\CategoryComponentResource;
use App\Http\Resources\ComponentResource;

class ComponentController extends Controller
{
    public function categoryComponentList(Request $request)
    {
        $category = Category::with('component');
        
        if($request->has('category_id') && !empty($request->category_id)){
            $category = $category->where('id',$request->category_id);
        }

        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $category->count();
            }
        }
        
        $category = $category->orderBy('sequence','desc')->paginate($per_page);
        $items = CategoryComponentResource::collection($category);

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

    public function componentList(Request $request)
    {
        $component_list = Component::with('category');
        
        if($request->has('category_id') && !empty($request->category_id)){
            $component_list = $component_list->where('category_id',$request->category_id);
        }
        
        if(auth()->user()->user_type != 'admin'){
            $component_list = $component_list->where('status',1);
        }
        
        $per_page = config('constant.PER_PAGE_LIMIT');
        
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $component_list->count();
            }
        }

        $component_list = $component_list->orderBy('created_at','desc')->paginate($per_page);
        $items = ComponentResource::collection($component_list);

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
        
        $result = Component::updateOrCreate(['id' => $request->id], $data);

        $message = "Component has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Component has been added successfully";
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

    public function delete(Request $request)
    {
        $component = Component::find($request->id);
        
        $message = "Component not found";
        $status = false;
        if($component!='') {
            $component->delete();
            $message = "Component has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
}
