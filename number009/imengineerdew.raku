# Compile:
# $ raku -c imengineerdew.raku
# Syntax OK

sub MAIN() {
    my $object = prompt();
    my $size = $object.Int();
    
    my @sideA;
    my @sideB;
    my @sideC;
    my @aux;

    readTri(@sideA, @sideB, @sideC, $size, 0);
    showTri(@sideA, @sideB, @sideC, @aux, 0);
    say @aux.join(" ");
}

sub readTri(@vectorA, @vectorB, @vectorC, $size, $i) {
    if $i == $size {
        return;
    }
    my ($elementA, $elementB, $elementC) = prompt().split(" ");

    @vectorA.push($elementA.Int);
    @vectorB.push($elementB.Int);
    @vectorC.push($elementC.Int);
    readTri(@vectorA, @vectorB, @vectorC, $size, $i + 1);
}

sub showTri(@vecA, @vecB, @vecC, @aux, $i) {
    return if $i == @vecA.elems || $i == @vecB.elems || $i == @vecC.elems;

    if (@vecA[$i] + @vecB[$i] > @vecC[$i]) {
        if (@vecA[$i] + @vecC[$i] > @vecB[$i]) {
            if (@vecB[$i] + @vecC[$i] > @vecA[$i]) {
                print(1 ~ " ");
            } else {
                print(0 ~ " ");
            }
        } else {
            print(0 ~ " ");
        }
    } else {
        print(0 ~ " ");
    }

    showTri(@vecA, @vecB, @vecC, @aux ,$i + 1);
}

# $ cat DATA.lst | raku imengineerdew.raku
# 1 0 1 0 0 0 0 1 0 1 1 1 1 0 0 1 1 1 0 1 0
