@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:20px">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card" style="margin-bottom:15px">
                {{-- <div class="card-header">{{ __('Quản lý danh mục') }}</div> --}}
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
                    @if (!isset($category))
                    {!! Form::open(['route'=>'category.store','method'=>'POST']) !!}
                    @else
                        {!! Form::open(['route'=>['category.update', $category->id],'method'=>'PUT']) !!}
                    @endif
                        <div class="form-group">
                            {!! Form::label('title', 'Title', []) !!}
                            {!! Form::text('title', isset($category) ? $category->title : '',['style'=>'margin-top: 12px', 'class'=>'form-control  ',  'placeholder' => 'Nhập vào dữ liệu...', 'id'=>'slug', 'onkeyup'=>'ChangeToSlug()'])!!}
                            @error('title')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('slug', 'Slug', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::text('slug', isset($category) ? $category->slug : '',['style'=>'margin-top: 12px','class'=>'form-control', 'placeholder' => 'Nhập vào dữ liệu...', 'id'=>'convert_slug'])!!}
                            @error('slug')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        
                        <div class="form-group" >
                            {!! Form::label('description', 'Description', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::textarea('description', isset($category) ? $category->description : '',['style'=>'resize:none; margin-top: 12px','class'=>'form-control', 'placeholder' => 'Nhập vào dữ liệu...', 'id'=>'description'])!!}
                            @error('description')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="form-group">
                            {!! Form::label('active', 'Active', ['style'=>'margin-top: 12px']) !!}
                            {!! Form::select('status', ['1'=>'Hiển thị', '0'=>'Không'], isset($category) ? $category->status : '', [ 'style'=>'margin-top: 12px', 'class' => 'form-control', 'placeholder' => '--Kích hoạt--']) !!}
                            @error('status')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        @if (!isset($category))
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
