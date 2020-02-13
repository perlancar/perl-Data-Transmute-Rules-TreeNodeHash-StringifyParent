package Data::Transmute::Rules::TreeNodeHash::StringifyParent;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

our @RULES = (
    [transmute_nodes => {
        recurse_object => 1,
        rules => [
            [create_hash_key => {
                name => 'parent',
                replace => 1,
                value_code => sub { ref $_[0] ? "$_[0]" : $_[0] },
            }],
        ],
    }],
);

1;
# ABSTRACT: Stringify parent attributes in tree nodes to make it more dump-friendly

=head1 DESCRIPTION

Tree is an interlinked data structure, where a child node links back to its
parent (and the parent links back to *its* parent, and so on). This makes the
dump of a tree structure looks unwieldy; if you dump a node, you will end up
dumping the whole tree.

This rule walks the tree structure and replaces the value of hash key 'parent'
to its stringified value. This will prevent "dumping upwards" and make the
structure more dump-friendly.
