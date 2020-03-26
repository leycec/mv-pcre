#!/usr/bin/env perl
# --------------------( LICENSE                           )--------------------
# Copyright (c) 2007-2020 Cecil Curry
# See "LICENSE" for further details.
#
# --------------------( SYNOPSIS                          )--------------------
# Standardized file for listing CPAN-hosted Perl project dependencies.
#
# --------------------( SEE ALSO                          )--------------------
# * https://metacpan.org/pod/cpanfile and "perldoc cpanfile", documenting the
#   format for this file.

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# CAVEATS: On modifying this file, run the following command to regenerate all
# downstream files hosted at this repository (e.g., "META.json", "README.md"):
#     $ minil build
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# ....................{ DEPENDENCIES                      }....................
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# CAVEATS: This version requirement *MUST* be synchronized between multiple
# files on each change. See "script/mv-pcre" for further details.
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
# Minimum version of Perl required by this script.
requires 'perl', '>= 5.008001';

# ....................{ DEPENDENCIES ~ runtime            }....................
# Third-party Perl modules required by scripts in the "script/" subdirectory.
#
# This project intentionally requires *ONLY* core Perl modules at runtime,
# conveniently reducing this subsection to a noop.

on 'runtime' => sub {
};

# ....................{ DEPENDENCIES ~ testing            }....................
# Third-party Perl modules required by tests in the "t/" subdirectory.

on 'test' => sub {
    requires 'Test2::V0',    '>= 0.000077';
    requires 'Test::Script', '>= 1.23';
};
