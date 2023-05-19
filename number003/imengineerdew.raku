# Compile:
# $ raku -c imengineerdew.raku
# Syntax OK

sub MAIN() {
    my $object = prompt;
    my $size = $object.Int;

    my @vectorA;
    my @vectorB;
    my @vectorR;

    readArray(@vectorA, @vectorB, 0, $size);
    resultSum(@vectorA, @vectorB, 0, @vectorR);
    say @vectorR.join(" ");
}

sub resultSum(@vectorA, @vectorB, $i, @vectorR) {
    if $i == @vectorA.elems || $i == @vectorB.elems {
        return;
    }
    my $res = @vectorA[$i] + @vectorB[$i];
    @vectorR.push($res);
    resultSum(@vectorA, @vectorB, $i + 1, @vectorR);
}

sub readArray(@vectorA, @vectorB, $i, $size) {
    if $i == $size {
        return;
    }
    my ($elementA, $elementB) = prompt.split(" ");

    @vectorA.push($elementA.Int);
    @vectorB.push($elementB.Int);
    readArray(@vectorA, @vectorB, $i + 1, $size);
}

# $ cat DATA.lst | raku imengineerdew.raku
# 1449584 1547607 888712 1001259 482959 
# 833512 1260954 719834 753350 932734 1588077 1119271
