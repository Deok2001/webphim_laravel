@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:20px">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card" style="margin-bottom:15px">
                {{-- <a href="{{ route('episode.index') }}" class="btn btn-primary">List Episode</a> --}}
                <div class="card-header">{{ __('Quản lý tập phim') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if (!isset($episode))
                    {!! Form::open(['route'=>'episode.store','method'=>'POST', 'enctype'=>'multipart/form-data']) !!}
                    @else
                    {!! Form::open(['route'=>['episode.update', $episode->id],'method'=>'PUT', 'enctype'=>'multipart/form-data']) !!}
                    @endif
                        
                        <div class="form-group">
                            {!! Form::label('movie_title', 'Movie', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('movie_title',  isset($movie) ? $movie->title : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'readonly']) !!}
                            {!! Form::hidden('movie_id',  isset($movie) ? $movie->id : '', []) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('link', 'Link Movie', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('link', isset($episode) ? $episode->link : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....'])!!}
                        </div>
                        @if (isset($episode))
                            <div class="form-group">
                                {!! Form::label('episode', 'Episode Movie', ['style'=>'margin-top: 12px']) !!}
                                {{-- <select class="form-control" name="episode" id="show_episode"></select> --}}
                                {!! Form::text('episode', isset($episode) ? $episode->episode : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....', isset($episode) ? 'readonly' : '']) !!}
                            </div>
                        @else 
                        <div class="form-group">
                            {!! Form::label('episode', 'Episode Movie', ['style'=>'margin-top: 12px']) !!}
                            {{-- <select class="form-control" name="episode" id="show_episode"></select> --}}
                            {!! Form::selectRange('episode', 1,  $movie->episode, $movie->episode ,['style'=>'margin-top: 12px','class'=>'form-control']) !!}
                        </div>
                        @endif
                        
                        <div class="form-group">
                            {!! Form::label('active', 'Active', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('status', ['1'=>'Hiển thị', '0'=>'Không'], isset($episode) ? $episode->status : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control' ]) !!}
                        </div>

                        @if (!isset($episode))
                            {!! Form::submit('Thêm dữ liệu', ['style'=>'margin-top: 12px','class'=>'btn btn-success']) !!}
                        @else
                            {!! Form::submit('Cập nhật', ['style'=>'margin-top: 12px','class'=>'btn btn-warning']) !!}
                        @endif
                    {!! Form::close() !!}
                </div>
            </div>
            
        </div>
        {{-- Liệt kê danh sách tập của phim --}}
        <div class="col-md-12">
            <table class="table " id="tablemovie">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Movie</th>
                    <th scope="col">Image</th>
                    <th scope="col">Episode</th>
                    <th scope="col">Link </th>
                    <th scope="col">Active/Inactive</th>
                    <th scope="col">Manage</th>
                  </tr>
                </thead>
                <tbody class="order_position">
                    @foreach ($list_episode as $key => $value)
                        <tr>
                            <th scope="row">{{ $key }}</th>
                            <td>{{ $value->movie->title }}</td>
                            <td><img style="width:80%" src="{{ asset('uploads/movie/'.$value->movie->image) }}"></td>
                            <td>{{ $value->episode }}</td>
                             <td>{{ $value->link }}</td>
                            <td>
                                @if ($value->status)
                                    Hiển thị
                                @else
                                    Không hiển thị
                                @endif
                            </td>
                            <td>
                                {!! Form::open(['route'=>['episode.destroy',$value->id],'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn có chắc muốn xóa không?")']) !!}
                                    {!! Form::submit('Xóa', ['class'=>'btn btn-danger']) !!}
                                {!! Form::close() !!}
                                <a href="{{ route('episode.edit',$value->id) }}" class="btn btn-warning">Sửa</a>
                            </td>
                        </tr>  
                    @endforeach  
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection
