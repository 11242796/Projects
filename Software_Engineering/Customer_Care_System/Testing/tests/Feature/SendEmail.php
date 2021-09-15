<?php

use Illuminate\Support\Facades\Notification;
use Lunaweb\EmailVerification\Notifications\EmailVerification;
use Tests\TestCase;
use App\Models\User;
class SendEmail extends TestCase
{




    public function setUp(): void
    {
        parent::setUp();


        Notification::fake();


    }


    public function testResend() {


        $user =  User::create(['email' => 'test@user.com', 'verified' => false]);

        $response = $this->actingAs($user)->json('POST', '/register/verify/resend', [
            'email' => 'new@email.info',
        ]);
        $response->assertRedirect('/home');


        Notification::assertSentTo(
            [$user], EmailVerification::class
        );

        $this->assertFalse($user->verified);

        $notification = Notification::sent($user, EmailVerification::class)->first();

        $activationUrl = $notification->toMail($user)->actionUrl;

        $response = $this->get($activationUrl);

        $response->assertRedirect('/home');
        $response->assertSessionHas('success');

        $user->refresh();
        $this->assertTrue($user->verified);
        $this->assertEquals('new@email.info', $user->email);


    }



}