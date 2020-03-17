#!/usr/bin/env perl

#FIXME: Use "Test2::V0" rather than "Test::More", as the former largely
#obsoletes the latter and more closely resembles "py.test" while doing so. See:
#    https://metacpan.org/pod/Test2::Suite
#    https://perlmaven.com/getting-started-with-test2
#
#Usage appears trivial:
#
#   # Prefix each ".t"-filetyped file in "t/" with this:
#   use Test2::V0;
#
#   # Suffix each such file with this:
#   done_testing();

#FIXME: Recursively copy the contents of the source "data" directory into a
#target temporary directory. Doing so will require leveraging at least the
#following third-party modules:
#
#* "Test::Directory", which dramatically simplifies both the creation and
#  subsequent removal of this temporary directory as well as path testing.
#  What makes this module particularly relevant for our use case is its
#  automatic tracking of new paths and ability to implicitly fail if unexpected
#  new paths crop up or old paths disappear during testing. It is supah cool.
#  Sadly, this otherwise ubiquitous module fails to support recursive copying.
#  It would appear that "Test::Directory" leverages "Test::Bulder" under the
#  hood, which has been refactored to defer to "Test2". Ergo, everything should
#  work as is without modification. Sweet! Note also that:
#  * "Test2::Tools:: GenTemp" provides a Test2-compliant alternative. While not
#    nearly as feature-complete as "Test::Directory", this might suffice for
#    our limited neads -- but probably not.
#* "File::Copy::Recursive", the canonical solution for safely performing
#  recursive directory copies in a platform-agnostic manner.
