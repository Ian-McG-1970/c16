; todo - how to draw landscape?
; todo - how to draw 16x8?
; todo - how to draw 1x1 bullets?

* = $1001

SCR_ADR     = 3*1024
SCR_COL_ADR = 2*1024
CHAR_SET_ADR = 14*1024
MAP_ADDR = 11 * 1024

SCN = 2
SRC = SCN +2
DST = SRC +2
MEM_SIZE = DST +2

REGA = MEM_SIZE +2
REGX = REGA +1
REGY = REGX +1
STACK = REGY +1
PLAYER_H = STACK +1
PLAYER_V = PLAYER_H +2

SPR_CNT = PLAYER_V +1

SN_V0H0LO = SPR_CNT +1
SN_V0H0HI = SN_V0H0LO +1
SN_V1H0LO = SN_V0H0HI +1
SN_V1H0HI = SN_V1H0LO +1

VPIX = SN_V1H0HI +1
HPIX = VPIX +1
MAP_PIXEL = HPIX +1
MAP_CHAR = MAP_PIXEL +1

MAP_LINE_ZP_0 = 32
MAP_LINE_ZP_1 = MAP_LINE_ZP_0 +2
MAP_LINE_ZP_2 = MAP_LINE_ZP_1 +2
MAP_LINE_ZP_3 = MAP_LINE_ZP_2 +2
MAP_LINE_ZP_4 = MAP_LINE_ZP_3 +2
MAP_LINE_ZP_5 = MAP_LINE_ZP_4 +2
MAP_LINE_ZP_6 = MAP_LINE_ZP_5 +2
MAP_LINE_ZP_7 = MAP_LINE_ZP_6 +2
MAP_LINE_ZP_8 = MAP_LINE_ZP_7 +2

TED_HOR_38_40_COL_FF07 = $FF07

TED_SCR_BDR_FF19 = $FF19
TED_SCR_COL0_FF15 = $FF15
TED_SCR_COL1_FF16 = $FF16
TED_SCR_COL2_FF17 = $FF17

TED_RASTER_LINE_FF08 = $FF0B
TED_INT_FFFE = $FFFE
TED_SCR_ADR_FF14 = $FF14
TED_CHARSET_ADR_FF13 = $FF13
TED_CHARSET_ROM_FF12 = $FF12

TED_IRQEN_FF0A = $FF0A

INT_RASTER_POS = 190;206-6

!ZONE SET_SCN_LINE_ADDR_ZP
!MACRO SET_SCN_LINE_ADDR_ZP SCN_LINE_ADDR, ZP_ADDR {
  LDA #<SCN_LINE_ADDR
  STA ZP_ADDR
  LDA #>SCN_LINE_ADDR
  STA ZP_ADDR +1
}

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

      LDA TED_IRQEN_FF0A
      AND #$FE
      STA TED_IRQEN_FF0A

      LDA #SCR_COL_ADR >>8 ; ((address /1024) *4) / colour addr = (ptr) / screen addr = (ptr +1024)
      STA TED_SCR_ADR_FF14
      LDA #CHAR_SET_ADR >>8
      STA TED_CHARSET_ADR_FF13

      LDA TED_CHARSET_ROM_FF12
      AND #%11111011 ; switch charset lookup from ROM to RAM
      STA TED_CHARSET_ROM_FF12

      LDA TED_HOR_38_40_COL_FF07
      AND #%11110111
      ORA #%10010000 ; FULL 256 CHARS + MCM +38COL
      STA TED_HOR_38_40_COL_FF07

      LDA #0;6
      STA TED_SCR_COL0_FF15 ; Background color. Works/used in every video mode.
      LDA #9
      STA TED_SCR_COL1_FF16 ; Multicolor/Extended color #1. Works/used in multicolor and ECM modes, see $FF07 and $FF06.
      LDA #4
      STA TED_SCR_COL2_FF17 ; Multicolor/Extended color #2. Works/used in multicolor and ECM modes, see $FF07 and $FF06.
;      STA $FF18 ; Extended color #3. Works/used in ECM mode only, see $FF06.
      LDA #0
      STA TED_SCR_BDR_FF19 ; Border color. Works/used in every video mode. When the screen is turned off, (see $FF06), the whole screen is this color.

 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(14*40), MAP_LINE_ZP_0
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(15*40), MAP_LINE_ZP_1
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(16*40), MAP_LINE_ZP_2
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(17*40), MAP_LINE_ZP_3
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(18*40), MAP_LINE_ZP_4
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(19*40), MAP_LINE_ZP_5
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(20*40), MAP_LINE_ZP_6
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(21*40), MAP_LINE_ZP_7
 +SET_SCN_LINE_ADDR_ZP SCR_ADR+(22*40), MAP_LINE_ZP_8

 
 LDA #13;11 ; colour 11
 LDX #<SCR_COL_ADR
 LDY #>SCR_COL_ADR
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

  LDA #50
  STA PLAYER_H
  LDX #0
  STX PLAYER_H +1
  STA PLAYER_V
  
  LDA #8;9 ;2; 7 ; 1; 7 ; 0 ; -1
  STA SPR_CNT

  LDA #0
  LDX #0
  JSR DRAW_LANDSCAPE
  
      CLI
      
MLOOP JMP MLOOP
    
!ZONE IRQ
IRQ:  STA .REGA +1
      STX .REGX +1
      STY .REGY +1

      LDA $FF09 ; clear interrupt bit
      STA $FF09

; DEC BORDER
;  JSR JOYSTICK1
;  JSR MOVE_PLAYER ; move sprite
; INC BORDER
 INC TED_SCR_BDR_FF19
 JSR CLEAR_LANDSCAPE
 DEC TED_SCR_BDR_FF19
  
 DEC TED_SCR_BDR_FF19
 JSR CLEAR_SPRITES
 INC TED_SCR_BDR_FF19

  LDX PLAYER_V
  LDY PLAYER_H
  STX SPR_PXL_V
  STY SPR_PXL_H
 
 JSR JOYSTICK1
 JSR MOVE_PLR
 JSR CALC_LANDSCAPE_CHAR_PIXEL

 INC TED_SCR_BDR_FF19
 LDX MAP_PIXEL
 LDA MAP_CHAR
 JSR DRAW_LANDSCAPE
 DEC TED_SCR_BDR_FF19

 DEC TED_SCR_BDR_FF19
 JSR DRAW_SPRITES 
 INC TED_SCR_BDR_FF19

 lda PLAYER_V
 ldy #0
 jsr HEX8
 lda PLAYER_H
 ldy #4
 jsr HEX8
 lda PLAYER_H +1
 ldy #8
 jsr HEX8
 lda MAP_CHAR
 ldy #12
 jsr HEX8
 lda MAP_PIXEL
 ldy #16
 jsr HEX8

.REGA LDA #0
.REGX LDX #0
.REGY LDY #0

      RTI   ; Return from Interrupt

!ZONE MOVE_PLR
MOVE_PLR  TYA
          CLC
          ADC   PLAYER_V
          STA   PLAYER_V  ; vertical

          TXA
          BEQ   .EXIT
          BMI   .RIGHT

.LEFT     STA   .LFT +1
;          STA TEST1
          LDA   PLAYER_H
          CLC
.LFT      ADC   #0 
          STA   PLAYER_H
          TAX
          LDA   PLAYER_H +1
          ADC   #0
          AND   #3
          STA   PLAYER_H +1
          TAY
          RTS

.RIGHT    EOR   #$FF
          CLC
          ADC   #1    ; carry is clear
          STA   .RGT +1
;          STA TEST2
          SEC
          LDA   PLAYER_H
.RGT      SBC   #0 
          STA   PLAYER_H
          TAX
          LDA   PLAYER_H +1
          SBC   #0
          AND   #3
          STA   PLAYER_H +1
          TAY
          RTS

.EXIT     LDX PLAYER_H
          LDY PLAYER_H +1
          RTS

!ZONE DRAW_LANDSCAPE
DRAW_LANDSCAPE ; X = MAP PIXEL POS / A = MAP CHAR POS START - MAP_POINTER MSB IS 0 - ALLOWS TO TO WRAP AROUND
          LDY MAP_PIXEL_PTR,X ; X=0 or 1 or 2 or 3
          STY .LOOP +2  ; height
          INY
          STY .MAP_CHAR_1 +2       ; char1
          INY
          STY .MAP_CHAR_2 +2       ; char1

          CLC
          ADC #38
          TAX               ; START FROM THE END

          LDY #38
.LOOP       LDA HeightPos_0,X         ; get screen line of char
            STA .SMC_ZP_1 +1        ; draw it this frame
            STA CLEAR_LANDSCAPE_TAB_1,Y ; clear it next frame
; CLC
            ADC #2
            STA .SMC_ZP_2 +1        ; draw it this frame
            STA CLEAR_LANDSCAPE_TAB_2,Y ; clear it next frame
.MAP_CHAR_1 LDA HeightPos_0,X
.SMC_ZP_1 STA (00),Y
.MAP_CHAR_2 LDA HeightPos_0,X
.SMC_ZP_2 STA (00),Y
            DEX
            DEY
            BNE .LOOP
          RTS

!ZONE CLEAR_LANDSCAPE
CLEAR_LANDSCAPE
          LDA #0
          LDY #38
.LOOP       LDX CLEAR_LANDSCAPE_TAB_1,Y           ; get byte of map
            STX .SMC_ZP_1 +1    ; this draws it this frame
            LDX CLEAR_LANDSCAPE_TAB_2,Y           ; get byte of map
            STX .SMC_ZP_2 +1    ; this draws it this frame
.SMC_ZP_1 STA (00),Y
.SMC_ZP_2 STA (00),Y
            DEY
            BNE .LOOP
          RTS

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
  STA SN_V0H0HI 
  LDA SCN_ADR_HI+1,Y
  STA SN_V1H0HI

  LDA SCN_ADR_LO,Y
  STA SN_V0H0LO
  CLC
  ADC #40
  STA SN_V1H0LO

  LDA #0
  LDY SPR_CHR_H,X
  STA (SN_V0H0LO),Y
  STA (SN_V1H0LO),Y

  INY
  STA (SN_V0H0LO),Y
  STA (SN_V1H0LO),Y

  RTS

!ZONE DRAW_SPRITES
DRAW_SPRITES
      LDY SPR_CNT
      BMI .EXIT
.LOOP   JSR DRAW_SPRITE
        DEY
        BPL .LOOP
.EXIT RTS

!ZONE DRAW_SPRITE
DRAW_SPRITE
; y=sprnum (0-12)
 DEC TED_SCR_BDR_FF19

  STY REGX

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
  ORA #32
  STA VPIX
 
  LDA V_CHAR,X
  STA SPR_CHR_V,Y
  TAX

  LDA SCN_ADR_HI,X
  STA SN_V0H0HI
  LDA SCN_ADR_HI+1,X
  STA SN_V1H0HI

  LDA SCN_ADR_LO,X
  STA SN_V0H0LO
  CLC
  ADC #40
  STA SN_V1H0LO

  LAX SPR_PXL_H,Y
  AND #3
  ORA SPR_SHAPE,Y
  STA HPIX

  LDA H_CHAR,X
  STA SPR_CHR_H,Y
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

 LDY HPIX
 LDX SPR_ORA_TAB_HI,Y 
 STX .SPR_ORA_00 +2
 STX .SPR_ORA_01 +2
 STX .SPR_ORA_02 +2
 STX .SPR_ORA_03 +2
 STX .SPR_ORA_04 +2
 STX .SPR_ORA_05 +2
 STX .SPR_ORA_06 +2
 STX .SPR_ORA_07 +2

 LDX SPR_ORA_TAB_LO,Y
 STX .SPR_ORA_00 +1
 INX
 STX .SPR_ORA_01 +1
 INX
 STX .SPR_ORA_02 +1
 INX
 STX .SPR_ORA_03 +1
 INX
 STX .SPR_ORA_04 +1
 INX
 STX .SPR_ORA_05 +1
 INX
 STX .SPR_ORA_06 +1
 INX
 STX .SPR_ORA_07 +1

 LDX #16
 LDY VPIX
 SEC

.LOOP
            LDA (SCN),Y ; Y IS SET BETWEEN 0 AND 7 AND sub 24 each loop ?
.SPR_ORA_00 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_ORA_01 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_ORA_02 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_ORA_03 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_ORA_04 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_ORA_05 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_ORA_06 ORA $ABCD,X
            STA (SCN),Y
            INY

            LDA (SCN),Y
.SPR_ORA_07 ORA $ABCD,X
            STA (SCN),Y

    TYA
    SBC #7+16
    TAY

    LDA #255
    SBX #8
    BPL .LOOP

 INC TED_SCR_BDR_FF19
  
  LDY REGX
  RTS

CALC_LANDSCAPE_CHAR_PIXEL ; convert 0-1023 to 0-3 pixel pos + 0-255 map pos
;  LDA HORSCROLLTAB,X
;  STA MAP_PIXEL
;  LDA MAPTABHI,Y ; (high ??????xx multiplied by 64 to xx??????)
;  ORA MAPTABLO,X ; (low xxxxxx?? divided by 4 to ??xxxxxx) 
;  STA MAPADDR2
;  RTS
;

; convert HHHHHHHHLLLLLLLL into CCCCCCCCPP
; HHHHHHHHLLLLLLLL
;       CCCCCCCCPP
 TXA
 STA MAP_CHAR
 AND #3
 STA MAP_PIXEL
 TYA
 LSR A
 ROR MAP_CHAR
 LSR A
 ROR MAP_CHAR
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

;!ZONE MOVE_PLAYER
;MOVE_PLAYER TXA
;            BEQ   .VER
;            BPL   .RIGHT
;.LEFT         DEC   PLAYER_H
;              JMP   .VER
;.RIGHT      INC   PLAYER_H
;.VER        TYA
;            BEQ   .EXIT
;            BPL   .DOWN
;.UP           DEC   PLAYER_V
;              RTS
;.DOWN       INC   PLAYER_V
;.EXIT       RTS

HEX8      ; A=VAL Y=POS
        LDX SCN_ADR_LO
        STX SCN
        LDX SCN_ADR_HI
        STX SCN +1
        TAX
        LSR
        LSR
        LSR
        LSR
        ORA #16
        STA (SCN),Y
        INY
        TXA
        AND #15
        ORA #16
        STA (SCN),Y
        RTS

MAP_HEIGHT_TAB
!for I = 0 TO 31
  !BYTE (0*2)+32,(1*2)+32,(2*2)+32,(3*2)+32,(4*2)+32,(5*2)+32,(6*2)+32,(7*2)+32 ; TODO - CALCULATE
!end

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

CLEAR_LANDSCAPE_TAB_1
  !FILL 40,0
CLEAR_LANDSCAPE_TAB_2
  !FILL 40,0

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

SPR_ORA_TAB_LO  !BYTE <SPR_ORA_000_00,<SPR_ORA_000_01,<SPR_ORA_000_02,<SPR_ORA_000_03
                !BYTE <SPR_ORA_001_00,<SPR_ORA_001_01,<SPR_ORA_001_02,<SPR_ORA_001_03
                !BYTE <SPR_ORA_002_00,<SPR_ORA_002_01,<SPR_ORA_002_02,<SPR_ORA_002_03

SPR_ORA_TAB_HI  !BYTE >SPR_ORA_000_00,>SPR_ORA_000_01,>SPR_ORA_000_02,>SPR_ORA_000_03
                !BYTE >SPR_ORA_001_00,>SPR_ORA_001_01,>SPR_ORA_001_02,>SPR_ORA_001_03
                !BYTE >SPR_ORA_002_00,>SPR_ORA_002_01,>SPR_ORA_002_02,>SPR_ORA_002_03

SCN_ADR_HI
!for I = 0 TO 24
!BYTE >(SCR_ADR+(I*40))
!end

SCN_ADR_LO
!for I = 0 TO 24
!BYTE <(SCR_ADR+(I*40))
!end

SPR_PXL_V !BYTE 35,100,3,180,50,100,10,20,30,40.50,60 ; pixel pos
SPR_PXL_H !BYTE 45,100,3,154,70,50,50,40,30,20,10,60
SPR_CHR   !BYTE 242,238,234,230,218,214,210,206,202,198,196,192 ; one of these crosses page boundary?
SPR_SHAPE !BYTE 0,4,8,0,4,8,0,4,8,0,4,8
SPR_CHR_V !BYTE 0,0,0,0,0,0,0,0,0,0,0,0 ; char pos
SPR_CHR_H !BYTE 0,0,0,0,0,0,0,0,0,0,0,0

!align 15,0
SPR_ORA_000_00:
  !BYTE %11111111
  !BYTE %11111111
  !BYTE %11111111
  !BYTE %11111111
  !BYTE %11111111
  !BYTE %11111111
  !BYTE %11111111
  !BYTE %11111111

  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000

SPR_ORA_000_01:
  !BYTE %00111111
  !BYTE %00111111
  !BYTE %00111111
  !BYTE %00111111
  !BYTE %00111111
  !BYTE %00111111
  !BYTE %00111111
  !BYTE %00111111

  !BYTE %11000000
  !BYTE %11000000
  !BYTE %11000000
  !BYTE %11000000
  !BYTE %11000000
  !BYTE %11000000
  !BYTE %11000000
  !BYTE %11000000

SPR_ORA_000_02:
  !BYTE %00001111
  !BYTE %00001111
  !BYTE %00001111
  !BYTE %00001111
  !BYTE %00001111
  !BYTE %00001111
  !BYTE %00001111
  !BYTE %00001111

  !BYTE %11110000
  !BYTE %11110000
  !BYTE %11110000
  !BYTE %11110000
  !BYTE %11110000
  !BYTE %11110000
  !BYTE %11110000
  !BYTE %11110000

SPR_ORA_000_03:
  !BYTE %00000011
  !BYTE %00000011
  !BYTE %00000011
  !BYTE %00000011
  !BYTE %00000011
  !BYTE %00000011
  !BYTE %00000011
  !BYTE %00000011

  !BYTE %11111100
  !BYTE %11111100
  !BYTE %11111100
  !BYTE %11111100
  !BYTE %11111100
  !BYTE %11111100
  !BYTE %11111100
  !BYTE %11111100

SPR_ORA_001_00:
  !BYTE %01010101
  !BYTE %01010101
  !BYTE %01010101
  !BYTE %01010101
  !BYTE %01010101
  !BYTE %01010101
  !BYTE %01010101
  !BYTE %01010101

  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000

SPR_ORA_001_01:
  !BYTE %00010101
  !BYTE %00010101
  !BYTE %00010101
  !BYTE %00010101
  !BYTE %00010101
  !BYTE %00010101
  !BYTE %00010101
  !BYTE %00010101
  !BYTE %01000000
  !BYTE %01000000
  !BYTE %01000000
  !BYTE %01000000
  !BYTE %01000000
  !BYTE %01000000
  !BYTE %01000000
  !BYTE %01000000

SPR_ORA_001_02:
  !BYTE %00000101
  !BYTE %00000101
  !BYTE %00000101
  !BYTE %00000101
  !BYTE %00000101
  !BYTE %00000101
  !BYTE %00000101
  !BYTE %00000101
  !BYTE %01010000
  !BYTE %01010000
  !BYTE %01010000
  !BYTE %01010000
  !BYTE %01010000
  !BYTE %01010000
  !BYTE %01010000
  !BYTE %01010000

SPR_ORA_001_03:
  !BYTE %00000001
  !BYTE %00000001
  !BYTE %00000001
  !BYTE %00000001
  !BYTE %00000001
  !BYTE %00000001
  !BYTE %00000001
  !BYTE %00000001

  !BYTE %01010100
  !BYTE %01010100
  !BYTE %01010100
  !BYTE %01010100
  !BYTE %01010100
  !BYTE %01010100
  !BYTE %01010100
  !BYTE %01010100

SPR_ORA_002_00:
  !BYTE %10101010
  !BYTE %10101010
  !BYTE %10101010
  !BYTE %10101010
  !BYTE %10101010
  !BYTE %10101010
  !BYTE %10101010
  !BYTE %10101010

  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000
  !BYTE %00000000

SPR_ORA_002_01:
  !BYTE %00101010
  !BYTE %00101010
  !BYTE %00101010
  !BYTE %00101010
  !BYTE %00101010
  !BYTE %00101010
  !BYTE %00101010
  !BYTE %00101010

  !BYTE %10000000
  !BYTE %10000000
  !BYTE %10000000
  !BYTE %10000000
  !BYTE %10000000
  !BYTE %10000000
  !BYTE %10000000
  !BYTE %10000000

SPR_ORA_002_02:
!BYTE %00001010
!BYTE %00001010
!BYTE %00001010
!BYTE %00001010
!BYTE %00001010
!BYTE %00001010
!BYTE %00001010
!BYTE %00001010

!BYTE %10100000
!BYTE %10100000
!BYTE %10100000
!BYTE %10100000
!BYTE %10100000
!BYTE %10100000
!BYTE %10100000
!BYTE %10100000

SPR_ORA_002_03:
!BYTE %00000010
!BYTE %00000010
!BYTE %00000010
!BYTE %00000010
!BYTE %00000010
!BYTE %00000010
!BYTE %00000010
!BYTE %00000010

!BYTE %10101000
!BYTE %10101000
!BYTE %10101000
!BYTE %10101000
!BYTE %10101000
!BYTE %10101000
!BYTE %10101000
!BYTE %10101000

MAP_PIXEL_PTR !BYTE >HeightPos_0,>HeightPos_1,>HeightPos_2,>HeightPos_3

      * = MAP_ADDR

HeightPos_0
 !BYTE  40, 40, 42, 42, 44, 44, 46, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 40, 38, 38, 40, 40, 42, 42, 40, 40, 38, 38, 36, 36, 38, 38, 36, 36, 34, 34, 36, 36, 38, 38, 36, 36, 34, 34, 32, 32, 34, 34, 34, 34, 32, 32, 32, 32, 34, 34, 32, 32, 34, 34, 34, 34, 34, 34, 36, 36, 38, 38, 38, 38, 38, 38, 40, 40, 42, 42, 42, 42, 44, 44, 44, 44, 46, 46, 46, 46, 44, 44, 46, 46, 44, 44, 44, 44, 44, 44, 42, 42, 40, 40, 40, 40, 40, 40, 38, 38, 36, 36, 38, 38, 38, 38, 38, 38, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 34, 34, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 40, 38, 38, 38, 38, 40, 40, 42, 42, 40, 40, 42, 42, 40, 40, 38, 38, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 46, 44, 44, 44, 44, 44, 44, 42, 42, 42, 42, 42, 42, 40, 40, 40, 40, 42, 42, 40, 40, 38, 38, 36, 36, 38, 38, 40, 40, 38, 38, 36, 36, 36, 36, 38, 38, 36, 36, 38, 38
 !BYTE  32, 33, 32, 33, 32, 33, 32, 33, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 32, 33, 32, 33, 32, 33, 32, 33, 32, 35, 34, 33, 32, 33, 32, 35, 34, 35, 34, 35, 34, 33, 32, 35, 34, 35, 34, 33, 32, 33, 32, 35, 34, 35, 34, 35, 34, 33, 32, 33, 34, 35, 34, 35, 32, 33, 32, 35, 34, 33, 32, 33, 34, 35, 32, 33, 32, 33, 32, 33, 34, 35, 32, 33, 32, 33, 32, 33, 34, 33, 32, 33, 34, 33, 32, 33, 34, 35, 34, 33, 32, 35, 34, 35, 32, 33, 34, 35, 34, 35, 34, 35, 32, 33, 34, 35, 34, 35, 34, 33, 32, 33, 34, 35, 32, 33, 32, 35, 34, 35, 34, 35, 34, 35, 34, 35, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 34, 35, 32, 33, 32, 35, 34, 35, 32, 33, 32, 33, 32, 33, 32, 33, 32, 35, 34, 35, 32, 33, 32, 33, 32, 35, 34, 33, 32, 35, 34, 35, 34, 35, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 34, 35, 34, 35, 32, 33, 34, 35, 34, 35, 32, 33, 34, 35, 34, 35, 32, 33, 32, 35, 34, 35, 34, 35, 34, 33, 32, 33, 32, 35, 34, 35, 34, 35, 32, 33, 32, 35, 34, 33, 32, 33
 !BYTE   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
HeightPos_1
 !BYTE  40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 38, 38, 38, 40, 40, 42, 40, 40, 38, 38, 36, 36, 36, 38, 36, 36, 34, 34, 34, 36, 36, 38, 36, 36, 34, 34, 32, 32, 32, 34, 34, 34, 32, 32, 32, 32, 32, 34, 32, 32, 32, 34, 34, 34, 34, 34, 34, 36, 36, 38, 38, 38, 38, 38, 38, 40, 40, 42, 42, 42, 42, 44, 44, 44, 44, 46, 46, 46, 44, 44, 44, 46, 44, 44, 44, 44, 44, 44, 42, 42, 40, 40, 40, 40, 40, 40, 38, 38, 36, 36, 36, 38, 38, 38, 38, 38, 38, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 38, 38, 38, 38, 38, 40, 40, 42, 40, 40, 40, 42, 40, 40, 38, 38, 38, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 44, 44, 44, 44, 42, 42, 42, 42, 42, 42, 40, 40, 40, 40, 40, 42, 40, 40, 38, 38, 36, 36, 36, 38, 38, 40, 38, 38, 36, 36, 36, 36, 36, 38, 36, 36, 36, 38, 38
 !BYTE  36, 37, 36, 37, 36, 37, 36, 39, 40, 41, 40, 41, 40, 41, 40, 41, 40, 41, 40, 41, 40, 41, 40, 43, 36, 37, 36, 37, 36, 37, 36, 37, 44, 41, 45, 37, 36, 37, 44, 41, 40, 41, 40, 41, 45, 37, 44, 41, 40, 41, 45, 37, 36, 37, 44, 41, 40, 41, 40, 41, 45, 37, 36, 39, 40, 41, 40, 43, 36, 37, 44, 41, 45, 37, 36, 39, 40, 43, 36, 37, 36, 37, 36, 39, 40, 43, 36, 37, 36, 37, 36, 39, 45, 37, 36, 39, 45, 37, 36, 39, 40, 41, 45, 37, 44, 41, 40, 43, 36, 39, 40, 41, 40, 41, 40, 43, 36, 39, 40, 41, 40, 41, 45, 37, 36, 39, 40, 43, 36, 37, 44, 41, 40, 41, 40, 41, 40, 41, 40, 43, 36, 37, 36, 37, 36, 37, 36, 37, 36, 37, 36, 37, 36, 37, 36, 39, 40, 41, 40, 41, 40, 41, 40, 41, 40, 41, 40, 41, 40, 41, 40, 43, 36, 37, 44, 41, 40, 43, 36, 37, 36, 37, 36, 37, 36, 37, 44, 41, 40, 43, 36, 37, 36, 37, 44, 41, 45, 37, 44, 41, 40, 41, 40, 43, 36, 37, 36, 37, 36, 37, 36, 37, 36, 39, 40, 41, 40, 43, 36, 39, 40, 41, 40, 43, 36, 39, 40, 41, 40, 43, 36, 37, 44, 41, 40, 41, 40, 41, 45, 37, 36, 37, 44, 41, 40, 41, 40, 43, 36, 37, 44, 41, 45, 37, 36, 37
 !BYTE   0, 38,  0, 38,  0, 38,  0,  0,  0, 42,  0, 42,  0, 42,  0, 42,  0, 42,  0, 42,  0, 42,  0,  0,  0, 38,  0, 38,  0, 38,  0, 38,  0, 42,  0, 38,  0, 38,  0, 42,  0, 42,  0, 42,  0, 38,  0, 42,  0, 42,  0, 38,  0, 38,  0, 42,  0, 42,  0, 42,  0, 38,  0,  0,  0, 42,  0,  0,  0, 38,  0, 42,  0, 38,  0,  0,  0,  0,  0, 38,  0, 38,  0,  0,  0,  0,  0, 38,  0, 38,  0,  0,  0, 38,  0,  0,  0, 38,  0,  0,  0, 42,  0, 38,  0, 42,  0,  0,  0,  0,  0, 42,  0, 42,  0,  0,  0,  0,  0, 42,  0, 42,  0, 38,  0,  0,  0,  0,  0, 38,  0, 42,  0, 42,  0, 42,  0, 42,  0,  0,  0, 38,  0, 38,  0, 38,  0, 38,  0, 38,  0, 38,  0, 38,  0,  0,  0, 42,  0, 42,  0, 42,  0, 42,  0, 42,  0, 42,  0, 42,  0,  0,  0, 38,  0, 42,  0,  0,  0, 38,  0, 38,  0, 38,  0, 38,  0, 42,  0,  0,  0, 38,  0, 38,  0, 42,  0, 38,  0, 42,  0, 42,  0,  0,  0, 38,  0, 38,  0, 38,  0, 38,  0,  0,  0, 42,  0,  0,  0,  0,  0, 42,  0,  0,  0,  0,  0, 42,  0,  0,  0, 38,  0, 42,  0, 42,  0, 42,  0, 38,  0, 38,  0, 42,  0, 42,  0,  0,  0, 38,  0, 42,  0, 38,  0, 38
HeightPos_2
 !BYTE  40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 38, 38, 38, 40, 40, 42, 40, 40, 38, 38, 36, 36, 36, 38, 36, 36, 34, 34, 34, 36, 36, 38, 36, 36, 34, 34, 32, 32, 32, 34, 34, 34, 32, 32, 32, 32, 32, 34, 32, 32, 32, 34, 34, 34, 34, 34, 34, 36, 36, 38, 38, 38, 38, 38, 38, 40, 40, 42, 42, 42, 42, 44, 44, 44, 44, 46, 46, 46, 44, 44, 44, 46, 44, 44, 44, 44, 44, 44, 42, 42, 40, 40, 40, 40, 40, 40, 38, 38, 36, 36, 36, 38, 38, 38, 38, 38, 38, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 38, 38, 38, 38, 38, 40, 40, 42, 40, 40, 40, 42, 40, 40, 38, 38, 38, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 44, 44, 44, 44, 42, 42, 42, 42, 42, 42, 40, 40, 40, 40, 40, 42, 40, 40, 38, 38, 36, 36, 36, 38, 38, 40, 38, 38, 36, 36, 36, 36, 36, 38, 36, 36, 36, 38, 38
 !BYTE  46, 47, 46, 47, 46, 47, 46, 49, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 53, 46, 47, 46, 47, 46, 47, 46, 47, 54, 51, 55, 47, 46, 47, 54, 51, 50, 51, 50, 51, 55, 47, 54, 51, 50, 51, 55, 47, 46, 47, 54, 51, 50, 51, 50, 51, 55, 47, 46, 49, 50, 51, 50, 53, 46, 47, 54, 51, 55, 47, 46, 49, 50, 53, 46, 47, 46, 47, 46, 49, 50, 53, 46, 47, 46, 47, 46, 49, 55, 47, 46, 49, 55, 47, 46, 49, 50, 51, 55, 47, 54, 51, 50, 53, 46, 49, 50, 51, 50, 51, 50, 53, 46, 49, 50, 51, 50, 51, 55, 47, 46, 49, 50, 53, 46, 47, 54, 51, 50, 51, 50, 51, 50, 51, 50, 53, 46, 47, 46, 47, 46, 47, 46, 47, 46, 47, 46, 47, 46, 47, 46, 49, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 51, 50, 53, 46, 47, 54, 51, 50, 53, 46, 47, 46, 47, 46, 47, 46, 47, 54, 51, 50, 53, 46, 47, 46, 47, 54, 51, 55, 47, 54, 51, 50, 51, 50, 53, 46, 47, 46, 47, 46, 47, 46, 47, 46, 49, 50, 51, 50, 53, 46, 49, 50, 51, 50, 53, 46, 49, 50, 51, 50, 53, 46, 47, 54, 51, 50, 51, 50, 51, 55, 47, 46, 47, 54, 51, 50, 51, 50, 53, 46, 47, 54, 51, 55, 47, 46, 47
 !BYTE   0, 48,  0, 48,  0, 48,  0,  0,  0, 52,  0, 52,  0, 52,  0, 52,  0, 52,  0, 52,  0, 52,  0,  0,  0, 48,  0, 48,  0, 48,  0, 48,  0, 52,  0, 48,  0, 48,  0, 52,  0, 52,  0, 52,  0, 48,  0, 52,  0, 52,  0, 48,  0, 48,  0, 52,  0, 52,  0, 52,  0, 48,  0,  0,  0, 52,  0,  0,  0, 48,  0, 52,  0, 48,  0,  0,  0,  0,  0, 48,  0, 48,  0,  0,  0,  0,  0, 48,  0, 48,  0,  0,  0, 48,  0,  0,  0, 48,  0,  0,  0, 52,  0, 48,  0, 52,  0,  0,  0,  0,  0, 52,  0, 52,  0,  0,  0,  0,  0, 52,  0, 52,  0, 48,  0,  0,  0,  0,  0, 48,  0, 52,  0, 52,  0, 52,  0, 52,  0,  0,  0, 48,  0, 48,  0, 48,  0, 48,  0, 48,  0, 48,  0, 48,  0,  0,  0, 52,  0, 52,  0, 52,  0, 52,  0, 52,  0, 52,  0, 52,  0,  0,  0, 48,  0, 52,  0,  0,  0, 48,  0, 48,  0, 48,  0, 48,  0, 52,  0,  0,  0, 48,  0, 48,  0, 52,  0, 48,  0, 52,  0, 52,  0,  0,  0, 48,  0, 48,  0, 48,  0, 48,  0,  0,  0, 52,  0,  0,  0,  0,  0, 52,  0,  0,  0,  0,  0, 52,  0,  0,  0, 48,  0, 52,  0, 52,  0, 52,  0, 48,  0, 48,  0, 52,  0, 52,  0,  0,  0, 48,  0, 52,  0, 48,  0, 48
HeightPos_3
 !BYTE  40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 38, 38, 38, 40, 40, 42, 40, 40, 38, 38, 36, 36, 36, 38, 36, 36, 34, 34, 34, 36, 36, 38, 36, 36, 34, 34, 32, 32, 32, 34, 34, 34, 32, 32, 32, 32, 32, 34, 32, 32, 32, 34, 34, 34, 34, 34, 34, 36, 36, 38, 38, 38, 38, 38, 38, 40, 40, 42, 42, 42, 42, 44, 44, 44, 44, 46, 46, 46, 44, 44, 44, 46, 44, 44, 44, 44, 44, 44, 42, 42, 40, 40, 40, 40, 40, 40, 38, 38, 36, 36, 36, 38, 38, 38, 38, 38, 38, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 42, 42, 40, 40, 38, 38, 36, 36, 34, 34, 32, 32, 32, 32, 32, 34, 32, 32, 32, 32, 32, 34, 34, 36, 36, 38, 38, 40, 38, 38, 38, 38, 38, 40, 40, 42, 40, 40, 40, 42, 40, 40, 38, 38, 38, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 46, 44, 44, 44, 44, 44, 44, 42, 42, 42, 42, 42, 42, 40, 40, 40, 40, 40, 42, 40, 40, 38, 38, 36, 36, 36, 38, 38, 40, 38, 38, 36, 36, 36, 36, 36, 38, 36, 36, 36, 38, 38
 !BYTE  56, 57, 56, 57, 56, 57, 56, 59, 60, 61, 60, 61, 60, 61, 60, 61, 60, 61, 60, 61, 60, 61, 60, 63, 56, 57, 56, 57, 56, 57, 56, 57, 64, 61, 65, 57, 56, 57, 64, 61, 60, 61, 60, 61, 65, 57, 64, 61, 60, 61, 65, 57, 56, 57, 64, 61, 60, 61, 60, 61, 65, 57, 56, 59, 60, 61, 60, 63, 56, 57, 64, 61, 65, 57, 56, 59, 60, 63, 56, 57, 56, 57, 56, 59, 60, 63, 56, 57, 56, 57, 56, 59, 65, 57, 56, 59, 65, 57, 56, 59, 60, 61, 65, 57, 64, 61, 60, 63, 56, 59, 60, 61, 60, 61, 60, 63, 56, 59, 60, 61, 60, 61, 65, 57, 56, 59, 60, 63, 56, 57, 64, 61, 60, 61, 60, 61, 60, 61, 60, 63, 56, 57, 56, 57, 56, 57, 56, 57, 56, 57, 56, 57, 56, 57, 56, 59, 60, 61, 60, 61, 60, 61, 60, 61, 60, 61, 60, 61, 60, 61, 60, 63, 56, 57, 64, 61, 60, 63, 56, 57, 56, 57, 56, 57, 56, 57, 64, 61, 60, 63, 56, 57, 56, 57, 64, 61, 65, 57, 64, 61, 60, 61, 60, 63, 56, 57, 56, 57, 56, 57, 56, 57, 56, 59, 60, 61, 60, 63, 56, 59, 60, 61, 60, 63, 56, 59, 60, 61, 60, 63, 56, 57, 64, 61, 60, 61, 60, 61, 65, 57, 56, 57, 64, 61, 60, 61, 60, 63, 56, 57, 64, 61, 65, 57, 56, 57
 !BYTE   0, 58,  0, 58,  0, 58,  0,  0,  0, 62,  0, 62,  0, 62,  0, 62,  0, 62,  0, 62,  0, 62,  0,  0,  0, 58,  0, 58,  0, 58,  0, 58,  0, 62,  0, 58,  0, 58,  0, 62,  0, 62,  0, 62,  0, 58,  0, 62,  0, 62,  0, 58,  0, 58,  0, 62,  0, 62,  0, 62,  0, 58,  0,  0,  0, 62,  0,  0,  0, 58,  0, 62,  0, 58,  0,  0,  0,  0,  0, 58,  0, 58,  0,  0,  0,  0,  0, 58,  0, 58,  0,  0,  0, 58,  0,  0,  0, 58,  0,  0,  0, 62,  0, 58,  0, 62,  0,  0,  0,  0,  0, 62,  0, 62,  0,  0,  0,  0,  0, 62,  0, 62,  0, 58,  0,  0,  0,  0,  0, 58,  0, 62,  0, 62,  0, 62,  0, 62,  0,  0,  0, 58,  0, 58,  0, 58,  0, 58,  0, 58,  0, 58,  0, 58,  0,  0,  0, 62,  0, 62,  0, 62,  0, 62,  0, 62,  0, 62,  0, 62,  0,  0,  0, 58,  0, 62,  0,  0,  0, 58,  0, 58,  0, 58,  0, 58,  0, 62,  0,  0,  0, 58,  0, 58,  0, 62,  0, 58,  0, 62,  0, 62,  0,  0,  0, 58,  0, 58,  0, 58,  0, 58,  0,  0,  0, 62,  0,  0,  0,  0,  0, 62,  0,  0,  0,  0,  0, 62,  0,  0,  0, 58,  0, 62,  0, 62,  0, 62,  0, 58,  0, 58,  0, 62,  0, 62,  0,  0,  0, 58,  0, 62,  0, 58,  0, 58
            
        * = CHAR_SET_ADR 
CHARSET !FILL 8,0 ; 0=space
        !FILL 15*8,255  ; 1-15=spare
        !BYTE %00000000,%11111100,%11001100,%11001100,%11001100,%11111100,%00000000,%11111111 ; 16=0
        !BYTE %00000000,%00110000,%11110000,%00110000,%00110000,%11111100,%00000000,%11111111 ; 17=1
        !BYTE %00000000,%11111100,%00001100,%11111100,%11000000,%11111100,%00000000,%11111111 ; 18=2
        !BYTE %00000000,%11111100,%00001100,%11111100,%00001100,%11111100,%00000000,%11111111 ; 19=3
        !BYTE %00000000,%11001100,%11001100,%11111100,%00001100,%00001100,%00000000,%11111111 ; 20=4
        !BYTE %00000000,%11111100,%11000000,%11111100,%00001100,%11111100,%00000000,%11111111 ; 21=5
        !BYTE %00000000,%11111100,%11000000,%11111100,%11001100,%11111100,%00000000,%11111111 ; 22=6
        !BYTE %00000000,%11111100,%00001100,%00001100,%00001100,%00001100,%00000000,%11111111 ; 23=7
        !BYTE %00000000,%11111100,%11001100,%11111100,%11001100,%11111100,%00000000,%11111111 ; 24=8
        !BYTE %00000000,%11111100,%11001100,%11111100,%00001100,%11111100,%00000000,%11111111 ; 25=9
        !BYTE %00000000,%11111100,%11001100,%11111100,%11001100,%11001100,%00000000,%11111111 ; 26=A
        !BYTE %00000000,%11110000,%11001100,%11110000,%11001100,%11110000,%00000000,%11111111 ; 27=B
        !BYTE %00000000,%11111100,%11000000,%11000000,%11000000,%11111100,%00000000,%11111111 ; 28=C
        !BYTE %00000000,%11110000,%11001100,%11001100,%11001100,%11110000,%00000000,%11111111 ; 29=9
        !BYTE %00000000,%11111100,%11000000,%11111100,%11000000,%11111100,%00000000,%11111111 ; 30=9
        !BYTE %00000000,%11111100,%11000000,%11111100,%11000000,%11000000,%00000000,%11111111 ; 31=9
C16Charset
 !BYTE 192,  48,  12,   3,   0,   0,   0,   0
 !BYTE   0,   0,   0,   0, 192,  48,  12,   3
 !BYTE   0,   0,   0,   0,   3,  12,  48, 192
 !BYTE   3,  12,  48, 192,   0,   0,   0,   0
 !BYTE   0, 192,  48,  12,   3,   0,   0,   0
 !BYTE   0,   0,   0,   0,   0, 192,  48,  12
 !BYTE   3,   0,   0,   0,   0,   0,   0,   0
 !BYTE   0,   0,   0,   0,   0, 192,  48,  15
 !BYTE   0,   0,   0,   3,  12,  48, 192,   0
 !BYTE   0,   0,   0,   0,   0,   0,   0,   3
 !BYTE  12,  48, 192,   0,   0,   0,   0,   0
 !BYTE  15,  48, 192,   0,   0,   0,   0,   0
 !BYTE   0, 192,  48,  15,   0,   0,   0,   0
 !BYTE   0,   0,   0,   0,  15,  48, 192,   0
 !BYTE   0,   0, 192,  48,  12,   3,   0,   0
 !BYTE   0,   0,   0,   0,   0,   0, 192,  48
 !BYTE  12,   3,   0,   0,   0,   0,   0,   0
 !BYTE   0,   0,   0,   0,   0,   0, 195,  60
 !BYTE   0,   0,   3,  12,  48, 192,   0,   0
 !BYTE   0,   0,   0,   0,   0,   0,   3,  12
 !BYTE  48, 192,   0,   0,   0,   0,   0,   0
 !BYTE  60, 195,   0,   0,   0,   0,   0,   0
 !BYTE   0,   0, 195,  60,   0,   0,   0,   0
 !BYTE   0,   0,   0,   0,  60, 195,   0,   0
 !BYTE   0,   0,   0, 192,  48,  12,   3,   0
 !BYTE   0,   0,   0,   0,   0,   0,   0, 192
 !BYTE  48,  12,   3,   0,   0,   0,   0,   0
 !BYTE   0,   0,   0,   0,   0,   3,  12, 240
 !BYTE   0,   3,  12,  48, 192,   0,   0,   0
 !BYTE   0,   0,   0,   0,   0,   3,  12,  48
 !BYTE 192,   0,   0,   0,   0,   0,   0,   0
 !BYTE 240,  12,   3,   0,   0,   0,   0,   0
 !BYTE   0,   3,  12, 240,   0,   0,   0,   0
 !BYTE   0,   0,   0,   0, 240,  12,   3,   0
