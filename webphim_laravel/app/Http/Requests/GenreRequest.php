<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GenreRequest extends FormRequest
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
            'title' => 'required|unique:genres|max:255',
            'slug' => 'required',
            'description' => 'required',
            'status' => 'required',
        ];
    }
    public function messages()
    {
        return [
            'title.required' => 'Thể loại không được bỏ trống',
            'title.unique' => 'Thể loại đã tồn tại ! Bạn vui lòng nhập Thể loại khác',
            'slug.required' => 'Slug không được bỏ trống',
            'description.required' => 'Description không được bỏ trống',
            'status.required' => 'Status chưa được chọn',
        ];
    }
}
