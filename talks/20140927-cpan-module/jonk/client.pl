#!/usr/bin/env perl

# Usage
#  perl -Ilib client.pl http://bleu-ll.com/
#

use strict;
use warnings;
use DBI;
use Jonk::Client;

my $url = shift or die '$0 <url>';
my $dbh = DBI->connect('dbi:SQLite:./jobqueue.db','','');
my $client = Jonk::Client->new($dbh);
$client->enqueue('MyFetcher', $url);
