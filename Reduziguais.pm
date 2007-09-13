package Text::Statistics::Reduziguais;
use strict;

=head1 NAME

Text::Statistics::Reduziguais

DESCRIPTION

This very simple module deletes duplicated lines, and counts how many times
each value has been duplicated.
Observation: input data need be sorted accendently,
because the search for duplicated values is not iterative!
The separator in output is . (dot) (see line 42)
The first comloum is line ID, the second one is number of repetitions,
the thyrd is original value.


=head1 VERSION

Version 0.01

=cut


#my $entrada = "tf-icf.txt";
my $saida = "tf-idf2.txt";
my $linha = 0;
my $match = 1;
my $sequencia = 0;
my $ultima_linha;

sub reduz{

my $entrada = shift;

open (my $in, "<", $entrada) || die "Can not open ", $entrada, "$!";
open (my $out, ">", $saida) || die "Can not open ", $saida, "$!";

my @cash = <$in>;

##descobre quantas linhas há
while ($cash[$linha] =~ /.+\n/){
    $linha++;
}
print "No input há um total de ", $linha, " linhas.", "\n";
##fim do descobre
$ultima_linha = $linha;
$linha = 0;


while ($cash[$linha]){    
    while ($cash[$linha] =~ $cash[($linha + 1)]){
        $match++;
        $linha++;        
    }
    $sequencia++;
    print "$sequencia.$match.", "$cash[($linha - 1)]";             #está com bug na primeira linha do output
    if ($match == 1){
        $linha++;
    }
    else{
        $linha = $linha + 2
    }
    $match = 1;
}
}
1;



