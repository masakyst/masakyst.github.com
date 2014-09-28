#!/usr/bin/env perl

# googleアカウントで安全性の低いアプリを有効にする必要あり

use v5.18;
use Email::Sender::Simple qw(sendmail);
use Email::Sender::Transport::SMTPS;
use Data::Dumper;

my $transport = Email::Sender::Transport::SMTPS->new(
    host          => 'smtp.gmail.com',
    ssl           => 'starttls',
    sasl_username => 'masakyst.mobile@gmail.com',
    sasl_password => '',
);  

my $email = Email::Simple->create(
    header => [
        From    => 'masakyst.mobile@gmail.com',
        To      => 'm.saito@bleu-ll.com',
        Subject => 'hello',
    ],  
    body => 'world',
);  

sendmail($email, { transport => $transport });

