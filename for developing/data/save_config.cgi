#!/usr/bin/perl -wT
use CGI qw(:standard);
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use strict;
use Fcntl qw(:flock :seek);

my $outfile = "poll.out";

if (param('script')) {
	open(OUT, ">$outfile") or &dienice("Couldn't open $outfile: $!");
} else {
	&dienice("You didn't pick anything!");
}