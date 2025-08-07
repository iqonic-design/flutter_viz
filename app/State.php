<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    protected $table = "states";
    protected $primaryKey = "id";
    
    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id','id');
    }

	public function cities()
    {
        return $this->hasMany(City::class, 'country_id','id');
    }
}
