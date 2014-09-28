package SchemaLoader;

use parent 'DBIx::Class::Schema::Loader';

# see SCHEMA_LOADER_BACKCOMPAT
__PACKAGE__->naming('current');
#__PACKAGE__->use_namespaces(1);

__PACKAGE__->loader_options(
    relationships => 1,
    debug         => 0,
);
__PACKAGE__->connection(
    'dbi:mysql:cataldb', 'root', 'root'
);

1;
