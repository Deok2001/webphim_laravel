<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Category;
use App\Models\Genre;
use App\Models\Country;
use App\Models\Movie;
use App\Models\Episode;
use App\Models\MovieGenre;
use App\Models\Rating;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Carbon\Carbon;
use Illuminate\Support\Facades\File;

class CreateSiteMap extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sitemap:create';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $sitemap = App::make('sitemap');
        $sitemap->add(route('homepage'), Carbon::now('Asia/Ho_Chi_Minh'), '1.0', 'daily');
        // Get all genre from DB
        $genre = Genre::orderBy('id','DESC')->where('status','1')->get();
        foreach($genre as $gen){
            $sitemap->add(env('APP_URL'). "/the-loai/{$gen->slug}" ,Carbon::now('Asia/Ho_Chi_Minh'), '0.7', 'daily');
        }
        // Get all category from DB
        $category = Category::orderBy('id','DESC')->where('status','1')->get();
        foreach($category as $cate){
            $sitemap->add(env('APP_URL'). "/danh-muc/{$cate->slug}" ,Carbon::now('Asia/Ho_Chi_Minh'), '0.7', 'daily');
        }
        // Get all country from DB
        $country = Country::orderBy('id','DESC')->where('status','1')->get();
        foreach($country as $count){
            $sitemap->add(env('APP_URL'). "/quoc-gia/{$count->slug}" ,Carbon::now('Asia/Ho_Chi_Minh'), '0.7', 'daily');
        }
        // Get all movie from DB
        $movie = Movie::orderBy('id','DESC')->where('status','1')->get();
        foreach($movie as $mov){
            $sitemap->add(env('APP_URL'). "/phim/{$mov->slug}" ,Carbon::now('Asia/Ho_Chi_Minh'), '0.6', 'daily');
        }
        // Get all yaer from DB
        $year = range(Carbon::now('Asia/Ho_Chi_Minh')->year, 2000);
        foreach($year as $year){
            $sitemap->add(env('APP_URL'). "/nam/{$year}" ,Carbon::now('Asia/Ho_Chi_Minh'), '0.6', 'daily');
        }
        // Get all episode from DB
        $movie_ep = Movie::orderBy('id','DESC')->where('status','1')->get();
        $episode = Episode::all();
        foreach($movie_ep as $mov_ep){
            foreach($episode as $ep){
                if($mov_ep->id == $ep->movie_id){
                    $sitemap->add(env('APP_URL'). "/xem-phim/{$mov_ep->slug}/tap-{$ep->episode}" ,Carbon::now('Asia/Ho_Chi_Minh'), '0.6', 'daily');
                }
            }
        }
        $sitemap->store('xml', 'sitemap');
        if (File::exists(public_path() . '/sitemap.xml')) {
            File::copy(public_path('sitemap.xml'), base_path('sitemap.xml')); 
        }
    }
}
