use utf8;
package Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2014-09-27 14:18:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:em7niP8do4/WdrVp8zeiKg
__PACKAGE__->connection(
    'dbi:mysql:cataldb', 'root', 'root'
);



# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
