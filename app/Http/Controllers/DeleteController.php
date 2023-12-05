<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Medicine;
class DeleteController extends Controller
{
    public function delete(Request $request)
    {
        $data = $request->input('delete');
        $product = Medicine::where('scientific_name', 'LIKE', '%' . $data . '%')->delete();
        return $product;
    }
}