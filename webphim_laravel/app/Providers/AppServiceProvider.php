<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Models\Category;
use App\Models\Genre;
use App\Models\Country;
use App\Models\Movie;
use App\Models\Episode;
use App\Models\MovieGenre;
use App\Models\Rating;
use App\Models\Info;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $info = Info::where('status', '1')->get();
        $phimhot_sidebar = Movie::where('phim_hot', 1)->where('status', 1)->orderby('updated_at','DESC')->take(10)->get();
        $phimhot_trailer = Movie::where('resolution', 5)->where('status', 1)->orderby('updated_at','DESC')->take(10)->get();
        $category = Category::orderBy('id', 'DESC')->where('status',1)->get();
        $genre = Genre::orderBy('id', 'DESC')->get();
        $country = Country::orderBy('id', 'DESC')->get();
        //total admin
        $category_total = Category::where('status', '1')->get()->count();
        $genre_total = Genre::where('status', '1')->get()->count();
        $country_total = Country::where('status', '1')->get()->count();
        $movie_total = Movie::where('status', '1')->get()->count();


        View::share([
            'info_home'=> $info,
            'phimhot_sidebar'=> $phimhot_sidebar,
            'phimhot_trailer'=> $phimhot_trailer,

            'category_home'=> $category,
            'genre_home'=> $genre,
            'country_home'=> $country,

            //total admin
            'category_total'=> $category_total,
            'genre_total'=> $genre_total,
            'country_total'=> $country_total,
            'movie_total'=> $movie_total,
        ]);
    }
}
