<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'email'         => $this->email,
            'user_type'     => $this->user_type,
            'description'   =>  optional($this->userProfile)->description,
            'dob'           =>  optional($this->userProfile)->dob,
            'gender'        =>  optional($this->userProfile)->gender,
            'country_id'    => optional($this->userProfile)->country_id,
            'country_name'  => !empty($this->userProfile) && !empty($this->userProfile->country) ? $this->userProfile->country->name : null,
            'state_id'          => optional($this->userProfile)->state_id,
            'state_name'  => !empty($this->userProfile) && !empty($this->userProfile->state) ? $this->userProfile->state->name : null,
            'city_id'           => optional($this->userProfile)->city_id,
            'city_name'  => !empty($this->userProfile) && !empty($this->userProfile->city) ? $this->userProfile->city->name : null,
            'contact_number'    => optional($this->userProfile)->contact_number,
            'designation'           =>  optional($this->userProfile)->designation,
            'no_of_project'           =>  optional($this->userProfile)->no_of_project,
            'linkdin_url'           =>  optional($this->userProfile)->linkdin_url,
            'twitter_url'           =>  optional($this->userProfile)->twitter_url,
            'stackoverflow_url'     =>  optional($this->userProfile)->stackoverflow_url,
            'facebook_url'          =>  optional($this->userProfile)->facebook_url,
            'dribbble_url'          =>  optional($this->userProfile)->dribbble_url,
            'pinterest_url'         =>  optional($this->userProfile)->pinterest_url,
            'github_url'            =>  optional($this->userProfile)->github_url,
            'uplabs_url'            =>  optional($this->userProfile)->uplabs_url,
            'instagram_url'         =>  optional($this->userProfile)->instagram_url,
            'is_darkmode'           =>  optional($this->userProfile)->is_darkmode,
            'language_code'         =>  optional($this->userProfile)->language_code,
            'created_at'    => $this->created_at,
            'updated_at'    => $this->updated_at,
            'profile_image'     => getSingleMedia($this, 'profile_image',null)
        ];
    }
}
