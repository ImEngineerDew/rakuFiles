# Compile:
# $ raku -c imengineerdew.raku
# Syntax OK

sub MAIN() {
    my $length = get().Int;
    my @tokens = get().split(" ");
    my $playX = @tokens[0].Int;
    my $playY = @tokens[1].Int;
    my $angles = @tokens[2].Num;
    coordinates($length, 1, $playX, $playY, $angles);
}

sub coordinates($length, $acum, $pX, $pY, $ang) {
    if $acum <= $length {
        my @tokens = get().split(" ");
        my $xI = @tokens[0].Int;
        my $yI = @tokens[1].Int;

        my $max = (2 * pi) + atan(0.2 / 0.5);
        my $min = (2 * pi) - atan(0.2 / 0.5);

        my $posX = cos($ang) * ($xI - $pX) + sin($ang) * ($yI - $pY);
        my $posY = cos($ang) * ($yI - $pY) + (-sin($ang)) * ($xI - $pX);

        my $hype = sqrt($posX ** 2 + $posY ** 2);
        my $beta = abs(atan($posY / $posX));
        my $quad = 0;

        my $soFar = 60;

        if $posX < 0 && $posY > $posX {
            $quad = $beta - pi;
        }
        if $posX < 0 && $posY < 0 {
            $quad = $beta + pi;
        }
        if $posX > 0 && $posY < 0 {
            $quad = (pi * 2) - $beta;
        }
        if $posX > 0 && $posY > 0 {
            $quad = (pi * 2) + $beta;
        }
        if $hype < $soFar && $quad > $min && $quad < $max {
            say "$posX  $posY";
        }
        coordinates($length, $acum + 1, $pX, $pY, $ang);
    }
}

#$ cat DATA.lst | raku imengineerdew.raku
# 53.779620809447366  -16.84495133837006
# 46.90854661986942  10.37247578987473
# 24.43882928451594  5.361307974952204
# 44.677682452693645  -11.353620156420156
# 44.218336718156934  -14.482358160178691
# 56.75410636568173  12.12317659002312
# 55.33272809307235  -8.443293301675695
# 7.242031982098296  -0.7436213890585899
# 39.382238983249245  7.002803200593557
# 49.42539224558496  -9.493713781764729
# 47.47709792891317  18.599063746554258
# 32.687940677704034  -12.46990514201699
# 23.69520789545735  -1.8807240071460916
# 24.154553629994062  1.2480139966124408
# 58.43894266032231  8.360022771713034
