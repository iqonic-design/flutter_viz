<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Feedback;
Use Auth;
use App\Http\Resources\FeedbackResource;


class FeedbackController extends Controller
{
    public function feedbackList(Request $request)
    {
        $feedback_list = Feedback::with('user');
        
        $feedback_list = $feedback_list->orderBy('created_at','desc')->paginate(10);
        $items = FeedbackResource::collection($feedback_list);

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
        
        $result = Feedback::updateOrCreate(['id' => $request->id], $data);

        // storeMediaFile($result,$request->image,'feedback_image');
        $message = "Feedback has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Feedback has been added successfully";
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
        $template = Feedback::find($request->id);
        
        $message = "Feedback not found";
        $status = false;
        if($template!='') {
            $template->delete();
            $message = "Feedback has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
}