<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProjectTemplateScreenResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'                    => $this->id,
            'name'                  => $this->name,
            'screen_data'           => $this->data,
            'status'                => $this->status,
            'project_template_id'   => $this->project_template_id,
            'project_template_screen_image' => $this->project_template_screen_image,
            'created_at'            => $this->created_at,
            'updated_at'            => $this->updated_at
        ];
    }
}
