<?php

namespace App\Http\Controllers;

class DateHandler 
{
    public function __invoke()
    {
        return ['date' => date('Y-m-d H:i:s')];
    }
}
