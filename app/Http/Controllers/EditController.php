<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Medicine;

class EditController extends Controller
{
    public function edit(Request $request)
    {
        $id = $request->input("id");
        $med = Medicine::find($id+1);
        $med->update([
            "quantity_available" => $request->input("new")
        ]);
    }
}