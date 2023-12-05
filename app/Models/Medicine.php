<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medicine extends Model
{
    public $fillable = [
        'scientific_name',
        'commercial_name',
        'category',
        'manufacturer',
        'quantity_available',
        'expiry_date',
        'price'
    ];
}
