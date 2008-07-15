# ===========================================================================
# Copyright 2006, Everitz Consulting (mt@everitz.com)
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
  author_link => 'http://www.everitz.com/',
  version => '0.0.1'
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

