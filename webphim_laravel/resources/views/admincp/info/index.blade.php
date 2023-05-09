@extends('layouts.app')

@section('content')

<table class="table" id="tablemovie" style="margin-top:8px">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Title</th>
        <th scope="col">Description</th>
        <th scope="col">Logo</th>
        <th scope="col">Copyright</th>
        <th scope="col">Active/Inactive</th>
        <th scope="col">Manage</th>
      </tr>
    </thead>
    <tbody class="order_position">
        @foreach ($list as $key => $value)
        <tr>
            <th scope="row">{{ $key }}</th>
            <td>{{ $value->title }}</td>
            <td>{{ $value->description }}</td>
            <td>
                <img style="width:60%" src="{{ asset('uploads/logo/'.$value->logo) }}">
            </td>
            <td>{{ $value->copyright }}</td>

            <td>
                @if ($value->status)
                    Hiển thị
                @else
                    Không hiển thị
                @endif
            </td>
            

            <td>
                {!! Form::open(['route'=>['info.destroy',$value->id],'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn có chắc muốn xóa không?")']) !!}
                    {!! Form::submit('Xóa', ['class'=>'btn btn-danger']) !!}
                {!! Form::close() !!}
                <a href="{{ route('info.edit',$value->id) }}" class="btn btn-warning">Sửa</a>
            </td>
          </tr>  
        @endforeach
      
    </tbody>
</table>
@endsection