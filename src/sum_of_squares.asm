// Step 1: read first digit
START,
// wait for input
        SKI
// loop until ready
        BUN START
// clear AC
        CLA
// read first ASCII digit
        INP
// store it
        STA ASCIN1

// Step 1: read second digit
WAIT2,
// wait for second digit
        SKI
// loop until ready
        BUN WAIT2
        CLA
// read second ASCII digit
        INP
        STA ASCIN2

// convert first ASCII digit to decimal
        LDA ASCIN1
        ADD NEG48
        STA D1

// convert second ASCII digit to decimal
        LDA ASCIN2
        ADD NEG48
        STA D2

// TEMP = D1
        LDA D1
        STA TEMP

// COUNT10 = -10 for loop
        LDA TEN
        CMA
        INC
        STA COUNT10

// multiply D1 by 10
MUL10_LOOP,
// TEMP = TEMP + D1
        LDA TEMP
        ADD D1
        STA TEMP
// repeat 10 times
        ISZ COUNT10
        BUN MUL10_LOOP
        LDA TEMP
        ADD D2
        STA INPUT

// Step 2: SUM = 0
        CLA
        STA SUM

// I = 2 (first even number)
        LDA TWO
        STA I

// Step 3–5: loop over even numbers
LOOP_START,
// calculate INPUT - I
        LDA I
        CMA
        INC
        ADD INPUT
// if negative stop
        SNA
        BUN LOOP_BODY
        BUN LOOP_END

// square I using repeated addition
LOOP_BODY,
// COUNTER = -I
        LDA I
        CMA
        INC
        STA COUNTER

// TEMP2 = 0
        CLA
        STA TEMP2

SQUARE_LOOP,
// TEMP2 = TEMP2 + I
        LDA TEMP2
        ADD I
        STA TEMP2
        ISZ COUNTER
        BUN SQUARE_LOOP

// SUM = SUM + I^2
        LDA SUM
        ADD TEMP2
        STA SUM

// I = I + 2
        LDA I
        ADD TWO
        STA I

        BUN LOOP_START

// Step 6: convert SUM to hex
LOOP_END,
// QUOTIENT = 0
        CLA
        STA QUOTIENT

// REMAINDER = SUM
        LDA SUM
        STA REMAINDER

HEX_LOOP,
// check if remainder < 16
        LDA SIXTEEN
        CMA
        INC
        ADD REMAINDER
        SNA
        BUN HEX_CONT

// remainder < 16 → done
HEX_DONE,
// move remainder to HEXDEC
        LDA REMAINDER
        STA HEXDEC

// check if HEXDEC < 10
        LDA HEXDEC
        ADD NEG10
        SNA
        BUN LOW_LETTER

// output 0–9
LOW_NUMBER,
        LDA HEXDEC
        ADD ASCII0
        STA HEX
        BUN HIGH_PROCESS

// output A–F
LOW_LETTER,
        LDA HEXDEC
        ADD ASCIIA
        STA HEX

HIGH_PROCESS,
// HEX1DEC = QUOTIENT
        LDA QUOTIENT
        STA HEX1DEC

// check if HEX1DEC < 10
        LDA HEX1DEC
        ADD NEG10
        SNA
        BUN HIGH_LETTER

// output 0–9
HIGH_NUMBER,
// HEX1 = HEX1DEC + '0'
        LDA HEX1DEC
        ADD ASCII0
        STA HEX1
        BUN OUTPUT_HEX

// output A–F
HIGH_LETTER,
// HEX1 = HEX1DEC + 'A' - 10
        LDA HEX1DEC
        ADD ASCIIA
        STA HEX1

// Step 7: output
OUTPUT_HEX,
// print high digit
        LDA HEX1
        OUT
// print low digit
        LDA HEX
        OUT
// stop
        HLT

// subtract 16 loop
HEX_CONT,
// REMAINDER
        LDA REMAINDER
        ADD NEG16
        STA REMAINDER
// QUOTIENT
        LDA QUOTIENT
        INC
        STA QUOTIENT
        BUN HEX_LOOP

// data
ASCIN1,     DEC 0
ASCIN2,     DEC 0
D1,         DEC 0
D2,         DEC 0
TEMP,       DEC 0
COUNT10,    DEC 0
TEN,        DEC 10

INPUT,      DEC 0
SUM,        DEC 0
I,          DEC 0

COUNTER,    DEC 0
TEMP2,      DEC 0

REMAINDER,  DEC 0
QUOTIENT,   DEC 0

HEXDEC,     DEC 0
HEX,        DEC 0
HEX1DEC,    DEC 0
HEX1,       DEC 0

TWO,        DEC 2
SIXTEEN,    DEC 16
NEG16,      DEC -16
NEG48,      DEC -48
NEG10,      DEC -10
ASCII0,     DEC 48
ASCIIA,     DEC 55

END