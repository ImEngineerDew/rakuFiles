# Compile
# raku -c imengineerdew.raku
# Syntax OK

sub MAIN() {
    my $size = prompt().Real;
    my @Array[$size];
    my $index = 0;
    
    readVector(@Array, $index);
    showVector(@Array, $index); 
}

sub readVector(@vector, $index) {
    if ($index == @vector.elems) {
       return;
    }
    my $s = prompt;
    @vector[$index] = calculateSquaresAux($s, 2, 1);
    readVector(@vector, $index + 1);
}

sub showVector(@vector, $index) {
    if ($index == @vector.elems) {
        return;
    }
    print(@vector[$index] ~ "\n");
    showVector(@vector, $index + 1);
}

sub calculateRecursive($s, $m, $n) {
   if $n >= $m {
      return 0.0;
   }
   my $a = ($m ** 2) - $n * $n;
   my $b = 2.0 * $m * $n;
   my $c = ($m ** 2) + ($n ** 2);
        
   if ($a + $b + $c == $s) { 
      my $cSquared = ($c ** 2);
      return $cSquared;
   }
   return calculateRecursive($s, $m, $n + 1);
}

sub calculateSquaresAux($s, $m, $n) {
   if $m > sqrt($s) {
      return 0.0;
   }
   my $result = calculateRecursive($s, $m, 1);
   if $result != 0.0 {
      return $result;
   }
   return calculateSquaresAux($s, $m + 1, 1);
}

# $ cat DATA.lst | raku imengineerdew.raku
# 48089301276025
# 80234029449025
# 76379576890681
# 78128362950625
# 113352071836249
# 83115768736225
# 90359568235225
# 46018924875625
# 37827580070569
