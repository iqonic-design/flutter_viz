<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FeedbackResource extends JsonResource
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
            'type'          => $this->type,
            'description'   => $this->description,
            'username'      => optional($this->user)->name,
            'user_email'      => optional($this->user)->email,
            'created_at'    => $this->created_at,
            'updated_at'    => $this->updated_at
        ];
    }
}
