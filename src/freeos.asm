include 'include/ez80.inc'
include 'include/tiformat.inc'
format ti executable 'FREEOS'
include 'include/os.inc'
include 'include/defines.inc'

;-------------------------------------------------------------------------------
	os_create
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
	os_rom
;-------------------------------------------------------------------------------

table:
	jp	handle_boot
	jp	handle_int
	jp	handle_rst10
	jp	handle_rst18
	jp	handle_rst20
	jp	handle_rst28
	jp	handle_rst30

include 'code.asm'
include 'data.asm'
