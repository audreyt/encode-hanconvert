#!/usr/bin/perl
# $File: //member/autrijus/Encode-HanConvert/map/ucm2map.pl $ $Author: autrijus $
# $Revision: #2 $ $Change: 3939 $ $DateTime: 2003/01/27 22:52:26 $

use strict;
use Encode 1.41;
use Cwd;

my $dir = getcwd();
chdir 'map' if -e 'big5-simp.ucm';

open IN, '../big5-simp.ucm' or die $!;
open OUT, '>b2g_map.txt' or die $!;

print OUT "B5 GB\n-----\n";

while (<IN>) {
    next unless /^<U(....)> \\x(..)\\x(..) \|0/;
    print OUT chr(hex($2)), chr(hex($3)), " ", 
	      encode('gbk', chr(hex($1))), "\n";
}

open IN, '../gbk-trad.ucm' or die $!;
open OUT, '>g2b_map.txt' or die $!;

print OUT "GB B5\n-----\n";

while (<IN>) {
    next unless /^<U(....)> \\x(..)\\x(..) \|\d/;
    print OUT chr(hex($2)), chr(hex($3)), " ", 
	      encode('big5', chr(hex($1))), "\n";
}

chdir $dir;
