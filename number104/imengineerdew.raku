# Compile
# raku -c imengineerdew.raku
# Syntax OK

sub MAIN() {
    my $size = prompt().Int;
    my @Result[$size];
    my @Vector[6];
    
    calculateA(@Result, @Vector, 0);
    resultTriangle(@Result,0);
    print("\n");
}

sub calculateA(@area, @vector, $index) { 
    if ($index == @area.elems) { 
       return;
    }
    my @numbers = readVector(@vector);
    @area[$index] = calculateArea(@numbers);
    calculateA(@area, @vector, $index + 1);
}

sub calculateArea(@vector) {
   my $result = 0.5 * abs(((@vector[0]*@vector[3])+(@vector[2]*@vector[5])
                     +(@vector[4]*@vector[1]) - (@vector[2]*@vector[1])
                     -(@vector[4]*@vector[3]) - (@vector[0]*@vector[5])));
   return $result;                     
}

sub resultTriangle(@result, $index) {
    if ($index == @result.elems) { 
       return;
    }
    printf("%.1f",@result[$index]);
    print(" ");
    resultTriangle(@result, $index + 1);
}

sub readVector(@vector) {
    my $input = prompt();
    @vector = $input.split(" ").map(*.Int);
    return @vector;
}

sub showVector(@vector, $index) {
    if ($index == @vector.elems) {
       return;
    }
    print(@vector[$index] ~ " ");
    showVector(@vector, $index + 1);
}

# $ cat DATA.lst | raku imengineerdew.raku
# 6466325.0 8752628.5 11371223.0 2228894.5 
# 43260.5 13604765.0 8109577.5 1819726.0 
# 3125992.0 26815647.0 2847.5 11732353.0 
# 3298252.0 5579059.0 
