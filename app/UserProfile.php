<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserProfile extends Model
{
    protected $fillable = [
        'user_id', 'description', 'dob', 'gender','country_id', 'state_id', 'city_id','contact_number', 'designation','no_of_project', 'linkdin_url', 'twitter_url', 'stackoverflow_url', 'facebook_url', 'dribbble_url','pinterest_url', 'github_url', 'uplabs_url', 'instagram_url','is_darkmode', 'language_code'
    ];

    public function users() {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function country(){
        return $this->belongsTo(Country::class, 'country_id','id');
    }

    public function state(){
        return $this->belongsTo(State::class, 'state_id','id');
    }

    public function city(){
        return $this->belongsTo(City::class, 'city_id','id');
    }
}
