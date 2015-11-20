[
 {
  name  => 'parse-json',
  skip  => [qw( )],
  tags  => [qw( io input parsing )],
  scale => 1 << 3,
  perl5 => [qw( BENCH/perl5/parse-json DATA/panda-projects.json SCALE )],
  perl6 => [qw( BENCH/perl6/parse-json DATA/panda-projects.json SCALE )],
  nqp   => [qw( BENCH/nqp/parse-json   DATA/panda-projects.json SCALE )],
 },
 {
  name  => 'parse-json-no-obj-creation',
  skip  => [qw( )],
  tags  => [qw( io input parsing )],
  scale => 1 << 3,
  perl6 => [qw( BENCH/perl6/parse-json-no-obj-creation DATA/panda-projects.json SCALE )],
  nqp   => [qw( BENCH/nqp/parse-json-no-obj-creation   DATA/panda-projects.json SCALE )],
 },
 {
  name  => 'rc-forest-fire',
  skip  => [qw( niecza.nqp p6.pl p6.js_v8 )],
  tags  => [qw( io output random simulation array cross for forest-fire )],
  scale => 1 << 3,
  x_label => 'Frames per Run',
  y_label => 'Frames per Second',
  perl5 => [qw( BENCH/perl5/rc-forest-fire 16 16 SCALE )],
  perl6 => [qw( BENCH/perl6/rc-forest-fire 16 16 SCALE )],
  nqp   => [qw( BENCH/nqp/rc-forest-fire   16 16 SCALE )],
 },
 {
  name  => 'rc-man-or-boy-test',
  skip  => [qw( )],
  tags  => [qw( recursion closures )],
  scale => 15,
  scaling => 'linear',
  x_label => 'k Parameter',
  work  => sub { 1 << ($_[0] - 1) },
  expected => sub {
      my @expected = qw( 1 0 -2 0 1 0 1 -1 -10 -30 -67 -138 -291 -642 -1446
                         -3250 -7244 -16065 -35601 -78985 -175416 -389695
                         -865609 -1922362 -4268854 -9479595 -21051458 );
      "$expected[$_[0]]\n";
  },
  perl5 => [qw( BENCH/perl5/rc-man-or-boy-test SCALE )],
  perl6 => [qw( BENCH/perl6/rc-man-or-boy-test SCALE )],
  nqp   => [qw( BENCH/nqp/rc-man-or-boy-test   SCALE )],
 },
 {
  name  => 'rc-self-describing-numbers',
  skip  => [qw( )],
  tags  => [qw( )],
  scale => 1 << 11,
  expected => sub {
      my @known = qw( 1210 2020 21200 3211000 42101000 );
      my @expected;
      for (@known) {
          push @expected, "$_\n" if $_ <= $_[0];
      }
      join '' => @expected;
  },
  perl5 => [qw( BENCH/perl5/rc-self-describing-numbers SCALE )],
  perl6 => [qw( BENCH/perl6/rc-self-describing-numbers SCALE )],
  nqp   => [qw( BENCH/nqp/rc-self-describing-numbers   SCALE )],
 },
 {
  name  => 'rc-dragon-curve',
  skip  => [qw( )],
  tags  => [qw( io output )],
  scale => 10,
  scaling => 'linear',
  x_label => 'Order',
  work  => sub { 1 << $_[0] },
  perl5 => [qw( BENCH/perl5/rc-dragon-curve SCALE )],
  perl6 => [qw( BENCH/perl6/rc-dragon-curve SCALE )],
  nqp   => [qw( BENCH/nqp/rc-dragon-curve   SCALE )],
 },
 {
  name  => 'rc-9-billion-names',
  skip  => [qw( )],
  tags  => [qw( bigint bigmem )],
  scale => 1 << 7,
  perl5 => [qw( BENCH/perl5/rc-9-billion-names SCALE )],
  perl6 => [qw( BENCH/perl6/rc-9-billion-names SCALE )],
  nqp   => [qw( BENCH/nqp/rc-9-billion-names   SCALE )],
 },
 {
  name  => 'rc-mandelbrot',
  skip  => [qw( )],
  tags  => [qw( complex io output )],
  scale => 1 << 5,
  work  => sub { $_[0] * $_[0] * 2 / 3 },
  perl5 => [qw( BENCH/perl5/rc-mandelbrot SCALE )],
  perl6 => [qw( BENCH/perl6/rc-mandelbrot SCALE )],
  nqp   => [qw( BENCH/nqp/rc-mandelbrot   SCALE )],
 },
 {
  name  => 'spinner',
  skip  => [qw( )],
  tags  => [qw( io output forest-fire )],
  scale => 1 << 5,
  perl5 => [qw( BENCH/perl5/spinner SCALE )],
  perl6 => [qw( BENCH/perl6/spinner SCALE )],
  nqp   => [qw( BENCH/nqp/spinner   SCALE )],
 },
 {
  name  => 'rc-forest-fire-stringify',
  skip  => [qw( )],
  tags  => [qw( array string forest-fire )],
  scale => 1 << 7,
  perl5 => [qw( BENCH/perl5/rc-forest-fire-stringify 16 16 SCALE )],
  perl6 => [qw( BENCH/perl6/rc-forest-fire-stringify 16 16 SCALE )],
  nqp   => [qw( BENCH/nqp/rc-forest-fire-stringify   16 16 SCALE )],
 },
 {
  name  => 'rc-perfect-shuffle',
  skip  => [qw( )],
  tags  => [qw( array map )],
  scale => 52,
  expected => sub {
      my @expected = qw(1 8 51 20 66 36 155 110 164 466 172 114 33 180 121 180);
      my @expected_exp = qw(8 51 66 164 92 831 1108 2420 504 273);
      my $i = int($_[0] / 52);
      ($expected[$i] // $expected_exp[log($i)/log(2)]) . "\n";
  },
  x_label => 'Deck size',
  perl5 => [qw( BENCH/perl5/rc-perfect-shuffle SCALE )],
  perl6 => [qw( BENCH/perl6/rc-perfect-shuffle SCALE )],
  nqp   => undef,
 },
 {
  name  => 'string-escape',
  skip  => [qw( )],
  tags  => [qw( string escape trans subs )],
  scale => 1 << 13,
  expected => sub { ($_[0] * 2) . "\n" },
  perl5 => [qw( BENCH/perl5/string-escape SCALE )],
  perl6 => [qw( BENCH/perl6/string-escape SCALE )],
  nqp   => undef,
 },
 {
  name  => 'divide-and-conquer',
  skip  => [qw( )],
  tags  => [qw( stress threads )],
  scale => 0,
  scaling => 'linear',
  work  => sub { 1 << $_[0] },
  expected => "1\n",
  perl5 => undef,
  perl6 => [qw( BENCH/perl6/divide-and-conquer SCALE )],
  nqp   => undef,
 },
 {
  name  => 'point-class-add',
  enabled => 0,
  skip  => [qw( )],
  tags  => [qw( oo )],
  scale => 1 << 3,
  expected => "650000001.5 950000002.5",
  perl5 => undef,
  perl6 => [qw( BENCH/perl6/point-class-add )],
  nqp   => [qw( BENCH/nqp/point-class-add   )],
 },
 {
  name     => 'insertion-sort',
  skip     => [qw( )],
  tags     => [qw( sorting array )],
  scale    => 0,
  perl5    => [qw( BENCH/perl5/insertion-sort SCALE)],
  perl6    => [qw( BENCH/perl6/insertion-sort SCALE)],
 },
 {
  name     => 'merge-sort',
  skip     => [qw( )],
  tags     => [qw( sorting array )],
  scale    => 0,
  perl5    => [qw( BENCH/perl5/merge-sort SCALE)],
  perl6    => [qw( BENCH/perl6/merge-sort SCALE)],
 },    
 {
  name     => 'pi-sequential-iteration',
  skip     => [qw( )],
  tags     => [qw( math )],
  scale    => 1 << 10,
  perl5    => [qw( BENCH/perl5/pi-sequential-iteration SCALE)],
  perl6    => [qw( BENCH/perl6/pi-sequential-iteration SCALE)],
 },    
 {
  name     => 'send-more-money-subs',
  skip     => [qw( )],
  tags     => [qw( )],
  scale    => 1,
  perl5    => [qw( BENCH/perl5/send-more-money-subs )],
  perl6    => [qw( BENCH/perl6/send-more-money-subs )],
 },    
 {
  name     => 'send-more-money-loops',
  skip     => [qw( )],
  tags     => [qw( )],
  scale    => 1,
  perl5    => [qw( BENCH/perl5/send-more-money-loops )],
  perl6    => [qw( BENCH/perl6/send-more-money-loops )],
  nqp      => [qw( BENCH/nqp/send-more-money-loops )],
 },    
]
