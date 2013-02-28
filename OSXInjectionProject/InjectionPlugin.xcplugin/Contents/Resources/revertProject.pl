#!/usr/bin/perl -w

#  $Id: //depot/InjectionPluginLite/revertProject.pl#4 $
#  Injection
#
#  Created by John Holdsworth on 15/01/2013.
#  Copyright (c) 2012 John Holdsworth. All rights reserved.
#
#  These files are copyright and may not be re-distributed, whole or in part.
#

use strict;
use FindBin;
use lib $FindBin::Bin;
use common;

my $key = "// From here to end of file added by Injection Plugin //";

print "\\b Reverting project contained in: $projRoot\n";

patchAll( "main.m", sub {
    $_[0] =~ s/\n+$key.*/\n/s;
} );

patchAll( "*refix.pch", sub {
    $_[0] =~ s/\n+$key.*/\n/s;
} );
