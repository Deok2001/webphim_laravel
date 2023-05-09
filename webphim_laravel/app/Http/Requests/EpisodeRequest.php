<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EpisodeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'movie_id' => 'required',
            'link' => 'required',
            'episode' => 'required',
            'status' => 'required',

        ];
    }
    public function messages()
    {
        return [
            'movie_id.required' => 'Bạn chưa chọn phim',
            'link.required' => 'link không được bỏ trống',
            'episode.required' => 'Tập phim chưa chọn',
            'status.required' => 'Status chưa được chọn',
        ];
    }
}
