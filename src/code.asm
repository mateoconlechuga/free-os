;-------------------------------------------------------------------------------
handle_boot:
	call	setup
	call	draw
	
handle_int:
.trap:
	jr	.trap

handle_rst10:
handle_rst18:
handle_rst20:
handle_rst28:
handle_rst30:
	jp	$3ac

;-------------------------------------------------------------------------------
setup:
; setup common items
	ld	a,$27
	ld	(LCD_CTRL),a
	ld	hl,_pal
	ld	de,LCD_PAL
	ld	bc,_pal_size
	ldir
	ret

;-------------------------------------------------------------------------------
draw:
; draw the image to the screen
	ld	ix,0
	lea	bc,ix
	ld	de,LCD_VRAM + (_image_width / 2)
	ld	a,_image_height
	ld	hl,_image
.loop:
	ld	c,_image_width
	add	ix,de
	lea	de,ix
	ldir
	ld	de,LCD_WIDTH
	dec	a
	jr	nz,.loop
	ret
