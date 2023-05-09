@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:20px">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card" style="margin-bottom:15px">
                {{-- <div class="card-header">{{ __('Quản lý thông tin website') }}</div> --}}
                {{-- <style type="text/css">
                    .alert-danger{
                        background-color: #fe1302;
                        font-weight: 500;
                    }
                </style> --}}
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if (!isset($info))
                    {!! Form::open(['route'=>'info.store','method'=>'POST' , 'enctype'=>'multipart/form-data']) !!}
                    @else
                        {!! Form::open(['route'=>['info.update', $info->id],'method'=>'PUT' , 'enctype'=>'multipart/form-data']) !!}
                    @endif
                        <div class="form-group">
                            {!! Form::label('title', 'Title', []) !!}
                            {!! Form::text('title', isset($info) ? $info->title : '',['style'=>'margin-top: 12px', 'class'=>'form-control  ',  'placeholder' => 'Nhập vào dữ liệu...', 'id'=>'slug', 'onkeyup'=>'ChangeToSlug()'])!!}
                            {{-- @error('title')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror --}}
                        </div>
                        <div class="form-group" style="display: table-caption;">
                            {!! Form::label('logo', 'Logo', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::file('logo', ['style'=>'margin-top: 12px','class'=>'form-control-file'])!!}
                            @if(isset($info))
                                <img style="width:50%" src="{{ asset('uploads/logo/'.$info->logo) }}">
                            @endif
                            {{-- @error('image')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror --}}
                        </div>
                        
                        <div class="form-group" >
                            {!! Form::label('description', 'Description', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::textarea('description', isset($info) ? $info->description : '',['style'=>'resize:none; margin-top: 12px','class'=>'form-control', 'placeholder' => 'Nhập vào dữ liệu...', 'id'=>'description'])!!}
                            {{-- @error('description')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror --}}
                        </div>
                        <div class="form-group">
                            {!! Form::label('copyright', 'Copyright', []) !!}
                            {!! Form::text('copyright', isset($info) ? $info->copyright : '',['style'=>'margin-top: 12px', 'class'=>'form-control  ',  'placeholder' => 'Nhập vào dữ liệu...', 'id'=>'slug', 'onkeyup'=>'ChangeToSlug()'])!!}
                            {{-- @error('copyright')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror --}}
                        </div>
                        <div class="form-group">
                            {!! Form::label('active', 'Active', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('status', ['1'=>'Hiển thị', '0'=>'Không'], isset($info) ? $info->status : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Kích hoạt--']) !!}
                            {{-- @error('status')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror --}}
                        </div>
                        @if (!isset($info))
                            {!! Form::submit('Thêm dữ liệu', ['class'=>'btn btn-success']) !!}
                        @else
                            {!! Form::submit('Cập nhật', ['class'=>'btn btn-warning']) !!}
                        @endif
                    {!! Form::close() !!}
                </div>
            </div>
            
        </div>
    </div>
</div>

@endsection
