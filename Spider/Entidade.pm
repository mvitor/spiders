package Spider::Entidade;

use Class::CSV;
use HTML::Entities;
use base qw(Class::Accessor);
my @atrr = qw(nome end telefone descricao url url_logo);

Spider::Entidade->mk_accessors(@atrr);

sub dump	{
	my $self = shift;
	print "Nome: ".$self->nome.$/;
	print "Endere�o: ".$self->end.$/;
	print "Telefone: ".$self->telefone.$/;
	print "Descricao: ".$self->descricao.$/;
	print "Categoria: ".$self->cat.$/;
	print "URL: ".$self->url.$/;
	print "URL Logotipo: ".$self->url_logo.$/x2;
}
sub save_csv	{
	my $self = shift;
	open my $fh,'>>','entidades.csv';
	print $fh join ', ', @{$self}{@atrr};print $fh $/;
	close $fh;
	$self->{num_ok}++;
#	$SUPER->{prod2}->configure(-text=>$self->{num_ok});
#	$self->{janela}->update;		
}
sub nome	{
	my $self = shift;
	@_ = HTML::Entities::decode_entities(@_);
	return $self->_nome_accessor(@_);
}
sub end	{
	my $self = shift;
	@_ = HTML::Entities::decode_entities(@_);
	return $self->_end_accessor(@_);
}
sub descricao	{
	my $self = shift;
	@_ = HTML::Entities::decode_entities(@_);
	return $self->_descricao_accessor(@_);
}
sub cat	{
	my $self = shift;
	@_ = HTML::Entities::decode_entities(@_);
	return $self->_descricao_accessor(@_);
}
sub url	{
	my $self = shift;
	@_ = HTML::Entities::decode_entities(@_);
	return $self->_url_accessor(@_);
}
sub url_logo	{
	my $self = shift;
	@_ = HTML::Entities::decode_entities(@_);
	return $self->_url_logo_accessor(@_);
}

1;

