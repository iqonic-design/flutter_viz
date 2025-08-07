<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $table = 'projects';

    protected $fillable = [
        'name', 'user_id'
    ];
    
    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function projectScreen(){
        return $this->hasMany(Screen::class, 'project_id','id');
    }

    protected static function boot()
    {
        parent::boot();
        static::deleted(function ($row) {
            $row->projectScreen()->delete();
        });
    }
}
