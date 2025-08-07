<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Screen extends Model
{
    protected $table = 'screens';

    protected $fillable = [
    	'user_id',
        'name',
        'project_id',
        'data',
        'screen_image'
    ];
}
