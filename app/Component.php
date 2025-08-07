<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Component extends Model
{
    protected $table = 'components';

    protected $fillable = [
        'name',
    	'category_id',
        'screen_data',
        'status'
    ];

    public function category(){
        return $this->belongsTo(Category::class,'category_id','id');
    }
}
