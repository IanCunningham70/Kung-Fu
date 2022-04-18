						//--------------------------------------------------------------------
                        // use this file to test different depack fx for the bitmaps.
						//--------------------------------------------------------------------
						// import standard library definitions
                        //------------------------------------------------------------------------------
						#import "standardLibrary.asm"			
                        //------------------------------------------------------------------------------
						// define koala images properties
                        //------------------------------------------------------------------------------
						.pc = $2000 "koala backdrop 1.prg"
						.var image01 = LoadBinary ("gfx\koala backdrop 1.kla", BF_KOALA)
						.fill image01.getSize(), image01.get(i)
						.var screen_data = $3f40
						.var colour_data = $4328
						.var back_colour = $4710
						.var screenLoad = $aa
						.var screenSave = screenLoad + 2
						.var colorLoad = screenSave+2
						.var colorSave = colorLoad + 2
                        //------------------------------------------------------------------------------
                        * = $0900 "test code"
start:		
						SetBoth(BLACK)

                        // setup bitmap pointers

						lda #$3b
                        sta screenmode					
						lda #26       
						sta charset        
						lda #$d8        
						sta smoothpos      

						lda #BLACK  // back_colour
						sta screen

                        jsr black_bitmap
						jsr reset_pointers

			!:			ldx line_count
						cpx #10
						beq !+

						jsr plot_bitmap
						inc line_count
						jmp !-

			!:			lda back_colour
						sta $d021

loop:                   jmp loop                        
                        //------------------------------------------------------------------------------



                        //------------------------------------------------------------------------------


                        //------------------------------------------------------------------------------




                        //------------------------------------------------------------------------------
						// plot a single line to the screen, setup next line and exit
                        //------------------------------------------------------------------------------
plot_bitmap:			ldy #$00
			!:			lda (screenLoad),y
						sta (screenSave),y
						lda (colorLoad),y
						sta (colorSave),y 
						iny
						cpy #40
						bne !-

						// move pointers to next line
						lda screenLoad
						clc
						adc #80
						sta screenLoad
						lda screenLoad+1
						adc #$00
						sta screenLoad+1
						lda screenSave
						clc
						adc #80
						sta screenSave
						lda screenSave+1
						adc #$00
						sta screenSave+1

						lda colorLoad
						clc
						adc #80
						sta colorLoad
						lda colorLoad+1
						adc #$00
						sta colorLoad+1
						lda colorSave
						clc
						adc #80
						sta colorSave
						lda colorSave+1
						adc #$00
						sta colorSave+1

						rts
                        //------------------------------------------------------------------------------
						// reset all zero-page pointers back to default values
                        //------------------------------------------------------------------------------
reset_pointers:			ldx #<screen_data
						ldy #>screen_data
						stx screenLoad
						sty screenLoad+1
						ldx #<1024
						ldy #>1024
						stx screenSave
						sty screenSave+1

						ldx #<colour_data
						ldy #>colour_data
						stx colorLoad
						sty colorLoad+1
						ldx #<$d800
						ldy #>$d800
						stx colorSave
						sty colorSave+1
						lda #$00
						sta line_count
						rts
                        //------------------------------------------------------------------------------
						// black out the whole screen, character and color data.
                        //------------------------------------------------------------------------------
black_bitmap:			ldx #00
						txa
				!:		sta $0400,x
						sta $0500,x
						sta $0600,x
						sta $0700,x
						sta $d800,x
						sta $d900,x
						sta $da00,x
						sta $db00,x
						dex
						bne !-
						rts
                        //------------------------------------------------------------------------------



                        //------------------------------------------------------------------------------
line_count:				.byte $00,$00
                        //------------------------------------------------------------------------------
