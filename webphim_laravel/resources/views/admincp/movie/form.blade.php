@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:20px">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card" style="margin-bottom:15px">
                {{-- <a href="{{ route('movie.index') }}" class="btn btn-primary">List Movie</a> --}}
                {{-- <div class="card-header">{{ __('Quản lý phim') }}</div> --}}
                <style type="text/css">
                    .alert-danger{
                        background-color: #fe1302;
                        font-weight: 500;
                    }
                </style>
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if (!isset($movie))
                    {!! Form::open(['route'=>'movie.store','method'=>'POST', 'enctype'=>'multipart/form-data']) !!}
                    @else
                        {!! Form::open(['route'=>['movie.update', $movie->id],'method'=>'PUT', 'enctype'=>'multipart/form-data']) !!}
                    @endif
                        <div class="form-group">
                            {!! Form::label('title', 'Title', []) !!}
                            {!! Form::text('title', isset($movie) ? $movie->title : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....', 'id'=>'slug', 'onkeyup'=>'ChangeToSlug()'])!!}
                            @error('title')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('slug', 'Slug', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('slug', isset($movie) ? $movie->slug : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....', 'id'=>'convert_slug'])!!}
                            @error('slug')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('episode', 'Episode', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('episode', isset($movie) ? $movie->episode : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....', 'id'=>'episode'])!!}
                            @error('episode')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('movie_duration', 'Movie Duration', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('movie_duration', isset($movie) ? $movie->movie_duration : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....' ])!!}
                            @error('movie_duration')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('trailer', 'Trailer', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('trailer', isset($movie) ? $movie->trailer : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....' ])!!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('Name English', 'Name Enghlish', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('name_eng', isset($movie) ? $movie->name_eng : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....', 'id'=>'name_eng'])!!}
                            @error('name_eng')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group" style="display: table-caption;">
                            {!! Form::label('Image', 'Image', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::file('image', ['style'=>'margin-top: 12px','class'=>'form-control-file'])!!}
                            @if(isset($movie))
                                <img style="width:50%" src="{{ asset('uploads/movie/'.$movie->image) }}">
                            @endif
                            @error('image')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group" >
                            {!! Form::label('description', 'Description', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::textarea('description', isset($movie) ? $movie->description : '',['style'=>'resize:none; margin-top: 12px','class'=>'form-control','placeholder' => '....', 'id'=>'description'])!!}
                            @error('description')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group" >
                            {!! Form::label('tags', 'Tags ', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::textarea('tags', isset($movie) ? $movie->tags : '',['style'=>'resize:none; margin-top: 12px','class'=>'form-control','placeholder' => '....'])!!}
                            @error('tags')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('active', 'Active', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('status', ['1'=>'Hiển thị', '0'=>'Không'], isset($movie) ? $movie->status : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Kích hoạt--' ]) !!}
                            @error('status')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('subtitle', 'Subtitle', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('subtitle', ['0'=>'Phụ đề', '1'=>'Thuyết minh'], isset($movie) ? $movie->subtitle : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Subtitle--' ]) !!}
                            @error('subtitle')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('resolution', 'Resolution', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('resolution', ['0'=>'HD', '1'=>'SD', '2'=>'HDCam', '3'=>'Cam', '4'=>'FullHD', '5'=>'Trailer'], isset($movie) ? $movie->resolution : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Độ phân giải--' ]) !!}
                            @error('resolution')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('category', 'Category', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('category_id', $category, isset($movie) ? $movie->category_id : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control',  'placeholder' => '--Danh mục phim--']) !!}
                            @error('category_id')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('format', 'Format', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('format', ['phimle'=>'Phim lẻ', 'phimbo'=>'Phim bộ'], isset($movie) ? $movie->format : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Format--']) !!}
                            @error('format')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('genre', 'Genre', ['style'=>'margin-top: 12px']) !!}<br>
                            {{-- {!! Form::select('genre_id', $genre, isset($movie) ? $movie->genre_id : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control']) !!} --}}
                            @foreach ($list_genre as $key => $gen)
                                @if (isset ($movie))
                                {!! Form::checkbox('genre[]',$gen->id, isset($movie_genre) &&  $movie_genre->contains($gen->id) ? true : false) !!}
                                @else
                                {!! Form::checkbox('genre[]', $gen->id, '' ) !!}
                                @endif
                                    {!! Form::label('genre', $gen->title) !!}
                            @endforeach
                        </div>
                        <div class="form-group">
                            {!! Form::label('country', 'Country', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('country_id', $country, isset($movie) ? $movie->country_id : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Quốc gia--']) !!}
                            @error('country_id')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('Hot', 'Hot', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('phim_hot', ['1'=>'Có', '0'=>'Không'], isset($movie) ? $movie->phim_hot : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Hot--']) !!}
                            @error('phim_hot')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        @if (!isset($movie))
                            {!! Form::submit('Thêm dữ liệu', ['style'=>'margin-top: 12px','class'=>'btn btn-success']) !!}
                        @else
                            {!! Form::submit('Cập nhật', ['style'=>'margin-top: 12px','class'=>'btn btn-warning']) !!}
                        @endif
                    {!! Form::close() !!}
                </div>
            </div>
            
        </div>
    </div>
</div>

@endsection
