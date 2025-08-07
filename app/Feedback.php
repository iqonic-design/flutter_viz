<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Feedback extends Model implements HasMedia
{
    use InteractsWithMedia;
    protected $table = 'feedback';
    protected $fillable = [
        'user_id', 'type', 'description'
    ];


    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }
}
