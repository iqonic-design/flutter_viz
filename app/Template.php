<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
    protected $table = 'templates';

    protected $fillable = [
        'name',
    	'category_id',
        'screen_data',
        'template_image',
        'status'
    ];

    public function category(){
        return $this->belongsTo(Category::class,'category_id','id');
    }
}
