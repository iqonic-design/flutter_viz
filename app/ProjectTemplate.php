<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProjectTemplate extends Model
{
    protected $table = 'project_templates';

    protected $fillable = [
        'name', 'status'
    ];

    public function projectTemplateScreen(){
        return $this->hasMany(ProjectTemplateScreen::class, 'project_template_id','id');
    }

    protected static function boot()
    {
        parent::boot();
        static::deleted(function ($row) {
            $row->projectTemplateScreen()->delete();
        });
    }
}
