# Compile
# raku -c imengineerdew.raku
# Syntax OK

sub MAIN() {
    my $size = prompt().Int;
    my @Array[$size];
    my @swapsAndPasses = (0,0);
    
    readVector(@Array);
    bubbleRecursive(@Array, @swapsAndPasses, $size - 1);
    print(@swapsAndPasses[1]);
    print("  ");
    print(@swapsAndPasses[0]);
    print("\n");
}

sub readVector(@vector) {
    my $input = prompt();
    my @numbers = $input.split(" ").map(*.Int);
    @vector = @numbers;   
}

sub showVector(@vector, $index) {
    if ($index == @vector.elems) {
       return;
    }
    print (@vector[$index] ~ " ");
    showVector(@vector, $index + 1);
}

sub bubbleRecursive(@vectorRandom, @swapsAndPasses, $kIndex) {
    if ($kIndex == @vectorRandom.elems) {
        return;
    }
    my $isSwapped = False;
    loop (my $l = 0; $l < $kIndex; $l++) {
        if (@vectorRandom[$l] > @vectorRandom[$l + 1]) {
            my $flagHelper = @vectorRandom[$l];
            @vectorRandom[$l] = @vectorRandom[$l + 1];
            @vectorRandom[$l + 1] = $flagHelper;
            $isSwapped = True;

            # Increase swaps
            @swapsAndPasses[0]++;
        }
    }
    # Increase passes
    @swapsAndPasses[1]++;

    if ($isSwapped) {
        bubbleRecursive(@vectorRandom, @swapsAndPasses, $kIndex - 1);
    }
}

# $ cat DATA.lst | raku imengineerdew.raku
# 14  85
