INCLUDE Irvine32.inc
includelib Irvine32.lib
includelib Kernel32.lib
includelib User32.lib
includelib Winmm.lib
include macros.inc

includelib winmm.lib

PlaySound PROTO,
pszSound:PTR BYTE,
hmod : DWORD,
fdwSound : DWORD

BUFFER_SIZE = 501

.model small
.stack 100h
.data

BRICK_LOGO db '           -----   ----    ---    ----    -   - ', 13, 10
            db '           |   |   -   -    -   -         -  - ', 13, 10
            db '           ---/    ----     -  -          ---      ', 13, 10
            db '           |   \   -  -     -   -         -  -    ', 13, 10
            db '           -----   -   -   ---   ----     -   - ', 13, 10
            db 0


BREAKER_LOGO db '          -----    ----      -----     -----     -   -   -----   ----', 13, 10
             db '          |   |    -   -     -         -   -     -  -    -       -   - ', 13, 10
             db '          ---/     ----      ----      -----     ---     -----   ----', 13, 10
             db '          |   \    -  -      -         -   -     -  -    -       -   -  ', 13, 10
             db '          -----    -   -     -----     -   -     -   -   -----   -   -   ', 13, 10
             db '          i23-3037 --> Ayesha Khan    ', 13, 10
             db '          i23-0065 --> Zainab Naeem    ', 13, 10
             db 0

START db '**********************************************', 13, 10
      db '*                                            *', 13, 10
      db '*          WELCOME TO BRICK BREAKER          *', 13, 10
      db '*                                            *', 13, 10
      db '*      PRESS START TO BEGIN THE ADVENTURE    *', 13, 10
      db '*                                            *', 13, 10
      db '**********************************************', 13, 10
      db 0
   


INSTRUCTIONS db '------------------------------------------', 13, 10
            db '|                INSTRUCTIONS              |', 13, 10
            db '------------------------------------------', 13, 10
            db '| Use left right to move the paddle.       |', 13, 10
            db '|                                          |', 13, 10
            db '| Objective: Break all the bricks to win.  |', 13, 10
            db '|                                          |', 13, 10
            db '| Avoid letting the ball fall below the    |', 13, 10
            db '| paddle to prevent losing lives.          |', 13, 10
            db '------------------------------------------', 13, 10
            db 0


 MENU db '**********************************************', 13, 10
      db '*                                            *', 13, 10
      db '*     WELCOME TO THE BRICK BREAKER MENU      *', 13, 10
      db '*                                            *', 13, 10
      db '*     Press I for Instructions               *', 13, 10
      db '*     Press N to Enter Name                  *', 13, 10
      db '*     Press H for High Score                 *', 13, 10
      db '*     Press S to Start                       *', 13, 10
      db '*     Press E to Exit                        *', 13, 10
      db '*                                            *', 13, 10
      db '**********************************************', 13, 10
      db 0




TITLE_SCREEN      DB '                                            ___ ___ ___ ___ ___   ',13,10
                  DB '                                              / __|_ _| . | . |_ _|  ',13,10
                  DB '                                              \__ \| ||   |   /| |   ',13,10
                  DB '                                              <___/|_||_|_|_\_\|_|   ',13,10
                  DB 0 


EXITED              db'                                                                                ',13,10
                    db'                                                                                ',13,10
                    db'                             $$$$$$$$\ $$\   $$\ $$$$$$\ $$$$$$$$\              ',13,10
                    db'                             $$  _____|$$ |  $$ |\_$$  _|\__$$  __|             ',13,10
                    db'                             $$ |      \$$\ $$  |  $$ |     $$ |                ',13,10
                    db'                             $$$$$\     \$$$$  /   $$ |     $$ |                ',13,10
                    db'                             $$  __|    $$  $$<    $$ |     $$ |                ',13,10
                    db'                             $$ |      $$  /\$$\   $$ |     $$ |                ',13,10
                    db'                             $$$$$$$$\ $$ /  $$ |$$$$$$\    $$ |                ',13,10
                    db'                             \________|\__|  \__|\______|   \__|                ',13,10
                    db 0
                                           
 POINTER            DB'  <<<<<<<<<<<<<<<<   ',13,10
                    DB 0


pauseScreen         db'                 #####################################                 ',13,10
                    db'                 ##        PAUSED SCREEN DESIGN       ##                 ',13,10
                    db'                 #####################################                 ',13,10
                    db'                 || $$$$$$\   $$$$$$$\  $$$$$$\      ||                 ',13,10
                    db'                 || $$  __$$\ $$  __$$\ \_$$  _|     ||                 ',13,10
                    db'                 || $$ /  $$ |$$ |  $$ |  $$ |       ||                 ',13,10
                    db'                 || $$$$$$$$ |$$$$$$$  |  $$ |       ||                 ',13,10
                    db'                 || $$  __$$ |$$  __$$<   $$ |       ||                 ',13,10
                    db'                 || $$ |  $$ |$$ |  $$ |  $$ |       ||                 ',13,10
                    db'                 || $$ |  $$ |$$ |  $$ |$$$$$$\      ||                 ',13,10
                    db'                 || \__|  \__|\__|  \__|\______|     ||                 ',13,10
                    db'                 #####################################                 ',13,10
                    db'                                                                                 ',13,10
                    db'                                                                                 ',13,10
                    db'                                                                                 ',13,10
                    db'                      ***** PRESS "P" TO RESUME *****                                 ',13,10
                    db'                      ***** PRESS "Q" TO QUIT   *****                                 ',13,10
                    db'                                                                                 ',13,10
                    db'                 <<<<<<<<<<<<>>>>>>>>>>>>>                  ',13,10
                    db'                 <<    BRICK BREAKER GAME    >>                  ',13,10
                    db'                 <<<<<<<<<<<<>>>>>>>>>>>>>                  ',13,10
                    db 0



; Controls Section
tempPause BYTE "Press 'P' for Resume ",0
CONTROLS_SCREEN db '+------------------CONTROLS------------------+',13,10
                db '|                                            |',13,10
                db '| > Use right left keys to move paddle       |',13,10
                db '|   USe (1,2,3) to mov on the screen         |',13,10
                db '+--------------------------------------------+',13,10
                db '+------------------GAMEPLAY------------------+',13,10
                db '|                                            |',13,10
                db '| > Hit bricks with ball                     |',13,10
                db '| > Don’t let ball fall below paddle         |',13,10
                db '| > Clear all bricks to win                  |',13,10
                db '|                                            |',13,10
                db '+--------------------------------------------+',13,10
                db '+------------------SCORING-------------------+',13,10
                db '|                                            |',13,10
                db '| > Each brick = 10 Points                   |',13,10
                db '| > Level Complete = 100 Points              |',13,10
                db '| > High Score saved                         |',13,10
                db '|                                            |',13,10
                db '+--------------------------------------------+',13,10
                db 0


LEVEL1_logo db '--------------------------------', 13, 10
            db '|            LEVEL 1            |', 13, 10
            db '--------------------------------', 13, 10
            db '| Break the bricks at an easy pace.', 13, 10
            db '| Good luck, beginner!', 13, 10
            db '--------------------------------', 13, 10
            db 0

LEVEL2_LOGO db '--------------------------------', 13, 10
            db '|           LEVEL 2             |', 13, 10
            db '--------------------------------', 13, 10
            db '| The ball moves faster now.    |', 13, 10
            db '| Stay sharp and aim well!      |', 13, 10
            db '--------------------------------', 13, 10
            db 0

LEVEL3_LOGO db '--------------------------------', 13, 10
            db '|           LEVEL 3             |', 13, 10
            db '--------------------------------', 13, 10
            db '| Complex patterns await!       |', 13, 10
            db '| Master this level to win.     |', 13, 10
            db '--------------------------------', 13, 10
            db 0




 gameOverScreen   db'              ______        ______  _______     _____  _    _ _______ ______                                    ',13,10
                  db'                   / _____)  /\  |  ___ \(_______)   / ___ \| |  | (_______(_____ \                                    ',13,10
                  db'                  | /  ___  /  \ | | _ | |_____     | |   | | |  | |_____   _____) )                                   ',13,10
                  db'                  | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ___) (_____ (                                    ',13,10
                  db'                  | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |                                   ',13,10
                  db'                   \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|                                   ',13,10
                  db 0  
count1 db 0;
count2 db 0;
count3 db 0;
count4 db 0;
count5 db 0;
count6 db 0;
count7 db 0;
count8 db 0;
count9 db 0;
count10 db 0;
count11 db 0;
count12 db 0;
count13 db 0;
count14 db 0;
count15 db 0;
count16 db 0;
count17 db 0;
count18 db 0;
count19 db 0;
count20 db 0;
count21 db 0;
bricksleft db 21;
bricksremoved db 0;


SND_FILENAME DWORD 00020000h
SND_LOOP DWORD  00000008h
SND_ASYNC DWORD 00000001h
SND_NOSTOP DWORD 00000010h
file  BYTE "explosion.wav", 0
file2 BYTE "ayein_meme.wav",0
file3 BYTE "Voicy_MemeOkay_.wav",0
file4 BYTE "victory.wav",0
file5 BYTE "among_us_trap_remix.wav",0
file6 BYTE "ChinTapakDamDam.wav",0
file7 BYTE "criquet.wav",0
file8 BYTE "moyemoye.wav",0
file9 BYTE "wot_victory.wav",0
file1 BYTE "oooeee.wav",0
file10 BYTE "brick-falling-100572.wav",0





lives dd 3
heart db 3, 0
space db ' ',0;
score DWORD 0
count db 0;
clear_string db "          ", 0 ; 10 spaces for erasing the output
level1EndTime      DWORD ?

;brickExits db 28 DUP(1)
brickExists db 21 DUP(1)
brickDrawn db  21 DUP(1)
brickExists2 db 28 DUP(2)  ; Initialize all bricks with a hit counter of 2
brickHitCount db 28 DUP(0)  ; Initialize all bricks with 0 hit counts


xCordD db 0
yCordD db 0
x db ?
y db ?

;For Count Down Time Functionality

startTime   DWORD ?
elapsedTime DWORD ?


;;;;;;;;;;;;;
;WHITE equ 7
YES db 'y', 0
NO db 'n', 0

;----------------------------
;  <--Checking Variable to Control direction -->
;----------------------------
    
checking_left db 0;
checking_right db 0;
checkpaddleleft db 0;
checkpaddleright db 0;
checkup db 0;
checkdown db 0;


;----------------------------
;  <--File Handling-->
;----------------------------
inst5 BYTE "Press '0' to exit game",0ah,0
inst6 BYTE "Press '1' to back to the menu",0ah,0

;filename db "highscore.txt", 0          ; High score file name
file_Handle dd ?                         ; Variable to store file handle
;buffer db 10 dup(0)                     ; Buffer to read/write data
highestScore dd 0                       ; Variable to store highest score
newScore dd ?                           ; Variable to store the current score
HIGH_SCORE db "High Score: ", 0         ; Message to display
bytesRead dd ?                          ; Number of bytes read
bytesWritten dd ?                       ; Number of bytes written

currentLevel DB ?             ; Current level entered by user
userData DB 130 DUP(?)        ; 10 users * (1 level + 10 name + 1 score) = 130 bytes
tempLevel DB ?                ; Temporary variable for level swapping
tempName DB 10 DUP(?)         ; Temporary variable for name swapping
tempScore DB ?                ; Temporary variable for score swapping

filename DB "user_data.txt", 0 ; File name for saving/loading data
;filename db 255 dup(0) 

    ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;
HS1 BYTE "               HIGH SCORES  ",0AH,0
PRMPT BYTE "NAME                  SCORE               LEVEL",0AH,0
 ;inputname BYTE 25 DUP (?)
 lev dd 0
 levelno db 2
  filename1 db "hs.txt",0
  fileHandle Handle  ?
buffer BYTE BUFFER_SIZE DUP(?)
stringLength DWORD ?
    prompt1 BYTE "Cannot create file",0dh,0ah,0
    prompt2 BYTE "Enter message: ",0
    prompt4 BYTE "Enter size: ",0
    prompt3 BYTE "Enter a Number: ",0
    spaces db "      ", 0
    task1arr db 10 dup(0)
    task1arrsize db ?
    i db 0
	j db 0
	swapped db 0
   a dd ?
   b dd ?
   bytesW dd ?
   q db ?
  temp1 dd ?
  temp2 dd ?
    Istr BYTE 11 DUP(0)    ; Buffer to store the resulting string (including null terminator)
    len DWORD ? 
    
    cc1 db 0


    ;------Brick draw Data------
    brickcolor db ' '   ; Define the character to represent a brick
    xCord db 0          ; Starting X-coordinate (can be updated)
    yCord db 0          ; Starting Y-coordinate (can be updated)
    bSize db 5          ; Fixed number of rows (height)
    
    ; Fixed brick dimensions (length and width)
    brickLength Dword 10   ; Number of columns (width)
    brickWidth Dword 1   ; Number of rows (height)

    xBallPos  BYTE 26
    yBallPos Byte 10
    ballSpeed db 2     ; Initial ball speed for Level 1 (2 units)

    paddleX BYTE 24;; use in when we call drawpaddle there save the x and y coordinates here
    paddleY Byte 26
    padleWidth Byte 20


    ;----------------------------
    ;  <--Player Credentials -->
    ;----------------------------

                               
    current_Player dd ?;                                                                  
    names db 10 dup(?);
    menuSelect db 0;
    ; Add arrow key scan codes
    UP_ARROW    equ 72
    DOWN_ARROW  equ 80
    ESC_KEY     equ 27
    ENTER_KEY   equ 13
    MAX_NAME_LEN equ 10
    
    invalid_Name_Msg db "Name must be between 1-10 characters. Try again.",0
    exitConfirmMsg db "Are you sure you want to exit? (Y/N)",0



;----------------------------
;  <--Draw Game Boundary-->
;----------------------------y
inputChar Byte ?               
leftBoundary BYTE 0          
rightBoundary BYTE 90    
topBoundary BYTE 2           ;0
bottomBoundary BYTE 29       
levelSelect BYTE 1


; Gravity Select for the ball 

ball_XPos    DB 5           ; Initial X-position of the ball
ball_YPos    DB 13         ; Initial Y-position of the ball
ball_velo_X      DB 1            ; Ball X-direction velocity (+1 for right, -1 for left)
ball_velo_Y      DB -1           ; Ball Y-direction velocity (-1 to move up, +1 to move down)
gravity     DB  0        ; Gravity effect (increasing vertical velocity)ball_XPos    DB 20           ; Initial X-position of the ball



;================================================================================================================================



.code
;-----------------------------------
; <--Check Boundary Function-->
;-----------------------------------
Checking_Boundary PROC
    ; Check if the player is within the left and right boundaries
    mov al, xCord                ; Load current X coordinate

    cmp al, leftBoundary         ; If xCord <= leftBoundary, restrict left movement
    jle leftRestrict

    add al,padleWidth
    cmp al, rightBoundary        ; If xCord >= rightBoundary, restrict right movement
    jge rightRestrict
    ret                          ; If within bounds, do nothing (skip the rest)

leftRestrict:
    mov al, leftBoundary         ; Reset xCord to leftBoundary if player tries to go beyond
    mov xCord, al
    inc xCord
    ret                          ; Return to prevent further movement to the left

rightRestrict:
    mov al, rightBoundary        ; Reset xCord to rightBoundary if player tries to go beyond
    mov xCord,al 
    mov cl,padleWidth
    sub xCord,cl
    ret                          ; Return to prevent further movement to the right
Checking_Boundary ENDP

;------------------------------
; <--Draw Game Boundary-->
;------------------------------
Drawing_Boundary PROC
    mov eax, 8              ; Set color for boundary
    call SetTextColor

    ; Draw top border (horizontal)
    mov dl, leftBoundary
    mov dh, topBoundary
topBorderLoop:
    call Gotoxy
    mov al, 205                ;Draw horizontal top border
    call WriteChar
    inc dl
    cmp dl, rightBoundary
    jl topBorderLoop
topBorderEnd:

  ; Draw left border (vertical)
    mov dl, leftBoundary
    mov dh, topBoundary
leftBorderLoop:
    call Gotoxy
    mov al, 205                 ; Draw vertical left border
    call WriteChar
    inc dh
    cmp dh, bottomBoundary
    jl leftBorderLoop
leftBorderEnd:

    ; Draw right border (vertical)
    mov dl, rightBoundary
    mov dh, topBoundary
rightBorderLoop:
    call Gotoxy
    mov al, 205                ; Draw vertical right border
    call WriteChar
    inc dh
    cmp dh, bottomBoundary
    jl rightBorderLoop
rightBorderEnd:

    ret
Drawing_Boundary ENDP

;-----------------------------
; <--Set Background and Text Color for Player-->
;-----------------------------
;;paddle colour set 
Set_Player_Color PROC
    mov eax, 7                 ; Set background color to blue (replace with your blue color code)
    mov ebx, 16
    mul eax
    call SetTextColor
    ret
Set_Player_Color ENDP

;------------------------------------------
; <--Draw Player with Background Color-->
;------------------------------------------
;;making paddle
DrawPaddle PROC
    call Set_Player_Color      ; Set background color for player (blue)
    mov dl, xCord              ; Get the starting X-coordinate
    mov dh, yCord              ; Get the starting Y-coordinate
    call Gotoxy                ; Move to the starting position
    movzx ecx, padleWidth      ; Set width of the player (6 characters wide)

draw_player_row:
    mov al, " "                ; Set character to draw (can be changed to any other symbol)
    call WriteChar             ; Draw the character at the current position
    inc dl                     ; Move right (increment X-coordinate)
    loop draw_player_row       ; Repeat for the next character in the row
    ret
DrawPaddle ENDP

;-------------------------------------------------------
; <--Update Player Position with Background Color-->
;-------------------------------------------------------
Updating_paddle PROC
    mov dl, xCord              ; Get the starting X-coordinate
    mov dh, yCord              ; Get the starting Y-coordinate
    call Gotoxy                ; Move to the starting position
    mov eax, 1                  
    mov ebx, 16
    mul eax
    call SetTextColor
    movzx ecx, padleWidth      ; Get the player's width (padleWidth) dynamically

clear_player_row:
    mov al, " "                ; Clear by drawing space (background color)
    call WriteChar             ; Clear the character at the current position
    inc dl                     ; Move right (increment X-coordinate)
    loop clear_player_row      ; Repeat for the next character in the row
    ret
Updating_paddle ENDP


;-------------------------------
; <--Input Handler Function-->
;-------------------------------
Handle_keys_Input PROC
    ; Use Right and Left Arrow for Paddle Movement
    invoke GetKeyState, 37     ;Check for Left Arrow
    test ax, 8000h
    jnz Moving_Left

    ; Check for Right Arrow
    invoke GetKeyState, 39
    test ax, 8000h
    jnz Moving_right

    invoke GetKeyState, 'P'
    test ax,8000h
    jnz pauseGame

    comment @
       ; Check if 'R' or 'r' key is pressed for resuming
    invoke GetKeyState, 'R'
    test ax, 8000h
    jnz resumeGame
    invoke GetKeyState, 'r'
    test ax, 8000h
    jnz resumeGame
    @

    ret
Handle_keys_Input ENDP

;-------------------------------
; <--Left Move-->
;-------------------------------
Moving_Left PROC
    call Updating_paddle           ; Clear current player position (clear background)
    sub xCord,4                   ; Decrement xCord (move left)
    call Checking_Boundary          ; Check if movement is within bounds (not crossing left boundary)
    call DrawPaddle             ; Draw player at the new position
    ret
Moving_Left ENDP

;-------------------------------
; <--Right Move-->
;-------------------------------
Moving_right PROC
    call Updating_paddle           ; Clear current player position (clear background)
    add xCord,4                   ; Increment xCord (move right)
    call Checking_Boundary          ; Check if movement is within bounds (not crossing right boundary)
    call DrawPaddle             ; Draw player at the new position
    ret
Moving_right ENDP

;--------------------------------------
;    <----Draw Bricks game---->
;--------------------------------------
DrawBrick PROC
    mov dl,xCord
    mov dh,yCord
    call GotoXY

    mov ebx,16
    mul ebx
    call setTextColor
    mov ecx, brickWidth      ; Set number of rows (height)
    mov ebx, brickLength     ; Set number of columns (width)
draw_row:
    
    push ecx                 ; Save row loop counter
    mov ecx, ebx             ; Number of bricks per row

draw_column:
    mov al, brickcolor       ; Load the brick character
    call WriteChar           ; Display the brick character
    loop draw_column         ; Loop to print all columns in this row

    call CrLf 
    
   mov dl,xCord
    inc yCord
    mov dh,yCord
    call GotoXY

    pop ecx                  
    loop draw_row        
    ret                      ; Return from the procedure
DrawBrick ENDP

DrawBrickl2 PROC
    mov dl,xCordD
    mov dh,yCordD
    call GotoXY

    mov ebx,16
    mul ebx
    call setTextColor
    mov ecx, brickWidth      ; Set number of rows (height)
    mov ebx, brickLength     ; Set number of columns (width)
draw_row:
    
    push ecx                 ; Save row loop counter
    mov ecx, ebx             ; Number of bricks per row

draw_column:
    mov al, brickcolor       ; Load the brick character
    call WriteChar           ; Display the brick character
    loop draw_column         ; Loop to print all columns in this row

    call CrLf 
    
   mov dl,xCordD
    inc yCordD
    mov dh,yCordD
    call GotoXY

    pop ecx                  
    loop draw_row        
    ret                      ; Return from the procedure
DrawBrickl2 ENDP




;--------------------------------------
;    <----Remove brick ---->
;--------------------------------------

RemoveBricks PROC
 

    mov dl,xCordD
    mov dh,yCordD
    call GotoXY

    mov ebx,16
    mul ebx
    call setTextColor
    mov ecx, brickWidth      ; Set number of rows (height)
    mov ebx, brickLength     ; Set number of columns (width)
draw_row:
    
    push ecx                 ; Save row loop counter
    mov ecx, ebx             ; Number of bricks per row


draw_column:

    mov al,' '       ; Load the brick character
    call WriteChar           ; Display the brick character
    loop draw_column         ; Loop to print all columns in this row

    call CrLf 
    
    mov dl,xCordD
    inc yCordD
    mov dh,yCordD
    call GotoXY

    pop ecx                  
    loop draw_row       
    
    ret                      ; Return from the procedure
; Return from the procedure
RemoveBricks ENDP

;--------------------------------------
;    <----Ball Functionality for level 3 ---->
;--------------------------------------

UpdateBall_level1_level3 PROC
      ; Clear current ball position
    ;mov ball_XPos,5;
    mov dl, ball_XPos          ; Current X position
    mov dh, ball_YPos          ; Current Y position
    call Gotoxy
    mov eax,black
    mov ebx,16
    mul ebx
    call setTextColor
    mov al, ' '               ; Clear with space character
    call WriteChar

    ; Update ball position based on velocity
    mov al, ball_velo_X
   ; add al, ballSpeed        ; Multiply speed by ballSpeed (2 in Level 1, 4 in Level 2)
    add ball_XPos, al          ; Update X position
    add ball_XPos, al         ; Update X position;; removing this the brick hit pattern in level2 goes same like in level1
     ;add ball_XPos, al
   
   mov al, ball_velo_Y
  ;add al, ballSpeed        ; Multiply speed by ballSpeed (2 in Level 1, 4 in Level 2)
    add ball_YPos, al          ; Update Y position
    add ball_YPos, al         ; Update Y position;; removing this the brick hit pattern in level2 goes same like in level1
     ;add ball_YPos, al

    ; Apply gravity (increment vertical speed)
    mov al, gravity
    add ball_velo_Y, al

    ; Check horizontal boundaries and set flags
    mov al, ball_XPos
    mov bl,leftBoundary
    inc bl
    cmp al,bl
    jle SetLeftFlag           ; Set flag if ball hits the left boundary
    mov bl,rightBoundary
    dec bl
    cmp al,bl 
    jge SetRightFlag          ; Set flag if ball hits the right boundary

    ; Check vertical boundaries and set flags
    mov al, ball_YPos
    mov bl,topBoundary
    inc bl
    cmp al,bl
    jle SetUpFlag             ; Set flag if ball hits the top boundary

    ret

SetLeftFlag:
    mov checking_left, 1
    neg ball_velo_X                ; Reverse horizontal direction
    ret

SetRightFlag:
    mov checking_right, 1
    neg ball_velo_X                ; Reverse horizontal direction
    ret

SetUpFlag:
    mov checkup, 1
    neg ball_velo_Y                ; Reverse vertical direction
    ret
   
UpdateBall_level1_level3 ENDP




;--------------------------------------
;    <----Ball Functionality for level 2 ---->
;--------------------------------------

UpdateBall_level1_level2 PROC
     
    ; Clear current ball position
    ;mov ball_XPos,5;
    mov dl, ball_XPos          ; Current X position
    mov dh, ball_YPos          ; Current Y position
    call Gotoxy
    mov eax,black
    mov ebx,16
    mul ebx
    call setTextColor
    mov al, ' '               ; Clear with space character
    call WriteChar

    ; Update ball position based on velocity
    mov al, ball_velo_X
   ; add al, ballSpeed        ; Multiply speed by ballSpeed (2 in Level 1, 4 in Level 2)
    add ball_XPos, al          ; Update X position
    add ball_XPos, al         ; Update X position;; removing this the brick hit pattern in level2 goes same like in level1
   
   mov al, ball_velo_Y
  ;add al, ballSpeed        ; Multiply speed by ballSpeed (2 in Level 1, 4 in Level 2)
    add ball_YPos, al          ; Update Y position
    add ball_YPos, al         ; Update Y position;; removing this the brick hit pattern in level2 goes same like in level1

    ; Apply gravity (increment vertical speed)
    mov al, gravity
    add ball_velo_Y, al

    ; Check horizontal boundaries and set flags
    mov al, ball_XPos
    mov bl,leftBoundary
    inc bl
    cmp al,bl
    jle SetLeftFlag           ; Set flag if ball hits the left boundary
    mov bl,rightBoundary
    dec bl
    cmp al,bl 
    jge SetRightFlag          ; Set flag if ball hits the right boundary

    ; Check vertical boundaries and set flags
    mov al, ball_YPos
    mov bl,topBoundary
    inc bl
    cmp al,bl
    jle SetUpFlag             ; Set flag if ball hits the top boundary

    ret

SetLeftFlag:
    mov checking_left, 1
    neg ball_velo_X                ; Reverse horizontal direction
    ret

SetRightFlag:
    mov checking_right, 1
    neg ball_velo_X                ; Reverse horizontal direction
    ret

SetUpFlag:
    mov checkup, 1
    neg ball_velo_Y                ; Reverse vertical direction
    ret
UpdateBall_level1_level2 ENDP

;--------------------------------------
;    <----Ball Functionality for level 1---->
;--------------------------------------
UpdateBall_level1 PROC
     
    ; Clear current ball position
    mov dl, ball_XPos          ; Current X position
    mov dh, ball_YPos          ; Current Y position
    call Gotoxy
    mov eax,black
    mov ebx,16
    mul ebx
    call setTextColor
    mov al, ' '               ; Clear with space character
    call WriteChar

    ; Update ball position based on velocity
    mov al, ball_velo_X
    add ball_XPos, al          ; Update X position
    mov al, ball_velo_Y
    add ball_YPos, al          ; Update Y position

    ; Apply gravity (increment vertical speed)
    mov al, gravity
    add ball_velo_Y, al

    ; Check horizontal boundaries and set flags
    mov al, ball_XPos
    mov bl,leftBoundary
    inc bl
    cmp al,bl
    jle SetLeftFlag           ; Set flag if ball hits the left boundary
    mov bl,rightBoundary
    dec bl
    cmp al,bl 
    jge SetRightFlag          ; Set flag if ball hits the right boundary

    ; Check vertical boundaries and set flags
    mov al, ball_YPos
    mov bl,topBoundary
    inc bl
    cmp al,bl
    jle SetUpFlag             ; Set flag if ball hits the top boundary

    ret

SetLeftFlag:
    mov checking_left, 1
    neg ball_velo_X                ; Reverse horizontal direction
    ret

SetRightFlag:
    mov checking_right, 1
    neg ball_velo_X                ; Reverse horizontal direction
    ret

SetUpFlag:
    mov checkup, 1
    neg ball_velo_Y                ; Reverse vertical direction
    ret
UpdateBall_level1 ENDP

;------------------------------------
;-    <----functiooanlity to remove bricks for level 1------>
;------------------------------------


desBall PROC
    ; Determine which row the ball is colliding with
    row1:
        cmp ball_YPos, 8
        jl row2
        cmp ball_YPos, 9
        je update;
     cmp ball_YPos, 8
        jg update1;
        update:
        mov yCordD, 8
        mov y, 2
        jmp skipRow
update1:
 cmp ball_YPos, 9
 jl update2;
 jmp comehere

 update2:
  mov yCordD, 8
        mov y, 2
   jmp skipRow     

    row2:
        cmp ball_YPos, 6
        jl row3
        mov yCordD, 6
        mov y, 1
        jmp skipRow

    row3:
        cmp ball_YPos, 4
        jl comehere
        mov yCordD, 4
        mov y, 0
        jmp skipRow

    skipRow:
        ; Determine the column of the brick the ball is colliding with
        cmp ball_XPos, 5
        jl comehere

    col1:
        cmp ball_XPos, 16
        jg col2
        mov xCordD, 5
        mov x, 0
        jmp skipCol

    col2:
        cmp ball_XPos, 28
        jg col3
        mov xCordD, 17
        mov x, 1
        jmp skipCol

    col3:
        cmp ball_XPos, 40
        jg col4
        mov xCordD, 29
        mov x, 2
        jmp skipCol

    col4:
        cmp ball_XPos, 52
        jg col5
        mov xCordD, 41
        mov x, 3
        jmp skipCol

    col5:
        cmp ball_XPos, 64
        jg col6
        mov xCordD, 53
        mov x, 4
        jmp skipCol

    col6:
        cmp ball_XPos, 76
        jg col7
        mov xCordD, 65
        mov x, 5
        jmp skipCol

    col7:
        cmp ball_XPos, 88
        mov xCordD, 77
        mov x, 6
        jmp skipCol

       
    skipCol:
        ; Calculate the index in the brickExists array: index = y * 7 + x
        mov al, y       ; Multiply row index by 7
        mov bl, 7
        mul bl
        add al, x       ; Add column index
        movzx esi, al   ; Store the result in ESI

        ; Check if the brick exists and destroy it if so
        cmp brickExists[esi], 1
        jl comehere
        mov eax, 16
        call RemoveBricks
        dec brickExists[esi]  ; Mark brick as destroyed
        ;; updating score
        
        ; Reverse ball direction
        mov checkdown, 1
        neg ball_velo_Y
         add score,2
        call updateScore

    comehere:
        ret
desBall ENDP


;------------------------------------
;-    <----functiooanlity to remove bricks for level 2 ------>
;------------------------------------


desBall2 PROC

    ; Determine which row the ball is colliding with
    row1:
        cmp ball_YPos, 8
        jl row2
        cmp ball_YPos, 9
        je update;
     cmp ball_YPos, 8
        jg update1;
        update:
        mov yCordD, 8
        mov y, 2
        jmp skipRow
update1:
 cmp ball_YPos, 9
 jl update2;
 jmp comehere

 update2:
  mov yCordD, 8
        mov y, 2
   jmp skipRow     

    row2:
        cmp ball_YPos, 6
        jl row3
        mov yCordD, 6
        mov y, 1
        jmp skipRow

    row3:
        cmp ball_YPos, 4
        jl comehere
        mov yCordD, 4
        mov y, 0
        jmp skipRow

    skipRow:
        ; Determine the column of the brick the ball is colliding with
        cmp ball_XPos, 5
        jl comehere

    col1:
        cmp ball_XPos, 16
        jg col2
        b1:
        mov xCordD, 5
        mov x, 0
        cmp yCordD,4        
        je ch1;
        cmp yCordD,6        
        je ch2;
        cmp yCordD,8       
        je ch3;
       
    col2:
        cmp ball_XPos, 28
        jg col3
        b2:
        mov xCordD, 17
        mov x, 1
         cmp yCordD,4        
        je ch4;
        cmp yCordD,6        
        je ch5;
        cmp yCordD,8       
        je ch6;

    col3:
        cmp ball_XPos, 40
        jg col4
        b3:
        mov xCordD, 29
        mov x, 2
         cmp yCordD,4        
        je ch7;
        cmp yCordD,6        
        je ch8;
        cmp yCordD,8       
        je ch9;


    col4:
        cmp ball_XPos, 52
        jg col5
        b4:
        mov xCordD, 41
        mov x, 3
         cmp yCordD,4        
        je ch10;
        cmp yCordD,6        
        je ch11;
        cmp yCordD,8       
        je ch12;
        

    col5:
        cmp ball_XPos, 64
        jg col6
        b5:
        mov xCordD, 53
        mov x, 4
         cmp yCordD,4        
        je ch13;
        cmp yCordD,6        
        je ch14;
        cmp yCordD,8       
        je ch15;
        

    col6:
        cmp ball_XPos, 76
        jg col7
        b6:
        mov xCordD, 65
        mov x, 5
         cmp yCordD,4        
        je ch16;
        cmp yCordD,6        
        je ch17;
        cmp yCordD,8       
        je ch18;

    col7:
        cmp ball_XPos, 88
        mov xCordD, 77
        mov x, 6
        b7:
         cmp yCordD,4        
        je ch19;
        cmp yCordD,6        
        je ch20;
        cmp yCordD,8       
        je ch21;

      
    skipCol:
        ; Calculate the index in the brickExists array: index = y * 7 + x
        mov al, y       ; Multiply row index by 7
        mov bl, 7
        mul bl
        add al, x       ; Add column index
        movzx esi, al   ; Store the result in ESI

        ; Check if the brick exists and destroy it if so
        cmp brickExists[esi], 1
        jl comehere
        mov eax, 16
        call RemoveBricks
        dec brickExists[esi]  ; Mark brick as destroyed
        ;; updating score
        
        ; Reverse ball direction
        mov checkdown, 1
        neg ball_velo_Y
        add score,3
        call updateScore2;
        jmp comehere;

 ch1:
        cmp count1,0;
        je lightb1;
        cmp count1,1;
        je skipCol;   

 ch2:
        cmp count2,0;
        je lightb2;
        cmp count2,1;
        je skipCol;   
 ch3:
        cmp count3,0;
        je lightb3;
        cmp count3,1;
        je skipCol;   
 ch4:
        cmp count4,0;
        je lightb4;
        cmp count4,1;
        je skipCol;   
 ch5:
        cmp count5,0;
        je lightb5;
        cmp count5,1;
        je skipCol;   
 ch6:
        cmp count6,0;
        je lightb6;
        cmp count6,1;
        je skipCol;   
 ch7:
        cmp count7,0;
        je lightb7;
        cmp count7,1;
        je skipCol;   
 ch8:
        cmp count8,0;
        je lightb8;
        cmp count8,1;
        je skipCol;   
 ch9:
        cmp count9,0;
        je lightb9;
        cmp count9,1;
        je skipCol;   
 ch10:
        cmp count10,0;
        je lightb10;
        cmp count10,1;
        je skipCol;   
 ch11:
        cmp count11,0;
        je lightb11;
        cmp count11,1;
        je skipCol;   
 ch12:
        cmp count12,0;
        je lightb12;
        cmp count12,1;
        je skipCol;   
 ch13:
        cmp count13,0;
        je lightb13;
        cmp count13,1;
        je skipCol;   
 ch14:
        cmp count14,0;
        je lightb14;
        cmp count14,1;
        je skipCol;   
 ch15:
        cmp count15,0;
        je lightb15;
        cmp count15,1;
        je skipCol;   
 ch16:
        cmp count16,0;
        je lightb16;
        cmp count16,1;
        je skipCol;   
 ch17:
        cmp count17,0;
        je lightb17;
        cmp count17,1;
        je skipCol;   
 ch18:
        cmp count18,0;
        je lightb18;
        cmp count18,1;
        je skipCol;   
 ch19:
        cmp count19,0;
        je lightb19;
        cmp count19,1;
        je skipCol;   
 ch20:
        cmp count20,0;
        je lightb20;
        cmp count20,1;
        je skipCol;   
 ch21:
        cmp count21,0;
        je lightb21;
        cmp count21,1;
        je skipCol;   

        
 lightb1:
    mov yCordD,4
    mov xCordD,5
    mov eax,11;         
    call DrawBrickl2;
    mov al,count1;
    inc count1;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

lightb2:
    mov yCordD,6
    mov xCordD,5
    mov eax,7;         
    call DrawBrickl2;
    mov al,count2;
    inc count2;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb3:
    mov yCordD,8
    mov xCordD,5
    mov eax,7;         
    call DrawBrickl2;
    mov al,count3;
    inc count3;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb4:
    mov yCordD,4
    mov xCordD,17
    mov eax,15;         
    call DrawBrickl2;
    mov al,count4;
    inc count4;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb5:
    mov yCordD,6
    mov xCordD,17
    mov eax,10;         
    call DrawBrickl2;
    mov al,count5;
    inc count5;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb6:
    mov yCordD,8
    mov xCordD,17
    mov eax,6;         
    call DrawBrickl2;
    mov al,count6;
    inc count6;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb7:
    mov yCordD,4
    mov xCordD,29
    mov eax,9;         
    call DrawBrickl2;
    mov al,count7;
    inc count7;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb8:
    mov yCordD,6
    mov xCordD,29
    mov eax,15;         
    call DrawBrickl2;
    mov al,count8;
    inc count8;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb9:
    mov yCordD,8
    mov xCordD,29
    mov eax,15;         
    call DrawBrickl2;
    mov al,count9;
    inc count9;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb10:
    mov yCordD,4
    mov xCordD,41
    mov eax,7;         
    call DrawBrickl2;
    mov al,count10;
    inc count10;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb11:
    mov yCordD,6
    mov xCordD,41
    mov eax,13;         
    call DrawBrickl2;
    mov al,count11;
    inc count11;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb12:
    mov yCordD,8
    mov xCordD,41
    mov eax,9;         
    call DrawBrickl2;
    mov al,count12;
    inc count12;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb13:
    mov yCordD,4
    mov xCordD,53
    mov eax,6;         
    call DrawBrickl2;
    mov al,count13;
    inc count13;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb14:
    mov yCordD,6
    mov xCordD,53
    mov eax,12;         
    call DrawBrickl2;
    mov al,count14;
    inc count14;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb15:
    mov yCordD,8
    mov xCordD,53
    mov eax,6;         
    call DrawBrickl2;
    mov al,count15;
    inc count15;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb16:
    mov yCordD,4
    mov xCordD,65
    mov eax,7;         
    call DrawBrickl2;
    mov al,count16;
    inc count16;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb17:
    mov yCordD,6
    mov xCordD,65
    mov eax,9;         
    call DrawBrickl2;
    mov al,count17;
    inc count17;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb18:
    mov yCordD,8
    mov xCordD,65
    mov eax,11;         
    call DrawBrickl2;
    mov al,count18;
    inc count18;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb19:
    mov yCordD,4
    mov xCordD,77
    mov eax,12;         
    call DrawBrickl2;
    mov al,count19;
    inc count19;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb20:
    mov yCordD,6
    mov xCordD,77
    mov eax,7;         
    call DrawBrickl2;
    mov al,count20;
    inc count20;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb21:
    mov yCordD,8
    mov xCordD,77
    mov eax,7;         
    call DrawBrickl2;
    mov al,count21;
    inc count21;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;


    comehere:
    ret
desBall2 ENDP
;------------------------------------
;-    <----functiooanlity to remove bricks for level 3 ------>
;------------------------------------

;--------------------------------------
;    <----DesBall3: Remove 5 Random Bricks---->
;--------------------------------------
desBall3 PROC
mov al,bricksleft;
     ; Determine which row the ball is colliding with
    row1:
        cmp ball_YPos, 8
        jl row2
        cmp ball_YPos, 9
        je update;
     cmp ball_YPos, 8
        jg update1;
        update:
        mov yCordD, 8
        mov y, 2
        jmp skipRow
update1:
 cmp ball_YPos, 9
 jl update2;
 jmp comehere

 update2:
  mov yCordD, 8
        mov y, 2
   jmp skipRow     

    row2:
        cmp ball_YPos, 6
        jl row3
        mov yCordD, 6
        mov y, 1
        jmp skipRow

    row3:
        cmp ball_YPos, 4
        jl comehere
        mov yCordD, 4
        mov y, 0
        jmp skipRow

    skipRow:
        ; Determine the column of the brick the ball is colliding with
        cmp ball_XPos, 5
        jl comehere

    col1:
        cmp ball_XPos, 16
        jg col2
        b1:
        mov xCordD, 5
        mov x, 0
        cmp yCordD,4        
        je ch1;
        cmp yCordD,6        
        je ch2;
        cmp yCordD,8       
        je ch3;
       
    col2:
        cmp ball_XPos, 28
        jg col3
        b2:
        mov xCordD, 17
        mov x, 1
         cmp yCordD,4        
        je ch4;
        cmp yCordD,6        
        je ch5;
        cmp yCordD,8       
        je ch6;

    col3:
        cmp ball_XPos, 40
        jg col4
        b3:
        mov xCordD, 29
        mov x, 2
         cmp yCordD,4        
        je ch7;
        cmp yCordD,6        
        je ch8;
        cmp yCordD,8       
        je ch9;


    col4:
        cmp ball_XPos, 52
        jg col5
        b4:
        mov xCordD, 41
        mov x, 3
         cmp yCordD,4        
        je ch10;
        cmp yCordD,6        
        je ch11;
        cmp yCordD,8       
        je ch12;
        

    col5:
        cmp ball_XPos, 64
        jg col6
        b5:
        mov xCordD, 53
        mov x, 4
         cmp yCordD,4        
        je ch13;
        cmp yCordD,6        
        je ch14;
        cmp yCordD,8       
        je ch15;
        

    col6:
        cmp ball_XPos, 76
        jg col7
        b6:
        mov xCordD, 65
        mov x, 5
         cmp yCordD,4        
        je ch16;
        cmp yCordD,6        
        je ch17;
        cmp yCordD,8       
        je ch18;

    col7:
        cmp ball_XPos, 88
        mov xCordD, 77
        mov x, 6
        b7:
         cmp yCordD,4        
        je ch19;
        cmp yCordD,6        
        je ch20;
        cmp yCordD,8       
        je ch21;

      
    skipCol:
        ; Calculate the index in the brickExists array: index = y * 7 + x
        mov al, y       ; Multiply row index by 7
        mov bl, 7
        mul bl
        add al, x       ; Add column index
        movzx esi, al   ; Store the result in ESI
         cmp brickExists[esi], 1
        jl comehere
        mov eax, 16
        call RemoveBricks
         dec brickExists[esi] 
        dec bricksleft;
         inc bricksremoved;
         mov checkdown, 1
       neg ball_velo_Y
        add score,4
        call updateScore3;
        jmp comehere;

        skipCol1:
        ; Calculate the index in the brickExists array: index = y * 7 + x
        mov al, y       ; Multiply row index by 7
        mov bl, 7
        mul bl
        add al, x       ; Add column index
        movzx esi, al   ; Store the result in ESI

        ; Check if the brick exists and destroy it if so
        ;cmp brickExists[esi], 1
        ;jl comehere
        mov eax, 16
        call RemoveBricks
        dec brickExists[esi]  ; Mark brick as destroyed
        ;; updating score
        dec bricksleft;
        inc bricksremoved;
        ; Reverse ball direction
        mov checkdown, 1
       neg ball_velo_Y
        add score,4
        call updateScore3;
        jmp removerandom;

        ch17:
        ;cmp count17,0;
        ;je lightb17;
        ;cmp count17,1;
        ;je skipCol;
        cmp bricksleft,5
        jg removerandom;
        jmp skipCol;

       removerandom:
       mov al,bricksremoved;

       remran1:
       cmp bricksremoved,5;
       jl rem1;
       jmp comehere;

       rem1:
       cmp count1,2;
       jne del1;
       jmp remran3;

       del1:
       mov count1,2;
       mov yCordD,4;
       mov xCordD,5;
       jmp skipCol1;
       jmp remran3;

       remran3:
       cmp bricksremoved,5;
       jl rem3;
       jmp comehere;

       rem3:
       cmp count3,2;
       jne del3;
       jmp remran5;

       del3:
       mov count3,2;
       mov yCordD,8;
       mov xCordD,5;
       jmp skipCol1;
       jmp remran5;

       remran5:
       cmp bricksremoved,5;
       jl rem5;
       jmp comehere;

       rem5:
       cmp count5,2;
       jne del5;
       jmp remran7;

       del5:
       mov count5,2;
       mov yCordD,6;
       mov xCordD,17;
       jmp skipCol1;
       jmp remran7;

       remran7:
       cmp bricksremoved,5;
       jl rem7;
       jmp comehere;

       rem7:
       cmp count7,2;
       jne del7;
       jmp remran9;

       del7:
       mov count7,2;
       mov yCordD,4;
       mov xCordD,29;
       jmp skipCol1;
       jmp remran9;

       remran9:
       cmp bricksremoved,5;
       jl rem9;
       jmp comehere;

       rem9:
       cmp count9,2;
       jne del9;
       jmp remran2;

       del9:
       mov count9,2;
       mov yCordD,8;
       mov xCordD,29;
       jmp skipCol1;
       jmp remran2;

       remran2:
       cmp bricksremoved,5;
       jl rem2;
       jmp comehere;

       rem2:
       cmp count2,2;
       jne del2;
       jmp remran6;

       del2:
       mov count2,2;
       mov yCordD,6;
       mov xCordD,5;
       jmp skipCol1;
       jmp remran6;

       remran6:
       cmp bricksremoved,5;
       jl rem6;
       jmp comehere;

       rem6:
       cmp count6,2;
       jne del6;
       jmp remran10;

       del6:
       mov count6,2;
       mov yCordD,8;
       mov xCordD,17;
       jmp skipCol1;
       jmp remran10;

       remran10:
       cmp bricksremoved,5;
       jl rem10;
       jmp comehere;

       rem10:
       cmp count10,2;
       jne del10;
       jmp remran12;

       del10:
       mov count10,2;
       mov yCordD,4;
       mov xCordD,41;
       jmp skipCol1;
       jmp remran12;

       remran12:
       cmp bricksremoved,5;
       jl rem12;
       jmp comehere;

       rem12:
       cmp count12,2;
       jne del12;
       jmp remran14;

       del12:
       mov count12,2;
       mov yCordD,8;
       mov xCordD,41;
       jmp skipCol1;
       jmp remran14;


       remran14:
       cmp bricksremoved,5;
       jl rem14;
       jmp comehere;

       rem14:
       cmp count14,2;
       jne del14;
       jmp remran15;

       del14:
       mov count14,2;
       mov yCordD,6;
       mov xCordD,53;
       jmp skipCol1;
       jmp remran15;

       remran15:
       cmp bricksremoved,5;
       jl rem15;
       jmp comehere;

       rem15:
       cmp count15,2;
       jne del15;
       jmp remran16;

       del15:
       mov count15,2;
       mov yCordD,8;
       mov xCordD,53;
       jmp skipCol1;
       jmp remran16;

       remran16:
       cmp bricksremoved,5;
       jl rem16;
       jmp comehere;

       rem16:
       cmp count16,2;
       jne del16;
       jmp remran18;

       del16:
       mov count16,2;
       mov yCordD,4;
       mov xCordD,65;
       jmp skipCol1;
       jmp remran18;

       remran18:
       cmp bricksremoved,5;
       jl rem18;
       jmp comehere;

       rem18:
       cmp count18,2;
       jne del18;
       jmp remran19;

       del18:
       mov count18,2;
       mov yCordD,8;
       mov xCordD,65;
       jmp skipCol1;
       jmp remran19;

       remran19:
       cmp bricksremoved,5;
       jl rem19;
       jmp comehere;

       rem19:
       cmp count19,2;
       jne del19;
       jmp remran21;

       del19:
       mov count19,2;
       mov yCordD,4;
       mov xCordD,77;
       jmp skipCol1;
       jmp remran21;

       remran21:
       cmp bricksremoved,5;
       jl rem21;
       jmp comehere;

       rem21:
       cmp count21,2;
       jne del21;
       jmp remall;

       del21:
       mov count21,2;
       mov yCordD,8;
       mov xCordD,77;
       jmp skipCol1;
       jmp remall;


    remall:
       remran4:
       cmp bricksremoved,5;
       jl rem4;
       jmp comehere;

       rem4:
       cmp count4,2;
       jne del4;
       jmp remran8;

       del4:
       mov count4,2;
       mov yCordD,4;
       mov xCordD,17;
       jmp skipCol1;
       jmp remran8;

       remran8:
       cmp bricksremoved,5;
       jl rem8;
       jmp comehere;

       rem8:
       cmp count8,2;
       jne del8;
       jmp remran11;

       del8:
       mov count8,2;
       mov yCordD,6;
       mov xCordD,29;
       jmp skipCol1;
       jmp remran11;

       remran11:
       cmp bricksremoved,5;
       jl rem11;
       jmp comehere;

       rem11:
       cmp count11,2;
       jne del11;
       jmp remran13;

       del11:
       mov count11,2;
       mov yCordD,6;
       mov xCordD,41;
       jmp skipCol1;
       jmp remran13;

       remran13:
       cmp bricksremoved,5;
       jl rem13;
       jmp comehere;

       rem13:
       cmp count13,2;
       jne del13;
       jmp remran20;

       del13:
       mov count13,2;
       mov yCordD,4;
       mov xCordD,53;
       jmp skipCol1;
       jmp remran20;

       remran20:
       cmp bricksremoved,5;
       jl rem20;
       jmp comehere;

       rem20:
       cmp count20,2;
       jne del20;
       jmp comehere;

       del20:
       mov count20,2;
       mov yCordD,6;
       mov xCordD,77;
       jmp skipCol1;
       jmp comehere;


 ch1:
        cmp count1,0;
        je lightb1;
        cmp count1,1;
        je lightb1;
        cmp count1,2;
        je skipCol;

 ch2:
        cmp count2,0;
        je lightb2;
        cmp count2,1;
        je lightb2;
        cmp count2,2;
        je skipCol;   
 ch3:
        cmp count3,0;
        je lightb3;
         cmp count3,1;
        je lightb3;
        cmp count3,2;
        je skipCol;   
 ch4:
  mov checkdown, 1
    neg ball_velo_Y
 jmp comehere;
        
 ch5:
        cmp count5,0;
        je lightb5;
        cmp count5,1;
        je lightb5;
        cmp count5,2;
        je skipCol;   
 ch6:
        cmp count6,0;
        je lightb6;
        cmp count6,1;
        je lightb6;
        cmp count6,2;
        je skipCol;   
 ch7:
        cmp count7,0;
        je lightb7;
         cmp count7,1;
        je lightb7;
        cmp count7,2;
        je skipCol;   
 ch8:
  mov checkdown, 1
    neg ball_velo_Y
       jmp comehere;
 ch9:
        cmp count9,0;
        je lightb9;
        cmp count9,1;
        je lightb9;
        cmp count9,2;
        je skipCol;   
 ch10:
        cmp count10,0;
        je lightb10;
         cmp count10,1;
        je lightb10;
        cmp count10,2;
        je skipCol;   
 ch11:
  mov checkdown, 1
    neg ball_velo_Y
 jmp comehere;
        
 ch12:
        cmp count12,0;
        je lightb12;
        cmp count12,1;
        je lightb12;
        cmp count12,2;
        je skipCol;   
 ch13:
  mov checkdown, 1
    neg ball_velo_Y
 jmp comehere;
         
 ch14:
        cmp count14,0;
        je lightb14;
        cmp count14,1;
        je lightb14;
        cmp count14,2;
        je skipCol;   
 ch15:
        cmp count15,0;
        je lightb15;
        cmp count15,1;
        je lightb15;
        cmp count15,2;
        je skipCol;   
 ch16:
        cmp count16,0;
        je lightb16;
        cmp count16,1;
        je lightb16;
        cmp count16,2;
        je skipCol;   
 


 ch18:
        cmp count18,0;
        je lightb18;
        cmp count18,1;
        je lightb18;
        cmp count18,2;
        je skipCol;   
 ch19:
        cmp count19,0;
        je lightb19;
        cmp count19,1;
        je lightb19;
        cmp count19,2;
        je skipCol;
 ch20:
  mov checkdown, 1
    neg ball_velo_Y;
     jmp comehere;
         
 ch21:
        cmp count21,0;
        je lightb21;
        cmp count21,1;
        je lightb21;
        cmp count21,2;
        je skipCol;   

        
 lightb1:
    mov yCordD,4
    mov xCordD,5
    mov eax,11;         
    call DrawBrickl2;
    mov al,count1;
    inc count1;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

lightb2:
    mov yCordD,6
    mov xCordD,5
    mov eax,7;         
    call DrawBrickl2;
    mov al,count2;
    inc count2;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb3:
    mov yCordD,8
    mov xCordD,5
    mov eax,7;         
    call DrawBrickl2;
    mov al,count3;
    inc count3;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb4:
    mov yCordD,4
    mov xCordD,17
    mov eax,15;         
    call DrawBrickl2;
    mov al,count4;
    inc count4;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb5:
    mov yCordD,6
    mov xCordD,17
    mov eax,10;         
    call DrawBrickl2;
    mov al,count5;
    inc count5;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb6:
    mov yCordD,8
    mov xCordD,17
    mov eax,6;         
    call DrawBrickl2;
    mov al,count6;
    inc count6;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb7:
    mov yCordD,4
    mov xCordD,29
    mov eax,9;         
    call DrawBrickl2;
    mov al,count7;
    inc count7;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb8:
    mov yCordD,6
    mov xCordD,29
    mov eax,15;         
    call DrawBrickl2;
    mov al,count8;
    inc count8;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb9:
    mov yCordD,8
    mov xCordD,29
    mov eax,15;         
    call DrawBrickl2;
    mov al,count9;
    inc count9;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb10:
    mov yCordD,4
    mov xCordD,41
    mov eax,7;         
    call DrawBrickl2;
    mov al,count10;
    inc count10;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb11:
    mov yCordD,6
    mov xCordD,41
    mov eax,13;         
    call DrawBrickl2;
    mov al,count11;
    inc count11;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb12:
    mov yCordD,8
    mov xCordD,41
    mov eax,9;         
    call DrawBrickl2;
    mov al,count12;
    inc count12;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb13:
    mov yCordD,4
    mov xCordD,53
    mov eax,6;         
    call DrawBrickl2;
    mov al,count13;
    inc count13;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb14:
    mov yCordD,6
    mov xCordD,53
    mov eax,12;         
    call DrawBrickl2;
    mov al,count14;
    inc count14;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb15:
    mov yCordD,8
    mov xCordD,53
    mov eax,6;         
    call DrawBrickl2;
    mov al,count15;
    inc count15;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb16:
    mov yCordD,4
    mov xCordD,65
    mov eax,7;         
    call DrawBrickl2;
    mov al,count16;
    inc count16;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb17:
    mov yCordD,6
    mov xCordD,65
    mov eax,9;         
    call DrawBrickl2;
    mov al,count17;
    inc count17;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb18:
    mov yCordD,8
    mov xCordD,65
    mov eax,11;         
    call DrawBrickl2;
    mov al,count18;
    inc count18;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb19:
    mov yCordD,4
    mov xCordD,77
    mov eax,12;         
    call DrawBrickl2;
    mov al,count19;
    inc count19;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb20:
    mov yCordD,6
    mov xCordD,77
    mov eax,7;         
    call DrawBrickl2;
    mov al,count20;
    inc count20;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;

    lightb21:
    mov yCordD,8
    mov xCordD,77
    mov eax,7;         
    call DrawBrickl2;
    mov al,count21;
    inc count21;
    mov checkdown, 1
    neg ball_velo_Y
    jmp comehere;


    comehere:
    mov bricksremoved,0;
        ret

desBall3 ENDP


;--------------------------------------
;    <----Remove Random Bricks---->
;--------------------------------------

;--------------------------------------
; Random: Generate random number in range 0 to (n - 1)
; Input: EAX = n (upper bound of range, exclusive)
; Output: AL = random number (0 to n-1)
;--------------------------------------
Random PROC
    ; Use current value of system clock as seed
    rdtsc                     ; Read the CPU's time-stamp counter
    xor edx, edx              ; Clear higher bits
    div eax                   ; EAX contains the divisor (range n)
    mov al, dl                ; Move remainder into AL (random value)
    ret
Random ENDP


comment @
GetRandomIndex PROC
    ; Generates a random number within the range of brickExists array size
    mov eax, brickCount        ; Total number of bricks
    call GenerateRandom        ; Replace with your random number generator
    ret
GetRandomIndex ENDP


RandomRemoveBricks PROC
    mov ecx, 5                 ; Number of bricks to remove
random_loop:
    ; Generate a random index for the brickExists array
    call GetRandomIndex        ; This should return a random index in EAX
    mov esi, eax               ; Store the random index in ESI
    
    ; Check if the brick exists
    cmp brickExists[esi], 1
    jne random_loop            ; Skip if brick does not exist

    ; Calculate x and y coordinates from the index
    mov eax, esi               ; Load index
    mov ebx, 7                 ; Number of bricks per row
    xor edx, edx               ; Clear remainder
    div ebx                    ; EAX = y, EDX = x
    mov yCordD, al             ; Store row (Y)
    mov xCordD, dl             ; Store column (X)

    ; Adjust coordinates for brick rendering
    mul ebx                    ; EAX = y * 7
    add eax, xCordD            ; EAX = (y * 7) + x
    movzx esi, eax             ; Ensure index is valid

    ; Remove the brick visually and in the array
    call RemoveBricks          ; Clear the brick on the screen
    dec brickExists[esi]       ; Mark brick as destroyed

    loop random_loop           ; Repeat for 5 bricks
    ret
RandomRemoveBricks ENDP
@

;------------------------------------
;-    <----Collision Checking ------>
;------------------------------------
CheckCollision1 PROC

    mov al, ball_YPos          ; Load ball's X position
    mov bl, yCord             ; Compare ball X with paddle's left edge
    inc bl;
    cmp al,bl
    je removeBall  
    ; Check if the ball is at paddle level
    mov al, ball_YPos          ; Load ball's Y position
    mov bl, yCord             ; Load paddle's Y position
    dec bl                    ; Adjust for paddle height if needed
    cmp al, bl
    je checkX;           ; Skip if ball is not at paddle level
    jmp noCollision;
    ; Check horizontal alignment with paddle
           ; Ball is left of paddle                  ;jl NoCollision

checkX:
 mov al, ball_XPos          ; Load ball's Y position
 mov bl, xCord  
 cmp al,bl;
 jge checkxx;
 jmp noCollision

 checkxx:
  mov cl, padleWidth      ; Load paddle width
   add cl, xCord             ; Calculate paddle's right edge
  cmp al, cl                ; Compare ball X with paddle's right edge
    jle Collision
    jmp noCollision

EndCollisionCheck:
    ret
    NoCollision:
    ret

removeBall:
call deleteBall;

Collision:
    neg ball_velo_Y                ; Reverse vertical speed to simulate bounce

    ; Set flags based on ball's position relative to paddle edges
    cmp al, xCord             ; Check if ball hits paddle's left edge
    je SetPaddleLeftFlag

    cmp al, cl                ; Check if ball hits paddle's right edge
    je SetPaddleRightFlag

    jmp EndCollisionCheck     ; Skip to end if middle of paddle

SetPaddleLeftFlag:
    mov checkpaddleleft, 1    ; Set left edge collision flag
    jmp EndCollisionCheck

SetPaddleRightFlag:
    mov checkpaddleright, 1   ; Set right edge collision flag
    ret
CheckCollision1 ENDP

CheckCollision2 PROC

    mov al, ball_YPos          ; Load ball's X position
    mov bl, yCord             ; Compare ball X with paddle's left edge
    inc bl;
    cmp al,bl
    je removeBall  
    ; Check if the ball is at paddle level
    mov al, ball_YPos          ; Load ball's Y position
    mov bl, yCord             ; Load paddle's Y position
    dec bl                    ; Adjust for paddle height if needed
    cmp al, bl
    je checkX;           ; Skip if ball is not at paddle level
    jmp noCollision;
    ; Check horizontal alignment with paddle
           ; Ball is left of paddle                  ;jl NoCollision

checkX:
 mov al, ball_XPos          ; Load ball's Y position
 mov bl, xCord  
 cmp al,bl;
 jge checkxx;
 jmp noCollision

 checkxx:
  mov cl, padleWidth     ; Load paddle width
   add cl, xCord             ; Calculate paddle's right edge
  cmp al, cl                ; Compare ball X with paddle's right edge
    jle Collision
    jmp noCollision



removeBall:
call deleteBall2;

Collision:
    neg ball_velo_Y                ; Reverse vertical speed to simulate bounce

    ; Set flags based on ball's position relative to paddle edges
    cmp al, xCord             ; Check if ball hits paddle's left edge
    je SetPaddleLeftFlag

    cmp al, cl                ; Check if ball hits paddle's right edge
    je SetPaddleRightFlag

    jmp EndCollisionCheck     ; Skip to end if middle of paddle

SetPaddleLeftFlag:
    mov checkpaddleleft, 1    ; Set left edge collision flag
    jmp EndCollisionCheck

SetPaddleRightFlag:
    mov checkpaddleright, 1   ; Set right edge collision flag

    EndCollisionCheck:
    ret
    NoCollision:
    ret
CheckCollision2 ENDP

CheckCollision3 PROC

    mov al, ball_YPos          ; Load ball's X position
    mov bl, yCord             ; Compare ball X with paddle's left edge
    inc bl;
    cmp al,bl
    je removeBall  
    ; Check if the ball is at paddle level
    mov al, ball_YPos          ; Load ball's Y position
    mov bl, yCord             ; Load paddle's Y position
    dec bl                    ; Adjust for paddle height if needed
    cmp al, bl
    je checkX;           ; Skip if ball is not at paddle level
    jmp noCollision;
    ; Check horizontal alignment with paddle
           ; Ball is left of paddle                  ;jl NoCollision

checkX:
 mov al, ball_XPos          ; Load ball's Y position
 mov bl, xCord  
 cmp al,bl;
 jge checkxx;
 jmp noCollision

 checkxx:
  mov cl, padleWidth     ; Load paddle width
   add cl, xCord             ; Calculate paddle's right edge
  cmp al, cl                ; Compare ball X with paddle's right edge
    jle Collision
    jmp noCollision



removeBall:
call deleteBall3;

Collision:
    neg ball_velo_Y                ; Reverse vertical speed to simulate bounce

    ; Set flags based on ball's position relative to paddle edges
    cmp al, xCord             ; Check if ball hits paddle's left edge
    je SetPaddleLeftFlag

    cmp al, cl                ; Check if ball hits paddle's right edge
    je SetPaddleRightFlag

    jmp EndCollisionCheck     ; Skip to end if middle of paddle

SetPaddleLeftFlag:
    mov checkpaddleleft, 1    ; Set left edge collision flag
    jmp EndCollisionCheck

SetPaddleRightFlag:
    mov checkpaddleright, 1   ; Set right edge collision flag

    EndCollisionCheck:
    ret
    NoCollision:
    ret
CheckCollision3 ENDP



;------------------------------------
;-    <----Ball Draw  for level 1------>
;------------------------------------
Drawing_Ball PROC
   mov eax,RED
    call setTextcolor
    mov dl, ball_XPos
    mov dh, ball_YPos
    call Gotoxy
   mov al, 254
    
    call WriteChar

    
    ret
Drawing_Ball ENDP

;------------------------------------
;-    <----Ball Draw  for level 2------>
;------------------------------------
Drawing_Ball2 PROC
   mov eax,12
    call setTextcolor
    mov dl, ball_XPos
    mov dh, ball_YPos
    call Gotoxy
    mov al, 254
    call WriteChar

    ret
Drawing_Ball2 ENDP

Drawing_Ball3 PROC
   mov eax,12
    call setTextcolor
    mov dl, ball_XPos
    mov dh, ball_YPos
    call Gotoxy
    mov al, 'O'
    call WriteChar
    ret
Drawing_Ball3 ENDP

deleteBall PROC

    mov eax,RED
    call setTextcolor
    mov dl, ball_XPos
    mov dh, ball_YPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    cmp count,0;
    je removeLife1
     
    cmp count,1;
    je removeLife2
    cmp count,2;
    je removeLife3
     ret
deleteBall ENDP

deleteBall2 PROC

    mov eax,RED
    call setTextcolor
    mov dl, ball_XPos
    mov dh, ball_YPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    cmp count,0;
    je removeLife12
     
    cmp count,1;
    je removeLife22
    cmp count,2;
    je removeLife3
     ret
deleteBall2 ENDP

deleteBall3 PROC

    mov eax,RED
    call setTextcolor
    mov dl, ball_XPos
    mov dh, ball_YPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    cmp count,0;
    je removeLife13
    cmp count,1;
    je removeLife23
    cmp count,2;
    je removeLife3
     ret
deleteBall3 ENDP

setBall PROC
 ;; Stop any currently playing sound (optional, but good practice)
    invoke PlaySound, NULL, 0, 0
 mov eax, SND_FILENAME;; pszSound is a file name
;;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file4
invoke PlaySound, esi, 0, eax

mov eax,RED
call setTextcolor
    mov ball_XPos,5
    mov dl, ball_XPos
     mov ball_YPos,13
    mov dh, ball_YPos
    call Gotoxy
    mov al, 254
    call WriteChar
    call UpdateBall_level1
    ret
setBall ENDP

setBall2 PROC
 ;; Stop any currently playing sound (optional, but good practice)
    invoke PlaySound, NULL, 0, 0
 mov eax, SND_FILENAME;; pszSound is a file name
;;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file4
invoke PlaySound, esi, 0, eax

mov eax,RED
call setTextcolor
    mov ball_XPos,5
    mov dl, ball_XPos
     mov ball_YPos,13
    mov dh, ball_YPos
    call Gotoxy
    mov al, 254
    call WriteChar
    call UpdateBall_level1_level2;
    ret
setBall2 ENDP

setBall3 PROC
 ;; Stop any currently playing sound (optional, but good practice)
    invoke PlaySound, NULL, 0, 0
 mov eax, SND_FILENAME;; pszSound is a file name
;;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file4
invoke PlaySound, esi, 0, eax

mov eax,RED
call setTextcolor
    mov ball_XPos,5
    mov dl, ball_XPos
     mov ball_YPos,13
    mov dh, ball_YPos
    call Gotoxy
    mov al,'O'
    call WriteChar
    call UpdateBall_level1_level3;
    ret
setBall3 ENDP



;------------------------------------
;-    <----Level 1 Proc------>
;------------------------------------
;; bricks formation
drawing_all_bricks PROC
    ;-------Row # 1 -------
    
    mov yCord,4
    mov xCord,5
    mov eax,1;
    call DrawBrick

    mov yCord,4
    mov xCord,17
    mov eax,3
    call DrawBrick

    mov yCord,4
    mov xCord,29
    mov eax,6
    call DrawBrick

    mov yCord,4
    mov xCord,41
    mov eax,9
    call DrawBrick

    mov yCord,4
    mov xCord,53
    mov eax,12
    call DrawBrick

    mov yCord,4
    mov xCord,65
    mov eax,2
    call DrawBrick

    mov yCord,4
    mov xCord,77
    mov eax,4
    call DrawBrick
    
        ;-------Row # 2 -------
    mov yCord,6
    mov xCord,5
    mov eax,9
    call DrawBrick

    mov yCord,6
    mov xCord,17
    mov eax,8
    call DrawBrick

    mov yCord,6
    mov xCord,29
    mov eax,7
    call DrawBrick

    mov yCord,6
    mov xCord,41
    mov eax,6
    call DrawBrick

    mov yCord,6
    mov xCord,53
    mov eax,15
    call DrawBrick

    mov yCord,6
    mov xCord,65
    mov eax,4
    call DrawBrick

    mov yCord,6
    mov xCord,77
    mov eax,3
    call DrawBrick
    


        ;-------Row # 3 -------
    mov yCord,8
    mov xCord,5
    mov eax,10          ; New color for the first brick in the 4th row
    call DrawBrick

    mov yCord,8
    mov xCord,17
    mov eax,11          ; New color for the second brick in the 4th row
    call DrawBrick

    mov yCord,8
    mov xCord,29
    mov eax,12          ; New color for the third brick in the 4th row
    call DrawBrick

    mov yCord,8
    mov xCord,41
    mov eax,13          ; New color for the fourth brick in the 4th row
    call DrawBrick

    mov yCord,8
    mov xCord,53
    mov eax,14          ; New color for the fifth brick in the 4th row
    call DrawBrick

    mov yCord,8
    mov xCord,65
    mov eax,5           ; New color for the sixth brick in the 4th row
    call DrawBrick

    mov yCord,8
    mov xCord,77
    mov eax,6           ; New color for the seventh brick in the 4th row
    call DrawBrick


    ;add yCord,10
    ;mov dl,xCord
    ;mov dh,yCord
    ;call GotoXY
    ;mov eax,1
    ;call setTextColor
    ret
  drawing_all_bricks ENDP

   ;---------------------------------------------------------------------
;;																	 ;;
;;					   video mode                                    ;;		
;;																	 ;;
;---------------------------------------------------------------------

setVideoMode proc
    
    mov ah, 0   ; set display mode function.
    mov al, 13h ; mode 13h = 320x200 pixels, 256 colors.
    int 10h     
    
    ret
    setVideoMode endp
;-----------------------------
;  Game Function  
;----------------------------

PauseGame PROC
    mov dh,15
    mov dl,15
    call gotoXY
    mov edx, OFFSET tempPause
    call WriteString

     
    waitForResume:
        invoke GetKeyState, 'r'
        test ax,8000h
        jz waitforResume
        mov dh,15
        mov dl,15
        call gotoXY
        mov eax,black
        mov ebx,16
        mul ebx
        call setTextColor
        mov eax,white
        call setTextcolor
    ret
PauseGame ENDP


;-----------------------------
; draw bricks, ball and paddle
;----------------------------


Draw_ball_paddle_bricks PROC

    ;call ClearScreen
    call clrscr

    ; Draw bricks
    call DrawBrick

    ; Draw paddle
    call DrawPaddle

    ; Draw ball
    call Drawing_Ball
    ret
Draw_ball_paddle_bricks ENDP

ClearScreen PROC
    call clrscr
    ret
ClearScreen ENDP

 ;;;; when adding this ball dos not move 
   ;----------------------------
  ;
  ;   <---display functionalities for level 1-->
  ;
  ;-----------------------------
displayLives PROC
 
    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "
    mov ecx, lives

livesLoop:
    mov edx, offset heart
    call writestring
    loop livesLoop
    ret
displayLives ENDP

removeLife1 PROC
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file
invoke PlaySound, esi, 0, eax
    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "
    mov ecx, lives
    dec ecx;
    mov al,count;

livesLoop:

    mov edx, offset heart
    call writestring
    loop livesLoop
    mov al,' ';
    call writechar
    inc count;
   ; Stop the sound before continuing
    invoke PlaySound, NULL, 0, 0
    jmp setBall
    ret
removeLife1 ENDP

 

removeLife2 PROC
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file7
invoke PlaySound, esi, 0, eax

    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "

;livesLoop:
;mov al,count;
    mov edx, offset heart
    call writestring
    mov edx, offset space
    call writechar
    mov edx, offset space
    call writechar
    inc count;
    ; Stop the sound before continuing
   ; invoke PlaySound, NULL, 0, 0
    jmp setBall
    ret
removeLife2 ENDP

removeLife3 PROC
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file
invoke PlaySound, esi, 0, eax

    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "
    mov edx, offset heart
    call writestring
    mov ecx,lives;
livesLoop:
;mov al,count;
   
    mov edx, offset space
    call writechar
    loop livesLoop;
    ;inc count;
    jmp gameOver;
    ; Stop the sound before continuing
    invoke PlaySound, NULL, 0, 0
    ret
removeLife3 ENDP

removeLife12 PROC
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file
invoke PlaySound, esi, 0, eax
    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "
    mov ecx, lives
    dec ecx;
    mov al,count;

livesLoop:

    mov edx, offset heart
    call writestring
    loop livesLoop
    mov al,' ';
    call writechar
    inc count;
   ; Stop the sound before continuing
    invoke PlaySound, NULL, 0, 0
    jmp setBall2
    ret
removeLife12 ENDP

 

removeLife22 PROC
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file7
invoke PlaySound, esi, 0, eax

    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "

;livesLoop:
;mov al,count;
    mov edx, offset heart
    call writestring
    mov edx, offset space
    call writechar
    mov edx, offset space
    call writechar
    inc count;
    ; Stop the sound before continuing
   ; invoke PlaySound, NULL, 0, 0
    jmp setBall2
    ret
removeLife22 ENDP

removeLife13 PROC
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file
invoke PlaySound, esi, 0, eax
    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "
    mov ecx, lives
    dec ecx;
    mov al,count;

livesLoop:

    mov edx, offset heart
    call writestring
    loop livesLoop
    mov al,' ';
    call writechar
    inc count;
   ; Stop the sound before continuing
    invoke PlaySound, NULL, 0, 0
    jmp setBall3
    ret
removeLife13 ENDP

 

removeLife23 PROC
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file7
invoke PlaySound, esi, 0, eax

    mov dh, 0
    mov dl, 68
    call gotoXY
    mwrite "Lives: "

;livesLoop:
;mov al,count;
    mov edx, offset heart
    call writestring
    mov edx, offset space
    call writechar
    mov edx, offset space
    call writechar
    inc count;
    ; Stop the sound before continuing
   ; invoke PlaySound, NULL, 0, 0
    jmp setBall3
    ret
removeLife23 ENDP



   ;----------------------------
  ;
  ;   <---display levels in the top right corners-->
  ;
  ;-----------------------------

display_level1 PROC
    mov dh, 0
    mov dl, 1
    call gotoXY
    mov eax,3
    call SetTextColor
    mwrite "_level1_ "  
    ret
display_level1 ENDP


display_level2 PROC
    mov dh, 0
    mov dl, 1
    call gotoXY
    mov eax,3
    call SetTextColor
    mwrite "_level2_ "  
    ret
display_level2 ENDP


display_level3 PROC
    mov dh, 0
    mov dl, 1
    call gotoXY
    mov eax,3
    call SetTextColor
    mwrite "_level3_ "  
    ret
display_level3 ENDP

  ;----------------------------
  ;
  ;   <---display name -->
  ;
  ;-----------------------------


 displayName PROC
    mov dh, 0
    mov dl, 15
    call gotoXY
     mov eax,8
    call SetTextColor
    mwrite "Player: "
     mov eax, offset names
    call writestring
    
    mov dh,0
    mov dl,23
    call GotoXY
    mov eax,WHITE
    call SetTextColor
    mov edx,OFFSET names
    call Writestring

    ret
displayName ENDP



displayScore PROC
    mov dh, 0
    mov dl, 35
    call gotoXY
    mov eax,8
    call SetTextColor
    mwrite "Score: "  
    call updateScore
    ret
displayScore ENDP

updateScore PROC
 mov dh,0
    mov dl,41
    call GotoXY
    mov eax,WHITE
    call SetTextColor
    mov eax, score
    call WriteDEC

    mov eax, [score]    ; Load the current score into EAX
    cmp eax, 14   ; Compare score with 42   ;8
    jne continue_game   ; If not equal, continue the game

    ; Call Level2 if score is 42
    jmp level_2

continue_game:

     ret
updateScore ENDP

updateScore2 PROC
 mov dh,0
    mov dl,41
    call GotoXY
    mov eax,WHITE
    call SetTextColor
    mov eax, score
    call WriteDEC

    mov eax, [score]    ; Load the current score into EAX
    cmp eax, 63    ; 63 ;Compare score with 42   ;8
    jne continue_game   ; If not equal, continue the game

    ; Call Level2 if score is 63
    jmp level_3;

continue_game:

     ret
updateScore2 ENDP

updateScore3 PROC
 mov dh,0
    mov dl,41
    call GotoXY
    mov eax,WHITE
    call SetTextColor
    mov eax, score
    call WriteDEC

    mov eax, [score]    ; Load the current score into EAX
    cmp eax, 84    ; Compare score with 42   ;8
    jne continue_game   ; If not equal, continue the game

    ; Call Level2 if score is 42
    call winner;

continue_game:

     ret
updateScore3 ENDP


;;;;;;;;;;;;
winner PROC

mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file9
invoke PlaySound, esi, 0, eax

; Clear the screen
    call ClearScreen

    ; Set cursor to the top of the screen
    mov dh, 5
    mov dl, 10
    call GotoXY

    ; Set text color to GREEN
    mov eax, 10
    call SetTextColor
    ; Display the congratulatory message
    mwrite "----------------------------------------"
    mov dh, 6
    mov dl, 10
    call GotoXY
    mwrite "|            CONGRATS!                 |"
    mov dh, 7
    mov dl, 10
    call GotoXY
     mwrite "|      You are a CHAMP!!!              |"
    mov dh, 8
    mov dl, 10
    call GotoXY
    mwrite "----------------------------------------"
    call waitmsg  ;
    call waitmsg  ;
    call clrscr
   

ret 
winner endp


displayTime PROC
    mov dh, 0
    mov dl, 83
    call gotoXY
    mov eax,8
    call SetTextColor
    mwrite "Time: "  
    call getTime
    ret
displayTime ENDP



  ;----------------------------
  ;   <--menu functionality -->
  ;
  ;-----------------------------


  displayMenu PROC
   
    mov dh,2
    mov dl,40
    call GotoXY
    mov eax,11
    call SetTextColor
    call CrLf
    call Crlf

    mov edx,OFFSET MENU
    call Writestring
    call Crlf
    call Crlf
   ; call waitmsg;
   ; call clrscr;

    ret
displayMenu ENDP

checkMenuOption PROC
    call ReadKey          ; Read a key press
    cmp al, 'I'           ; Compare if the key is 'I'
  ;  je display_instructions   ; Jump to show instructions if 'I' is pressed

    cmp al, 'H'           ; Compare if the key is 'H'
;    je showHighScore      ; Jump to show high score if 'H' is pressed

    cmp al, 'S'           ; Compare if the key is 'S'
;    je start_tab          ; Jump to start game if 'S' is pressed

    cmp al, 'E'           ; Compare if the key is 'E'
 ;   je exiting_program        ; Jump to exit the program if 'E' is pressed

    ret
checkMenuOption ENDP




  ;----------------------------
  ;   <--level2 Entering -->
  ;
  ;-----------------------------

  AskToPlay_level2 PROC
    mov dl, 10
    mov dh, 10
    call gotoxy
    mwrite "Do you want to play level 2 of Brick Breaker? (y/n): "
    
    call ReadChar           ; Wait for single character input (y/n)
     cmp al, 'y'             ; Check if the input is 'y'
    call level2Start            ; Jump to the main loop if 'y'
    cmp al, 'n'             ; Check if the input is 'n'
    je exit_the_program     ; Exit if 'n'
    ret                     ; Return with the character in AL
AskToPlay_level2 ENDP


exit_the_program:
    call clrscr  

    ; Display "Exit"
    mov dl, 20
    mov dh, 7
    call gotoxy
    mov eax, RED
    call SetTextColor
    mov edx, offset EXITED
    call writestring
    ret
     

level_2 PROC

 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file6
invoke PlaySound, esi, 0, eax

; Clear the screen
    call ClearScreen
   ; call clrscr            ; Clear screen at the start of level 2


;call clearTimeDisplay

    ; Set cursor to the top of the screen
    mov dh, 5
    mov dl, 10
    call GotoXY

    ; Set text color to GREEN
    mov eax, 10
    call SetTextColor

    ; Display the congratulatory message
    mwrite "----------------------------------------"
    mov dh, 2
    mov dl, 2
    call GotoXY
    mwrite "|   CONGRATULATIONS! YOU DID WELL!    |"
    mov dh, 7
    mov dl, 10
    call GotoXY
    mwrite "|  NOW IT'S LEVEL 2 OF BRICK BREAKER!  |"
    mov dh, 8
    mov dl, 10
    call GotoXY
    mwrite "----------------------------------------"

    
     ; Display "LEVEL2_LOGO logo"
    mov dl, 6
    mov dh, 20
    call gotoxy
    mov eax, RED
    call SetTextColor
    mov edx, offset LEVEL2_LOGO
    call writestring
   



    ; Wait for user input to proceed
    mov dh, 0
    mov dl, 35
    call GotoXY
    mwrite "Press any key to continue..."
    call waitmsg  ;
    call waitmsg  ;
    call clrscr



    call level2Start


ret
level_2 endp



  ;----------------------------
  ;   <--level2Start -->
  ;
  ;-----------------------------
level2Start PROC


    ; Clear the screen
   ; call clrscr
   call ClearScreen
    mov eax, SND_FILENAME;; pszSound is a file name
    or eax, SND_LOOP;; Play in a loop
    or eax, SND_ASYNC;; Play in the background
    mov esi , OFFSET file4
    invoke PlaySound, esi, 0, eax

    ; Draw static elements
    mov count,0;
    call drawing_all_bricks     ; Start Game Level 1  
    call Drawing_Boundary      ; Draw the game boundary
    call display_level2
    call displayLives;
    call displayName       ; Display the player’s name
    mov [score],0
    call displayScore      ; Display initial score
   
    call GetMseconds
    ;;mov eax, level1EndTime    ; Load Level 1's end time
    mov startTime, eax
    call displayTime       ; Display time

     mov eax, 3           ; Set game state or some variable (example)
    mov xCord, 24        ; Set X-coordinate
    mov yCord, 26        ; Set Y-coordinate
    mov paddleX, 26
    mov paddleY, 23
    mov padleWidth,15    ; here shorten the lengthof the brick for level 2
    call DrawPaddle      ; Draw player at starting position
     mov ball_XPos,5;
     mov ball_YPos,13;

     ;Set ball position
    mov xBallPos,26;
    mov dl, xBallPos     ; Ball X position
   mov yBallPos,10;
    mov dh, yBallPos     ; Ball Y position
    call GotoXY          ; Move cursor to ball position
    call Drawing_Ball2        ; Draw the ball

    ;Set text color to Green
    mov eax, 7      ; Set color to green (you should define the Green constant)
    call setTextcolor    ; Set text color to green

    ; Move to desired position (xCord, yCord) and draw the character '0'
    mov dl,xCord        ; Load X coordinate for drawing '0'
    mov dh,yCord        ; Load Y coordinate for drawing '0'
    call GotoXY          ; Move to the (xCord, yCord) position
    mov al, 'O'          ; Load the character '0' to be drawn
    call WriteConsoleA   ; Call the function to draw the character

    L1:

    call Handle_keys_Input         ; Check and process paddle movement
    call CheckCollision2      ; Detect paddle-ball collision
    call UpdateBall_level1_level2;          ; Update ball position based on velocity ;UpdateBall_level1_level2;
    call desBall2
    call Drawing_Ball2            ; Redraw the ball at the new position
    call Delay               ; Add a small delay to control game speed
    call getTime;

    ContinueGame:
    jmp L1



    ret
level2Start ENDP

 ;----------------------------
  ;   <--level3 Entering -->
  ;
  ;-----------------------------

level_3 PROC

 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file6
invoke PlaySound, esi, 0, eax

; Clear the screen
    call ClearScreen
   ; call clrscr            ; Clear screen at the start of level 2


;call clearTimeDisplay

    ; Set cursor to the top of the screen
    mov dh, 5
    mov dl, 10
    call GotoXY

    ; Set text color to GREEN
    mov eax, 6
    call SetTextColor

    ; Display the congratulatory message
    mwrite "----------------------------------------"
    mov dh, 2
    mov dl, 2
    call GotoXY
    mwrite "|   CONGRATULATIONS! YOU DID WELL!    |"
    mov dh, 7
    mov dl, 10
    call GotoXY
    mwrite "|  NOW IT'S LEVEL 3 OF BRICK BREAKER!  |"
    mov dh, 8
    mov dl, 10
    call GotoXY
    mwrite "----------------------------------------"

    
     ; Display "LEVEL2_LOGO logo"
    mov dl, 6
    mov dh, 20
    call gotoxy
    mov eax, 13
    call SetTextColor
    mov edx, offset LEVEL3_LOGO
    call writestring
   



    ; Wait for user input to proceed
    mov dh, 0
    mov dl, 35
    call GotoXY
    mwrite "Press any key to continue..."
    call waitmsg  ;
    call waitmsg  ;
    call clrscr



    call level3


ret
level_3 endp






level3 PROC
mov count1,0;
mov count2,0;
mov count3,0;
mov count4,0;
mov count5,0;
mov count6,0;
mov count7,0;
mov count8,0;
mov count9,0;
mov count10,0;
mov count11,0;
mov count12,0;
mov count13,0;
mov count14,0;
mov count15,0;
mov count16,0;
mov count17,0;
mov count18,0;
mov count19,0;
mov count20,0;
mov count21,0;
 ; Clear the screen
   ; call clrscr
   call ClearScreen
    mov eax, SND_FILENAME;; pszSound is a file name
    or eax, SND_LOOP;; Play in a loop
    or eax, SND_ASYNC;; Play in the background
    mov esi , OFFSET file4
    invoke PlaySound, esi, 0, eax

    ; Draw static elements
    mov count,0;
    call drawing_all_bricks     ; Start Game Level 1  
    call Drawing_Boundary      ; Draw the game boundary
    call display_level3
    call displayLives;
    call displayName       ; Display the player’s name
    mov [score],0
    call displayScore      ; Display initial score
   
    call GetMseconds
    mov startTime, eax
    call displayTime       ; Display time
     mov eax, 3           ; Set game state or some variable (example)
    mov xCord, 24        ; Set X-coordinate
    mov yCord, 26        ; Set Y-coordinate
    mov paddleX, 26
    mov paddleY, 23
    mov padleWidth,15    ; here shorten the lengthof the brick for level 2
    call DrawPaddle      ; Draw player at starting position
     mov ball_XPos,5;
     mov ball_YPos,13;

     ;Set ball position
    mov xBallPos,26;
    mov dl, xBallPos     ; Ball X position
   mov yBallPos,10;
    mov dh, yBallPos     ; Ball Y position
    call GotoXY          ; Move cursor to ball position
    call Drawing_Ball3      ; Draw the ball

    ;Set text color to Green
    mov eax, 7      ; Set color to green (you should define the Green constant)
    call setTextcolor    ; Set text color to green

    ; Move to desired position (xCord, yCord) and draw the character '0'
    mov dl,xCord        ; Load X coordinate for drawing '0'
    mov dh,yCord        ; Load Y coordinate for drawing '0'
    call GotoXY          ; Move to the (xCord, yCord) position
    mov al, 'O'          ; Load the character '0' to be drawn
    call WriteConsoleA   ; Call the function to draw the character

    L1:

    call Handle_keys_Input         ; Check and process paddle movement
    call CheckCollision3      ; Detect paddle-ball collision
    call UpdateBall_level1_level3;          ; Update ball position based on velocity ;UpdateBall_level1_level3;
    call desBall3
    call Drawing_Ball3         ; Redraw the ball at the new position        ;Drawing_Ball2;
    call Delay               ; Add a small delay to control game speed
    call getTime;

    ContinueGame:
    jmp L1
ret
level3 ENDP
 

  ;----------------------------
  ;   <--Game over -->
  ;
  ;-----------------------------

gameOver PROC
mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file8
invoke PlaySound, esi, 0, eax

; Clear the screen
    call ClearScreen

    ; Set cursor to the top of the screen
    mov dh, 5
    mov dl, 10
    call GotoXY

    ; Set text color to GREEN
    mov eax, 10
    call SetTextColor
    ; Display the congratulatory message
    mwrite "----------------------------------------"
    mov dh, 6
    mov dl, 10
    call GotoXY
    mwrite "|            Game Over!                 |"
    mov dh, 7
    mov dl, 10
    call GotoXY
     mwrite "|      BETTER LUCK NEXT TIME !         |"
    mov dh, 8
    mov dl, 10
    call GotoXY
    mwrite "----------------------------------------"

   call clearTimeDisplay
     ; Display "gameover logo"
    mov dl, 6
    mov dh, 13
    call gotoxy
    mov eax, RED
    call SetTextColor
    mov edx, offset gameOverScreen
    call writestring
    call waitmsg  ;
    call waitmsg  ;
    call clrscr
     ;;jmp exiting_program
    ret
    gameOver ENDP;


  ;----------------------------
  ;
  ;   <--Main function-->
  ;
  ;-----------------------------





main PROC

call Q2

; Display Logo of the game 
 mov eax, SND_FILENAME;; pszSound is a file name
;or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file10
invoke PlaySound, esi, 0, eax

    mov dh,0
    mov dl,0
    call GotoXY
    mov eax,BLUE
    call SetTextColor
    call CrLf
    call Crlf

    mov edx,OFFSET BRICK_LOGO
    call Writestring
    call Crlf
    call Crlf
    
    mov dh,10
    mov dl,40
    call GotoXY
    mov eax,RED
    call SetTextColor
    call CrLf
    call Crlf
    mov edx,OFFSET BREAKER_LOGO
    call Writestring
    call Crlf
    call Crlf
    call waitmsg;
    call clrscr;

      starting::
    ; Display Logo of the game 
     mov eax, SND_FILENAME;; pszSound is a file name
    or eax, SND_LOOP;; Play in a loop
    or eax, SND_ASYNC;; Play in the background
    mov esi , OFFSET file5
    invoke PlaySound, esi, 0, eax



    call displayMenu
  ;  call checkMenuOption

    call ReadChar          ; Read a key press
   cmp al, 'N'           ; Compare if the key is 'I'
     je EnterName

     cmp al, 'I'           ; Compare if the key is 'I'
    je display_instructions   ; Jump to show instructions if 'I' is pressed

    cmp al, 'H'           ; Compare if the key is 'H'
    je SHOW_HIGHSCORES      ; Jump to show high score if 'H' is pressed

    cmp al, 'E'           ; Compare if the key is 'E'
    je exiting_program        ; Jump to exit the program if 'E' is pressed

    cmp al, 'S'           ; Compare if the key is 'S'
    je EnterName        ; Jump to start game if 'S' is pressed

  
   ;-------------------------------------------
;         <----Start Menu---->
;------------------------------------------
point1:
    mov dl, 70
    mov dh, 3
    call gotoxy
    mov eax, GREEN
    call SetTextColor
    mov edx, offset POINTER
    call writestring
    mov menuSelect, 1
    jmp start_tab

point2:
    mov dl, 80
    mov dh, 12
    call gotoxy
    mov eax, YELLOW
    call SetTextColor
    mov edx, offset POINTER
    call writestring
    mov menuSelect, 2
    jmp start_tab

point3:
    mov dl, 80
    mov dh, 15
    call gotoxy
    mov eax, WHITE
    call SetTextColor
    mov edx, offset POINTER
    call writestring
    mov menuSelect, 3
    jmp start_tab

point4:
    mov dl, 70
    mov dh, 27
    call gotoxy
    mov eax, RED
    call SetTextColor
    mov edx, offset POINTER
    call writestring
    mov menuSelect, 4
    jmp start_tab


    
    ;------------------------------------
  ;  <--Enter Name-->
  ;-----------------------------------
   ;NAME INPUT
   EnterName:
   call clrscr
    mov dh,20
    mov dl,40
    call gotoxy
     mov eax,8
    call SetTextColor
    mwrite "Enter your name please :"
    mov edx,offset names
    mov ecx,20
    call readstring
    mov current_Player,eax;
    call clrscr

    mov eax,White
    call SetTextColor
   

;--------------------------------
;   <-----Display start Menu--->
;---------------------------------
start_tab:

 ; Display "Start logo"
    mov dl, 10
    mov dh, 5
    call gotoxy
    mov eax, RED
    call SetTextColor
    mov edx, offset TITLE_SCREEN
    call writestring
     call waitmsg  ;
    call clrscr


    ; Display "Start"
    mov dl, 0
    mov dh, 1
    call gotoxy
    mov eax, 13
    call SetTextColor
    mov edx, offset START
    call writestring

    ; Ask if user wants to play
    call AskToPlay
    cmp al, 'n'             ; If user presses 'n', exit
    je exiting_program

    ; Display Instructions if user answers 'y'
    call AskForInstructions
    cmp al, 'y'
    je display_instructions
    cmp al, 'n'
    je display_title_screen

    ; Display Title Screen after instructions
    call AskForTitleScreen
    cmp al, 'y'
    je display_title_screen

    jmp start_tab_exit      ; Exit if no action required

display_instructions:
    call clrscr  

    ; Display "Instructions"
    mov dl, 0
    mov dh, 0
    call gotoxy
    mov eax, WHITE
    call SetTextColor
    mov edx, offset INSTRUCTIONS
    call writestring

    ; Ask if user wants to see the Title Screen
    call AskForTitleScreen
    cmp al, 'y'
    je display_title_screen

    jmp start_tab_exit      ; Jump to exit if no action required

display_title_screen:
    ;call waitmsg;
    ;call clrscr;

    ; Display "TITLE_SCREEN"
    mov dl, 20
    mov dh, 7
    call gotoxy
    mov eax, BLUE
    call SetTextColor
    mov edx, offset TITLE_SCREEN
    call writestring
    call clrscr  ;

    jmp startGame;
    ; Ensure the program doesn't jump back to the start menu after showing title screen
  ;  jmp start_tab_exit

exiting_program::
    call clrscr  

    ; Display "Exit"
    mov dl, 20
    mov dh, 7
    call gotoxy
    mov eax, RED
    call SetTextColor
    mov edx, offset EXITED
    call writestring
     ;;;CALL WRITENAME
     ;;jmp ending
    ;jmp start_tab_exit

start_tab_exit:
    ; Exit point where the program can clean up or return
    ret  ; Return to the calling procedure or exit the program

; Ask if the user wants to play
AskToPlay:
    mov dl, 10
    mov dh, 10
    call gotoxy
    mwrite "Do you want to play? (y/n): "
    call ReadChar    ; Read single character input (y/n)
    ret

; Ask for instructions
AskForInstructions:
    mov dl, 10
    mov dh, 15
    call gotoxy
    mwrite "Do you want to see instructions? (y/n): "
    call ReadChar    ; Read single character input (y/n)
    ret

; Ask for title screen
AskForTitleScreen:
    mov dl, 10
    mov dh, 12
    call gotoxy
    mwrite "Do you want to see the title screen? (y/n): "
    call ReadChar    ; Read single character input (y/n)
    ret


    call readchar
    call clrscr
    cmp al,'1'
    je point1
    cmp al,'2'
    je point2
    cmp al,'3'
    je point3
    cmp al,13
    cmp al,'4'
    je point4

  

;-----------------------------
;   <---start Game Manu--->
;-----------------------------
startGame:
   level1Label:
        mov dl,50
        mov dh,1
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov levelSelect,1
    jmp  start_level

    level2Label:
        mov dl,50
        mov dh,10
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov levelSelect,2
    jmp  start_level

    level3Label:
        mov dl,50
        mov dh,20
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov levelSelect,3
    jmp  start_level

    ;-----------------------------------------
    ;   <---display context of level manu--->
    ;----------------------------------------
    start_level:
     
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset LEVEL1_logo
    call writestring

    mov dl,0
    mov dh,10
    call gotoxy
    mov edx,offset LEVEL2_LOGO
    call writestring

    mov dl,0
    mov dh,20
    call gotoxy
    mov edx,offset LEVEL3_LOGO 
    call writestring
    

    call readchar
    call clrscr
    cmp al,ESC_KEY
    je start_tab
    cmp al,'1'
    je level1Label
    cmp al,'2'
    je level2Label
    cmp al,'3'
    je level3Label
    cmp al,13
    je selectionLevel


  selectionLevel:
    cmp levelSelect,1
    je  level1Start
    cmp levelSelect,2
    je level2Start
    cmp levelSelect,3
    je level3

level1Start:
 
    call drawing_all_bricks      ; Start Game Level 1  
    call Drawing_Boundary    ; Draw the game boundary
    call display_level1
mov eax, SND_FILENAME;; pszSound is a file name
or eax, SND_LOOP;; Play in a loop
or eax, SND_ASYNC;; Play in the background
mov esi , OFFSET file4
invoke PlaySound, esi, 0, eax
    call displayLives
    call displayName
   
    call GetMseconds
    mov startTime, eax

 
    
; Set video mode to graphics mode
;call setVideoMode

  

    mov eax, 3           ; Set game state or some variable (example)
    mov xCord, 24        ; Set X-coordinate
    mov yCord, 26        ; Set Y-coordinate
    mov paddleX, 26
    mov paddleY, 23
    call DrawPaddle      ; Draw player at starting position

    ; Set ball position
    mov dl, xBallPos     ; Ball X position
    mov dh, yBallPos     ; Ball Y position
    call GotoXY          ; Move cursor to ball position
    call Drawing_Ball        ; Draw the ball

    ; Set text color to Green
    mov eax, 7      ; Set color to green (you should define the Green constant)
    call setTextcolor    ; Set text color to green

    ; Move to desired position (xCord, yCord) and draw the character '0'
    mov dl, xCord        ; Load X coordinate for drawing '0'
    mov dh, yCord        ; Load Y coordinate for drawing '0'
    call GotoXY          ; Move to the (xCord, yCord) position
    mov al, 'O'          ; Load the character '0' to be drawn
    call WriteConsoleA   ; Call the function to draw the character
   
    call displayTime
      mov level1EndTime, eax   ; Store the time at the end of Level 1
    call displayScore
   



    ; Initialize coordinates for drawing hearts
  ;;;;=====================================================================================================
  ;DrawHeart 10, 10
    ;Call the DrawHeart macro for each heart
    ; DrawHeart heart1X, heart1Y
    ;DrawHeart heart2X, heart2Y
    ;DrawHeart heart3X, heart3Y






; Main game loop
L1:
    
    call Handle_keys_Input         ; Check and process paddle movement
    call CheckCollision1      ; Detect paddle-ball collision
    call UpdateBall_level1          ; Update ball position based on velocity
    call desBall
    call Drawing_Ball            ; Redraw the ball at the new position
    call Delay               ; Add a small delay to control game speed
    call getTime
    call desBall
    ; Check for pause key
    ;call GetKeyState 
    ;test ax, 8000h

    ;jz ContinueGame          ; If 'P' key is not pressed, continue the game loop

    ;call PauseGame

ContinueGame:
    jmp L1


    ;;;;;;;;;HIGH SCORES;;;;;;;;;;

    SHOW_HIGHSCORES proc
    mov eax, SND_FILENAME;; pszSound is a file name
    ;or eax, SND_LOOP;; Play in a loop
    or eax, SND_ASYNC;; Play in the background
    mov esi , OFFSET file7
    invoke PlaySound, esi, 0, eax
    mov  edx, offset HS1
    call writestring

    mov edx, offset buffer
    call writestring

    MOV EDX, offset inst5
    call writestring
    MOV EDX, offset inst6
    call writestring
    call readint
    cmp al, 0
    je exiting_program
    call clrscr
    jmp starting
    RET
    SHOW_HIGHSCORES ENDP




exit_program:
    ; Exit the program gracefully

    call readchar
    call clrscr
    
    
;;    exit::
  main  ENDP;
  ;;;;;;;;;;;;;;

  getTime PROC
    call GetMseconds           ; Get the current milliseconds from the system
    sub eax, startTime         ; Subtract the start time to get elapsed time
    mov elapsedTime, eax       ; Store the elapsed time (in milliseconds)

    mov eax, elapsedTime       ; Load elapsed time
    mov ecx, 1000              ; Conversion factor (milliseconds to seconds)
    xor edx, edx               ; Clear the remainder
    div ecx                    ; EAX = elapsedTime / 1000 (seconds)

    mov dl, 89                 ; Move cursor to X = 89
    mov dh, 0                  ; Move cursor to Y = 0
    call gotoxy                ; Set cursor position
    call WriteDec              ; Write the elapsed time in seconds

    ret                        ; Return from the procedure
getTime ENDP

clearTimeDisplay PROC
    mov dl, 89                 ; X-coordinate (same as in `getTime`)
    mov dh, 0                  ; Y-coordinate
    call gotoxy                ; Move cursor to the same position

    ; Overwrite with spaces
    mov edx, OFFSET clear_string ; Pointer to a string of spaces
    call writestring            ; Write the spaces to clear the display

    ret                        ; Return from the procedure
clearTimeDisplay ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;FILE HANDLING
writenum PROC
mov eax, 0
    push ecx
    mov edx,OFFSET filename
    call CreateOutputFile
    mov fileHandle,eax
    cmp eax, INVALID_HANDLE_VALUE ; error found?
    jne file_ok
    ; no: skip
    mov edx,OFFSET prompt1
    ; display error
    call WriteString
    jmp quit
    file_ok:
        mov eax,fileHandle
        mov edx, esi
        pop ecx
        call WriteToFile
        
        mov bytesW, eax
        MOV edx, Offset filename
        mov eax,fileHandle
        call CloseFile
    quit:
    ret
writenum endP



Q1 PROC

        mov ecx, lengthof PRMPT
        SUB ECX, 1
    MOV esi, offset PRMPT
    call writenum
 
    ret
Q1 endP

Q2 PROC
    mov edx,OFFSET filename
    call OpenInputFile
    mov fileHandle,eax
    cmp eax,INVALID_HANDLE_VALUE 
    jne file_ok1
    mWrite <"Cannot open file",0dh,0ah>
    jmp quit1
    file_ok1:
        mov edx,OFFSET buffer
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc check_buffer_size

        check_buffer_size:
        cmp eax,BUFFER_SIZE
        ; buffer large enough?
        jb buf_size_ok
        ; yes
        mWrite <"Error: Buffer too small for the file",0dh,0ah>
        jmp quit1
        ; and quit
        buf_size_ok:
        mov b, eax
            mov buffer[eax],0
            ; insert null terminator
            ; Display the buffer.
           ; mWrite <"Buffer:",0dh,0ah,0dh,0ah>
           ; mov edx,OFFSET buffer
            ; display the buffer
            ;call WriteString

    quit1:
    mov eax, fileHandle
    CALL CLOSEFILE
    ret
Q2 endP


ADD_SPACE PROC 
push edi
mov edi, offset spaces
SPACEl:
mov al, [edi]
MOV [ESI],AL
inc ebx
INC ESI
LOOP SPACEl
pop edi

RET
ADD_SPACE ENDP


WRITENAME PROC
MOV ebx, b
mov edi, offset names                                 ;inputname


mov esi, offset buffer 
mov ecx, lengthof names                                ;inputname
add esi, ebx
addname:
mov al, [edi]
cmp al, 0
je finish
mov [esi], al
inc esi
inc ebx
inc edi

loop addname

;nexL:
;jmp nexL

finish:
mov esi, offset buffer
add esi, ebx
MOV ECX, 12
CALL ADD_SPACE

;;;score

    mov eax, score
    ;mov al, score          ; Load the number into eax
         ; Load the address of str into edx
    push ebx
    call itos
    pop ebx
    mov esi, offset buffer
    add esi, ebx

mov ecx, len
dec edi

addscr:
mov al, [edi]
MOV [ESI], al
inc ebx
dec edi
inc esi
loop addscr

MOV ECX, 18
CALL ADD_SPACE

mov eax, lev
call itos

mov esi, offset buffer
 add esi, ebx

mov ecx, len
dec edi

comment @
addslvl:
mov al, [edi]
MOV [ESI], al
inc ebx
dec edi
inc esi
loop addslvl
mov al, 0Ah
mov [esi], al

mov ecx, ebx
inc ecx
mov esi, offset buffer


call writenum

@

RET
WRITENAME ENDP

;;;;Int to string
itos PROC
push ebx

mov bl, 10
mov edi, offset Istr
mov len, 0
loop1:
cmp al, 0
je ex
div bl
mov q, al
add ah, 48
mov [edi], ah
inc edi
inc len
mov eax, 0
mov al,q
jmp loop1



ex:

;pop esi
pop ebx
;pop eax
ret
itos ENDP

ending::
call WRITENAME


END main;