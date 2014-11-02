package FrontPageFull::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use 5.20.0;
use experimental 'signatures';


# This action will render a template
sub welcome($self) {

  # Render template "example/welcome.html.ep" with message
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

# This is a websocket action
sub title($self) {
  $self->on(message => sub { my ($self, $msg) = @_;
    my $title = $self->ua->get($msg)->res->dom->at('title')->text;
    $self->send($title);
  });
};

# This is a websocket action
sub bogusbot($self) {
  $self->on(message => sub { my ($self, $msg) = @_;
    
    my $full = $self->ua->get($msg, { 'User-Agent' => 'Googlebot/2.1; +http://www.google.com/bot.html)'  } )->res->dom->find('#article-box p')->join("\n");
    $self->send($full);
  });
};


1;
