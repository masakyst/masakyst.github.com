#!/usr/bin/env perl

use v5.18;

use Schema;
my $schema = Schema->connect;

my $book = $schema->resultset('Book')->find({isbn => '978-4-8443-2699-1'});

say $book->isbn;
say $book->title;
say $book->price;

