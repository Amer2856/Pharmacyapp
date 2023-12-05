<?php

namespace App\Http\Controllers;

use App\Models\Medicine;
use Illuminate\Http\Request;

class MedicineController extends Controller
{
    public function store(Request $request)
    {
        $medicine = new Medicine();
        $medicine->scientific_name = $request->input('scientific_name');
        $medicine->commercial_name = $request->input('commercial_name');
        $medicine->category = $request->input('category');
        $medicine->manufacturer = $request->input('manufacturer');
        $medicine->quantity_available = $request->input('quantity_available');
        $medicine->expiry_date = $request->input('expiry_date');
        $medicine->price = $request->input('price');
        $medicine->save();
    }
}
