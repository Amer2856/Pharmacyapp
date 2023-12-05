<?php

namespace App\Http\Controllers;

use App\Models\Medicine;


use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $data = $request->input('search');
        $product = Medicine::where('scientific_name', 'LIKE', '%' . $data . '%')->get();
        return $product;
    }
}
