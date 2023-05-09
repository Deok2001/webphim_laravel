<?php

namespace App\Http\Controllers;

use App\Http\Requests\EpisodeRequest;
use Illuminate\Http\Request;
use App\Models\Movie;
use App\Models\Episode;
use Carbon\Carbon;

class EpisodeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list_episode = Episode::with('movie')->orderBy('movie_id', 'DESC')->get();
        // return response()->json($list_episode);
        return view('admincp.episode.index', compact('list_episode'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $list_movie = Movie::orderBy('id', 'DESC')->pluck('title', 'id');
        return view('admincp.episode.form', compact('list_movie'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $ep_check = Episode::where('episode',$data['episode'])->where('movie_id',$data['movie_id'])->count();
        if($ep_check>0){
            return redirect()->back();

        }else{
            $ep = new Episode();
            $ep->movie_id = $data['movie_id'];
            $ep->link = $data['link'];
            $ep->episode = $data['episode'];
            $ep->status = $data['status'];
            $ep->created_at = Carbon::now('Asia/Ho_Chi_Minh');
            $ep->updated_at = Carbon::now('Asia/Ho_Chi_Minh');
            $ep->save();
            toastr()->success('Thành Công','Thêm tập phim!');
            return redirect()->route('episode.index');
        }
        
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
        $list_movie = Movie::orderBy('id', 'DESC')->pluck('title', 'id');
        $episode = Episode::find($id);
        return view('admincp.episode.form', compact('list_movie', 'episode'));
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
        $ep =  Episode::find($id);
        $ep->movie_id = $data['movie_id'];
        $ep->link = $data['link'];
        $ep->episode = $data['episode'];
        $ep->status = $data['status'];
        // $ep->created_at = Carbon::now('Asia/Ho_Chi_Minh');
        $ep->updated_at = Carbon::now('Asia/Ho_Chi_Minh');
        $ep->save();
        toastr()->success('Thành Công','Cập nhật tập phim!');
        return redirect()->route('episode.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $episode = Episode::find($id)->delete();
        toastr()->info('Thành Công','Xóa tập phim!');
        return redirect()->route('episode.index');

    }
    //Thêm tập phim ở trang movie
    public function add_episode($id){
        // $id = $_GET['id'];
        $movie = Movie::find($id);
        $list_episode = Episode::with('movie')->where('movie_id',$id)->orderBy('episode', 'DESC')->get();  
        
        return view('admincp.episode.add_episode', compact('list_episode', 'movie'));
    }
    public function select_episode(){
        $id = $_GET['id'];
        $movie = Movie::find($id);
        $output = '<option>--Chọn tập phim--</option>';
        if($movie->format =='phimbo'){
            for($i = 1; $i<= $movie->episode; $i++){
                $output.='<option value="'.$i.'">'.$i.'</option>';
            }
        }else{
            $output.='<option value="HD">HD</option>
            <option value="FullHD">FullHD</option>
            <option value="Cam">Cam</option>
            <option value="HDCam">HDCam</option>';

        }
        echo $output;
    }
}
