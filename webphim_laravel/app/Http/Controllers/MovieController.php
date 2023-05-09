<?php

namespace App\Http\Controllers;

use App\Http\Requests\MovieRequest;
use Illuminate\Http\Request;
use App\Models\Movie;
use App\Models\Category;
use App\Models\Genre;
use App\Models\Country;
use App\Models\Episode;
use App\Models\MovieGenre;
use App\Models\Info;
use Carbon\Carbon;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class MovieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list = Movie::with('category', 'movie_genres', 'country', 'genre')->withCount('episodes')->orderBy('id', 'DESC')->get();

        $category = Category::where('status','1')->pluck('title','id');
        $country = Country::where('status','1')->pluck('title','id');
        


        $path = public_path()."/json/";

        if(!is_dir($path)) { 
            mkdir($path, 0777, true); 
        }
        File::put($path. 'movie.json', json_encode($list));

        return view('admincp.movie.index', compact('list','category', 'country'));
    }

    //Update image = ajax
    public function update_image_movie_ajax(Request $request){
        $get_image = $request->file('file');
        $movie_id = $request->movie_id;

        if($get_image){
            //Xóa ảnh cũ
            $movie = Movie::find($movie_id);
            unlink('uploads/movie/'.$movie->image);

            //Thêm ảnh mới
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.', $get_name_image));
            $new_image = $name_image.rand(0,9999).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('uploads/movie', $new_image);
            $movie->image = $new_image;
            
            $movie->save();
        }

    }



    //Update category = ajax
    public function select_category(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['movie_id']);
        $movie->category_id = $data['category_id'];
        $movie->save();
    }

    //Update country = ajax
    public function select_country(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['movie_id']);
        $movie->country_id = $data['country_id'];
        $movie->save();
    }

    //Update subtitle = ajax
    public function select_subtitle(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['movie_id']);
        $movie->subtitle = $data['subtitle_val'];
        $movie->save();
    }
     //Update hot = ajax
     public function select_hot(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['movie_id']);
        $movie->phim_hot = $data['hot_val'];
        $movie->save();
    }

     //Update format = ajax
     public function select_format(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['movie_id']);
        $movie->format = $data['format_val'];
        $movie->save();
    }

    //Update resolution = ajax
    public function select_resolution(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['movie_id']);
        $movie->resolution = $data['resolution_val'];
        $movie->save();
    }

    //Update status = ajax
    public function select_status(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['movie_id']);
        $movie->status = $data['status_val'];
        $movie->save();
    }

    //Update Year
    public function update_year(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['id_movie']);
        $movie->year = $data['year'];
        $movie->save();
    }

    //Update Season
    public function update_season(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['id_movie']);
        $movie->season = $data['season'];
        $movie->save();
    }

    //Update Top View
    public function update_topview(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['id_movie']);
        $movie->top_view = $data['top_view'];
        $movie->save();
    }

    //Filter Top View
    public function filter_topview(Request $request){
        $data = $request->all();
        $movie = Movie::where('top_view',$data['value'])->orderBy('updated_at','DESC')->take(10)->get();
        $output = '';
        foreach($movie as $key => $mov){
            if($mov->resolution!=5){
                if ($mov->resolution==0){
                    $text = 'HD';
                }elseif($mov->resolution==1){
                    $text = 'SD';
                }elseif($mov->resolution==2){
                    $text = 'HDCam';
                }elseif($mov->resolution==3){
                    $text = 'Cam';
                }elseif($mov->resolution==4){
                    $text = 'FullHD';
                }else{
                    $text = 'Trailer';
    
                }   
            $output.= '<div class="item post-37176">
            <a href="'.url('phim/'.$mov->slug).'" title="'.$mov->title.'">
               <div class="item-link">
                  <img src="'. url('uploads/movie/'.$mov->image) .'" class="lazy post-thumb" alt="'.$mov->title.'" title="'.$mov->title.'" />
                  <span class="is_trailer">'.$text.'</span>
               </div>
               <p class="title">'.$mov->title.'</p>
            </a>
            <div class="viewsCount" style="color: #9d9d9d;">Năm: '.$mov->year.'</div>
            <div style="float: left;">
                    <ul class="list-inline rating"   title="Average Rating">';
                        for($count=1; $count<=5; $count++){
                            $output.= '<li title="star_rating" style="cursor:pointer; font-size:20px; padding:0; color:#ffcc00; ">
                                &#9733;
                            </li>';
                        }
                        $output.= '</ul>
            </div>
         </div>';
            
            }
        }
        echo $output;
    }

    //Filter default
    public function filter_default(Request $request){
        $data = $request->all();
        $movie = Movie::where('top_view',0)->orderBy('updated_at','DESC')->take(10)->get();
        $output = '';
        foreach($movie as $key => $mov){
            if($mov->resolution!=5){
                if ($mov->resolution==0){
                    $text = 'HD';
                }elseif($mov->resolution==1){
                    $text = 'SD';
                }elseif($mov->resolution==2){
                    $text = 'HDCam';
                }elseif($mov->resolution==3){
                    $text = 'Cam';
                }elseif($mov->resolution==4){
                    $text = 'FullHD';
                }else{
                    $text = 'Trailer';
    
                }   
            $output.= '<div class="item post-37176">
            <a href="'.url('phim/'.$mov->slug).'" title="'.$mov->title.'">
               <div class="item-link">
                  <img src="'. url('uploads/movie/'.$mov->image) .'" class="lazy post-thumb" alt="'.$mov->title.'" title="'.$mov->title.'" />
                  <span class="is_trailer">'.$text.'</span>
               </div>
               <p class="title">'.$mov->title.'</p>
            </a>
            <div class="viewsCount" style="color: #9d9d9d;">Năm: '.$mov->year.'</div>
            <div style="float: left;">
            <ul class="list-inline rating"   title="Average Rating">';
                    for($count=1; $count<=5; $count++){
                        $output.= '<li title="star_rating" style="cursor:pointer; font-size:20px; padding:0; color:#ffcc00; ">
                            &#9733;
                        </li>';
                    }
                    $output.= '</ul>
            </div>
         </div>';
            
            }    
        }
        echo $output;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $category = Category::where('status',1)->pluck('title','id');
        $genre = Genre::where('status',1)->pluck('title','id');
        $country = Country::where('status',1)->pluck('title','id');
        $list_genre = Genre::all();
        return view('admincp.movie.form', compact( 'genre', 'country', 'category', 'list_genre'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MovieRequest $request)
    {
        $data = $request->all();
        $movie =  new Movie();
        $movie->title = $data['title'];
        $movie->slug = $data['slug'];
        $movie->episode = $data['episode'];
        $movie->trailer = $data['trailer'];
        $movie->movie_duration = $data['movie_duration'];
        $movie->name_eng = $data['name_eng'];
        $movie->description = $data['description'];
        $movie->tags = $data['tags'];
        $movie->status = $data['status'];
        $movie->category_id = $data['category_id'];
        $movie->format = $data['format'];
        $movie->country_id = $data['country_id'];
        $movie->phim_hot = $data['phim_hot'];
        $movie->subtitle = $data['subtitle'];
        $movie->resolution = $data['resolution'];
        $movie->created_at = Carbon::now('Asia/Ho_Chi_Minh');
        $movie->updated_at = Carbon::now('Asia/Ho_Chi_Minh');

        foreach($data['genre'] as $key  => $gen){
            $movie->genre_id = $gen[0];
        }

        $get_image = $request->file('image');

        //Thêm hình ảnh
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.', $get_name_image));
            $new_image = $name_image.rand(0,9999).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('uploads/movie', $new_image);
            $movie->image = $new_image;
        }
        $movie->save();
        toastr()->success('Thành Công','Thêm phim!');
        //Thêm nhiều thể loại cho phim 
        $movie->movie_genres()->attach($data['genre']);
        return redirect()->route('movie.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = Category::where('status',1)->pluck('title','id');
        $genre = Genre::where('status',1)->pluck('title','id');
        $country = Country::where('status',1)->pluck('title','id');
        // $list = Movie::with('category', 'genre', 'country')->orderBy('id', 'DESC')->get();
        $list_genre = Genre::all();
        $movie = Movie::find($id);
        $movie_genre = $movie->movie_genres;
        return view('admincp.movie.form', compact('genre', 'country', 'category', 'movie', 'list_genre', 'movie_genre'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->all();
        $movie =  Movie::find($id);
        $movie->title = $data['title'];
        $movie->slug = $data['slug'];
        $movie->episode = $data['episode'];
        $movie->trailer = $data['trailer'];
        $movie->movie_duration = $data['movie_duration'];
        $movie->name_eng = $data['name_eng'];
        $movie->description = $data['description'];
        $movie->tags = $data['tags'];
        $movie->status = $data['status'];
        $movie->category_id = $data['category_id'];
        $movie->format = $data['format'];
        // $movie->genre_id = $data['genre_id'];
        $movie->country_id = $data['country_id'];
        $movie->phim_hot = $data['phim_hot'];
        $movie->subtitle = $data['subtitle'];
        $movie->resolution = $data['resolution'];
        $movie->updated_at = Carbon::now('Asia/Ho_Chi_Minh');

        foreach($data['genre'] as $key  => $gen){
            $movie->genre_id = $gen[0];
        }

        $get_image = $request->file('image');

        //Thêm hình ảnh
        if($get_image){
            if(file_exists('uploads/movie/'.$movie->image)){
                unlink('uploads/movie/'.$movie->image);
            }else{
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.', $get_name_image));
            $new_image = $name_image.rand(0,9999).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('uploads/movie', $new_image);
            $movie->image = $new_image;
            }
        }
        $movie->save();
        toastr()->success('Thành Công','Cập nhật phim!');
        //Thêm nhiều thể loại cho phim 
        $movie->movie_genres()->sync($data['genre']); 
        return redirect()->route('movie.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $movie = Movie::find($id);
        if(file_exists('uploads/movie/'.$movie->image)){
            unlink('uploads/movie/'.$movie->image);
        }
        MovieGenre::whereIn('movie_id',[$movie->id])->delete();
        Episode::whereIn('movie_id',[$movie->id])->delete();
        $movie->delete();
        toastr()->info('Thành Công','Xóa phim!');
        return redirect()->back();
    }
    // public function watch_video(Request $request){
    //     $data = $request->all();
    //     $movie = Movie::find($data['movie_id']);
    //     $video =  Episode::where('movie_id', $data['movie_id'])->where('episode', $data['episode_id'])->first();
    //     $output['video_title'] = $movie->title.'- Tập '.$video->episode;
    //     $output['video_desc'] = $movie->description;
    //     $output['video_link'] = $video->link;

    //      echo json_encode($output);
    // }
}
