# ===========================================================================
# A Movable Type plugin to force all templates to static when saved.
# Copyright 2006 Everitz Consulting <everitz.com>.
#
# This program is free software:  You may redistribute it and/or modify it
# it under the terms of the Artistic License version 2 as published by the
# Open Source Initiative.
#
# This program is distributed in the hope that it will be useful but does
# NOT INCLUDE ANY WARRANTY; Without even the implied warranty of FITNESS
# FOR A PARTICULAR PURPOSE.
#
# You should have received a copy of the Artistic License with this program.
# If not, see <http://www.opensource.org/licenses/artistic-license-2.0.php>.
# ===========================================================================
package MT::Plugin::YBDynamic;

use base qw(MT::Plugin);
use strict;

use MT;

my $YBDynamic;
my $about = {
  name => 'MT-YBDynamic',
  description => 'Force all templates to static when saved.',
  author_name => 'Everitz Consulting',
  author_link => 'http://everitz.com/',
  version => '0.0.2'
};
$YBDynamic = MT::Plugin::YBDynamic->new($about);
MT->add_plugin($YBDynamic);

use MT::Template;
MT::Template->add_callback('post_save', 10, $about, \&force_static);

sub force_static {
  my ($err, $obj) = @_;
  $obj->build_dynamic(0);
  $obj->save;
}

1;

