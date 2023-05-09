<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MovieRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => 'required|max:255',
            'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:2048',
            'slug' => 'required',
            'episode' => 'required',
            'movie_duration' => 'required',
            'name_eng' => 'required',
            'tags' => 'required',
            'subtitle' => 'required',
            'resolution' => 'required',
            'category_id' => 'required',
            'format' => 'required',
            'country_id' => 'required',
            'phim_hot' => 'required',
            'description' => 'required',
            'status' => 'required',

        ];
    }
    public function messages()
    {
        return [
            'title.required' => 'Tên phim không được bỏ trống',
            'image.required' => 'Hình ảnh chưa được chọn',
            'image.image' => 'File chọn phải là file ảnh',
            'image.mimes' => 'Đuôi mở rộng của ảnh không phù hợp',
            'slug.required' => 'Slug không được bỏ trống',
            'episode.required' => 'Tập không được bỏ trống',
            'movie_duration.required' => 'Thời lượng phim không được bỏ trống',
            'name_eng.required' => 'Tên tiếng anh không được bỏ trống',
            'tags.required' => 'Từ khóa không được bỏ trống',
            'subtitle.required' => 'Subtitle không được bỏ trống',
            'resolution.required' => 'Độ phân giải phim không được bỏ trống',
            'description.required' => 'Description không được bỏ trống',
            'category_id.required' => 'Danh mục phim chưa được chọn',
            'format.required' => 'Thuộc phim chưa được chọn',
            'country_id.required' => 'Quốc gia chưa được chọn',
            'phim_hot.required' => 'Hot chưa được chọn',
            'status.required' => 'Status chưa được chọn',
        ];
    }
}
