package pf::dal::_iplog_archive;

=head1 NAME

pf::dal::_iplog_archive -

=cut

=head1 DESCRIPTION

pf::dal::_iplog_archive -

=cut

use strict;
use warnings;

use base qw(pf::dal);

our @FIELD_NAMES;
our @INSERTABLE_FIELDS;
our @PRIMARY_KEYS;
our %DEFAULTS;
our %FIELDS_META;

BEGIN {
    @FIELD_NAMES = qw(
        ip
        iplog_archive_id
        end_time
        mac
        start_time
    );

    %DEFAULTS = (
        ip => '',
        end_time => '',
        mac => '',
        start_time => '',
    );

    @INSERTABLE_FIELDS = qw(
        ip
        end_time
        mac
        start_time
    );

    %FIELDS_META = (
        ip => {
            type => 'VARCHAR',
            is_auto_increment => 0,
            is_primary_key => 0,
            is_nullable => 0,
        },
        iplog_archive_id => {
            type => 'INT',
            is_auto_increment => 1,
            is_primary_key => 1,
            is_nullable => 0,
        },
        end_time => {
            type => 'DATETIME',
            is_auto_increment => 0,
            is_primary_key => 0,
            is_nullable => 0,
        },
        mac => {
            type => 'VARCHAR',
            is_auto_increment => 0,
            is_primary_key => 0,
            is_nullable => 0,
        },
        start_time => {
            type => 'DATETIME',
            is_auto_increment => 0,
            is_primary_key => 0,
            is_nullable => 0,
        },
    );

    @PRIMARY_KEYS = qw(
        iplog_archive_id
    );
}

use Class::XSAccessor {
    accessors => \@FIELD_NAMES,
};

sub _defaults {
    return {%DEFAULTS};
}

sub field_names {
    return [@FIELD_NAMES];
}

sub primary_keys {
    return [@PRIMARY_KEYS];
}

sub table { "iplog_archive" }

our $FIND_SQL = do {
    my $where = join(", ", map { "$_ = ?" } @PRIMARY_KEYS);
    "SELECT * FROM iplog_archive WHERE $where;";
};

sub _find_one_sql {
    return $FIND_SQL;
}

sub _updateable_fields {
    return [@FIELD_NAMES];
}

sub _inserteable_fields {
    return [@INSERTABLE_FIELDS];
}

sub get_meta {
    return \%FIELDS_META;
}
 
=head1 AUTHOR

Inverse inc. <info@inverse.ca>

=head1 COPYRIGHT

Copyright (C) 2005-2017 Inverse inc.

=head1 LICENSE

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
USA.

=cut

1;
