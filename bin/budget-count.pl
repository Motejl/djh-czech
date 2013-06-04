#!/usr/bin/env perl

use Modern::Perl;

while (my $line = <>) {
    if ($line =~ /:\s*(\d+)$/) {
        my $ns = int $1/1800;
        my $rounded = int $1/1000;
        $line =~ s/$1/${rounded}K (~$ns NS)/;
    }
    print $line;
}
