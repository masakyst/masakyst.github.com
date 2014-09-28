#!/usr/bin/env perl

use strict;
use warnings;
use DBI;
use Time::Piece;
use Parallel::Prefork;
use Jonk::Worker;
use MyFetcher;
use File::RotateLogs;

my $rotatelogs = File::RotateLogs->new(
    logfile      => './worker_log.%Y%m%d%H%M',
    linkname     => './worker_log',
    rotationtime => 86400,
    maxage       => 86400*14,
);

my $logger = sub {
    $rotatelogs->print(join("\t", @{[
        localtime->strftime('%Y-%m-%d %H:%M:%S'),
        $$,
        shift,
    ]})."\n");
};


my $pm = Parallel::Prefork->new({
    max_workers       => 5,
    trap_signals      => {
        TERM => 'TERM',
        HUP  => 'TERM',
    },
});

while ($pm->signal_received ne 'TERM') {
    $pm->start and next;

    my $dbh = DBI->connect('dbi:SQLite:./jobqueue.db','','');
    $logger->("DBI connect");

    my $jonk = Jonk::Worker->new($dbh => {functions => [qw/MyFetcher/]});
    $logger->("Create worker");

    while (1) {
        if (my $job = $jonk->dequeue) {
            $logger->("wget ".$job->{arg});
            MyFetcher->work($job);
        } else {
            sleep(3);
            $logger->("wait for 3 sec");
        }
    }

    $pm->finish;
}

$pm->wait_all_children();
