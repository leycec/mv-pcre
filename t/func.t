#!/usr/bin/env perl
# --------------------( LICENSE                           )--------------------
# Copyright (c) 2007-2020 Cecil Curry
# See "LICENSE" for further details.
#
# --------------------( SYNOPSIS                          )--------------------
# "Test2"-based functional (also referred to as "integration") tests externally
# exercising the "mv-pcre" script CLI.
#
# --------------------( SEE ALSO                          )--------------------
# * "perldoc Test2::Suite", high-level documentation for the "Test2" framework.
# * "perldoc Test2::V0", mid-level documentation for the "Test2::V0" bundle.

# ....................{ DEPENDENCIES                      }....................
# Require the standard "Test2" bundle, which implicitly:
#
# * Enables both "use strict;" and "use warnings;", which we thus omit above.
# * Enables *ALL* "Test2" tools (i.e., "Test2"-based Perl modules exporting
#   testing functions), excluding "Test2::Tools::ClassicCompare".
use Test2::V0;

#FIXME: Write preliminary functional tests using "Test::Script", which is
#basically everything that we were looking for:
#    https://metacpan.org/pod/Test::Script

#FIXME: Add a top-level ".travis.yml" file exercising this test suite.

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
#  It would appear that "Test::Directory" leverages "Test::Builder" under the
#  hood, which has been refactored to defer to "Test2". Ergo, everything should
#  work as is without modification. Sweet! Note also that:
#  * "Test2::Tools:: GenTemp" provides a Test2-compliant alternative. While not
#    nearly as feature-complete as "Test::Directory", this might suffice for
#    our limited neads -- but probably not.
#* "File::Copy::Recursive", the canonical solution for safely performing
#  recursive directory copies in a platform-agnostic manner.

# ....................{ TESTS                             }....................

# ....................{ POSTAMBLE                         }....................
# Finalize "Test2"-based testing.
done_testing();
