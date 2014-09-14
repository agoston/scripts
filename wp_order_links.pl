#!/usr/bin/perl
my $in = do { local $/; <STDIN> };
print join('</a>', sort(split('</a>', $in))), "\n"
