<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProjectTemplateResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $project_template_screen = $this->projectTemplateScreen->where('status',1)->first();
        
        return [
            'id'            => $this->id,
            'name'          => $this->name,
            'status'        => $this->status,
            'created_at'    => $this->created_at,
            'updated_at'    => $this->updated_at,
            'project_template_screen' => new ProjectTemplateScreenResource($project_template_screen), // $this->projectTemplateScreen->where('status',1)->first()
            'project_template_screen_count' => optional($this->projectTemplateScreen)->where('status',1)->count()
        ];
    }
}
