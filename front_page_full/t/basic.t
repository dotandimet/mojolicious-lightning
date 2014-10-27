use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('FrontPageFull');
#$t->get_ok('/')->status_is(200)->content_like(qr/Mojolicious/i);
$t->websocket_ok('/title')->send_ok('http://mojolicio.us')->message_ok->message_is("Mojolicious - Perl real-time web framework")->close_ok;

done_testing();
