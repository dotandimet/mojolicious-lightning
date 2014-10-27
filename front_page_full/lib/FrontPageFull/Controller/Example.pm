package FrontPageFull::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

# This is a websocket action
sub title {
  my $c = shift;
  $c->on(message => sub { my ($c, $msg) = @_;
    my $title = $c->ua->get($msg)->res->dom->at('title')->text;
    $c->send($title);
  });
};


1;
