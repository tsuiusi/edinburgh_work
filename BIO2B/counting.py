string = r"5ʹATGGTGCACC TGAGGATCCA GGAGAAGTCT GCCGTTACTG CCCTGTGGGG 3ʹ5ʹCAAGGTGAAC GTGGATGAAG TTGGTGGTGA GGCCCTGGGC AGGCTGCTGG 3ʹ5ʹTCAGCTGCCC TTGGACCCAG AGGTTCTTTG AGTCCTTTGG GGGTCTGTCC 3ʹ5ʹACTCCTGATG CTGTTATGGG CAACCCTAAG GTGAAGGCTC ATGGCAAGAA 3ʹ5ʹACCCGGGAGT GCCTTTAGTG ATGCCCTGGC TCACCTGGAC AACCTCAAGG 3ʹ5ʹGCACCTTTGC CACACTGAGT GAGAATTCAA TGTGAGAAGC TCACGTGGAT 3ʹ"
string = string.replace(' ', "")
string = string.replace("5ʹ", "")
string = string.replace("3ʹ", "")
string = string.replace("ʹ", "")
print(string)
recognition = "GGCC"

splitstring = string.split(recognition)

print(len(string))
print(len(splitstring) - 1)
print(splitstring)
