@extends('layout')
@section('content')
<div class="container">
    <div class="row container" id="wrapper">
       <div class="halim-panel-filter">
          <div class="panel-heading">
             <div class="row">
                <div class="col-xs-6">
                   <div class="yoast_breadcrumb hidden-xs"><span><span><a href="{{ route('category',[$movie->category->slug]) }}">{{ $movie->category->title }}</a> » <span><a href="{{ route('country',[$movie->country->slug]) }}">{{ $movie->country->title }}</a> » <span class="breadcrumb_last" aria-current="page">{{ $movie->title }}</span></span></span></span></div>
                </div>
             </div>
          </div>
          <div id="ajax-filter" class="panel-collapse collapse" aria-expanded="true" role="menu">
             <div class="ajax"></div>
          </div>
       </div>
       <main id="main-contents" class="col-xs-12 col-sm-12 col-md-8">
          <section id="content" class="test">
             <div class="clearfix wrap-content">
               
                <div class="halim-movie-wrapper">
                   <div class="title-block">
                      <div id="bookmark" class="bookmark-img-animation primary_ribbon" data-id="38424">
                         <div class="halim-pulse-ring"></div>
                      </div>
                      <div class="title-wrapper" style="font-weight: bold;">
                         Bookmark
                      </div>
                   </div>
                   <div class="movie_info col-xs-12">
                      <div class="movie-poster col-md-3">
                         <img class="movie-thumb" src="{{ asset('uploads/movie/'.$movie->image) }}" alt="{{ $movie->title }}">
                         
                             
                         
                        @if ($movie->resolution!=5)
                           @if ( $episode_count>0)
                              <div class="bwa-content">
                                 <div class="loader"></div>
                                 <a href="{{ url('xem-phim/'.$movie->slug.'/tap-'.$episode_movie->episode) }}" class="bwac-btn">
                                 <i class="fa fa-play"></i>
                                 </a>
                              </div>
                           @endif
                        @else 
                           <a href="#watch_trailer" style="display: block;" class="btn btn-primary watch_trailer">Xem Trailer</a>   
                        @endif
                      </div>
                      <div class="film-poster col-md-9">
                         <h1 class="movie-title title-1" style="display:block;line-height:35px;margin-bottom: -14px;color: #ffed4d;text-transform: uppercase;font-size: 18px;">{{ $movie->title }}</h1>
                         <h2 class="movie-title title-2" style="font-size: 12px;">{{ $movie->name_eng }}</h2>
                         <ul class="list-info-group">
                            <li class="list-info-group-item"><span>Trạng Thái</span> : <span class="quality">
                              @if ($movie->resolution==0)
                                HD
                            @elseif($movie->resolution==1)
                                SD
                            @elseif($movie->resolution==2)
                                HDCam
                            @elseif($movie->resolution==3)
                                Cam
                            @elseif($movie->resolution==4)
                                FullHD
                            @else
                                Trailer
                            @endif  
                           </span>
                           
                           @if ($movie->resolution!=5)
                           <span class="episode">
                              @if ($movie->subtitle==0)
                                    Phụ đề
                              @else
                                    Thuyết minh
                              @endif   
                           </span>
                           @endif
                        
                        </li>
                            <li class="list-info-group-item"><span>Thời lượng</span> : {{ $movie->movie_duration }}</li>
                            <li class="list-info-group-item"><span>Tập phim</span> : 
                           @if ($movie->format == 'phimbo')
                              {{ $episode_count}}/{{ $movie->episode}} - 
                              @if ($episode_count == $movie->episode)
                                    Hoàn thành
                              @else 
                                    Đang cập nhật   
                              @endif
                           @else 
                              FullHD/HD  
                           @endif
                           
                           </li>
                            @if ($movie->season!=0)
                              <li class="list-info-group-item"><span>Season</span> : {{ $movie->season }}</li>     
                            @endif
                            <li class="list-info-group-item"><span>Thể loại</span> : 
                              @foreach ($movie->movie_genres as $gen)
                              <a href="{{ route('genre', $gen->slug) }}" rel="genre tag">{{ $gen->title }}</a>
                              @endforeach
                           </li>
                            <li class="list-info-group-item"><span>Danh mục</span> : <a href="{{ route('category',[$movie->category->slug]) }}" rel="category tag">{{ $movie->category->title }}</a></li>
                            <li class="list-info-group-item"><span>Quốc gia</span> : <a href="{{ route('country',[$movie->country->slug]) }}" rel="country tag">{{ $movie->country->title }}</a></li>
                            <li class="list-info-group-item">
                              @if ( $episode_count>0)

                                 @if ($movie->format == 'phimbo')
                                    <span>Tập phim mới nhất</span> :
                                       @if ($episode_count>0)
                                             @foreach ($episode_new as $key => $ep_new)
                                                <a href="{{ url('xem-phim/'.$ep_new->movie->slug.'/tap-'.$ep_new->episode) }}" rel="country tag">Tập {{ $ep_new->episode }}</a>
                                          
                                             @endforeach
                                          
                                          
                                       @endif
                                 @elseif($movie->format == 'phimle') 
                                    <span>Độ phân giải</span> :  
                                          @foreach ($episode_new as $key => $ep_new)
                                             <a href="{{ url('xem-phim/'.$ep_new->movie->slug.'/tap-'.$ep_new->episode) }}" rel="country tag">{{ $ep_new->episode }} </a>
                                          @endforeach


                                       
                                       {{-- <a href="{{ url('xem-phim/'.$ep_new->movie->slug.'/tap-'.$ep_new->episode) }}" rel="country tag">{{ $ep_new->episode }}</a> --}}
                                 @endif
                                 @else
                                 <span>Trạng thái phim</span> :
                                    Đang cập nhật                              
                                 
                              @endif
                           </li>

                           {{-- Đánh giá phim --}}
                           @if ($movie->resolution!=5)
                              @if ( $episode_count>0)
                                 <li class="list-info-group-item" style="display: inline-flex;">
                                    <style type="text/css">
                                       .rating{
                                          float: none;   
                                       }
                                    </style>
                                    <span>Đánh giá phim</span> :
                                       <ul class="list-inline rating" style="margin: -12px 19px"  title="Average Rating">

                                          @for($count=1; $count<=5; $count++)

                                          @php

                                             if($count<=$rating){ 
                                                $color = 'color:#ffcc00;'; //mau vang
                                             }
                                             else {
                                                $color = 'color:#ccc;'; //mau xam
                                             }
                                          
                                          @endphp
                                                <li title="star_rating" id="{{$movie->id}}-{{$count}}" 
                                                      data-index="{{$count}}"  
                                                      data-movie_id="{{$movie->id}}" 
                                                      data-rating="{{$rating}}" 
                                                      class="rating"
                                                   style="cursor:pointer; {{$color}} font-size:30px;">&#9733;
                                                </li>
                                          @endfor
                                       </ul>
                                       <span class="total_rating">{{ $rating }}/{{ $count_total }} lượt</span>
                                 </li>
                              @endif
                           @endif
                        
            
                        </ul>
                         
                     <div class="movie-trailer hidden"></div>
                      </div>
                   </div>
                </div>
                <div class="clearfix"></div>
                <div id="halim_trailer"></div>
                <div class="clearfix"></div>
                <div class="section-bar clearfix">
                   <h2 class="section-title"><span style="color:#ffed4d">Nội dung phim</span></h2>
                </div>
                <div class="entry-content htmlwrap clearfix">
                   <div class="video-item halim-entry-box">
                      <article id="post-38424" class="item-content">
                         {{ $movie->description }}
                      </article>
                   </div>
                </div>
                {{-- Tags phim --}}
                <div class="section-bar clearfix">
                  <h2 class="section-title"><span style="color:#ffed4d">Tags phim</span></h2>
               </div>
               <div class="entry-content htmlwrap clearfix">
                  <div class="video-item halim-entry-box">
                     <article id="post-38424" class="item-content">
                        @if ($movie->tags!=NULL)
                           @php
                              $tags = array();
                              $tags = explode(',', $movie->tags);
                           @endphp
                           @foreach ($tags as $key =>$tag)
                              <a href="{{ url('tag/'.$tag) }}">{{ $tag }}</a>
                           @endforeach    
                        @else
                           {{ $movie->title }}
                        @endif
                     </article>
                  </div>
               </div>
                {{-- Trailer phim --}}
               @if ($movie->resolution == 5)
               <div class="section-bar clearfix">
                  <h2 class="section-title"><span style="color:#ffed4d">Trailer phim</span></h2>
               </div>
               <div class="entry-content htmlwrap clearfix">
                  <div class="video-item halim-entry-box">
                     <article id="watch_trailer" class="item-content">
                        <iframe width="100%" height="315" src="https://www.youtube.com/embed/{{ $movie->trailer }}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                     </article>
                  </div>
               </div>
               @endif
               
               
                
             </div>
          </section>
          <section class="related-movies">
             <div id="halim_related_movies-2xx" class="wrap-slider">
                <div class="section-bar clearfix">
                   <h3 class="section-title"><span>CÓ THỂ BẠN MUỐN XEM</span></h3>
                </div>
                <div id="halim_related_movies-2" class="owl-carousel owl-theme related-film">
                   @foreach ($related as $key => $mov)
                   @if ($mov->resolution!=5)
                   <article class="thumb grid-item post-38498">
                     <div class="halim-item">
                        <a class="halim-thumb" href="{{ route('movie',$mov->slug) }}" title="{{ $mov->title }}">
                           <figure><img class="lazy img-responsive" src="{{ asset('uploads/movie/'.$mov->image) }}" alt="{{ $mov->title }}" title="{{ $mov->title }}"></figure>
                           <span class="status">
                              @if ($mov->resolution==0)
                                    HD
                              @elseif($mov->resolution==1)
                                    SD
                              @elseif($mov->resolution==2)
                                    HDCam
                              @elseif($mov->resolution==3)
                                    Cam
                              @elseif($mov->resolution==4)
                                    FullHD
                              @else
                                    Trailer
                              @endif   
                           </span><span class="episode"><i class="fa fa-play" aria-hidden="true"></i>
                              @if ($mov->subtitle==0)
                                    Phụ đề
                              @else
                                    Thuyết minh
                              @endif
                           </span> 
                           <div class="icon_overlay"></div>
                           <div class="halim-post-title-box">
                              <div class="halim-post-title ">
                                 <p class="entry-title">{{ $mov->title }}</p>
                                 <p class="original_title">{{ $mov->name_eng }}</p>
                              </div>
                           </div>
                        </a>
                     </div>
                  </article>
                   @endif
                  
                  @endforeach
                  
                    
                  
                </div>
                <script>
                   $(document).ready(function($) {				
                   var owl = $('#halim_related_movies-2');
                   owl.owlCarousel({loop: true,margin: 4,autoplay: true,autoplayTimeout: 4000,autoplayHoverPause: true,nav: true,navText: ['<i class="hl-down-open rotate-left"></i>', '<i class="hl-down-open rotate-right"></i>'],responsiveClass: true,responsive: {0: {items:2},480: {items:3}, 600: {items:4},1000: {items: 4}}})});
                </script>
             </div>
          </section>
       </main>
       @include('pages.includes.sidebar')
    </div>
</div>
@endsection