#!/bin/sh

cat jawiki-latest-abstract.xml | perl -lne 'if (m{^<title>(.*)</title>$}) { $t = $1; } elsif (m{^<url>(..*)</url>}) { $u = $1; } elsif (m{^<abstract>(.*)</abstract>$}) { $ab = $1; } else { $ab =~ s{[\[\]{}]}{}g; print "$t\t$u\t$ab" if $t and $u and $ab and $ab !~ m{[|]} and length($ab) > 64; $t = $u = $ab = ""; }' | gzip > title_url_abstract_ja.tsv.gz
cat enwiki-latest-abstract.xml | perl -lne 'if (m{^<title>(.*)</title>$}) { $t = $1; } elsif (m{^<url>(..*)</url>}) { $u = $1; } elsif (m{^<abstract>(.*)</abstract>$}) { $ab = $1; } else { $ab =~ s{[\[\]{}]}{}g; print "$t\t$u\t$ab" if $t and $u and $ab and $ab !~ m{[|]} and length($ab) > 64; $t = $u = $ab = ""; }' | gzip > title_url_abstract_en.tsv.gz
