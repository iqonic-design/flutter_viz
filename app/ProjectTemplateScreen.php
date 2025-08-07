<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProjectTemplateScreen extends Model
{
    protected $table = 'project_template_screens';

    protected $fillable = [
        'name',
        'project_template_id',
        'status',
        'project_template_screen_image',
        'data'
    ];

    public function project_template()
    {
        return $this->belongsTo(ProjectTemplate::class,'project_template_id','id');
    }
}
