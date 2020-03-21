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

# ....................{ PRAGMAS                           }....................
use strict;
use warnings;

# ....................{ CONSTANTS                         }....................
use constant {
    true => '1',
    false=> '',

    success=> 0,
    failure=> 1,
};

# ....................{ DEPENDENCIES                      }....................
# Import the standard "Test2" bundle *BEFORE* importing subsequent
# dependencies, as the former fundamentally modifies core interpreter behaviour
# expected by the latter. Note that importing this bundle implicitly:
#
# * Enables both "use strict;" and "use warnings;". In theory, this would
#   enable us to omit these pragmas above. In practice, doing so would fail to
#   curtail complaints from linters (e.g., perlcritic). Ergo, we don't.
# * Enables *ALL* "Test2" tools (i.e., "Test2"-based Perl modules exporting
#   testing functions), excluding "Test2::Tools::ClassicCompare".
use Test2::V0;

use Test::Script qw(
    script_compiles
    script_runs
    script_stdout_like
);

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
#  * "File::Temp" provides a tempdir() function that when called appropriately
#    (e.g., "tempdir(CLEANUP => 1)") also facilitates creation of a temporary
#    directory guaranteed to be removed on completion, albeit without any of
#    the testing facilities provided by "Test::Directory".
#* "File::Copy::Recursive", the canonical solution for safely performing
#  recursive directory copies in a platform-agnostic manner.

# ....................{ GLOBALS                           }....................
# Relative filename of this project's script, relative to this project's
# top-level repository directory.
my $SCRIPT_FILENAME = 'script/mv-pcre';

# Substring prefixing the names of all tests performed in this file.
my $TEST_NAME_PREFIX = "Script \"$SCRIPT_FILENAME\"";

# ....................{ TESTS                             }....................
# Test that this script compiles.
script_compiles($SCRIPT_FILENAME, "$TEST_NAME_PREFIX compiles");

# ....................{ TESTS ~ options                   }....................
#FIXME: To test this, we need to call script_runs() like so:
#    my %options = (exit=> 1);
#    script_runs( $script, \%options, $test_name );
#Sadly, that doesn't apply to Windows. Examine the "Test::Script" codebase to
#decide what exactly we should replace the above "1" with for portability.
# Test that this script fails when run without arguments.
# script_runs($SCRIPT_FILENAME, "$TEST_NAME_PREFIX runs without arguments");

#FIXME: See above. Again, this is expected to fail.
# Test that this script displays help documentation when run without arguments.
# script_stdout_like(
#     qr~^NAME\n~,
#     $SCRIPT_FILENAME,
#     "$TEST_NAME_PREFIX displays help documentation when run without arguments"
# );

#FIXME: Add a test exercising passing an unrecognized option.
#FIXME: Add a test exercising passing only one rather than two arguments.

# ....................{ POSTAMBLE                         }....................
# Finalize "Test2"-based testing.
done_testing();
