@extends('layouts.app')

@section('content')

{{-- <div class="modal" id="videoModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><span id="video_title"></span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="video_desc"></p>
                <p id="video_link"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div> --}}


<div class="container-fluid" >
    <div class="row justify-content-center">
        <div class="col-md-12">
            
            <table class="table table-responsive" style="display: block" id="tablemovie" >
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Add_Ep</th>
                    <th scope="col">Episode</th>
                    <th scope="col">Slug</th>
                    <th scope="col">Trailer</th>
                    <th scope="col">Duration</th>
                    <th scope="col">English</th>
                    <th scope="col">Image</th>
                    <th scope="col">Genre</th>
                    <th scope="col">Format</th>
                    {{-- <th scope="col">Description</th> --}}
                    {{-- <th scope="col">Tags</th> --}}
                    <th scope="col">Category</th>
                    <th scope="col">Country</th>
                    <th scope="col">Hot</th>
                    <th scope="col">Subtitle</th>
                    <th scope="col">Resolution</th>
                    <th scope="col">View</th>
                    <th scope="col">Year</th>
                    <th scope="col">Season</th>
                    <th scope="col">Active/Inactive</th>
                    <th scope="col">Created_at</th>
                    <th scope="col">Updated_at</th>
                    <th scope="col">Manage</th>
                  </tr>
                </thead>
                <tbody>
                    @foreach ($list as $key => $value)
                    <tr>
                        <th scope="row">{{ $key }}</th>
                        <td>{{ $value->title }}</td>
                        <td>
                            <a href="{{ route('add-episode',[$value->id]) }}" class="btn btn-success btn-sm">Thêm tập phim</a>
                            @foreach ($value->episodes as $key => $epis)
                                <a class="show_video" 
                                    data-movie_video_id="{{ $epis->movie_id }}" 
                                    data-video_episode="{{ $epis->episode }}"  
                                    style="color: #fff; cursor: pointer;"> 

                                    <span class="badge badge-dark">{{ $epis->episode }}</span>
                                </a>
                            @endforeach
                            
                        </td>
                        <td>
                            @if ($value->format == 'phimle')
                                {{ $value->episodes_count }}/{{ $value->episode }} Bản
                            @elseif ($value->format == 'phimbo')
                                {{ $value->episodes_count }}/{{ $value->episode }} Tập
                            @else
                            @endif
                        </td>
                        <td>{{ $value->slug }}</td>
                        <td>{{ $value->trailer }}</td>
                        <td>{{ $value->movie_duration }}</td>
                        <td>{{ $value->name_eng }}</td>
                        <td>
                            <img style="width:60%" src="{{ asset('uploads/movie/'.$value->image) }}">
                            <input type="file"  data-movie_id="{{ $value->id }}" id="file-{{ $value->id }}" class="form-control-file file_image" accept="image/*">
                            <span id="success_image"></span>
                        </td>
                        <td>
                            @foreach ($value->movie_genres as $gen)
                            <span class="badge bg-dark">{{ $gen->title }}</span>  
                            @endforeach
                        </td>
                        <td>
                            {{-- @if ($value->format == 'phimle')
                                Phim lẻ
                            @elseif ($value->format == 'phimbo')
                                Phim bộ
                            @else
                            @endif --}}
                            <select id="{{ $value->id }}" class="select-format">
                                @if ($value->format== 'phimbo')
                                <option value="phimle">Phim lẻ</option>
                                <option selected value="phimbo">Phim bộ</option>
                                @else
                                <option selected value="phimle">Phim lẻ</option>
                                <option  value="phimbo">Phim bộ</option>
                            @endif
                            </select>
                        </td>
                        {{-- <td>{{ $value->description }}</td> --}}
                        {{-- <td>{{ $value->tags }}</td> --}}
                        <td>
                            {{-- {{ $value->category->title }} --}}
                            {!! Form::select('category_id', $category, isset($value) ? $value->category->id : '', [ 'class' => 'select-category', 'id'=> $value->id ,'placeholder'=> '--Category--']) !!}
                        </td>
                        <td>
                            {{-- {{ $value->country->title }} --}}
                            {!! Form::select('country_id', $country, isset($value) ? $value->country->id : '', [ 'class' => 'select-country', 'id'=> $value->id ,'placeholder'=> '--Country--']) !!}
                        </td>
                        <td>
                            {{-- @if ($value->phim_hot==0)
                                Không
                            @else
                                Có
                            @endif --}}
                            <select id="{{ $value->id }}" class="select-hot">
                                @if ($value->phim_hot==0)
                                <option value="1">Hot</option>
                                <option selected value="0">Không</option>
                                @else
                                <option selected value="1">Hot</option>
                                <option  value="0">Không</option>
                            @endif
                            </select>
                        </td>
                        <td>
                            {{-- @if ($value->subtitle==0)
                                Phụ đề
                            @else
                                Thuyết minh
                            @endif --}}
                            <select id="{{ $value->id }}" class="select-subtitle">
                                @if ($value->subtitle==0)
                                <option value="1">Thuyết minh</option>
                                <option selected value="0">Phụ đề</option>
                                @else
                                <option selected value="1">Thuyết minh</option>
                                <option  value="0">Phụ đề</option>
                                @endif
                            </select>    
                        </td>
                        <td>
                            {{-- @if ($value->resolution==0)
                                HD
                            @elseif($value->resolution==1)
                                SD
                            @elseif($value->resolution==2)
                                HDCam
                            @elseif($value->resolution==3)
                                Cam
                            @elseif($value->resolution==4)
                                FullHD
                            @else
                                Trailer
                            @endif --}}

                            @php
                                $options = array('0'=>'HD', '1'=>'SD', '2'=>'HDCam', '3'=>'Cam', '4'=>'FullHD', '5'=>'Trailer');
                            @endphp
                            <select id="{{ $value->id }}" class="select-resolution">
                                @foreach ($options as $key => $resol)
                                    <option {{ $value->resolution==$key ? 'selected' : ''}} value="{{ $key }}">{{ $resol }}</option>
                                @endforeach
                            </select>

                        </td>
                        <td>
                            {!! Form::select('top_view', ['0'=>'Ngày', '1'=>'Tuần', '2'=>'Tháng'], isset($value->top_view) ? $value->top_view : '', [ 'class' => 'select-topview', 'id'=> $value->id , 'placeholder'=> '--Views--']) !!}
                        </td>
                        <td>
                            <form method="POST">
                                @csrf
                                {!! Form::selectYear('year',2000,2023, isset($value->year) ? $value->year : '' , ['class' => 'select-year', 'id' => $value->id, 'placeholder'=> '--Năm phim--']) !!}
                            </form>
                        </td>
                        <td>
                            <form method="POST">
                                @csrf
                                {!! Form::selectRange('season',0, 20, isset($value->season) ? $value->season : '' , ['class' => 'select-season', 'id' => $value->id, 'placeholder'=> '--Season--']) !!}
                            </form>
                        </td>
                        <td>
                            {{-- @if ($value->status)
                                Hiển thị
                            @else
                                Không hiển thị
                            @endif --}}
                            <select id="{{ $value->id }}" class="select-status">
                                @if ($value->status==0)
                                <option value="1">Hiển thị</option>
                                <option selected value="0">Không</option>
                                @else
                                <option selected value="1">Hiển thị</option>
                                <option  value="0">Không</option>
                            @endif
                            </select>
                        </td>
                        <td>{{ $value->created_at }}</td>
                        <td>{{ $value->updated_at }}</td>
                        <td>
                            {!! Form::open(['route'=>['movie.destroy',$value->id],'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn có chắc muốn xóa không?")']) !!}
                                {!! Form::submit('Xóa', ['class'=>'btn btn-danger']) !!}
                            {!! Form::close() !!}
                            <a href="{{ route('movie.edit',$value->id) }}" class="btn btn-warning">Sửa</a>
                        </td>
                      </tr>  
                    @endforeach
                  
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection
