@extends('layouts.app')

@section('content')
<table class="table" id="tablemovie" style="margin-top:8px">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Slug</th>
        <th scope="col">Description</th>
        <th scope="col">Active/Inactive</th>
        <th scope="col">Manage</th>
      </tr>
    </thead>
    <tbody class="order_position">
        @foreach ($list as $key => $cate)
        <tr id="{{ $cate->id }}">
            <th scope="row">{{ $key }}</th>
            <td>{{ $cate->title }}</td>
            <td>{{ $cate->slug }}</td>
            <td>{{ $cate->description }}</td>
            <td>
                @if ($cate->status)
                    Hiển thị
                @else
                    Không hiển thị
                @endif
            </td>
            <td>
                {!! Form::open(['route'=>['category.destroy',$cate->id],'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn có chắc muốn xóa không?")']) !!}
                    {!! Form::submit('Xóa', ['class'=>'btn btn-danger']) !!}
                {!! Form::close() !!}
                <a href="{{ route('category.edit',$cate->id) }}" class="btn btn-warning">Sửa</a>
            </td>
          </tr>  
        @endforeach
      
    </tbody>
</table>
@endsection