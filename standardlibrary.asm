//-----------------------------------------------------------------
// $VER: VIC-II.varCHIP.I	V1.2	29/12/96
//-----------------------------------------------------------------
.var sprite0x			= $d000
.var sprite0y			= $d001
.var sprite1x			= $d002
.var sprite1y			= $d003
.var sprite2x			= $d004
.var sprite2y			= $d005
.var sprite3x			= $d006
.var sprite3y			= $d007
.var sprite4x			= $d008
.var sprite4y			= $d009
.var sprite5x			= $d00a
.var sprite5y			= $d00b
.var sprite6x			= $d00c
.var sprite6y			= $d00d
.var sprite7x			= $d00e
.var sprite7y			= $d00f
.var spritermsb			= $d010
.var spriteset			= $d015
.var spriteexpy			= $d017		// Expand Y.
.var spritepr			= $d01b		// Priority.
.var spritemulti		= $d01c		// Multicolor mode.
.var spriteexpx			= $d01d		// Expand X.
.var spritesprite		= $d01e		// Sprite to sprite collision.
.var spritechar			= $d01f		// Sprite to character collision.
.var spritemcol0		= $d025		// Multicolor #1.
.var spritemcol1		= $d026		// Multicolor #2.
.var spritecolors		= $d027		// Sprite colors.
.var screenmode			= $d011
.var raster				= $d012		// Raster scan line.
.var penx				= $d013		// Lightpen horizontal position.
.var peny				= $d014		// Lightpen vertical position.
.var smoothpos			= $d016
.var charset			= $d018
.var irqflag			= $d019
.var irqenable			= $d01a
.var border				= $d020
.var screen				= $d021
.var backcol0			= $d022		// Background color 0.
.var backcol1			= $d023		// Background color 1.
.var backcol2			= $d024		// Background color 2.
//-----------------------------------------------------------------
// Kernal Jump Table Calls.
//-----------------------------------------------------------------
.var talk2		= $ff96
.var iec_inp	= $ffa5
.var untalk		= $ffab
.var unlstn		= $ffae
.var listen		= $ffb1
.var talk		= $ffb4
.var setfile	= $ffba
.var chkin		= $ffc6
.var chkout		= $ffc9
.var open		= $ffc0
.var close		= $ffc3
.var clrch		= $ffcc
.var bsin		= $ffcf
.var bsout		= $ffd2
.var get		= $ffe4

//--------------------------------------------------------------------
// macro's
//--------------------------------------------------------------------
.macro SetBorderColor(color) {
					lda #color
					sta $d020
}
.macro SetScreenColor(color) {
					lda #color
					sta $d021
}
.macro SetBoth(color) {
					lda #color
					sta $d020
					sta $d021
}
//--------------------------------------------------------------------
