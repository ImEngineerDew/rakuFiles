# Compile:
# $ raku -c imengineerdew.raku
# Syntax OK

my %roman-map = 'I' => 1, 'V' => 5, 'X' => 10, 
                'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000;

sub MAIN() {
    my $op-quantity = prompt;
    performOperations($op-quantity);
}

sub performOperations($remainingOps) {
    if $remainingOps <= 0 {
        return;
    }
    my $ops = prompt;

    my ($romNum1, $symbolOp, $romNum2) = $ops.words;

    my $decimal1 = romanToDecimal($romNum1);
    my $decimal2 = romanToDecimal($romNum2);

    my $result;
    if $symbolOp eq "+" {
        $result = $decimal1 + $decimal2;
    } else {
        $result = $decimal1 - $decimal2;
    }

    my $res = intToRoman($result);
    say $res;

    performOperations($remainingOps - 1);
}

sub romanToDecimal($romanNumber) {
    return romToDecRec($romanNumber, 0, $romanNumber.chars - 1);
}

sub romToDecRec($romanNumber, $left, $right) {
    if $left > $right {
        return 0;
    }

    if $left == $right {
        return %roman-map{$romanNumber.substr($left, 1)};
    }

    my $current = %roman-map{$romanNumber.substr($left, 1)};
    my $next = %roman-map{$romanNumber.substr($left + 1, 1)};

    if $current < $next {
        return $next - $current + romToDecRec($romanNumber, $left + 2, $right);
    } else {
        return $current + romToDecRec($romanNumber, $left + 1, $right);
    }
}

sub intToRoman($number) {
    if $number <= 0 || $number > 3999 {
        return "Invalid number";
    }
    return intToRomanRecursive($number);
}

sub intToRomanRecursive($number) {
    if $number >= 1000 {
        return "M" ~ intToRomanRecursive($number - 1000);
    } elsif $number >= 900 {
        return "CM" ~ intToRomanRecursive($number - 900);
    } elsif $number >= 500 {
        return "D" ~ intToRomanRecursive($number - 500);
    } elsif $number >= 400 {
        return "CD" ~ intToRomanRecursive($number - 400);
    } elsif $number >= 100 {
        return "C" ~ intToRomanRecursive($number - 100);
    } elsif $number >= 90 {
        return "XC" ~ intToRomanRecursive($number - 90);
    } elsif $number >= 50 {
        return "L" ~ intToRomanRecursive($number - 50);
    } elsif $number >= 40 {
        return "XL" ~ intToRomanRecursive($number - 40);
    } elsif $number >= 10 {
        return "X" ~ intToRomanRecursive($number - 10);
    } elsif $number >= 9 {
        return "IX" ~ intToRomanRecursive($number - 9);
    } elsif $number >= 5 {
        return "V" ~ intToRomanRecursive($number - 5);
    } elsif $number >= 4 {
        return "IV" ~ intToRomanRecursive($number - 4);
    } elsif $number >= 1 {
        return "I" ~ intToRomanRecursive($number - 1);
    } else {
        return "";
    }
}

# $ cat DATA.lst | raku imengineerdew.raku
# MMCCXIX
# MMCLXXV
# MMMCL
# MDCCCXCVIII
# MMMDCCXLIV
# MMMCMXCIX
# CMXCI
# MDCLXVII
# CLV
# MCLXXXI
# MMMCMLXVII
# MMMCLXVI
# MMCDXCIX
# MMDLXXV
# MMMCCCLXXXV
# CCXVI
# MMCCLXXIII
# MXXXV
# DCXXVI
# DCCCXIV
# MDLXVI
# MMMCMXV
# CLXXX
