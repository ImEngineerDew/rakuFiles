# Compile
# raku -c imengineerdew.raku
# Syntax OK

sub MAIN(){
   my $object = prompt();
   my $size = $object.Int;
   my @Aux;
   my @valA;
   my @valB;
   
   readVector(@valA, @valB, $size, 0);
   showVector(@valA, @valB, @Aux, 0);
   say @Aux.join(" ");
}

sub readVector(@vectorA, @vectorB, $size, $index) {
    if ($index == $size) {
       return;
    }
    my ($variableA, $variableB) = prompt.split(" ");
    @vectorA.push($variableA.Int);
    @vectorB.push($variableB.Int);
    readVector(@vectorA, @vectorB, $size, $index + 1);
}

sub showVector(@vectorA, @vectorB, @aux, $index) {
    if ($index != @vectorA.elems) {
       my @coe = bezout(@vectorA[$index], @vectorB[$index], @vectorA[$index], 1, 0, @vectorB[$index], 0, 1);
       print(@coe[0]~" "~@coe[1] ~ " " ~ @coe[2] ~ "\n");
       showVector(@vectorA, @vectorB, @aux, $index + 1);
    }
}

sub calcGCD(@vectorA, @vectorB, $index) { 
    if ($index ==  @vectorA.elems) { 
       return @vectorA;
    }
    my @gcdValue = calcGCD(@vectorA, @vectorB, $index + 1);
    @gcdValue[$index] = commonGreaterDivisor(@vectorA[$index], @vectorB[$index]);
    return @gcdValue;    
}

sub commonGreaterDivisor($a, $b) {
    if ($a < $b) {
       return commonGreaterDivisor($b, $a);
    } elsif ($b == 0) { 
       return $a; 
    }
    my @coefficients = bezout($a, $b, $a, 1, 0, $b, 0, 1);
    return @coefficients[0];    
}

sub bezout($a, $b, $r, $s, $t, $x, $y, $z) {
    if ($r == 0) {
        my @result = ($x, $y, $z);
        return @result;
    } else {
        my $quotient = $x div $r;
        my $temporal = $x % $r;
        my $otherR = $temporal;

        $temporal = $y - $quotient * $s;
        my $otherS = $temporal;

        $temporal = $z - $quotient * $t;
        my $otherT = $temporal;

        bezout($a, $b, $otherR, $otherS, $otherT, $r, $s, $t);
    }
}

# $ cat DATA.lst | raku imengineerdew.raku
# 1 17872 -5789
# 1 -3399 24238
# 2 -18088 4353
# 9 556 -1795
# 1 -2922 2887
# 1 21835 -10679
# 1 -24482 26609
# 1 -6184 7755
# 33 608 -993
# 3 584 -429
# 7 3727 -2091
# 1 25249 -18762
# 1 -5783 6004
# 2 1069 -1693
# 1 120 -169
# 1 25008 -7331
# 29 769 -1493
# 1 -1240 4393
# 4 8697 -3854
# 2 -4180 4813
# 1 -23433 4540
# 3 255 -107
# 1 -6531 1985
# 2 6046 -6693
# 18 1222 -381
