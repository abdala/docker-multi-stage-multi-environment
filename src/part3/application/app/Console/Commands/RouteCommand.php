<?php

namespace App\Console\Commands;

use Illuminate\Http\Request;
use Illuminate\Console\Command;
use Illuminate\Contracts\Http\Kernel;

class RouteCommand extends Command
{
    protected $signature = 'ipc:route {path?}';

    protected $description = 'Execute a route';

    public function handle(Kernel $kernel)
    {
        $path = $this->argument('path') ?: env('API_ROUTE');
        $request = Request::create($path, 'GET');
        
        $this->output->write($kernel->handle($request)->getContent());
    }
}
