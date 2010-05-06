dir /B | perl -ne "use feature ':5.10'; chomp; next if /install/; say '_'. $_; $h=$ENV{'HOMEPATH'}; $h=~s/ /\\ /;`xcopy $_ $ENV{'HOMEDRIVE'}\$h\_$_ /e /y`"
echo DONE
