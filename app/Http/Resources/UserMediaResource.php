<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserMediaResource extends JsonResource
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
            'user_id'       => $this->user_id,
            'username'      => optional($this->user)->name,
            'user_attachment'=> getSingleMedia($this, 'user_attachment'),
            'created_at'    => $this->created_at,
            'updated_at'    => $this->updated_at
        ];
    }
}
