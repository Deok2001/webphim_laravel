@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:20px">
    <div class="row justify-content-center">
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
