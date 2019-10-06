<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class DateCommand extends Command
{
    protected $signature = 'ipc:date';

    protected $description = 'Display the current date and time';

    public function handle()
    {
        $this->line('Current date: ' . date('Y-m-d H:i:s'));
    }
}
