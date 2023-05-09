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
    <tbody>
        @foreach ($list as $key => $value)
        <tr>
            <th scope="row">{{ $key }}</th>
            <td>{{ $value->title }}</td>
            <td>{{ $value->slug }}</td>
            <td>{{ $value->description }}</td>
            <td>
                @if ($value->status)
                    Hiển thị
                @else
                    Không hiển thị
                @endif
            </td>
            <td>
                {!! Form::open(['route'=>['country.destroy',$value->id],'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn có chắc muốn xóa không?")']) !!}
                    {!! Form::submit('Xóa', ['class'=>'btn btn-danger']) !!}
                {!! Form::close() !!}
                <a href="{{ route('country.edit',$value->id) }}" class="btn btn-warning">Sửa</a>
            </td>
          </tr>  
        @endforeach
      
    </tbody>
</table>
@endsection