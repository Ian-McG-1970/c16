
* = $1001

SCR_ADR     = 3*1024
SCR_COL_ADR = 2*1024
CHAR_SET_ADR = 14*1024
BB_SCN = 1*1024

SCN = 2
SRC = SCN +2
DST = SRC +2
MEM_SIZE = DST +2

REGA = MEM_SIZE +2
REGX = REGA +1
REGY = REGX +1
PLAYER_H = REGY +1
PLAYER_V = PLAYER_H +1

SPR_CNT = PLAYER_V +1

SN_V0H0LO = SPR_CNT +1
SN_V0H0HI = SN_V0H0LO +1
SN_V1H0LO = SN_V0H0HI +1
SN_V1H0HI = SN_V1H0LO +1
SN_V2H0LO = SN_V1H0HI +1
SN_V2H0HI = SN_V2H0LO +1

BB_V0H0LO = SN_V2H0HI +1
BB_V0H0HI = BB_V0H0LO +1
BB_V1H0LO = BB_V0H0HI +1
BB_V1H0HI = BB_V1H0LO +1
BB_V2H0LO = BB_V1H0HI +1
BB_V2H0HI = BB_V2H0LO +1

VPIX = BB_V2H0HI +1
HPIX = VPIX +1

TED_SCR_BDR_FF19 = $FF19
TED_SCR_COL0_FF15 = $FF15
TED_SCR_COL1_FF16 = $FF16
TED_SCR_COL2_FF17 = $FF17

TED_RASTER_LINE_FF08 = $FF0B
TED_INT_FFFE = $FFFE
TED_SCR_ADR_FF14 = $FF14
TED_CHARSET_ADR_FF13 = $FF13
TED_CHARSET_ROM_FF12 = $FF12

INT_RASTER_POS = 206-6

!ZONE CLR_CHR
!MACRO CLR_CHR {
  LDY #0
  STA (DST),Y
  INY
  STA (DST),Y
  INY
  STA (DST),Y
  INY
  STA (DST),Y
  INY
  STA (DST),Y
  INY
  STA (DST),Y
  INY
  STA (DST),Y
  INY
  STA (DST),Y
}

!ZONE CPY_CHR
!MACRO CPY_CHR {
    LDA TED_CHAR_TAB_HI,X
    STA SRC +1
    LDA TED_CHAR_TAB_LO,X
    STA SRC +0 
    LDY #0
    LDA (SRC),Y
    STA (DST),Y
    INY
    LDA (SRC),Y
    STA (DST),Y
    INY
    LDA (SRC),Y
    STA (DST),Y
    INY
    LDA (SRC),Y
    STA (DST),Y
    INY
    LDA (SRC),Y
    STA (DST),Y
    INY
    LDA (SRC),Y
    STA (DST),Y
    INY
    LDA (SRC),Y
    STA (DST),Y
    INY
    LDA (SRC),Y
    STA (DST),Y
}

INIT: !WORD $100B,0
      !BYTE $9E,"4","1","0","9",0,0,0   ; *** Produce one basic line ; SYS4107
  
      SEI       ; DISABLE INTERRUPTS
      STA $FF3F ; enable RAM
      
      CLV
      CLD
      LDX   #$FF   ; reset stack
      TXS

;main
;      LDX #<main  ; low byte
;      LDY #>main  ; and high byte of address
;      STX $FFFC   ; --- set up reset vector
;      STY $FFFD

      LDX #<IRQ   ; low byte
      LDY #>IRQ   ; and high byte of address
      STX TED_INT_FFFE ; --- set up nmi
      STY TED_INT_FFFE +1

      LDA #INT_RASTER_POS
      STA TED_RASTER_LINE_FF08 ; --- raster line

      LDA $FF0A
      AND #$FE
      STA $FF0A

      LDA #SCR_COL_ADR >>8 ; ((address /1024) *4) / colour addr = (ptr) / screen addr = (ptr +1024)
      STA TED_SCR_ADR_FF14
      LDA #CHAR_SET_ADR >>8
      STA TED_CHARSET_ADR_FF13

      LDA TED_CHARSET_ROM_FF12
      AND #%11111011 ; switch charset lookup from ROM to RAM
      STA TED_CHARSET_ROM_FF12

      LDA $FF07
      ORA #%10010000 ; FULL 256 CHARS + MCM
      STA $FF07

      LDA #6
      STA TED_SCR_COL0_FF15 ; Background color. Works/used in every video mode.
      LDA #9
      STA TED_SCR_COL1_FF16 ; Multicolor/Extended color #1. Works/used in multicolor and ECM modes, see $FF07 and $FF06.
      LDA #4
      STA TED_SCR_COL2_FF17 ; Multicolor/Extended color #2. Works/used in multicolor and ECM modes, see $FF07 and $FF06.
;      STA $FF18 ; Extended color #3. Works/used in ECM mode only, see $FF06.
      LDA #0
      STA TED_SCR_BDR_FF19 ; Border color. Works/used in every video mode. When the screen is turned off, (see $FF06), the whole screen is this color.

 LDA #11 ; colour 11
 LDX #<SCR_COL_ADR
 LDY #>SCR_COL_ADR
 STX DST+0
 STY DST+1
 LDX #>1000 
 LDY #<1000
 JSR MEMSET

 LDA #0;//%10011100 ; screen
 LDX #<BB_SCN
 LDY #>BB_SCN
 STX DST+0
 STY DST+1
 LDX #>1000 
 LDY #<1000
 JSR MEMSET

 LDA #0;//%10011100 ; screen
 LDX #<SCR_ADR
 LDY #>SCR_ADR
 STX DST+0
 STY DST+1
 LDX #>1000 
 LDY #<1000
 JSR MEMSET

  LDX #7
  LDA #0 ;  lda #0 ; %11000110
-   STA CHAR_SET_ADR,X
    DEX
    BPL -

  LDA #50
  STA PLAYER_H
  STA PLAYER_V
  
  LDA #2 ;2; 7 ; 1; 7 ; 0 ; -1
  STA SPR_CNT

      CLI
      
MLOOP JMP MLOOP
    
!ZONE IRQ
IRQ:  STA .REGA +1
      STX .REGX +1
      STY .REGY +1

      LDA $FF09 ; clear interrupt bit
      STA $FF09

; DEC BORDER
  JSR JOYSTICK1
  JSR MOVE_PLAYER ; move sprite
; INC BORDER
  
 DEC TED_SCR_BDR_FF19
 JSR CLEAR_SPRITES
 INC TED_SCR_BDR_FF19

  LDX PLAYER_V
  LDY PLAYER_H
  STX SPR_PXL_V
  STY SPR_PXL_H
 
 DEC TED_SCR_BDR_FF19
 JSR DRAW_SPRITES 
 INC TED_SCR_BDR_FF19

.REGA LDA #0
.REGX LDX #0
.REGY LDY #0

      RTI   ; Return from Interrupt

; FROM = source start address
;   TO = destination start address
; SIZE = number of bytes to move
  
;!ZONE MEMCPY
;MEMCPY
;    STY .LSB +1
;    LDY #0
;    TXA
;    BEQ .LSB
;.LOOPHI LDA (MEM_FROM),Y ; move a page at a time
;        STA (MEM_TO),Y
;        INY
;        BNE .LOOPHI
;      INC MEM_FROM+1
;      INC MEM_TO+1
;      DEX
;      BNE .LOOPHI
;.LSB    LDX #0
;        BEQ .EXIT
;.LOOPLO   LDA (MEM_FROM),Y ; move the remaining bytes
;          STA (MEM_TO),Y
;          INY
;          DEX
;          BNE .LOOPLO
;.EXIT  RTS

!ZONE MEMSET        
MEMSET       STY    .LSB_ONLY+1 ; store LSB count
             CPX    #0          ; MSB?     
             BEQ    .LSB_ONLY   ; no

             LDY    #0          ; yes so reset LSB
.MSB_LOOP  
.LSB_LOOP      STA    (DST),Y   ; clear whole MSB
               DEY 
               BNE    .LSB_LOOP

              INC    DST+1      ; inc MSB
              DEX               ; dec MSB count
              BNE    .MSB_LOOP

.LSB_ONLY    LDY    #0          ; LSB count 
             BEQ    .MS_END     ; not needed

.LAST_LSB_LOOP STA   (DST),Y
               DEY 
               BNE   .LAST_LSB_LOOP
                
              STA   (DST),Y     ; clear last Y (0)
 
.MS_END      RTS

!ZONE CLEAR_SPRITES
CLEAR_SPRITES
      LDX SPR_CNT
      BMI .EXIT
.LOOP   JSR CLEAR_SPRITE
        DEX
        BPL .LOOP
.EXIT RTS

!ZONE CLEAR_SPRITE
CLEAR_SPRITE

  LDY SPR_CHR_V,X
  LDA SCN_ADR_HI,Y
  STA SN_V0H0HI ; screen hi
  SEC
  SBC #8
  STA BB_V0H0HI ; back buffer hi
  LDA SCN_ADR_HI+1,Y
  STA SN_V1H0HI
  SEC           ; needed?
  SBC #8
  STA BB_V1H0HI
  LDA SCN_ADR_HI+2,Y
  STA SN_V2H0HI
  SEC           ; needed?
  SBC #8
  STA BB_V2H0HI

  LDA SCN_ADR_LO,Y
  STA SN_V0H0LO
  STA BB_V0H0LO
  CLC             ; not needed due to adc above?
  ADC #40         ; with sec above could remove clc and possibly be #39?
  STA SN_V1H0LO
  STA BB_V1H0LO
  CLC
  ADC #40
  STA SN_V2H0LO
  STA BB_V2H0LO

  LDY SPR_CHR_H,X
  LDA (BB_V0H0LO),Y ; get back buffer
  STA (SN_V0H0LO),Y ; put screen
  LDA (BB_V1H0LO),Y
  STA (SN_V1H0LO),Y
  LDA (BB_V2H0LO),Y
  STA (SN_V2H0LO),Y

  INY
  LDA (BB_V0H0LO),Y
  STA (SN_V0H0LO),Y
  LDA (BB_V1H0LO),Y
  STA (SN_V1H0LO),Y
  LDA (BB_V2H0LO),Y
  STA (SN_V2H0LO),Y

  INY
  LDA (BB_V0H0LO),Y
  STA (SN_V0H0LO),Y
  LDA (BB_V1H0LO),Y
  STA (SN_V1H0LO),Y
  LDA (BB_V2H0LO),Y
  STA (SN_V2H0LO),Y

  RTS

!ZONE DRAW_SPRITES
DRAW_SPRITES
      LAX SPR_CNT
      BMI .EXIT
.LOOP   JSR DRAW_SPRITE
        DEX
        BPL .LOOP
.EXIT RTS

; pass in v / h / sprite number to be used (0-12?) / sprite number to be drawn (0-255)
; get sprite x and y
; convert to char pos
; store in v and h char pos to be cleared
; get 9 chars from screen
; store in 9 chars for sprite
; 9 chars allocated for this sprite
; put them on screen

!ZONE DRAW_SPRITE
DRAW_SPRITE
; x=sprnum (0-12)
 DEC TED_SCR_BDR_FF19

  STX REGX

  LDY SPR_CHR,X
  STY REGA
  LDA TED_CHAR_TAB_HI,Y
  STA DST +1
  STA SCN +1
  LDA TED_CHAR_TAB_LO,Y
  STA DST
  STA SCN

  LDY SPR_PXL_V,X
  LDA V_PIXEL,Y
;  TYA
;  AND #7
;  ORA #48
  STA VPIX
 
  LDA V_CHAR,Y
  STA SPR_CHR_V,X
  TAY

  LDA SCN_ADR_HI,Y
  STA SN_V0H0HI
  LDA SCN_ADR_HI+1,Y
  STA SN_V1H0HI
  LDA SCN_ADR_HI+2,Y
  STA SN_V2H0HI

  LDA SCN_ADR_LO,Y
  STA SN_V0H0LO
  CLC
  ADC #40
  STA SN_V1H0LO
  CLC
  ADC #40
  STA SN_V2H0LO

  LDY SPR_PXL_H,X
;  LDA H_PIXEL,Y
  TYA
  AND #3
  ORA SPR_SHAPE,X
  STA HPIX

  LDA H_CHAR,Y
  STA SPR_CHR_H,X
  TAY

  STY REGY                      ; store char
  
          LAX (SN_V0H0LO),Y             ; get screen in X and A
          BNE .COPY_00                  ; if not zero it needs copied
.CLEAR_00   +CLR_CHR                    ; else it needs cleared
            jmp .CONT_00                ; jmp
.COPY_00    +CPY_CHR   ; if not zero copy char on screen to char
.CONT_00  LDY REGY                      ; get hor pos
          LAX REGA                      ; get char
          STA (SN_V0H0LO),Y             ; on screen

          LDA TED_CHAR_TAB_LO+1,X  ; move dest to next char 
          STA DST
          INC REGA                ; next char

          LAX (SN_V1H0LO),Y
          BNE .COPY_10
.CLEAR_10   +CLR_CHR
            jmp .CONT_10
.COPY_10    +CPY_CHR 
.CONT_10  LDY REGY
          LAX REGA
          STA (SN_V1H0LO),Y

          LDA TED_CHAR_TAB_LO+1,X
          STA DST
          INC REGA

          LAX (SN_V2H0LO),Y
          BNE .COPY_20
.CLEAR_20   +CLR_CHR
            jmp .CONT_20
.COPY_20    +CPY_CHR 
.CONT_20  LDY REGY
          LAX REGA
          STA (SN_V2H0LO),Y

          LDA TED_CHAR_TAB_LO+1,X
          STA DST
          INC REGA

          INY
          STY REGY
          LAX (SN_V0H0LO),Y
          BNE .COPY_01
.CLEAR_01   +CLR_CHR
            jmp .CONT_01
.COPY_01    +CPY_CHR 
.CONT_01  LDY REGY
          LAX REGA
          STA (SN_V0H0LO),Y

          LDA TED_CHAR_TAB_LO+1,X
          STA DST
          INC REGA

          LAX (SN_V1H0LO),Y
          BNE .COPY_11
.CLEAR_11   +CLR_CHR
            jmp .CONT_11
.COPY_11    +CPY_CHR 
.CONT_11  LDY REGY
          LAX REGA
          STA (SN_V1H0LO),Y

          LDA TED_CHAR_TAB_LO+1,X
          STA DST
          INC REGA

          LAX (SN_V2H0LO),Y
          BNE .COPY_21
.CLEAR_21   +CLR_CHR 
            jmp .CONT_21
.COPY_21    +CPY_CHR 
.CONT_21  LDY REGY
          LAX REGA
          STA (SN_V2H0LO),Y

          LDA TED_CHAR_TAB_LO+1,X
          STA DST
          INC REGA

          INY 
          STY REGY
          LAX (SN_V0H0LO),Y
          BNE .COPY_02
.CLEAR_02   +CLR_CHR 
            jmp .CONT_02
.COPY_02    +CPY_CHR 
.CONT_02  LDY REGY
          LAX REGA
          STA (SN_V0H0LO),Y

          LDA TED_CHAR_TAB_LO+1,X
          STA DST
          INC REGA

          LAX (SN_V1H0LO),Y
          BNE .COPY_12
.CLEAR_12   +CLR_CHR
            jmp .CONT_12
.COPY_12    +CPY_CHR 
.CONT_12  LDY REGY
          LAX REGA
          STA (SN_V1H0LO),Y

          LDA TED_CHAR_TAB_LO+1,X
          STA DST
          INC REGA

          LAX (SN_V2H0LO),Y
          BNE .COPY_22
.CLEAR_22   +CLR_CHR 
            jmp .CONT_22
.COPY_22    +CPY_CHR 
.CONT_22  LDY REGY
          LAX REGA
          STA (SN_V2H0LO),Y

 LDY HPIX
 LDX SPR_AND_TAB_HI,Y 
 STX .SPR_AND_00 +2
 STX .SPR_AND_01 +2
 STX .SPR_AND_02 +2
 STX .SPR_AND_03 +2
 STX .SPR_AND_04 +2
 STX .SPR_AND_05 +2
 STX .SPR_AND_06 +2
 STX .SPR_AND_07 +2
 STX .SPR_AND_08 +2
 STX .SPR_AND_09 +2
 STX .SPR_AND_10 +2
 STX .SPR_AND_11 +2
 STX .SPR_AND_12 +2
 STX .SPR_AND_13 +2
 STX .SPR_AND_14 +2
 STX .SPR_AND_15 +2
 INX
; LDX SPR_ORA_TAB_HI,Y 
 STX .SPR_ORA_00 +2
 STX .SPR_ORA_01 +2
 STX .SPR_ORA_02 +2
 STX .SPR_ORA_03 +2
 STX .SPR_ORA_04 +2
 STX .SPR_ORA_05 +2
 STX .SPR_ORA_06 +2
 STX .SPR_ORA_07 +2
 STX .SPR_ORA_08 +2
 STX .SPR_ORA_09 +2
 STX .SPR_ORA_10 +2
 STX .SPR_ORA_11 +2
 STX .SPR_ORA_12 +2
 STX .SPR_ORA_13 +2
 STX .SPR_ORA_14 +2
 STX .SPR_ORA_15 +2

 LDX SPR_AND_TAB_LO,Y
 STX .SPR_AND_00 +1
 STX .SPR_ORA_00 +1
 INX
 STX .SPR_AND_01 +1
 STX .SPR_ORA_01 +1
 INX
 STX .SPR_AND_02 +1
 STX .SPR_ORA_02 +1
 INX
 STX .SPR_AND_03 +1
 STX .SPR_ORA_03 +1
 INX
 STX .SPR_AND_04 +1
 STX .SPR_ORA_04 +1
 INX
 STX .SPR_AND_05 +1
 STX .SPR_ORA_05 +1
 INX
 STX .SPR_AND_06 +1
 STX .SPR_ORA_06 +1
 INX
 STX .SPR_AND_07 +1
 STX .SPR_ORA_07 +1
 INX
 STX .SPR_AND_08 +1
 STX .SPR_ORA_08 +1
 INX
 STX .SPR_AND_09 +1
 STX .SPR_ORA_09 +1
 INX
 STX .SPR_AND_10 +1
 STX .SPR_ORA_10 +1
 INX
 STX .SPR_AND_11 +1
 STX .SPR_ORA_11 +1
 INX
 STX .SPR_AND_12 +1
 STX .SPR_ORA_12 +1
 INX
 STX .SPR_AND_13 +1
 STX .SPR_ORA_13 +1
 INX
 STX .SPR_AND_14 +1
 STX .SPR_ORA_14 +1
 INX
 STX .SPR_AND_15 +1
 STX .SPR_ORA_15 +1

 LDX #32
 LDY VPIX
; SEC ; not needed?

.LOOP
            LDA (SCN),Y ; Y IS SET BETWEEN 0 AND 7 AND sub 24 each loop ?
.SPR_AND_00 AND $ABCD,X
.SPR_ORA_00 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_01 AND $ABCD,X
.SPR_ORA_01 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_02 AND $ABCD,X
.SPR_ORA_02 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_03 AND $ABCD,X
.SPR_ORA_03 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_04 AND $ABCD,X
.SPR_ORA_04 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_05 AND $ABCD,X
.SPR_ORA_05 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_06 AND $ABCD,X
.SPR_ORA_06 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_07 AND $ABCD,X
.SPR_ORA_07 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_08 AND $ABCD,X
.SPR_ORA_08 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_09 AND $ABCD,X
.SPR_ORA_09 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_10 AND $ABCD,X
.SPR_ORA_10 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_11 AND $ABCD,X
.SPR_ORA_11 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_12 AND $ABCD,X
.SPR_ORA_12 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_13 AND $ABCD,X
.SPR_ORA_13 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_14 AND $ABCD,X
.SPR_ORA_14 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_AND_15 AND $ABCD,X
.SPR_ORA_15 ORA $ABCD,X
            STA (SCN),Y
    LDA #255
    SBX #16
    BMI .EXIT

   TYA
   SBC #15+24
   TAY
   JMP .LOOP

.EXIT


 INC TED_SCR_BDR_FF19
  
  LAX REGX
  RTS


JOYSTICK2 LDA #%00000100 ; ; JOYSTICKSELECT2
          JMP JOYSTICK
          
JOYSTICK1 LDA #%00000010 ; ; JOYSTICKSELECT1

!ZONE JOYSTICK
JOYSTICK  LDX #$FF
          STX $fd30
          STA $ff08
          LDA $ff08

          LDX #0 ; inx to save a byte?
          LDY #0
.UP       LSR
          BCS   .DOWN
            DEY
.DOWN     LSR
          BCS   .LEFT
            INY
.LEFT     LSR
          BCS   .RIGHT
            DEX
.RIGHT    LSR
          BCS   .FIRE
            INX
.FIRE     EOR   #1
          AND   #1
;          STA   JOYF
;          STX   JOYX
;          STY   JOYY
          LSR
          RTS

!ZONE MOVE_PLAYER
MOVE_PLAYER TXA
            BEQ   .VER
            BPL   .RIGHT
.LEFT         DEC   PLAYER_H
              JMP   .VER
.RIGHT      INC   PLAYER_H
.VER        TYA
            BEQ   .EXIT
            BPL   .DOWN
.UP           DEC   PLAYER_V
              RTS
.DOWN       INC   PLAYER_V
.EXIT       RTS

H_CHAR:
!FILL 4,00
!FILL 4,01
!FILL 4,02
!FILL 4,03
!FILL 4,04
!FILL 4,05
!FILL 4,06
!FILL 4,07
!FILL 4,08
!FILL 4,09
!FILL 4,10
!FILL 4,11
!FILL 4,12
!FILL 4,13
!FILL 4,14
!FILL 4,15
!FILL 4,16
!FILL 4,17
!FILL 4,18
!FILL 4,19
!FILL 4,20
!FILL 4,21
!FILL 4,22
!FILL 4,23
!FILL 4,24
!FILL 4,25
!FILL 4,26
!FILL 4,27
!FILL 4,28
!FILL 4,29
!FILL 4,30
!FILL 4,31
!FILL 4,32
!FILL 4,33
!FILL 4,34
!FILL 4,35
!FILL 4,36
!FILL 4,37
!FILL 4,38
!FILL 4,39

V_CHAR:
!FILL 8,00
!FILL 8,01
!FILL 8,02
!FILL 8,03
!FILL 8,04
!FILL 8,05
!FILL 8,06
!FILL 8,07
!FILL 8,08
!FILL 8,09
!FILL 8,10
!FILL 8,11
!FILL 8,12
!FILL 8,13
!FILL 8,14
!FILL 8,15
!FILL 8,16
!FILL 8,17
!FILL 8,18
!FILL 8,19
!FILL 8,20
!FILL 8,21
!FILL 8,22
!FILL 8,23
!FILL 8,24

!align 255,0
TED_CHAR_TAB_HI
!for I = 0 TO 255
!BYTE >(CHAR_SET_ADR+(I*8))
!end
  
TED_CHAR_TAB_LO
!for I = 0 TO 255
!BYTE <(CHAR_SET_ADR+(I*8))
!end

V_PIXEL:
!for I = 0 TO 24
!BYTE 0+48,1+48,2+48,3+48,4+48,5+48,6+48,7+48
!end

SPR_AND_TAB_LO  !BYTE <SPR_AND_000_00,<SPR_AND_000_01,<SPR_AND_000_02,<SPR_AND_000_03
                !BYTE <SPR_AND_001_00,<SPR_AND_001_01,<SPR_AND_001_02,<SPR_AND_001_03
                !BYTE <SPR_AND_002_00,<SPR_AND_002_01,<SPR_AND_002_02,<SPR_AND_002_03

SPR_AND_TAB_HI  !BYTE >SPR_AND_000_00,>SPR_AND_000_01,>SPR_AND_000_02,>SPR_AND_000_03
                !BYTE >SPR_AND_001_00,>SPR_AND_001_01,>SPR_AND_001_02,>SPR_AND_001_03
                !BYTE >SPR_AND_002_00,>SPR_AND_002_01,>SPR_AND_002_02,>SPR_AND_002_03

SCN_ADR_HI
!for I = 0 TO 24
!BYTE >(SCR_ADR+(I*40))
!end

SCN_ADR_LO
!for I = 0 TO 24
!BYTE <(SCR_ADR+(I*40))
!end

SPR_PXL_V !BYTE 35,100,130,70,50,100 ; pixel pos
SPR_PXL_H !BYTE 45,100,130,50,70,50
SPR_CHR   !BYTE 242,233,224
SPR_SHAPE !BYTE 0,4,8
SPR_CHR_V !BYTE 0,0,0,0,0,0 ; char pos
SPR_CHR_H !BYTE 0,0,0,0,0,0

!align 255,0
SPR_AND_000_00:
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %11111111
!end
SPR_AND_000_01:
!for I = 0 TO 15
!BYTE %11000000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00111111
!end
SPR_AND_000_02:
!for I = 0 TO 15
!BYTE %11110000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00001111
!end
SPR_AND_000_03:
!for I = 0 TO 15
!BYTE %11111100
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00000011
!end
SPR_AND_001_00:
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %11111111
!end

!align 255,0
SPR_ORA_000_00:
!for I = 0 TO 15
!BYTE %11111111
!end
!for I = 0 TO 15
!BYTE %11111111
!end
!for I = 0 TO 15
!BYTE %00000000
!end
SPR_ORA_000_01:
!for I = 0 TO 15
!BYTE %00111111
!end
!for I = 0 TO 15
!BYTE %11111111
!end
!for I = 0 TO 15
!BYTE %11000000
!end
SPR_ORA_000_02:
!for I = 0 TO 15
!BYTE %00001111
!end
!for I = 0 TO 15
!BYTE %11111111
!end
!for I = 0 TO 15
!BYTE %11110000
!end
SPR_ORA_000_03:
!for I = 0 TO 15
!BYTE %00000011
!end
!for I = 0 TO 15
!BYTE %11111111
!end
!for I = 0 TO 15
!BYTE %11111100
!end
SPR_ORA_001_00:
!for I = 0 TO 15
!BYTE %01010101
!end
!for I = 0 TO 15
!BYTE %01010101
!end
!for I = 0 TO 15
!BYTE %00000000
!end

!align 255,0
SPR_AND_001_01:
!for I = 0 TO 15
!BYTE %11000000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00111111
!end
SPR_AND_001_02:
!for I = 0 TO 15
!BYTE %11110000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00001111
!end
SPR_AND_001_03:
!for I = 0 TO 15
!BYTE %11111100
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00000011
!end
SPR_AND_002_00:
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %11111111
!end
SPR_AND_002_01:
!for I = 0 TO 15
!BYTE %11000000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00111111
!end

!align 255,0
SPR_ORA_001_01:
!for I = 0 TO 15
!BYTE %00010101
!end
!for I = 0 TO 15
!BYTE %01010101
!end
!for I = 0 TO 15
!BYTE %01000000
!end
SPR_ORA_001_02:
!for I = 0 TO 15
!BYTE %00000101
!end
!for I = 0 TO 15
!BYTE %01010101
!end
!for I = 0 TO 15
!BYTE %01010000
!end
SPR_ORA_001_03:
!for I = 0 TO 15
!BYTE %00000001
!end
!for I = 0 TO 15
!BYTE %01010101
!end
!for I = 0 TO 15
!BYTE %01010100
!end
SPR_ORA_002_00:
!for I = 0 TO 15
!BYTE %10101010
!end
!for I = 0 TO 15
!BYTE %10101010
!end
!for I = 0 TO 15
!BYTE %00000000
!end
SPR_ORA_002_01:
!for I = 0 TO 15
!BYTE %00101010
!end
!for I = 0 TO 15
!BYTE %10101010
!end
!for I = 0 TO 15
!BYTE %10000000
!end

!align 255,0
SPR_AND_002_02:
!for I = 0 TO 15
!BYTE %11110000
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00001111
!end
SPR_AND_002_03:
!for I = 0 TO 15
!BYTE %11111100
!end
!for I = 0 TO 15
!BYTE %00000000
!end
!for I = 0 TO 15
!BYTE %00000011
!end
!align 255,0
SPR_ORA_002_02:
!for I = 0 TO 15
!BYTE %00001010
!end
!for I = 0 TO 15
!BYTE %10101010
!end
!for I = 0 TO 15
!BYTE %10100000
!end
SPR_ORA_002_03:
!for I = 0 TO 15
!BYTE %00000010
!end
!for I = 0 TO 15
!BYTE %10101010
!end
!for I = 0 TO 15
!BYTE %10101000
!end
