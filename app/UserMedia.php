<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class UserMedia extends Model implements HasMedia
{
    use InteractsWithMedia;
    protected $table = 'user_media';
    protected $fillable = [
        'user_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function scopeMyAttachment($query)
    {
        if(auth()->user()->user_type == 'admin') {
            return $query;
        }

        if(auth()->user()->user_type == 'user') {
            return $query->where('user_id', auth()->user()->id);
        }

        return $query;
    }
}
