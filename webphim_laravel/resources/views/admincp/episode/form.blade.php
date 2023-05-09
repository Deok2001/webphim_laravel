@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:20px">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card" style="margin-bottom:15px">
                {{-- <a href="{{ route('episode.index') }}" class="btn btn-primary">List Episode</a> --}}
                {{-- <div class="card-header">{{ __('Quản lý tập phim') }}</div> --}}
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
                            {!! Form::label('movie', 'Movie', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('movie_id', ['0'=>'Movie', 'Danh sách phim hiện có !'=>$list_movie] , isset($episode) ? $episode->movie_id : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control select-movie']) !!}
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
                            <select class="form-control" name="episode" id="show_episode"></select>
                            {{-- {!! Form::text('episode', isset($episode) ? $episode->episode : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => '....', isset($episode) ? 'readonly' : '']) !!} --}}
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
    </div>
</div>


@endsection
