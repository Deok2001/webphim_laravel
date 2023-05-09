<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Info;

class InfoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list = Info::all();
        return view('admincp.info.index', compact('list'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       
        return view('admincp.info.form');
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
        $info = new Info();
        $info->title = $data['title'];
        $info->copyright = $data['copyright'];
        $info->description = $data['description'];
        $info->status = $data['status'];
        $get_image = $request->file('logo');

        //Thêm hình ảnh
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.', $get_name_image));
            $new_image = $name_image.rand(0,9999).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('uploads/logo', $new_image);
            $info->logo = $new_image;
        }
        $info->save();
        toastr()->success('Thành Công','Thêm thông tin website!');
        return redirect()->route('info.index');
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
        $info = Info::find($id);
        $list = Info::where('status',1)->get();
        return view('admincp.info.form', compact('list', 'info'));
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
        $info = Info::find($id);
        $info->title = $data['title'];
        $info->copyright = $data['copyright'];
        $info->description = $data['description'];
        $info->status = $data['status'];
        $get_image = $request->file('logo');

        //Thêm hình ảnh
        if($get_image){
            if(file_exists('uploads/logo/'.$info->logo)){
                unlink('uploads/logo/'.$info->logo);
            }else{
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.', $get_name_image));
            $new_image = $name_image.rand(0,9999).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('uploads/logo', $new_image);
            $info->logo = $new_image;
            }
        }
        $info->save();
        toastr()->success('Thành Công','Cập nhật thông tin website!');
        return redirect()->route('info.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $info = Info::find($id);
        if(file_exists('uploads/logo/'.$info->logo)){
            unlink('uploads/logo/'.$info->logo);
        }
        $info->delete();
        toastr()->info('Thành Công','Xóa thông tin website!');
        return redirect()->back();
    }
}
