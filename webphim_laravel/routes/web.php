<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\IndexController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Artisan;
//AdminController
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\GenreController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\EpisodeController;
use App\Http\Controllers\InfoController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Route index
Route::get('/', [IndexController::class, 'home'])->name('homepage');
Route::get('/danh-muc/{slug}', [IndexController::class, 'category'])->name('category');//Danh mục
Route::get('/the-loai/{slug}', [IndexController::class, 'genre'])->name('genre');//Thể loại
Route::get('/quoc-gia/{slug}', [IndexController::class, 'country'])->name('country');//Quốc gia
Route::get('/phim/{slug}', [IndexController::class, 'movie'])->name('movie');//Phim
Route::get('/xem-phim/{slug}/{tap}', [IndexController::class, 'watch']);//Xem phim
Route::get('/tap-phim', [IndexController::class, 'episode'])->name('episode');//Tập phim
Route::get('/tim-kiem', [IndexController::class, 'search'])->name('search');//Tìm kiếm phim
Route::get('/loc-phim', [IndexController::class, 'filter'])->name('filter');//Tìm kiếm phim
Route::post('/add-rating', [IndexController::class, 'add_rating'])->name('add-rating');//Đánh giá phim
Route::get('/nam/{year}', [IndexController::class, 'year']);//Năm phim
Route::get('/tag/{tag}', [IndexController::class, 'tag']);//Tags phim






Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');

//route admin 
Route::resource('category', CategoryController::class);
Route::post('resorting', [CategoryController::class, 'resorting'])->name('resorting');
Route::resource('country', CountryController::class);
Route::resource('genre', GenreController::class);
Route::resource('movie', MovieController::class);


// Update year, season movie
Route::post('/update-year-movie', [MovieController::class, 'update_year']);//Update Phim theo năm
Route::post('/update-season-movie', [MovieController::class, 'update_season']);//Update Phim theo season

//Top view
Route::get('/update-topview-movie', [MovieController::class, 'update_topview']);//Update Phim theo topview
Route::get('/filter-topview-default', [MovieController::class, 'filter_default']);//Hiển thị top filter default
Route::post('/filter-topview-movie', [MovieController::class, 'filter_topview']);//Update Phim theo top filter

//Episode
Route::resource('episode', EpisodeController::class);
Route::get('/select-episode', [EpisodeController::class, 'select_episode'])->name('select-episode');// Thêm tập phim
Route::get('/add-episode/{id}', [EpisodeController::class, 'add_episode'])->name('add-episode');// Thêm tập phim ở trang quản lý movie

//Thay đổi category movie = ajax
Route::get('/select-category', [MovieController::class, 'select_category'])->name('select-category');
//Thay đổi country movie = ajax
Route::get('/select-country', [MovieController::class, 'select_country'])->name('select-country');
//Thay đổi subtitle movie = ajax
Route::get('/select-subtitle', [MovieController::class, 'select_subtitle'])->name('select-subtitle');
//Thay đổi status movie = ajax
Route::get('/select-status', [MovieController::class, 'select_status'])->name('select-status');
//Thay đổi hot movie = ajax
Route::get('/select-hot', [MovieController::class, 'select_hot'])->name('select-hot');
//Thay đổi format movie = ajax
Route::get('/select-format', [MovieController::class, 'select_format'])->name('select-format');
//Thay đổi resolution movie = ajax
Route::get('/select-resolution', [MovieController::class, 'select_resolution'])->name('select-resolution');
//Thay đổi image movie = ajax
Route::post('/update-image-movie-ajax', [MovieController::class, 'update_image_movie_ajax'])->name('update-image-movie-ajax');
//Xem tập phim trong movie admin
// Route::post('/watch-video', [MovieController::class, 'watch_video'])->name('watch-video');

//Thông tin website
Route::resource('info', InfoController::class);

Route::get('/create_sitemap', function(){
    return Artisan::call('sitemap:create');
});