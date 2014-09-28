#!/usr/bin/env perl

use v5.18;
use Carp::Reply qw(repl);

my $foo = 'foo value';
Carp::Reply::repl();        #=> ここでREPLに入る
                            #=> ↓は、REPLをC-dが:qコマンドで抜けた後に実行される

my $baz = 'baz value';
print "$baz\n";
