<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Category;
use App\Models\Genre;
use App\Models\Country;
use App\Models\MovieGenre;
use App\Models\Episode;

class Movie extends Model
{
    use HasFactory;
    public function category(){
        return $this->belongsTo(Category::class, 'category_id');
    }
    public function genre(){
        return $this->belongsTo(Genre::class, 'genre_id');
    }
    public function country(){
        return $this->belongsTo(Country::class, 'country_id');
    }
    public function movie_genres(){
        return $this->belongsToMany(Genre::class, 'movie_genres' , 'movie_id', 'genre_id');
    }
    public function episodes(){
        return $this->hasMany(Episode::class);
    }
}
