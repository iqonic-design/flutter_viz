<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ScreenResource extends JsonResource
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
            'id'            => $this->id,
            'name'          => $this->name,
            'user_id'       => $this->user_id,
            'project_id'    => $this->project_id,
            'data'          => $this->data,
            'screen_image'  => $this->screen_image,
            'created_at'    => $this->created_at,
            'updated_at'    => $this->updated_at
        ];
    }
}
