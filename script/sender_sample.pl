#!/usr/local/bin/perl 

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Job9::Sender;

Job9::Sender->new->send;
