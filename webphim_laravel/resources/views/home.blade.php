@extends('layouts.app')

@section('content')
<div class="container" style="margin-top:20px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Quản lý Admin') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('Chào mừng đến với bình nguyên vô tận :D !') }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
