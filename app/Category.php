<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';

    protected $fillable = [ 'id', 'name', 'sequence' ];

    public function template(){
        if(auth()->user()->user_type == 'user')
        {
            return $this->hasMany(Template::class,'category_id','id')->where('status',1);
        } else {
            return $this->hasMany(Template::class,'category_id','id');
        }
    }

    public function component(){
        if(auth()->user()->user_type == 'user')
        {
            return $this->hasMany(Component::class,'category_id','id')->where('status',1);
        } else {
            return $this->hasMany(Component::class,'category_id','id');
        }
    }
    
}