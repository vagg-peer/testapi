<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Mail\SendEmail;
use App\Models\Offer;
use App\Models\User;
use Mail;

class SendQueueEmail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $offer;
    /**
     * Create a new job instance.
     */
    public function __construct(Offer $offer) 
    {
        
        $this->offer = $offer;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $users = User::all();
        $email = new SendEmail($this->offer);

        foreach ( $users as $user ){
            Mail::to($user->email)->send($email);
        }
        
    }
}
