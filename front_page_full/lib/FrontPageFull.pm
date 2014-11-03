package FrontPageFull;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#index');
  $r->get('/lookup')->to('example#lookup');
  $r->get('/haaretz')->to('example#haaretz');
  $r->websocket('/title')->to('example#title');
  $r->websocket('/nb_title')->to('example#nb_title');
  $r->websocket('/bogusbot')->to('example#bogusbot');
}

1;
