<form action="{{ route('filter') }}" method="GET">
    <style type="text/css">
       .stylish_filter{
          border: 0;
          background: #12171b;
          color: #fff; 
       }
       .btn_fliter{
          border: 0 #b2b7bb;
          background: #12171b;
          color: #fff;
          padding: 9px;
          width: 109px;
       }
    </style>
 <div class="col-md-2">
    <div class="form-group ">
       <select class="form-control stylish_filter"name="order" id="exampleFormControlSelect1">
             <option value="">--Sắp xếp--</option>
             <option value="date">Ngày đăng</option>
             <option value="year_release">Năm sản xuất</option>
             <option value="name_a_z">Tên phim</option>
             <option value="watch_views">Lượt xem</option>
       </select>
    </div>
 </div>
 <div class="col-md-2">
    <div class="form-group ">
       <select class="form-control stylish_filter" name="genre" id="exampleFormControlSelect1">
          <option value="">--Thể loại--</option>
          @foreach ($genre_home as $key => $gen_filter)
             <option {{ (isset($_GET['genre']) && $_GET['genre']==$gen_filter->id) ? 'selected' : '' }} value="{{ $gen_filter->id }}">{{ $gen_filter->title }}</option>
          @endforeach
       </select>
    </div>
 </div>
 <div class="col-md-2">
    <div class="form-group ">
       <select class="form-control stylish_filter" name="country" id="exampleFormControlSelect1">
          <option value="">--Quốc gia--</option>
          @foreach ($country_home as $key => $count_filter)
             <option {{ (isset($_GET['country']) && $_GET['country']==$count_filter->id) ? 'selected' : '' }} value="{{ $count_filter->id }}">{{ $count_filter->title }}</option>
          @endforeach
       </select>
    </div>
 </div>
 <div class="col-md-2">
    <div class="form-group ">
        @php
            if(isset($_GET['year'])){
                $year = $_GET['year'];
            }else{
                $year = null;
            }
        @endphp
       {!! Form::selectYear('year', 2000, 2023, $year , ['class' => 'form-control stylish_filter', 'placeholder'=> '--Năm phim--' ]) !!}
    </div>
 </div>
 <div class="col-md-2">
    <input type="submit" class="btn btn-sm btn-default btn_fliter" value="Lọc phim">
 </div>
</form>