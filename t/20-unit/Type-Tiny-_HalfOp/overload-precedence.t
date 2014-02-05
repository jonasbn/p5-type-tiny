use strict;
use warnings FATAL => 'all';
use Test::More;

use Types::Standard -all;

my $union = eval { ArrayRef[Int] | HashRef[Int] };

SKIP: {
  ok $union or skip 'broken type', 6;
  ok $union->check({welp => 1});
  ok !$union->check({welp => 1.4});
  ok !$union->check({welp => "guff"});
  ok $union->check([1]);
  ok !$union->check([1.4]);
  ok !$union->check(["guff"]);
}

done_testing;
