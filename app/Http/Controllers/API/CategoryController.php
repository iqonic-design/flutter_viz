<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Category;
use App\Template;
use App\Component;
use Validator;
use Hash;
Use Auth;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\CategoryTemplateResource;

class CategoryController extends Controller
{
    public function categoryList(Request $request){

        $category = Category::orderBy('sequence','asc');
        
        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $category->count();
            }
        }
        $category = $category->paginate($per_page);
        $items = CategoryResource::collection($category);

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

    public function categoryTemplateList(Request $request)
    {
        $category = Category::with('template');
        
        if($request->has('category_id') && !empty($request->category_id)){
            $category = $category->where('id',$request->category_id);
        }
        
        if(auth()->user()->user_type != 'admin'){
            $category = $category->whereHas('template', function ($q) use ($request) {
                $q->where('status', 1 );
            });
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
        
        $category = $category->orderBy('sequence','asc')->paginate($per_page);
        $items = CategoryTemplateResource::collection($category);

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
        
        $result = Category::updateOrCreate(['id' => $request->id], $data);

        $message = "Category has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Category has been added successfully";
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
        $category = Category::find($request->id);
        
        $message = "Category not found";
        $status = false;
        if($category!='') {
            $template = Template::where('category_id',$request->id)->first();

            if($template != null){
                return response()->json([ 'status' => 400 , 'message' => 'Template have category , so you can\'t delete.' ]);
            }

            $component = Component::where('category_id',$request->id)->first();

            if($component != null){
                return response()->json([ 'status' => 400 , 'message' => 'Component have category , so you can\'t delete.' ]);
            }
            $category->delete();
            $message = "Category has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
}