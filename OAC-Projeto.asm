# INIT UTILS VARIABLES
ADDI $t2, $zero, 0 # acumulator
ADDI $t3, $zero, 0 # constant 0


# CREATE AND SAVE STRINGS
# store "Input value:" in stack
ADDI $sp, $sp, -13 # Initialize the stack with 12 positions and 1 for null

ADDI $t0, $zero, 73 # I to stack $t0
SB $t0, 0($sp)      #   position 0

ADDI $t0, $zero, 78 # N to stack $t0
SB $t0, 1($sp)      #   position 1to stack $

ADDI $t0, $zero, 80 # P to stack $t0
SB $t0, 2($sp)      #   position 2

ADDI $t0, $zero, 85 # U to stack $t0
SB $t0, 3($sp)      #   position 3

ADDI $t0, $zero, 84 # T to stack $t0
SB $t0, 4($sp)      #   position 4

ADDI $t0, $zero, 32 # " " to stack $t0
SB $t0, 5($sp)      #   position 5

ADDI $t0, $zero, 86 # V to stack $t0
SB $t0, 6($sp)      #   position 6

ADDI $t0, $zero, 65 # A to stack $t0
SB $t0, 7($sp)      #   position 7

ADDI $t0, $zero, 76 # L to stack $t0
SB $t0, 8($sp)      #   position 8

ADDI $t0, $zero, 85 # U to stack $t0
SB $t0, 9($sp)      #   position 9

ADDI $t0, $zero, 69 # E to stack $t0
SB $t0, 10($sp)     #   position 10

ADDI $t0, $zero, 58 # ":" to stack $t0
SB $t0, 11($sp)     #   position 11

ADDI $t0, $zero, 0 # null to stack @t0
SB $t0, 12($sp)    #    position 12


# store "SUM:" in stack
ADDI $sp, $sp, -5 # Initialize the stack with 4 positions and 1 for null

ADDI $t9, $zero, 83 # S to stack $t9
SB $t9, 0($sp)      #   position 0

ADDI $t9, $zero, 85 # U to stack $t9
SB $t9, 1($sp)      #   position 1

ADDI $t9, $zero, 77 # M to stack $t9
SB $t9, 2($sp)      #   position 2

ADDI $t9, $zero, 58 # ":" to stack $t9
SB $t9, 3($sp)      #   position 3

ADDI $t9, $zero, 0 # null to stack $t9
SB $t9, 4($sp)     #   position 4


addiu $t0, $sp, 0


# INPUT VALUES AND CALCULATE
INPUT_VALUE: # create a block

ADDI $v0, $zero, 51 # 51 is the code for print a null-terminated string
ADDI $a0, $t0, 5    # $a0 gonna receive the $sp stack`s value 
syscall 			      # print to the log
ADD $t2, $t2, $a0

BEQ $a0, $t3, END # if the input is equal to $t3 (zero), get away of the loop

J INPUT_VALUE


# OUTPUT
END: # create a block

# Output string "SUM:"
ADDI $a0, $t0, 0
ADDI $v0, $zero, 4 # 1 is the code for print a int
syscall

# Output sum value
ADDI $a0, $t2, 0
ADDI $v0, $zero, 1 # 1 is the code for print a int
syscall