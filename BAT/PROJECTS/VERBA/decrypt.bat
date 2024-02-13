rem ------------------------------------------------------------------------------
rem VerbaTools -f <files> [-o <crypt|decrypt|setsign|CHECKSIGN>] [-t <VERBA|tula>] [-from <from>] [-to <to1,...>]
rem ------------------------------------------------------------------------------

VerbaTools -f %1 -o decrypt -t VERBA -to %2
