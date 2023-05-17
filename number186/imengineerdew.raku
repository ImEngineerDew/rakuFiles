# Compile:
# $ raku -c imengineerdew.raku
# Syntax OK

sub simples($quantity, $index) {
    my $width = 480;
    my $height = 360;
    my $scrDistant = 0.5;
    my $scrWidth = 0.4;
    my $scrHeight = 0.3;
    my $eY = 1.0;

    if $index < $quantity {
        my @tokens = get().split(" ");
        my $valueOfX = @tokens[0].Num;
        my $valueOfY = @tokens[1].Num;
        my $valueOfH = @tokens[2].Num;

        my $valueOfK = $scrDistant / $valueOfX;
        my $sX = -$valueOfY * $valueOfK;
        my $sY = -$eY * $valueOfK;
        my $sH = $valueOfH * $valueOfK;

        my $resOfX = ($sX + ($scrWidth / 2)) * ($width / $scrWidth);
        my $resOfY = (($scrHeight / 2) - $sY) * ($height / $scrHeight);
        my $resOfH = (($scrHeight / 2) - $sY - $sH) * ($height / $scrHeight);
        
        print "{$resOfX.round.Int} ";
        print "{$resOfY.round.Int} ";
        print "{$resOfH.round.Int} \n";   
        simples($quantity, $index + 1);
    }
}

sub MAIN (){
    my $quantity = get().Int;
    simples($quantity, 0);
    say " ";
}

#$ cat DATA.lst | raku imengineerdew.raku
# 171 197 153 
# 295 207 185 
# 240 280 220 
# 409 195 171 
# 131 207 139 
# 126 209 166 
# 0 300 48 
# 480 220 124 
# 440 193 164 
# 40 197 168 
# 55 203 162 
# 315 255 210 
# 240 223 163
