#!/bin/sh
# TODO: Make this a proper shell script
dir -1 | perl -ne 'chomp; next if /install/; print ".$_\n";`cp -r $_ ~/.$_`'
echo DONE
