<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\ProjectTemplate;
use App\ProjectTemplateScreen;
use App\Project;
use App\Http\Resources\ProjectTemplateResource;


class ProjectTemplateController extends Controller
{
    public function projectTemplateList(Request $request)
    {
        $project_template_list = new ProjectTemplate;
        
        if($request->has('user_id') && !empty($request->user_id)){
            $project_template_list = $project_template_list->where('user_id',$request->user_id);
        }

        if($request->has('status') && isset($request->status)){
            $project_template_list = $project_template_list->where('status',$request->status);
        }

        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page)){
                $per_page = $request->per_page;
            }
            if($request->per_page === '-1' ){
                $per_page = $project_template_list->count();
            }
        }

        $project_template_list = $project_template_list->orderBy('created_at','desc')->paginate($per_page);
        $items = ProjectTemplateResource::collection($project_template_list);

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
        
        $result = ProjectTemplate::updateOrCreate(['id' => $request->id], $data);

        $message = "Project template has been updated successfully";
        if($result->wasRecentlyCreated)
        {
            $message = "Project template has been added successfully";
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

    public function saveProjectTemplateAsProject(Request $request)
    {
        $project_template = ProjectTemplate::where('id',$request->project_template_id)->where('status',1)->first();

        $message = 'Project template not found';

        if($project_template == null)
        {
            return response()->json([ 'status' => false , 'message' => $message ]);
        }
        $template_data = [
            'id' => null,
            'name' => $request->name,
            'user_id' => $request->user_id,
        ];
        
        $result = Project::updateOrCreate(['id' => $template_data['id']], $template_data);

        $project_screen = $project_template->projectTemplateScreen->where('status',1);

        if(count($project_screen) > 0) {
            foreach($project_screen as $screen) {
                $service_data = [
                    'project_id'    => $result->id,
                    'user_id'       => $result->user_id,
                    'name'          => $screen->name,
                    'data'          => $screen->data,
                    'screen_image'  => $screen->project_template_screen_image,
                    
                ];
                $result->projectScreen()->insert($service_data);
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

    public function Delete(Request $request)
    {
        $project_template = ProjectTemplate::find($request->id);
        
        $message = "Project template not found";
        $status = false;
        if($project_template!='') {
            $project_template->delete();
            $message = "Project template has been delete successfully";
            $status = true;
        }

        return response()->json([ 'status' => $status , 'message' => $message ]);
    }
    
}