
* = $1001

SCR_ADR     = 3*1024
SCR_COL_ADR = 2*1024
CHAR_SET_ADR = 14*1024
BB_SCN = 1*1024

SCN = 2
SRC = SCN +2
DST = SRC +2
REGA = DST +2
REGX = REGA +1
REGY = REGX +1
PLAYER_H = REGY +1
PLAYER_V = PLAYER_H +1

SPR_CNT = PLAYER_V +1
SPR_NUM = SPR_CNT +1
STACK = SPR_NUM +1

SN_V0H0LO = STACK +1
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

ORA_BUF_00_00 = HPIX +1
ORA_BUF_00_01 = ORA_BUF_00_00 +1
ORA_BUF_00_02 = ORA_BUF_00_01 +1
AND_BUF_00_00 = ORA_BUF_00_02 +1
AND_BUF_00_01 = AND_BUF_00_00 +1
AND_BUF_00_02 = AND_BUF_00_01 +1

ORA_BUF_01_00 = AND_BUF_00_02 +1
ORA_BUF_01_01 = ORA_BUF_01_00 +1
ORA_BUF_01_02 = ORA_BUF_01_01 +1
AND_BUF_01_00 = ORA_BUF_01_02 +1
AND_BUF_01_01 = AND_BUF_01_00 +1
AND_BUF_01_02 = AND_BUF_01_01 +1

ORA_BUF_02_00 = AND_BUF_01_02 +1
ORA_BUF_02_01 = ORA_BUF_01_00 +1
ORA_BUF_02_02 = ORA_BUF_01_01 +1
AND_BUF_02_00 = ORA_BUF_02_02 +1
AND_BUF_02_01 = AND_BUF_02_00 +1
AND_BUF_02_02 = AND_BUF_02_01 +1

ORA_BUF_03_00 = AND_BUF_02_02 +1
ORA_BUF_03_01 = ORA_BUF_03_00 +1
ORA_BUF_03_02 = ORA_BUF_03_01 +1
AND_BUF_03_00 = ORA_BUF_03_02 +1
AND_BUF_03_01 = AND_BUF_03_00 +1
AND_BUF_03_02 = AND_BUF_03_01 +1

ORA_BUF_04_00 = AND_BUF_03_02 +1
ORA_BUF_04_01 = ORA_BUF_04_00 +1
ORA_BUF_04_02 = ORA_BUF_04_01 +1
AND_BUF_04_00 = ORA_BUF_04_02 +1
AND_BUF_04_01 = AND_BUF_04_00 +1
AND_BUF_04_02 = AND_BUF_04_01 +1

ORA_BUF_05_00 = AND_BUF_04_02 +1
ORA_BUF_05_01 = ORA_BUF_05_00 +1
ORA_BUF_05_02 = ORA_BUF_05_01 +1
AND_BUF_05_00 = ORA_BUF_05_02 +1
AND_BUF_05_01 = AND_BUF_05_00 +1
AND_BUF_05_02 = AND_BUF_05_01 +1

ORA_BUF_06_00 = AND_BUF_05_02 +1
ORA_BUF_06_01 = ORA_BUF_06_00 +1
ORA_BUF_06_02 = ORA_BUF_06_01 +1
AND_BUF_06_00 = ORA_BUF_06_02 +1
AND_BUF_06_01 = AND_BUF_06_00 +1
AND_BUF_06_02 = AND_BUF_06_01 +1

ORA_BUF_07_00 = AND_BUF_06_02 +1
ORA_BUF_07_01 = ORA_BUF_07_00 +1
ORA_BUF_07_02 = ORA_BUF_07_01 +1
AND_BUF_07_00 = ORA_BUF_07_02 +1
AND_BUF_07_01 = AND_BUF_07_00 +1
AND_BUF_07_02 = AND_BUF_07_01 +1

ORA_BUF_08_00 = AND_BUF_07_02 +1
ORA_BUF_08_01 = ORA_BUF_08_00 +1
ORA_BUF_08_02 = ORA_BUF_08_01 +1
AND_BUF_08_00 = ORA_BUF_08_02 +1
AND_BUF_08_01 = AND_BUF_08_00 +1
AND_BUF_08_02 = AND_BUF_08_01 +1

ORA_BUF_09_00 = AND_BUF_08_02 +1
ORA_BUF_09_01 = ORA_BUF_09_00 +1
ORA_BUF_09_02 = ORA_BUF_09_01 +1
AND_BUF_09_00 = ORA_BUF_09_02 +1
AND_BUF_09_01 = AND_BUF_09_00 +1
AND_BUF_09_02 = AND_BUF_09_01 +1

ORA_BUF_10_00 = AND_BUF_09_02 +1
ORA_BUF_10_01 = ORA_BUF_10_00 +1
ORA_BUF_10_02 = ORA_BUF_10_01 +1
AND_BUF_10_00 = ORA_BUF_10_02 +1
AND_BUF_10_01 = AND_BUF_10_00 +1
AND_BUF_10_02 = AND_BUF_10_01 +1

ORA_BUF_11_00 = AND_BUF_10_02 +1
ORA_BUF_11_01 = ORA_BUF_11_00 +1
ORA_BUF_11_02 = ORA_BUF_11_01 +1
AND_BUF_11_00 = ORA_BUF_11_02 +1
AND_BUF_11_01 = AND_BUF_11_00 +1
AND_BUF_11_02 = AND_BUF_11_01 +1

ORA_BUF_12_00 = AND_BUF_11_02 +1
ORA_BUF_12_01 = ORA_BUF_12_00 +1
ORA_BUF_12_02 = ORA_BUF_12_01 +1
AND_BUF_12_00 = ORA_BUF_12_02 +1
AND_BUF_12_01 = AND_BUF_12_00 +1
AND_BUF_12_02 = AND_BUF_12_01 +1

ORA_BUF_13_00 = AND_BUF_12_02 +1
ORA_BUF_13_01 = ORA_BUF_13_00 +1
ORA_BUF_13_02 = ORA_BUF_13_01 +1
AND_BUF_13_00 = ORA_BUF_13_02 +1
AND_BUF_13_01 = AND_BUF_13_00 +1
AND_BUF_13_02 = AND_BUF_13_01 +1

ORA_BUF_14_00 = AND_BUF_13_02 +1
ORA_BUF_14_01 = ORA_BUF_14_00 +1
ORA_BUF_14_02 = ORA_BUF_14_01 +1
AND_BUF_14_00 = ORA_BUF_14_02 +1
AND_BUF_14_01 = AND_BUF_14_00 +1
AND_BUF_14_02 = AND_BUF_14_01 +1

ORA_BUF_15_00 = AND_BUF_14_02 +1
ORA_BUF_15_01 = ORA_BUF_15_00 +1
ORA_BUF_15_02 = ORA_BUF_15_01 +1
AND_BUF_15_00 = ORA_BUF_15_02 +1
AND_BUF_15_01 = AND_BUF_15_00 +1
AND_BUF_15_02 = AND_BUF_15_01 +1


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
MEM_SIZE = SCN

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

      LDA #0;6
      STA TED_SCR_COL0_FF15 ; Background color. Works/used in every video mode.
      LDA #9
      STA TED_SCR_COL1_FF16 ; Multicolor/Extended color #1. Works/used in multicolor and ECM modes, see $FF07 and $FF06.
      LDA #4
      STA TED_SCR_COL2_FF17 ; Multicolor/Extended color #2. Works/used in multicolor and ECM modes, see $FF07 and $FF06.
;      STA $FF18 ; Extended color #3. Works/used in ECM mode only, see $FF06.
      LDA #0
      STA TED_SCR_BDR_FF19 ; Border color. Works/used in every video mode. When the screen is turned off, (see $FF06), the whole screen is this color.

 LDA #$1f ; colour 11
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
      LDA SPR_CNT
      STA SPR_NUM
.LOOP   LDY SPR_NUM
        JSR DRAW_SPRITE
        DEC SPR_NUM
        BPL .LOOP
      RTS

; pass in v / h / sprite number to be used (0-12?) / sprite number to be drawn (0-255)
; get sprite x and y
; convert to char pos
; store in v and h char pos to be cleared
; get 9 chars from screen
; store in 9 chars for sprite
; 9 chars allocated for this sprite
; put them on screen

!ZONE DRAW_SPRITE
DRAW_SPRITE ; y=sprnum (0-12)
 DEC TED_SCR_BDR_FF19

  LDX SPR_CHR,Y
  STX REGA
  LDA TED_CHAR_TAB_HI,X
  STA DST +1
  STA SCN +1
  LDA TED_CHAR_TAB_LO,X
  STA DST
  STA SCN

  LAX SPR_PXL_V,Y
  AND #7
  STA VPIX
  LDA V_CHAR,X
  STA SPR_CHR_V,Y
  TAX

  LDA SCN_ADR_HI,X
  STA SN_V0H0HI
  LDA SCN_ADR_HI+1,X
  STA SN_V1H0HI
  LDA SCN_ADR_HI+2,X
  STA SN_V2H0HI

  LDA SCN_ADR_LO,X
  STA SN_V0H0LO
  CLC
  ADC #40
  STA SN_V1H0LO
  CLC
  ADC #40
  STA SN_V2H0LO

  LAX SPR_PXL_H,Y
  AND #3
  STA HPIX
  LDA H_CHAR,X
  STA SPR_CHR_H,Y
  TAY

  STY REGY                      ; store hor pos
  
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

          LDX SPR_SHIFT_ORA_LO_HI_TAB,Y
          STX OTL_00_00 +2
          STX OTL_01_00 +2
          STX OTL_02_00 +2
          STX OTL_03_00 +2
          STX OTL_04_00 +2
          STX OTL_05_00 +2
          STX OTL_06_00 +2
          STX OTL_07_00 +2
          STX OTL_08_00 +2
          STX OTL_09_00 +2
          STX OTL_10_00 +2
          STX OTL_11_00 +2
          STX OTL_12_00 +2
          STX OTL_13_00 +2
          STX OTL_14_00 +2
          STX OTL_15_00 +2
          STX OTL_00_01 +2
          STX OTL_01_01 +2
          STX OTL_02_01 +2
          STX OTL_03_01 +2
          STX OTL_04_01 +2
          STX OTL_05_01 +2
          STX OTL_06_01 +2
          STX OTL_07_01 +2
          STX OTL_08_01 +2
          STX OTL_09_01 +2
          STX OTL_10_01 +2
          STX OTL_11_01 +2
          STX OTL_12_01 +2
          STX OTL_13_01 +2
          STX OTL_14_01 +2
          STX OTL_15_01 +2

  INX
          STX OTH_00_00 +2
          STX OTH_01_00 +2
          STX OTH_02_00 +2
          STX OTH_03_00 +2
          STX OTH_04_00 +2
          STX OTH_05_00 +2
          STX OTH_06_00 +2
          STX OTH_07_00 +2
          STX OTH_08_00 +2
          STX OTH_09_00 +2
          STX OTH_10_00 +2
          STX OTH_11_00 +2
          STX OTH_12_00 +2
          STX OTH_13_00 +2
          STX OTH_14_00 +2
          STX OTH_15_00 +2
          STX OTH_00_01 +2
          STX OTH_01_01 +2
          STX OTH_02_01 +2
          STX OTH_03_01 +2
          STX OTH_04_01 +2
          STX OTH_05_01 +2
          STX OTH_06_01 +2
          STX OTH_07_01 +2
          STX OTH_08_01 +2
          STX OTH_09_01 +2
          STX OTH_10_01 +2
          STX OTH_11_01 +2
          STX OTH_12_01 +2
          STX OTH_13_01 +2
          STX OTH_14_01 +2
          STX OTH_15_01 +2

 LDX SPR_NUM 
 LDY SPR_SHAPE,X
 LDA SPR_TAB_LO,Y
 CLC
 STA SRC +0
 ADC #8
 STA DST +0
 ADC #8
 STA SCN +0
 ADC #8
 STA SN_V0H0LO +0
 LDA SPR_TAB_HI,Y
 STA SRC +1
 STA DST +1
 STA SCN +1
 STA SN_V0H0LO +1

  LDY #0

          TSX        ; store stack and at end resstore stack?
          STX STACK

          LAX (SRC),Y
      TXS 
OTL_00_00 LDA ORA_0_TAB_LO,X  ; ora tab lo
          STA ORA_BUF_00_00   ; ora buf 0;          tax (then lookup same 256 byte table?)
          TAX
          LDA AND_TAB,X
          STA AND_BUF_00_00   ; and buf 0
      TSX
OTH_00_00 LDA ORA_0_TAB_HI,X  ; ora tab hi
          STA ORA_BUF_00_01   ; ora buf 1;          tax
          TAX
          LDA AND_TAB,X
          STA AND_BUF_00_01   ; and buf 1

          LAX (DST),Y
      TXS 
OTL_08_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_08_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_08_00
      TSX
OTH_08_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_08_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_08_01

          LAX (SCN),Y
      TXS 
OTL_00_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_00_01
          STA ORA_BUF_00_01
          TAX
          LDA AND_TAB,X
          and AND_BUF_00_01
          STA AND_BUF_00_01
      TSX
OTH_00_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_00_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_00_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_08_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_08_01
          STA ORA_BUF_08_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_08_01
          STA AND_BUF_08_01
      TSX
OTH_08_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_08_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_08_02 

          INY

          LAX (SRC),Y
      TXS 
OTL_01_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_01_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_01_00
      TSX
OTH_01_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_01_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_01_01

          LAX (DST),Y
      TXS 
OTL_09_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_09_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_09_00
      TSX
OTH_09_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_09_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_09_01

          LAX (SCN),Y
      TXS 
OTL_01_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_01_01
          STA ORA_BUF_01_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_01_01
          STA AND_BUF_01_01
      TSX
OTH_01_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_01_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_01_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_09_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_09_01
          STA ORA_BUF_09_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_09_01
          STA AND_BUF_09_01
      TSX
OTH_09_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_09_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_09_02 

          INY

          LAX (SRC),Y
      TXS 
OTL_02_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_02_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_02_00
      TSX
OTH_02_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_02_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_02_01

          LAX (DST),Y
      TXS 
OTL_10_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_10_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_10_00
      TSX
OTH_10_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_10_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_10_01

          LAX (SCN),Y
      TXS 
OTL_02_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_02_01
          STA ORA_BUF_02_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_02_01
          STA AND_BUF_02_01
      TSX
OTH_02_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_02_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_02_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_10_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_10_01
          STA ORA_BUF_10_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_10_01
          STA AND_BUF_10_01
      TSX
OTH_10_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_10_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_10_02 

          INY

          LAX (SRC),Y
      TXS 
OTL_03_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_03_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_03_00
      TSX
OTH_03_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_03_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_03_01

          LAX (DST),Y
      TXS 
OTL_11_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_11_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_11_00
      TSX
OTH_11_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_11_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_11_01

          LAX (SCN),Y
      TXS 
OTL_03_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_03_01
          STA ORA_BUF_03_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_03_01
          STA AND_BUF_03_01
      TSX
OTH_03_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_03_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_03_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_11_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_11_01
          STA ORA_BUF_11_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_11_01
          STA AND_BUF_11_01
      TSX
OTH_11_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_11_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_11_02 

          INY

          LAX (SRC),Y
      TXS 
OTL_04_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_04_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_04_00
      TSX
OTH_04_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_04_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_04_01

          LAX (DST),Y
      TXS 
OTL_12_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_12_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_12_00
      TSX
OTH_12_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_12_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_12_01

          LAX (SCN),Y
      TXS 
OTL_04_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_04_01
          STA ORA_BUF_04_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_04_01
          STA AND_BUF_04_01
      TSX
OTH_04_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_04_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_04_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_12_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_12_01
          STA ORA_BUF_12_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_12_01
          STA AND_BUF_12_01
      TSX
OTH_12_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_12_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_12_02 

          INY

          LAX (SRC),Y
      TXS 
OTL_05_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_05_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_05_00
      TSX
OTH_05_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_05_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_05_01

          LAX (DST),Y
      TXS 
OTL_13_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_13_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_13_00
      TSX
OTH_13_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_13_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_13_01

          LAX (SCN),Y
      TXS 
OTL_05_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_05_01
          STA ORA_BUF_05_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_05_01
          STA AND_BUF_05_01
      TSX
OTH_05_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_05_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_05_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_13_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_13_01
          STA ORA_BUF_13_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_13_01
          STA AND_BUF_13_01
      TSX
OTH_13_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_13_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_13_02 

          INY

          LAX (SRC),Y
      TXS 
OTL_06_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_06_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_06_00
      TSX
OTH_06_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_06_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_06_01

          LAX (DST),Y
      TXS 
OTL_14_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_14_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_14_00
      TSX
OTH_14_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_14_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_14_01

          LAX (SCN),Y
      TXS 
OTL_06_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_06_01
          STA ORA_BUF_06_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_06_01
          STA AND_BUF_06_01
      TSX
OTH_06_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_06_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_06_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_14_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_14_01
          STA ORA_BUF_14_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_14_01
          STA AND_BUF_14_01
      TSX
OTH_14_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_14_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_14_02 

          INY

          LAX (SRC),Y
      TXS 
OTL_07_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_07_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_07_00
      TSX
OTH_07_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_07_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_07_01

          LAX (DST),Y
      TXS 
OTL_15_00 LDA ORA_0_TAB_LO,X
          STA ORA_BUF_15_00
          TAX
          LDA AND_TAB,X
          STA AND_BUF_15_00
      TSX
OTH_15_00 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_15_01
          TAX
          LDA AND_TAB,X
          STA AND_BUF_15_01

          LAX (SCN),Y
      TXS 
OTL_07_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_07_01
          STA ORA_BUF_07_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_07_01
          STA AND_BUF_07_01
      TSX
OTH_07_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_07_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_07_02 

          LAX (SN_V0H0LO),Y
      TXS 
OTL_15_01 LDA ORA_0_TAB_LO,X
          ORA ORA_BUF_15_01
          STA ORA_BUF_15_01
          TAX
          LDA AND_TAB,X
          AND AND_BUF_15_01
          STA AND_BUF_15_01
      TSX
OTH_15_01 LDA ORA_0_TAB_HI,X
          STA ORA_BUF_15_02
          TAX
          LDA AND_TAB,X
          STA AND_BUF_15_02 

          LDX STACK
          TXS

  LDX SPR_NUM 
  LDY SPR_CHR,X
  LDX TED_CHAR_TAB_LO,Y
  STX SCN +0
  INX
  STX DST +0
  INX
  STX SRC +0
  INX
  STX SN_V0H0LO +0
  INX
  STX SN_V1H0LO +0
  INX
  STX SN_V2H0LO +0
  INX
  STX BB_V0H0LO +0
  INX
  STX BB_V1H0LO +0

  LDA TED_CHAR_TAB_HI,Y
  STA SCN +1
  STA DST +1
  STA SRC +1
  STA SN_V0H0LO +1
  STA SN_V1H0LO +1
  STA SN_V2H0LO +1
  STA BB_V0H0LO +1
  STA BB_V1H0LO +1

 LDY VPIX ; Y IS SET BETWEEN 0 AND 7

      LDA (SCN),Y
      AND AND_BUF_00_00
      ORA ORA_BUF_00_00
      STA (SCN),Y

      LDA (DST),Y
      AND AND_BUF_01_00
      ORA ORA_BUF_01_00
      STA (DST),Y

      LDA (SRC),Y
      AND AND_BUF_02_00
      ORA ORA_BUF_02_00
      STA (SRC),Y

      LDA (SN_V0H0LO),Y
      AND AND_BUF_03_00
      ORA ORA_BUF_03_00
      STA (SN_V0H0LO),Y

      LDA (SN_V1H0LO),Y
      AND AND_BUF_04_00
      ORA ORA_BUF_04_00
      STA (SN_V1H0LO),Y

      LDA (SN_V2H0LO),Y
      AND AND_BUF_05_00
      ORA ORA_BUF_05_00
      STA (SN_V2H0LO),Y

      LDA (BB_V0H0LO),Y
      AND AND_BUF_06_00
      ORA ORA_BUF_06_00
      STA (BB_V0H0LO),Y

      LDA (BB_V1H0LO),Y
      AND AND_BUF_07_00
      ORA ORA_BUF_07_00
      STA (BB_V1H0LO),Y

 tya
 adc #8
 tay

      LDA (SCN),Y
      AND AND_BUF_08_00
      ORA ORA_BUF_08_00
      STA (SCN),Y

      LDA (DST),Y
      AND AND_BUF_09_00
      ORA ORA_BUF_09_00
      STA (DST),Y

      LDA (SRC),Y
      AND AND_BUF_10_00
      ORA ORA_BUF_10_00
      STA (SRC),Y

      LDA (SN_V0H0LO),Y
      AND AND_BUF_11_00
      ORA ORA_BUF_11_00
      STA (SN_V0H0LO),Y

      LDA (SN_V1H0LO),Y
      AND AND_BUF_12_00
      ORA ORA_BUF_12_00
      STA (SN_V1H0LO),Y

      LDA (SN_V2H0LO),Y
      AND AND_BUF_13_00
      ORA ORA_BUF_13_00
      STA (SN_V2H0LO),Y

      LDA (BB_V0H0LO),Y
      AND AND_BUF_14_00
      ORA ORA_BUF_14_00
      STA (BB_V0H0LO),Y

      LDA (BB_V1H0LO),Y
      AND AND_BUF_15_00
      ORA ORA_BUF_15_00
      STA (BB_V1H0LO),Y

 tya
 adc #16
 tay

      LDA (SCN),Y
      AND AND_BUF_00_01
      ORA ORA_BUF_00_01
      STA (SCN),Y

      LDA (DST),Y
      AND AND_BUF_01_01
      ORA ORA_BUF_01_01
      STA (DST),Y

      LDA (SRC),Y
      AND AND_BUF_02_01
      ORA ORA_BUF_02_01
      STA (SRC),Y

      LDA (SN_V0H0LO),Y
      AND AND_BUF_03_01
      ORA ORA_BUF_03_01
      STA (SN_V0H0LO),Y

      LDA (SN_V1H0LO),Y
      AND AND_BUF_04_01
      ORA ORA_BUF_04_01
      STA (SN_V1H0LO),Y

      LDA (SN_V2H0LO),Y
      AND AND_BUF_05_01
      ORA ORA_BUF_05_01
      STA (SN_V2H0LO),Y

      LDA (BB_V0H0LO),Y
      AND AND_BUF_06_01
      ORA ORA_BUF_06_01
      STA (BB_V0H0LO),Y

      LDA (BB_V1H0LO),Y
      AND AND_BUF_07_01
      ORA ORA_BUF_07_01
      STA (BB_V1H0LO),Y

 tya
 adc #8
 tay

      LDA (SCN),Y
      AND AND_BUF_08_01
      ORA ORA_BUF_08_01
      STA (SCN),Y

      LDA (DST),Y
      AND AND_BUF_09_01
      ORA ORA_BUF_09_01
      STA (DST),Y

      LDA (SRC),Y
      AND AND_BUF_10_01
      ORA ORA_BUF_10_01
      STA (SRC),Y

      LDA (SN_V0H0LO),Y
      AND AND_BUF_11_01
      ORA ORA_BUF_11_01
      STA (SN_V0H0LO),Y

      LDA (SN_V1H0LO),Y
      AND AND_BUF_12_01
      ORA ORA_BUF_12_01
      STA (SN_V1H0LO),Y

      LDA (SN_V2H0LO),Y
      AND AND_BUF_13_01
      ORA ORA_BUF_13_01
      STA (SN_V2H0LO),Y

      LDA (BB_V0H0LO),Y
      AND AND_BUF_14_01
      ORA ORA_BUF_14_01
      STA (BB_V0H0LO),Y

      LDA (BB_V1H0LO),Y
      AND AND_BUF_15_01
      ORA ORA_BUF_15_01
      STA (BB_V1H0LO),Y

 tya
 adc #16
 tay

      LDA (SCN),Y
      AND AND_BUF_00_02
      ORA ORA_BUF_00_02
      STA (SCN),Y

      LDA (DST),Y
      AND AND_BUF_01_02
      ORA ORA_BUF_01_02
      STA (DST),Y

      LDA (SRC),Y
      AND AND_BUF_02_02
      ORA ORA_BUF_02_02
      STA (SRC),Y

      LDA (SN_V0H0LO),Y
      AND AND_BUF_03_02
      ORA ORA_BUF_03_02
      STA (SN_V0H0LO),Y

      LDA (SN_V1H0LO),Y
      AND AND_BUF_04_02
      ORA ORA_BUF_04_02
      STA (SN_V1H0LO),Y

      LDA (SN_V2H0LO),Y
      AND AND_BUF_05_02
      ORA ORA_BUF_05_02
      STA (SN_V2H0LO),Y

      LDA (BB_V0H0LO),Y
      AND AND_BUF_06_02
      ORA ORA_BUF_06_02
      STA (BB_V0H0LO),Y

      LDA (BB_V1H0LO),Y
      AND AND_BUF_07_02
      ORA ORA_BUF_07_02
      STA (BB_V1H0LO),Y

 tya
 adc #8
 tay

      LDA (SCN),Y
      AND AND_BUF_08_02
      ORA ORA_BUF_08_02
      STA (SCN),Y

      LDA (DST),Y
      AND AND_BUF_09_02
      ORA ORA_BUF_09_02
      STA (DST),Y

      LDA (SRC),Y
      AND AND_BUF_10_02
      ORA ORA_BUF_10_02
      STA (SRC),Y

      LDA (SN_V0H0LO),Y
      AND AND_BUF_11_02
      ORA ORA_BUF_11_02
      STA (SN_V0H0LO),Y

      LDA (SN_V1H0LO),Y
      AND AND_BUF_12_02
      ORA ORA_BUF_12_02
      STA (SN_V1H0LO),Y

      LDA (SN_V2H0LO),Y
      AND AND_BUF_13_02
      ORA ORA_BUF_13_02
      STA (SN_V2H0LO),Y

      LDA (BB_V0H0LO),Y
      AND AND_BUF_14_02
      ORA ORA_BUF_14_02
      STA (BB_V0H0LO),Y

      LDA (BB_V1H0LO),Y
      AND AND_BUF_15_02
      ORA ORA_BUF_15_02
      STA (BB_V1H0LO),Y
      
 INC TED_SCR_BDR_FF19
  
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

SPR_TAB_LO  !BYTE <SPR_000_00,<SPR_001_00,<SPR_002_00
SPR_TAB_HI  !BYTE >SPR_000_00,>SPR_001_00,>SPR_002_00

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
SPR_SHAPE !BYTE 0,1,2
SPR_CHR_V !BYTE 0,0,0,0,0,0 ; char pos
SPR_CHR_H !BYTE 0,0,0,0,0,0

!align 255,0
SPR_000_00:
!BYTE %11111111
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11000000
!BYTE %11111111

!BYTE %11111111
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %00000011
!BYTE %11111111

SPR_001_00:
!for I = 0 TO 15
!BYTE %01010101
!end
!for I = 0 TO 15
!BYTE %01010101
!end
SPR_002_00:
!for I = 0 TO 15
!BYTE %10101010
!end
!for I = 0 TO 15
!BYTE %10101010
!end

SPR_SHIFT_ORA_LO_HI_TAB !BYTE >ORA_0_TAB_LO,>ORA_1_TAB_LO,>ORA_2_TAB_LO,>ORA_3_TAB_LO

!align 255,0
ORA_0_TAB_LO !BYTE %00000000, %00000001, %00000010, %00000011, %00000100, %00000101, %00000110, %00000111, %00001000, %00001001, %00001010, %00001011, %00001100, %00001101, %00001110, %00001111, %00010000, %00010001, %00010010, %00010011, %00010100, %00010101, %00010110, %00010111, %00011000, %00011001, %00011010, %00011011, %00011100, %00011101, %00011110, %00011111, %00100000, %00100001, %00100010, %00100011, %00100100, %00100101, %00100110, %00100111, %00101000, %00101001, %00101010, %00101011, %00101100, %00101101, %00101110, %00101111, %00110000, %00110001, %00110010, %00110011, %00110100, %00110101, %00110110, %00110111, %00111000, %00111001, %00111010, %00111011, %00111100, %00111101, %00111110, %00111111, %01000000, %01000001, %01000010, %01000011, %01000100, %01000101, %01000110, %01000111, %01001000, %01001001, %01001010, %01001011, %01001100, %01001101, %01001110, %01001111, %01010000, %01010001, %01010010, %01010011, %01010100, %01010101, %01010110, %01010111, %01011000, %01011001, %01011010, %01011011, %01011100, %01011101, %01011110, %01011111, %01100000, %01100001, %01100010, %01100011, %01100100, %01100101, %01100110, %01100111, %01101000, %01101001, %01101010, %01101011, %01101100, %01101101, %01101110, %01101111, %01110000, %01110001, %01110010, %01110011, %01110100, %01110101, %01110110, %01110111, %01111000, %01111001, %01111010, %01111011, %01111100, %01111101, %01111110, %01111111, %10000000, %10000001, %10000010, %10000011, %10000100, %10000101, %10000110, %10000111, %10001000, %10001001, %10001010, %10001011, %10001100, %10001101, %10001110, %10001111, %10010000, %10010001, %10010010, %10010011, %10010100, %10010101, %10010110, %10010111, %10011000, %10011001, %10011010, %10011011, %10011100, %10011101, %10011110, %10011111, %10100000, %10100001, %10100010, %10100011, %10100100, %10100101, %10100110, %10100111, %10101000, %10101001, %10101010, %10101011, %10101100, %10101101, %10101110, %10101111, %10110000, %10110001, %10110010, %10110011, %10110100, %10110101, %10110110, %10110111, %10111000, %10111001, %10111010, %10111011, %10111100, %10111101, %10111110, %10111111, %11000000, %11000001, %11000010, %11000011, %11000100, %11000101, %11000110, %11000111, %11001000, %11001001, %11001010, %11001011, %11001100, %11001101, %11001110, %11001111, %11010000, %11010001, %11010010, %11010011, %11010100, %11010101, %11010110, %11010111, %11011000, %11011001, %11011010, %11011011, %11011100, %11011101, %11011110, %11011111, %11100000, %11100001, %11100010, %11100011, %11100100, %11100101, %11100110, %11100111, %11101000, %11101001, %11101010, %11101011, %11101100, %11101101, %11101110, %11101111, %11110000, %11110001, %11110010, %11110011, %11110100, %11110101, %11110110, %11110111, %11111000, %11111001, %11111010, %11111011, %11111100, %11111101, %11111110, %11111111
ORA_0_TAB_HI !BYTE %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
ORA_1_TAB_LO !BYTE %00000000, %00000000, %00000000, %00000000, %00000001, %00000001, %00000001, %00000001, %00000010, %00000010, %00000010, %00000010, %00000011, %00000011, %00000011, %00000011, %00000100, %00000100, %00000100, %00000100, %00000101, %00000101, %00000101, %00000101, %00000110, %00000110, %00000110, %00000110, %00000111, %00000111, %00000111, %00000111, %00001000, %00001000, %00001000, %00001000, %00001001, %00001001, %00001001, %00001001, %00001010, %00001010, %00001010, %00001010, %00001011, %00001011, %00001011, %00001011, %00001100, %00001100, %00001100, %00001100, %00001101, %00001101, %00001101, %00001101, %00001110, %00001110, %00001110, %00001110, %00001111, %00001111, %00001111, %00001111, %00010000, %00010000, %00010000, %00010000, %00010001, %00010001, %00010001, %00010001, %00010010, %00010010, %00010010, %00010010, %00010011, %00010011, %00010011, %00010011, %00010100, %00010100, %00010100, %00010100, %00010101, %00010101, %00010101, %00010101, %00010110, %00010110, %00010110, %00010110, %00010111, %00010111, %00010111, %00010111, %00011000, %00011000, %00011000, %00011000, %00011001, %00011001, %00011001, %00011001, %00011010, %00011010, %00011010, %00011010, %00011011, %00011011, %00011011, %00011011, %00011100, %00011100, %00011100, %00011100, %00011101, %00011101, %00011101, %00011101, %00011110, %00011110, %00011110, %00011110, %00011111, %00011111, %00011111, %00011111, %00100000, %00100000, %00100000, %00100000, %00100001, %00100001, %00100001, %00100001, %00100010, %00100010, %00100010, %00100010, %00100011, %00100011, %00100011, %00100011, %00100100, %00100100, %00100100, %00100100, %00100101, %00100101, %00100101, %00100101, %00100110, %00100110, %00100110, %00100110, %00100111, %00100111, %00100111, %00100111, %00101000, %00101000, %00101000, %00101000, %00101001, %00101001, %00101001, %00101001, %00101010, %00101010, %00101010, %00101010, %00101011, %00101011, %00101011, %00101011, %00101100, %00101100, %00101100, %00101100, %00101101, %00101101, %00101101, %00101101, %00101110, %00101110, %00101110, %00101110, %00101111, %00101111, %00101111, %00101111, %00110000, %00110000, %00110000, %00110000, %00110001, %00110001, %00110001, %00110001, %00110010, %00110010, %00110010, %00110010, %00110011, %00110011, %00110011, %00110011, %00110100, %00110100, %00110100, %00110100, %00110101, %00110101, %00110101, %00110101, %00110110, %00110110, %00110110, %00110110, %00110111, %00110111, %00110111, %00110111, %00111000, %00111000, %00111000, %00111000, %00111001, %00111001, %00111001, %00111001, %00111010, %00111010, %00111010, %00111010, %00111011, %00111011, %00111011, %00111011, %00111100, %00111100, %00111100, %00111100, %00111101, %00111101, %00111101, %00111101, %00111110, %00111110, %00111110, %00111110, %00111111, %00111111, %00111111, %00111111
ORA_1_TAB_HI !BYTE %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000, %00000000, %01000000, %10000000, %11000000
ORA_2_TAB_LO !BYTE %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000100, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000101, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000110, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00000111, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001000, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001001, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001010, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001011, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001100, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001101, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001110, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111, %00001111
ORA_2_TAB_HI !BYTE %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000, %00000000, %00010000, %00100000, %00110000, %01000000, %01010000, %01100000, %01110000, %10000000, %10010000, %10100000, %10110000, %11000000, %11010000, %11100000, %11110000
ORA_3_TAB_LO !BYTE %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000001, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000010, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011, %00000011
ORA_3_TAB_HI !BYTE %00000000, %00000100, %00001000, %00001100, %00010000, %00010100, %00011000, %00011100, %00100000, %00100100, %00101000, %00101100, %00110000, %00110100, %00111000, %00111100, %01000000, %01000100, %01001000, %01001100, %01010000, %01010100, %01011000, %01011100, %01100000, %01100100, %01101000, %01101100, %01110000, %01110100, %01111000, %01111100, %10000000, %10000100, %10001000, %10001100, %10010000, %10010100, %10011000, %10011100, %10100000, %10100100, %10101000, %10101100, %10110000, %10110100, %10111000, %10111100, %11000000, %11000100, %11001000, %11001100, %11010000, %11010100, %11011000, %11011100, %11100000, %11100100, %11101000, %11101100, %11110000, %11110100, %11111000, %11111100, %00000000, %00000100, %00001000, %00001100, %00010000, %00010100, %00011000, %00011100, %00100000, %00100100, %00101000, %00101100, %00110000, %00110100, %00111000, %00111100, %01000000, %01000100, %01001000, %01001100, %01010000, %01010100, %01011000, %01011100, %01100000, %01100100, %01101000, %01101100, %01110000, %01110100, %01111000, %01111100, %10000000, %10000100, %10001000, %10001100, %10010000, %10010100, %10011000, %10011100, %10100000, %10100100, %10101000, %10101100, %10110000, %10110100, %10111000, %10111100, %11000000, %11000100, %11001000, %11001100, %11010000, %11010100, %11011000, %11011100, %11100000, %11100100, %11101000, %11101100, %11110000, %11110100, %11111000, %11111100, %00000000, %00000100, %00001000, %00001100, %00010000, %00010100, %00011000, %00011100, %00100000, %00100100, %00101000, %00101100, %00110000, %00110100, %00111000, %00111100, %01000000, %01000100, %01001000, %01001100, %01010000, %01010100, %01011000, %01011100, %01100000, %01100100, %01101000, %01101100, %01110000, %01110100, %01111000, %01111100, %10000000, %10000100, %10001000, %10001100, %10010000, %10010100, %10011000, %10011100, %10100000, %10100100, %10101000, %10101100, %10110000, %10110100, %10111000, %10111100, %11000000, %11000100, %11001000, %11001100, %11010000, %11010100, %11011000, %11011100, %11100000, %11100100, %11101000, %11101100, %11110000, %11110100, %11111000, %11111100, %00000000, %00000100, %00001000, %00001100, %00010000, %00010100, %00011000, %00011100, %00100000, %00100100, %00101000, %00101100, %00110000, %00110100, %00111000, %00111100, %01000000, %01000100, %01001000, %01001100, %01010000, %01010100, %01011000, %01011100, %01100000, %01100100, %01101000, %01101100, %01110000, %01110100, %01111000, %01111100, %10000000, %10000100, %10001000, %10001100, %10010000, %10010100, %10011000, %10011100, %10100000, %10100100, %10101000, %10101100, %10110000, %10110100, %10111000, %10111100, %11000000, %11000100, %11001000, %11001100, %11010000, %11010100, %11011000, %11011100, %11100000, %11100100, %11101000, %11101100, %11110000, %11110100, %11111000, %11111100

AND_TAB 
 !BYTE %11111111,%11111100,%11111100,%11111100,%11110011,%11110000,%11110000,%11110000,%11110011,%11110000,%11110000,%11110000,%11110011,%11110000,%11110000,%11110000
 !BYTE %11001111,%11001100,%11001100,%11001100,%11000011,%11000000,%11000000,%11000000,%11000011,%11000000,%11000000,%11000000,%11000011,%11000000,%11000000,%11000000
 !BYTE %11001111,%11001100,%11001100,%11001100,%11000011,%11000000,%11000000,%11000000,%11000011,%11000000,%11000000,%11000000,%11000011,%11000000,%11000000,%11000000
 !BYTE %11001111,%11001100,%11001100,%11001100,%11000011,%11000000,%11000000,%11000000,%11000011,%11000000,%11000000,%11000000,%11000011,%11000000,%11000000,%11000000
 !BYTE %00111111,%00111100,%00111100,%00111100,%00110011,%00110000,%00110000,%00110000,%00110011,%00110000,%00110000,%00110000,%00110000,%00110000,%00110000,%00110000
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000
 !BYTE %00001111,%00011100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000
 !BYTE %00111111,%00111100,%00111100,%00111100,%00110011,%00110000,%00110000,%00110000,%00110011,%00110000,%00110000,%00110000,%00110011,%00110000,%00110000,%00110000
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000
 !BYTE %00111111,%00111100,%00111100,%00111100,%00110011,%00110000,%00110000,%00110000,%00110011,%00110000,%00110000,%00110000,%00110011,%00110000,%00110000,%00110000
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000 
 !BYTE %00001111,%00001100,%00001100,%00001100,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000,%00000011,%00000000,%00000000,%00000000

