.MODEL SMALL

.STACK 100H
.DATA

OPT1 DB 10,13, "For Addition:'1'$"
OPT2 DB 10,13, "For Subtraction:'2'$"
OPT3 DB 10,13,"For Multiplication:'3'$"
OPT4 DB 10,13,"For Division:'4'$"
OPT5 DB 10,13,"To find Power of a number:'5'$"
OPT6 DB 10,13,"To find Square of a number:'6'$"
OPT7 DB 10,13,"To find Factorial of a number:'8'$" 
OPT8 DB 10,13,"Enter 'E' for exit$"
CHC DB 10,13,"Choose Any One:$"
MSG1 DB 10,13,10,13, "Enter 1st Number:$"
MSG2 DB 10,13, "Enter 2nd Number:$"
MSG3 DB 10,13,10,13, "Enter Power: $"
MSG4 DB 10,13,10,13, "Enter Base: $"
MSG5 DB 10,13,10,13, "Enter a Number: $"  
CONTINUE DB 10,13, "DO YOU WANT TO CONTINUE?$"
EX DB 10,13,"THANK YOU FOR USING CALCULATOR!$"
M1 DB " ^ $"
M2 DB " = $"
RESL DB 10,13,10,13, "The Result is:$"
                           

NUM1 DB ?
NUM2 DB ?
RESULT DB ? 
CON DB ?
RES DW 1
BASE DB ?
POWER DB ?
SQUARE DB 2

.CODE

START:    
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,OPT1
    MOV AH,9
    INT 21H
    
    LEA DX,OPT2
    MOV AH,9
    INT 21H
    
    LEA DX,OPT3
    MOV AH,9
    INT 21H
    
    LEA DX,OPT4
    MOV AH,9
    INT 21H
    
    LEA DX,OPT5
    MOV AH,9
    INT 21H
    
    LEA DX,OPT6
    MOV AH,9
    INT 21H
    
    LEA DX,OPT7
    MOV AH,9
    INT 21H
    
    LEA DX,OPT8
    MOV AH,9
    INT 21H 
   
    LEA DX,CHC
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE Addition
    
    CMP BH,2
    JE Subtraction
     
    CMP BH,3
    JE Multiplication
    
    CMP BH,4
    JE Division 
    
    CMP BH,5
    JE Pow

    CMP BH,6
    JE Sqa
    
    CMP BH,7
    JE Factorial  
    
    CMP AL,'E'
    JE EXIT 
    
START_P:
     
    MOV AX,@DATA
    MOV DS,AX
       
    LEA DX,OPT1
    MOV AH,9
    INT 21H
    
    LEA DX,OPT2
    MOV AH,9
    INT 21H
    
    LEA DX,OPT3
    MOV AH,9
    INT 21H
    
    LEA DX,OPT4
    MOV AH,9
    INT 21H
    
    LEA DX,OPT5
    MOV AH,9
    INT 21H
    
    LEA DX,OPT6
    MOV AH,9
    INT 21H
    
    LEA DX,OPT7
    MOV AH,9
    INT 21H
    
    LEA DX,OPT8
    MOV AH,9
    INT 21H  
   
    LEA DX,CHC
    MOV AH,9
    INT 21H
    
  
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE Addition
    
    CMP BH,2
    JE Subtraction
     
    CMP BH,3
    JE Multiplication
    
    CMP BH,4
    JE Division 
    
    CMP BH,5
    JE Pow

    CMP BH,6
    JE Sqa
    
    CMP BH,7
    JE Factorial 
    
    CMP AL,'E'
    JE EXIT
       
Addition:
    LEA DX,MSG1  ;ENTER 1ST NUMBER
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    LEA DX,MSG2    ;ENTER 2ND NUMBER
    MOV AH,9
    INT 21H 

    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ADD AL,BL
    MOV AH,0
    AAA

    MOV BX,AX 
    ADD BH,48
    ADD BL,48 

    LEA DX,RESL
    MOV AH,9
    INT 21H

    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H 
              
    MOV AH,09H
    MOV DX,OFFSET CONTINUE
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV CON,AL
    MOV AL,CON
    
    CMP AL,'Y'
    JE START_P
     
    
    CMP AL,'N'
    JE EXIT

Subtraction:
 
    LEA DX,MSG1  ;ENTER 1ST NUMBER
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    LEA DX,MSG2    ;ENTER 2ND NUMBER
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    SUB BL,CL
    ADD BL,48
      
    LEA DX,RESL
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET CONTINUE
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV CON,AL
    MOV AL,CON
    
    CMP AL,'Y'
    JE START_P
    
    CMP AL,'N'
    JE EXIT
    
Multiplication:
 
    LEA DX,MSG1
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL

    LEA DX,MSG2
    MOV AH,9
    INT 21H 

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL

    MUL NUM1
    MOV RESULT,AL
    AAM  

    ADD AH,30H
    ADD AL,30H

    MOV BX,AX 

    LEA DX,RESL
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET CONTINUE
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV CON,AL
    MOV AL,CON
    CMP AL,'Y'
    JE START_P
    CMP AL,'N'
    JE EXIT
    
Division:
	
    LEA DX,MSG1
    MOV AH,9
    INT 21H

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL

    LEA DX,MSG2
    MOV AH,9
    INT 21H 

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL
    
    MOV CL,NUM1
    MOV CH,00
    MOV AX,CX  
    
    DIV NUM2
    MOV RESULT,AL
    MOV AH, 00
    AAD  

    ADD AH,30H
    ADD AL,30H

    MOV BX,AX 

    LEA DX,RESL
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H

    MOV AH,09H
    MOV DX,OFFSET CONTINUE
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV CON,AL
    MOV AL,CON
    CMP AL,'Y'
    JE START_P
    CMP AL,'N'
    JE EXIT   
    
    
Pow:
    LEA DX,MSG3
    MOV AH,9
    INT 21H

    MOV AH,01H
    INT 21H
    MOV [POWER],AL
    SUB [POWER],30H

    LEA DX,MSG4
    MOV AH,9
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV [BASE],AL 
    MOV CL,[POWER]
    
    

FOR:
    MUL [RES]
    CMP CL,1
    JE FOR_END
    MOV [RES],AX
    MOV AL,[BASE]
    LOOP FOR

FOR_END:
    AAM
    MOV [RES],AX

    LEA DX,RESL
    MOV AH,09H
    INT 21H

    MOV DL,[BASE]
    ADD DL,30H
    MOV AH,02H
    INT 21H

    LEA DX,M1
    MOV AH,09H
    INT 21H

    MOV DL,[POWER]
    ADD DL,30H
    MOV AH,02H
    INT 21H

    LEA DX,M2
    MOV AH,09H
    INT 21H

    MOV DL,BYTE PTR RES[1]
    ADD DL,30H
    MOV AH,02H
    INT 21H

    MOV DL,BYTE PTR RES[0]
    ADD DL,30H
    MOV AH,02H
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET CONTINUE
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV CON,AL
    MOV AL,CON
    CMP AL,'Y'
    JE START_P
    CMP AL,'N'
    JE EXIT    

Sqa:
    LEA DX,MSG5
    MOV AH,9
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV [BASE],AL
    MOV CL,[SQUARE]

FOR_S:
    MUL [BASE]
    CMP CL,1
    JE FOR_END_S
    MOV BYTE PTR RES,AL
    MOV AL,[BASE]
    LOOP FOR_S

FOR_END_S:
    AAM
    MOV [RES],AX

    LEA DX,RESL
    MOV AH,09H
    INT 21H

    MOV DL,[BASE]
    ADD DL,30H
    MOV AH,02H
    INT 21H

    LEA DX,M1
    MOV AH,09H
    INT 21H

    MOV DL,[SQUARE]
    ADD DL,30H
    MOV AH,02H
    INT 21H

    LEA DX,M2
    MOV AH,09H
    INT 21H

    MOV DL,BYTE PTR RES[1]
    ADD DL,30H
    MOV AH,02H
    INT 21H

    MOV DL,BYTE PTR RES[0]
    ADD DL,30H
    MOV AH,02H
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET CONTINUE
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV CON,AL
    MOV AL,CON
    CMP AL,'Y'
    JE START_P
    CMP AL,'N'
    JE EXIT  
    
Factorial:
    LEA DX,MSG5
    MOV AH,9
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV CL,AL
    MOV CH,00H
    MOV AX,0001H
    MOV DX,0000H
    MOV BX,0001H
    
YY: MUL BX
    DEC CX
    CMP CX,00
    JE XX
    INC BX
    JMP YY
   
XX:        
    MOV RESULT,AL
    AAM  

    ADD AH,30H
    ADD AL,30H

    MOV BX,AX 

    LEA DX,RESL
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,09H
    MOV DX,OFFSET CONTINUE
    INT 21H
    
    MOV AH,01H
    INT 21H
    
    MOV CON,AL
    MOV AL,CON
    CMP AL,'Y'
    JE START_P
    CMP AL,'N'
    JE EXIT
    
EXIT:      
    MOV AH,09H
    MOV DX,OFFSET EX
    INT 21H
    
        
.EXIT
END
