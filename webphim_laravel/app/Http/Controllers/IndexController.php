<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Models\Genre;
use App\Models\Country;
use App\Models\Movie;
use App\Models\Episode;
use App\Models\MovieGenre;
use App\Models\Rating;
use App\Models\Info;
use Illuminate\Support\Facades\DB;


use Illuminate\Http\Request;

class IndexController extends Controller
{
    public function home(){
        $phimhot = Movie::withCount('episodes')->where('phim_hot', 1)->where('status', 1)->orderby('updated_at','DESC')->get();
        // dd($phimhot);
        $category_home = Category::with(['movie'=> function($q){$q->withCount('episodes')->where('status',1);}])->orderBy('id', 'DESC')->where('status',1)->get();

        return view('pages.home', compact( 'category_home', 'phimhot'));
    }
    public function search(){
        if(isset($_GET['search'])){
            $search = $_GET['search'];
            
            $movie = Movie::withCount('episodes')->where('title','LIKE', '%'.$search.'%')->orderby('updated_at','DESC')->paginate(12);
            return view('pages.search',compact('search', 'movie')); 
    }else {
        return redirect()->to('/');
    }
    }
    public function filter(){
        $order = $_GET['order'];
        $genre_get = $_GET['genre'];
        $country_get = $_GET['country'];
        $year_get = $_GET['year'];

        if($order == '' && $genre_get == '' && $country_get == '' && $year_get == ''){
            return redirect()->back();
        }else{
            $movie = Movie::withCount('episodes');
            if($genre_get){
                $movie = $movie->where('genre_id', '=', $genre_get);
            }elseif($country_get){
                $movie = $movie->where('country_id', '=', $country_get);
            }elseif($year_get){
                $movie = $movie->where('year', '=', $year_get);
            }elseif($order){
                $movie = $movie->orderBy('title', 'ASC');
            }
            $movie = $movie->orderBy('updated_at','DESC')->paginate(40);
            return view('pages.filter',compact( 'movie'));
            
        }
    }
    public function category($slug){
        $cate_slug = Category::where('slug',$slug)->first();
        $movie = Movie::withCount('episodes')->where('category_id',$cate_slug->id)->orderby('updated_at','DESC')->paginate(12);
        return view('pages.category',compact('cate_slug', 'movie'));

    }
    public function genre($slug){
        
        $genre_slug = Genre::where('slug',$slug)->first();
        ///Nhiều thể loại
        $movie_genre = MovieGenre::where('genre_id',$genre_slug->id)->get();
        $many_genre = [];
        foreach($movie_genre as $key => $value){
            $many_genre[] = $value->movie_id;
        }
        // return response()->json($many_genre);
        $movie = Movie::withCount('episodes')->whereIn('id',$many_genre)->orderby('updated_at','DESC')->paginate(40);
        return view('pages.genre', compact('genre_slug', 'movie'));

    }
    public function country($slug){
        $country_slug = Country::where('slug',$slug)->first();
        $movie = Movie::withCount('episodes')->where('country_id',$country_slug->id)->orderby('updated_at','DESC')->paginate(12);
        return view('pages.country', compact( 'country_slug', 'movie'));

    }
    public function movie($slug){
        $movie = Movie::with('category', 'genre', 'country', 'movie_genres', 'episodes')->where('slug',$slug)->where('status',1)->first();
        $related = Movie::with('category', 'genre', 'country')->where('category_id',$movie->category->id)->orderby(DB::raw('RAND()'))->whereNotIn('slug',[$slug])->get();
        
        //Click nút play thì xem tập đầu tiên của phim
        $episode_movie = Episode::with('movie')->where('movie_id',$movie->id)->orderBy('episode', 'ASC')->take(1)->first();

        //Lấy ra 3 tập mới nhất của phim
        $episode_new = Episode::where('movie_id',$movie->id)->orderBy('episode','DESC')->take(3)->get();
        
        //Lấy all episode đã add của movie
        $episode_list = Episode::with('movie')->where('movie_id',$movie->id)->get();
        $episode_count = $episode_list->count();


        //Rating movie
        $rating = Rating::where('movie_id',$movie->id)->avg('rating');// 'avg'->average(); là hàm tính tổng trung bình 
        $rating = round($rating);// 'round' -> hàm làm tròn

        $count_total = Rating::where('movie_id',$movie->id)->count();

        return view('pages.movie', compact( 'movie', 'related',  'episode_new' ,'episode_movie', 'episode_count', 'rating', 'count_total'));

    }
    public function add_rating(Request $request){
        $data = $request->all();
        $ip_address = $request->ip();

        $rating_count = Rating::where('movie_id',$data['movie_id'])->where('Ip_address',$ip_address)->count();

        if($rating_count>0){
            echo 'exist';
        }else{
            $rating = new Rating();
            $rating->movie_id = $data['movie_id'];
            $rating->rating = $data['index'];
            $rating->Ip_address = $ip_address;
            $rating->save();
            echo 'done';
        }
    }
    public function year($year){
        $year = $year;
        $movie = Movie::withCount('episodes')->where('year',$year)->orderby('updated_at','DESC')->paginate(12);
        return view('pages.year',compact( 'year', 'movie'));

    }public function tag($tag){
        $tag = $tag;
        $movie = Movie::withCount('episodes')->where('tags', 'LIKE', '%'.$tag.'%')->orderby('updated_at','DESC')->paginate(12);
        return view('pages.tag',compact( 'tag', 'movie'));

    }
    public function watch($slug, $tap){
        $movie = Movie::with('category', 'genre', 'country', 'movie_genres', 'episodes')->where('slug',$slug)->where('status',1)->first();
        $related = Movie::with('category', 'genre', 'country')->where('category_id',$movie->category->id)->orderby(DB::raw('RAND()'))->whereNotIn('slug',[$slug])->get();
        if(isset($tap)){
            $ep = $tap;
            $ep = substr($tap, 4,20);
            $episode = Episode::where('movie_id',$movie->id)->where('episode',$ep)->first();
        }else{
            $ep = 1;
            $episode = Episode::where('movie_id',$movie->id)->where('episode',$ep)->first();
        }
        return view('pages.watch', compact('movie', 'episode', 'ep', 'related'));

    }
    public function episode(){
        // $category = Category::orderBy('id', 'DESC')->where('status',1)->get();
        // $genre = Genre::orderBy('id', 'DESC')->get();
        // $country = Country::orderBy('id', 'DESC')->get();
        // $movie = Movie::with('category', 'genre', 'country', 'movie_genres', 'episodes')->where('slug',$slug)->where('status',1)->first();
        // $phimhot_sidebar = Movie::where('phim_hot', 1)->where('status', 1)->orderby('updated_at','DESC')->take(10)->get();
        // $phimhot_trailer = Movie::where('resolution', 5)->where('status', 1)->orderby('updated_at','DESC')->take(10)->get();
        // // $episode = Episode::where('movie_id',$movie->id)->where('episode',$ep)->first();
        // return view('pages.episode' , compact('genre', 'country', 'category', 'movie', 'phimhot_sidebar', 'phimhot_trailer'));

    }
}
