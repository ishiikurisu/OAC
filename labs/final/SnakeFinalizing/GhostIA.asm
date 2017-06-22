.eqv parede 0
.eqv fantasma 61
.eqv oo 99999
.eqv pacman 62
.eqv sizeline 40
.eqv sizecolumn 30
.data
INICIO: .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0,62,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,46, 0,
 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,
 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,
 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,
 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0,46,46, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,
 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,
 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,
 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,
 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,
 0,46,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,46, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 AUX: .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0,62,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,46, 0,
 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,
 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,
 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,
 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0,46,46, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,
 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38,38,38, 0,38,38,38, 0,38,38,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,46,46,46,46,46,46,46,46,46,46,46,46,46,46, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,38, 0,
 0,38, 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,38, 0,
 0,38, 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,38, 0,
 0,38, 0,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38, 0,38, 0,
 0,38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,38, 0,
 0,46,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,38,46, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 
GHOSTAUX: .word oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,
oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo,oo

 PACADRESS: .word 0,0,0,0
 
 GHOSTADRESS: .word 0,0,0,0
 
 SCORE: .word 0,0,0,0
 
 HP: .byte 3,3,3,3
 
 MOUTHOPEN: .byte 0,0,0,0
 
 GHOSTOVER: .byte 46,46,46,46
 
 PACMOVES: .byte 0,0,0,0
 
 BUFFTIME: .byte 0,0,0,0
 
 PACCOLOR: .byte 0x3f,0x7c,0xc7,0xf8
 
 GHOSTCOLOR: .byte 0x07,0xc0,0x67,0xe4
 
 REPS: .byte 0
 
 PACAMOUNT: .byte 1
 
 GHOSTAMOUNT: .byte 4
 
 BUFFTURN: .byte 0
.text
#PACTRANSLATE
#a0=ghostpositiontable
#t0=table pointer
#t1=ghostauxpointer
#t2=table byte
#t3=ghostaux byte
#sp=last
#fp=first
#t4=distyet
#t5=stack keeper
#t6=1 if pacmanisfound and 0 if pacman is not found
#t8=pacmanadress

j MAIN

GETGHOSTMOVE:
 addi $sp,$sp,-4
 sw $fp,0($sp)

 li $t0,0
 la $t1,GHOSTAUX
 li $t2,oo
SETAUXOO:
 sw $t2,0($t1)
 addi $t1,$t1,4
 addi $t0,$t0,1
 blt $t0,1200,SETAUXOO
 
 la $t0,GHOSTADRESS
 mul $t1,$a0,4
 add $t1,$t1,$t0
 lw $t0,0($t1)
 la $t1,INICIO
 sub $t2,$t0,$t1
 mul $t2,$t2,4
 la $t1,GHOSTAUX
 add $t1,$t1,$t2
 
 sw $zero,0($t1)
 
 li $t4,0
 li $t6,0
 
 move $fp,$sp
 move $t5,$fp
 
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 
 LOOPIACHECK:
 addi $fp,$fp,-8
 lw $t0,0($fp)
 lw $t1,4($fp)
 lb $t2,0($t0)
 lw $t3,0($t1)
 addi $t7,$t3,1
 
 CHECKDIREITA:
 addi $t0,$t0,1
 addi $t1,$t1,4
 lb $t2,0($t0)
 lw $t3,0($t1)
 beq $t2,parede,DIREITANOTSET
 beq $t2,fantasma,DIREITANOTSET
 bne $t3,oo,DIREITANOTSET
 beq $t6,1,DIREITAPACFOUND
 move $t4,$t7
 DIREITAPACFOUND:
 sw $t7,0($t1)
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 bne $t2,pacman,DIREITANOTAPACMAN
 li $t6,1
 move $t8,$t1
 DIREITANOTAPACMAN:
 DIREITANOTSET:
 addi $t0,$t0,-1
 addi $t1,$t1,-4
 
 CHECKESQUERDA:
 addi $t0,$t0,-1
 addi $t1,$t1,-4
 lb $t2,0($t0)
 lw $t3,0($t1)
 beq $t2,parede,ESQUERDANOTSET
 beq $t2,fantasma,ESQUERDANOTSET
 bne $t3,oo,ESQUERDANOTSET
 beq $t6,1,ESQUERDAPACFOUND
 move $t4,$t7
 ESQUERDAPACFOUND:
 sw $t7,0($t1)
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 bne $t2,pacman,ESQUERDANOTAPACMAN
 li $t6,1
 move $t8,$t1
 ESQUERDANOTAPACMAN:
 ESQUERDANOTSET:
 addi $t0,$t0,1
 addi $t1,$t1,4
 
 CHECKCIMA:
 addi $t0,$t0,-40
 addi $t1,$t1,-160
 lb $t2,0($t0)
 lw $t3,0($t1)
 beq $t2,parede,CIMANOTSET
 beq $t2,fantasma,CIMANOTSET
 bne $t3,oo,CIMANOTSET
 beq $t6,1,CIMAPACFOUND
 move $t4,$t7
 CIMAPACFOUND:
 sw $t7,0($t1)
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 bne $t2,pacman,CIMANOTAPACMAN
 li $t6,1
 move $t8,$t1
 CIMANOTAPACMAN:
 CIMANOTSET:
 addi $t0,$t0,40
 addi $t1,$t1,160
 
 CHECKBAIXO:
 addi $t0,$t0,40
 addi $t1,$t1,160
 lb $t2,0($t0)
 lw $t3,0($t1)
 beq $t2,parede,BAIXONOTSET
 beq $t2,fantasma,BAIXONOTSET
 bne $t3,oo,BAIXONOTSET
 beq $t6,1,BAIXOPACFOUND
 move $t4,$t7
 BAIXOPACFOUND:
 sw $t7,0($t1)
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 bne $t2,pacman,BAIXONOTAPACMAN
 li $t6,1
 move $t8,$t1
 BAIXONOTAPACMAN:
 BAIXONOTSET:
 addi $t0,$t0,-40
 addi $t1,$t1,-160
 
 beq $fp,$sp,LOOPIADONE
 beq $t6,0,LOOPIACHECK
 addi $fp,$fp,-8
 lw $t1,4($fp)
 addi $fp,$fp,8
 lw $t3,0($t1)
 beq $t3,$t4,LOOPIACHECK
 LOOPIADONE:
 move $sp,$t5
 
 move $t1,$t8
 li $v0,0
 beqz $t6,GOTMOVE
 MOVELOOP:
 lw $t3,0($t1)
 beq $t3,0,GOTMOVE
 
 addi $t0,$t1,4
 lw $t2,0($t0)
 addi $t2,$t2,1
 bne $t3,$t2,IAMOVENOTDIREITA
 addi $t1,$t1,4
 li $v0,97
 j MOVELOOP
 IAMOVENOTDIREITA:
 addi $t0,$t1,-4
 lw $t2,0($t0)
 addi $t2,$t2,1
 bne $t3,$t2,IAMOVENOTESQUERDA
 addi $t1,$t1,-4
 li $v0,100
 j MOVELOOP
 IAMOVENOTESQUERDA:
 addi $t0,$t1,160
 lw $t2,0($t0)
 addi $t2,$t2,1
 bne $t3,$t2,IAMOVENOTBAIXO
 addi $t1,$t1,160
 li $v0,119
 j MOVELOOP
 IAMOVENOTBAIXO:
 addi $t0,$t1,-160
 lw $t2,0($t0)
 addi $t2,$t2,1
 bne $t3,$t2,IAMOVENOTCIMA
 addi $t1,$t1,-160
 li $v0,115
 j MOVELOOP
 IAMOVENOTCIMA:
 GOTMOVE:
 lw $fp,0($sp)
 addi $sp,$sp,4
 jr $ra

#PACTRANSLATE
MAIN:
# Leitura do teclado e echo na tela
#la $t1,0xFF100000
#li $t0,2
#sw $t0,0($t1)   # Habilita interrup��o do teclado
 li $v0, 30    #system time
 syscall       # operate
 add $t0, $a1, $zero    #
 add $a1, $a0, $zero    #randswap
 add $a0, $t0, $zero    #
 li $v0, 40       #set seed
 syscall     #operate
 REINC:    #restarts the game and sets the variables
 la $t1,PACAMOUNT  #
 lb $s2,0($t1)     #
 la $t1,GHOSTAMOUNT#
 lb $s3,0($t1)     #
 li $s0,0          #
 li $s1,0          #
 li $t0,100      #PACMOVE 0 is receiving argument 'd'
 la $t1,PACMOVES #
 sb $t0,0($t1)   #
 sb $t0,2($t1)   #
 li $t0,97       #
 sb $t0,1($t1)   #
 sb $t0,3($t1)   #
 la $t0, INICIO   #t0 is table top
 la $a1, 0xff000000  #a1 is screen top
 li $t3,62              #
 addi $t1, $t0, 41	#PACADRESS 0 is snake 0
 la $t2,PACADRESS       #
 sw $t1,0($t2)          #
 blt $s2,2,PACNUMDONE   #
 addi $t1, $t0, 78      #
 sw $t1,4($t2)          #
 sb $t3,0($t1)          #
 blt $s2,3,PACNUMDONE   #
 addi $t1, $t0, 1121	#PACADRESS 1 is snake 1
 sw $t1,8($t2)          #
 sb $t3,0($t1)          #
 blt $s2,4,PACNUMDONE   #
 addi $t1, $t0, 1158	#PACADRESS 3 is snake 3
 sw $t1,12($t2)         #
 sb $t3,0($t1)          #
 PACNUMDONE:
 
 
 blt $s3,1,GHOSTNUMDONE   #
 li $t3,61              #
 addi $t1, $t0, 578	#GHOSTADRESS 0 is GHOST 0
 la $t2,GHOSTADRESS       #
 sw $t1,0($t2)          #
 sb $t3,0($t1)          #
 blt $s3,2,GHOSTNUMDONE   #
 addi $t1, $t0, 581      #
 sw $t1,4($t2)          #
 sb $t3,0($t1)          #
 blt $s3,3,GHOSTNUMDONE   #
 addi $t1, $t0, 618	#PACADRESS 1 is snake 1
 sw $t1,8($t2)          #
 sb $t3,0($t1)          #
 blt $s3,4,GHOSTNUMDONE   #
 addi $t1, $t0, 621	#PACADRESS 3 is snake 3
 sw $t1,12($t2)         #
 sb $t3,0($t1)          #
 GHOSTNUMDONE:
 addi $s5,$zero,544     #s5 is amount of fooding
 li $t2, 1200   #t2 is 1200 aka tabletop amount
 
 PUTAPUTALOOP:  #print tela
 addi $t4, $zero, 40   #amount of lines in t4
 LOOP:         #does a line
 lb $a0, 0($t0)    #loads byte to print
 bne $a0,46,NOTGRASS   #if is not a grass check what is
 addi $sp,$sp,-4    #
 sw $t4,0($sp)      #
 jal PRINTGROUND    #prints a grass and leaves
 lw $t4,0($sp)      #
 addi $sp,$sp,4     #
 j GOON             #
 NOTGRASS:          #
 bne $a0,0,NOTWALL#checks if is wall and if is prints and leaves
 addi $sp,$sp,-4  #
 sw $t4,0($sp)    #
 jal PRINTWALL    #
 lw $t4,0($sp)    #
 addi $sp,$sp,4   #
 j GOON           #
 NOTWALL:         #
 bne $a0,62,NOTHEAD    #checks if is head and prints
 addi $sp,$sp,-4       #
 sw $t4,0($sp)         #
 jal PRINTGROUND       #
 lw $t4,0($sp)         #
 addi $sp,$sp,4        #
 la $t3,PACCOLOR
 add $t3,$t3,$s0
 lb $a2,0($t3)
 addi $s0,$s0,1
 jal PRINT_PACMAN_RIGHT#
 j GOON                #
 NOTHEAD:              #
 
 bne $a0,61,NOTGHOST    #checks if is head and prints
 addi $sp,$sp,-4       #
 sw $t4,0($sp)         #
 jal PRINTGROUND       #
 lw $t4,0($sp)         #
 addi $sp,$sp,4        #
 la $t3,GHOSTCOLOR
 add $t3,$t3,$s1
 lb $a2,0($t3)
 addi $s1,$s1,1
 jal PRINT_GHOST#
 j GOON                #
 NOTGHOST:              #
 
 bne $a0,38,NOTCOIN#checks if is coin and prints
 addi $sp,$sp,-4   #
 sw $t4,0($sp)     #
 jal PRINTGROUND   #
 lw $t4,0($sp)     #
 addi $sp,$sp,4    #
 jal PRINTCOIN     #
 j GOON            #
 NOTCOIN:          #
 addi $sp,$sp,-4#else print 
 sw $t4,0($sp)  #
 jal PRINTGROUND#
 lw $t4,0($sp)  #
 addi $sp,$sp,4 #
 GOON:          #
 addi $t0, $t0, 1   #gets next tabletop adress
 addi $a1, $a1, 8   #gets next screen adress
 addi $t2, $t2, -1  #one less tile to print
 addi $t4, $t4, -1  #one less tile to print in line
 bne $t4, 0, LOOP  #does a loop
 addi $a1, $a1, 2240 #next line
 bne $t2, 0, PUTAPUTALOOP #loops next line
 
 li $a0,0
 la $t0,PACCOLOR
 add $t0,$t0,$a0
 lb $t8,0($t0)
 la $a1 0xff000000 #a1 is screen
 la $t0 HP     #
 lb $t0,0($t0) #loads healthpoint in t0
 HEARTS:          #prints HP amount of hearts and then the score
 jal PRINTHEART   #
 addi $a1,$a1,10  #
 addi $t0,$t0,-1  #
 bne $t0,0,HEARTS #
 jal PRINTSCORE   #
 blt $s2,2,PULAHEART4
 PULAHEART1:
 li $a0,1
 la $t0,PACCOLOR
 add $t0,$t0,$a0
 lb $t8,0($t0)
 la $a1 0xff000000 #a1 is screen
 addi $a1,$a1,292
 la $t0 HP     #
 lb $t0,1($t0) #loads healthpoint in t0
 HEARTS2:          #prints HP amount of hearts and then the score
 jal PRINTHEART   #
 addi $a1,$a1,10  #
 addi $t0,$t0,-1  #
 bne $t0,0,HEARTS2 #
 jal PRINTSCORE   #
 blt $s2,3,PULAHEART4
 PULAHEART2:
 li $a0,2
 la $t0,PACCOLOR
 add $t0,$t0,$a0
 lb $t8,0($t0)
 la $a1 0xff000000 #a1 is screen
 addi $a1,$a1,74240
 la $t0 HP     #
 lb $t0,2($t0) #loads healthpoint in t0
 HEARTS3:          #prints HP amount of hearts and then the score
 jal PRINTHEART   #
 addi $a1,$a1,10  #
 addi $t0,$t0,-1  #
 bne $t0,0,HEARTS3 #
 jal PRINTSCORE   #
 blt $s2,4,PULAHEART4
 PULAHEART3:
 li $a0,3
 la $t0,PACCOLOR
 add $t0,$t0,$a0
 lb $t8,0($t0)
 la $a1 0xff000000 #a1 is screen
 addi $a1,$a1,74532
 la $t0 HP     #
 lb $t0,3($t0) #loads healthpoint in t0
 HEARTS4:          #prints HP amount of hearts and then the score
 jal PRINTHEART   #
 addi $a1,$a1,10  #
 addi $t0,$t0,-1  #
 bne $t0,0,HEARTS4 #
 jal PRINTSCORE   #
 PULAHEART4:
 
 JOGO:
 li $v0,31
 li $a0,70
 li $a1,500
 li $a2,4
 li $a3,120
 syscall    #sound eff
 li $v0,32
 li $a0,1000
 syscall
 li $v0,31
 li $a0,70
 syscall
 li $v0,32
 li $a0,1000
 syscall
 li $v0,31
 li $a0,70
 syscall
 li $v0,32
 li $a0,1000
 syscall
 li $v0,31
 li $a0,80
 li $a1,1000
 syscall
 la $a0,0xFF100000   #set defaul d
 li $a1,100
 sw $a1,4($a0)
 LOOP_JOGO:
 
 blt $s3,1,LOOP_JOGO
 li $a0,0
 jal GETGHOSTMOVE
 jal EXECGHOST
 JUMPPAC1:
 blt $s3,2,LOOP_JOGO
 li $a0,1
 jal GETGHOSTMOVE
 jal EXECGHOST
 JUMPPAC2:
 blt $s3,3,LOOP_JOGO
 li $a0,2
 jal GETGHOSTMOVE
 jal EXECGHOST
 JUMPPAC3:
 blt $s3,4,LOOP_JOGO
 li $a0,3
 jal GETGHOSTMOVE
 jal EXECGHOST
 JUMPPAC4:
 j LOOP_JOGO
 #a0 is pacman to move

EXECGHOST:
 addi $sp,$sp,4
 sw $ra,0($sp)
 
 la $t0,GHOSTCOLOR
 add $t0,$t0,$a0
 lb $a2,0($t0)
 
 beq $v0, 65, C_A_G
 beq $v0, 97, C_A_G
  
 beq $v0, 83, C_S_G
 beq $v0, 115, C_S_G
 
 beq $v0, 68, C_D_G
 beq $v0, 100, C_D_G	
  
 beq $v0, 87, C_W_G
 beq $v0, 119, C_W_G
 
 CGHOSTRETURN:
 lw $ra,0($sp)
 addi $sp,$sp,-4
 jr $ra
 
 C_A_G:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 add $t0, $t1, $zero
 lb $t0, -1($t0)
 beq $t0, 0, CGHOSTRETURN
 beq $t0, 62, CGHOSTRETURN
 j EXECUTA_GHOST
 
 C_S_G:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 add $t0, $zero, $t1
 lb $t0, 40($t0)
 beq $t0, 0, CGHOSTRETURN
 beq $t0, 62, CGHOSTRETURN
 j EXECUTA_GHOST
 
 C_D_G:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 add $t0, $zero, $t1
 lb $t0, 1($t0)
 beq $t0, 0, CGHOSTRETURN
 beq $t0, 62, CGHOSTRETURN
 j EXECUTA_GHOST
 
 C_W_G:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 add $t0, $zero, $t1
 lb $t0, -40($t0)
 beq $t0, 0, CGHOSTRETURN
 beq $t0, 62, CGHOSTRETURN
 j EXECUTA_GHOST
  
 EXECUTA_GHOST:
 beq $v0, 65, GHOST_MOVE_LEFT
 beq $v0, 97, GHOST_MOVE_LEFT
  
 beq $v0, 83, GHOST_MOVE_DOWN
 beq $v0, 115, GHOST_MOVE_DOWN
 
 beq $v0, 68, GHOST_MOVE_RIGHT
 beq $v0, 100, GHOST_MOVE_RIGHT
 
 beq $v0, 87, GHOST_MOVE_UP
 beq $v0, 119, GHOST_MOVE_UP
                               
 GHOST_MOVE_LEFT:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t0,0($t0)
 sb $t0, 0($t1)
 la $t8,INICIO
 sub $t9, $t1, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGROUND
 beq $t0,46,LEFTNOCOIN
 jal PRINTCOIN
 LEFTNOCOIN:
 la $t0,GHOSTADRESS
 mul $t1,$a0,4
 add $t0,$t0,$t1
 lw $t1,0($t0)
 addi $t1, $t1, -1
 sw $t1,0($t0)
 addi $t9, $t9, -8
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t8,0($t1)
 sb $t8,0($t0)
 li $t0, 61
 sb $t0, 0($t1)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGROUND
 jal PRINT_GHOST
 j CGHOSTRETURN
 
 GHOST_MOVE_DOWN:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t0,0($t0)
 sb $t0, 0($t1)
 la $t8,INICIO
 sub $t9, $t1, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGROUND
 beq $t0,46,DOWNNOCOIN
 jal PRINTCOIN
 DOWNNOCOIN:
 la $t0,GHOSTADRESS
 mul $t1,$a0,4
 add $t0,$t0,$t1
 lw $t1,0($t0)
 addi $t1, $t1, 40
 sw $t1,0($t0)
 addi $t9, $t9, 2560
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t8,0($t1)
 sb $t8,0($t0)
 li $t0, 61
 sb $t0, 0($t1)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGROUND
 jal PRINT_GHOST
 j CGHOSTRETURN
 
 GHOST_MOVE_RIGHT:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t0,0($t0)
 sb $t0, 0($t1)
 la $t8,INICIO
 sub $t9, $t1, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8
 la $t8,0xff000000 
 add $a1, $t8, $t9
 jal PRINTGROUND
 beq $t0,46,RIGHTNOCOIN
 jal PRINTCOIN
 RIGHTNOCOIN:
 la $t0,GHOSTADRESS
 mul $t1,$a0,4
 add $t0,$t0,$t1
 lw $t1,0($t0)
 addi $t1, $t1, 1
 sw $t1,0($t0)
 addi $t9, $t9, 8
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t8,0($t1)
 sb $t8,0($t0)
 li $t0, 61
 sb $t0, 0($t1)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGROUND
 jal PRINT_GHOST
 j CGHOSTRETURN
 
 GHOST_MOVE_UP:
 la $t1,GHOSTADRESS
 mul $t0,$a0,4
 add $t1,$t1,$t0
 lw $t1,0($t1)
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t0,0($t0)
 sb $t0, 0($t1)
 la $t8,INICIO
 sub $t9, $t1, $t8
 div $t9, $t9, 40
 mfhi $t8
 mul $t9, $t9, 320
 add $t9, $t9, $t8
 mul $t9, $t9, 8 
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGROUND
 beq $t0,46,UPNOCOIN
 jal PRINTCOIN
 UPNOCOIN:
 la $t0,GHOSTADRESS
 mul $t1,$a0,4
 add $t0,$t0,$t1
 lw $t1,0($t0)
 addi $t1, $t1, -40
 sw $t1,0($t0)
 addi $t9, $t9, -2560
 la $t0,GHOSTOVER
 add $t0,$t0,$a0
 lb $t8,0($t1)
 sb $t8,0($t0)
 li $t0, 61
 sb $t0, 0($t1)
 la $t8,0xff000000
 add $a1, $t8, $t9
 jal PRINTGROUND
 jal PRINT_GHOST
 j CGHOSTRETURN
 
 INCSCORE:
 addi $sp,$sp,-32
 sw $t0,0($sp)
 sw $t1,4($sp)
 sw $t2,8($sp)
 sw $t3,12($sp)
 sw $t4,16($sp)
 sw $t5,20($sp)
 sw $a1,24($sp)
 sw $ra,28($sp)
 la $t0,SCORE
 mul $t1,$a0,4
 add $t0,$t0,$t1
 lw $t1,0($t0)
 addi $t1,$t1,1
 div $t1,$t1,99999
 mfhi $t2
 sw $t2,0($t0)
 div $t2,$t2,10
 mfhi $t1
 lw $a1,24($sp)
 addi $a1,$a1,80
 jal PRINTCHAR
 div $t2,$t2,10
 mfhi $t1
 lw $a1,24($sp)
 addi $a1,$a1,72
 jal PRINTCHAR
 div $t2,$t2,10
 mfhi $t1
 lw $a1,24($sp)
 addi $a1,$a1,64
 jal PRINTCHAR
 div $t2,$t2,10
 mfhi $t1
 lw $a1,24($sp)
 addi $a1,$a1,56
 jal PRINTCHAR
 div $t2,$t2,10
 mfhi $t1
 lw $a1,24($sp)
 addi $a1,$a1,48
 jal PRINTCHAR
 lw $t0,0($sp)
 lw $t1,4($sp)
 lw $t2,8($sp)
 lw $t3,12($sp)
 lw $t4,16($sp)
 lw $t5,20($sp)
 lw $a1,24($sp)
 lw $ra,28($sp)
 addi $sp,$sp,32
 jr $ra
 
 SCORETABLE:
 addi $sp,$sp,-12
 sw $t0,0($sp)
 sw $t1,4($sp)
 sw $ra,8($sp)
 bne $a0,0,SCORENOTPAC1
 li $a1,0xff000000
 SCORENOTPAC1:
 bne $a0,1,SCORENOTPAC2
 li $a1,0xff000000
 addi $a1,$a1,184
 SCORENOTPAC2:
 bne $a0,2,SCORENOTPAC3
 li $a1,0xff000000
 addi $a1,$a1,74240
 SCORENOTPAC3:
 bne $a0,3,SCORENOTPAC4
 li $a1,0xff000000
 addi $a1,$a1,184
 addi $a1,$a1,74240
 SCORENOTPAC4:
 lw $t0,0($sp)
 lw $t1,4($sp)
 lw $ra,8($sp)
 addi $sp,$sp,12
 jr $ra
 
 PRINTSCORE:
 addi $sp,$sp,-12
 sw $t0,0($sp)
 sw $t1,4($sp)
 sw $ra,8($sp)
 la $t0,SCORE
 mul $t1,$a0,4
 add $t0,$t0,$t1
 lw $t1,0($t0)
 addi $t1,$t1,-1
 sw $t1,0($t0)
 jal SCORETABLE
 jal INCSCORE
 lw $t0,0($sp)
 lw $t1,4($sp)
 lw $ra,8($sp)
 addi $sp,$sp,12
 jr $ra

 PRINTCHAR:
 addi $sp,$sp,-12
 sw $t0,0($sp)
 sw $t1,4($sp)
 sw $ra,8($sp)
 bne $t1,0,FN0
 jal PRINT0
 j FGO
 FN0:
 bne $t1,1,FN1
 jal PRINT1
 j FGO
 FN1:
 bne $t1,2,FN2
 jal PRINT2
 j FGO
 FN2:
 bne $t1,3,FN3
 jal PRINT3
 j FGO
 FN3:
 bne $t1,4,FN4
 jal PRINT4
 j FGO
 FN4:
 bne $t1,5,FN5
 jal PRINT5
 j FGO
 FN5:
 bne $t1,6,FN6
 jal PRINT6
 j FGO
 FN6:
 bne $t1,7,FN7
 jal PRINT7
 j FGO
 FN7:
 bne $t1,8,FN8
 jal PRINT8
 j FGO
 FN8:
 bne $t1,9,FN9
 jal PRINT9
 j FGO
 FN9:
 FGO:
 lw $t0,0($sp)
 lw $t1,4($sp)
 lw $ra,8($sp)
 addi $sp,$sp,12
 jr $ra
 
 PRINTGROUND:
 add $t1, $zero, $a1
 li $t8,0x8a
 li $t7,0x89
 li $t6,0x81
 li $t5,0x80
 li $t4,0
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t7,2($a1)
 sb $t7,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t5,6($a1)
 sb $t5,7($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINT_PACMAN_RIGHT:
 add $t1, $zero, $a1
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 addi $a1,$a1,320
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 addi $a1,$a1,320
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 addi $a1,$a1,320
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINT_PACMAN_LEFT:
 add $t1, $zero, $a1
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 addi $a1,$a1,320
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 addi $a1,$a1,320
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 addi $a1,$a1,320
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINT_PACMAN_UP:
 add $t1, $zero, $a1
 addi $a1,$a1,320
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 addi $a1,$a1,320
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINT_PACMAN_DOWN:
 add $t1, $zero, $a1
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 addi $a1,$a1,320
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 addi $a1,$a1,320
 add $a1, $zero, $t1
 jr $ra
 
 PRINT_PACMAN_FULL:
 add $t1, $zero, $a1
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 addi $a1,$a1,320
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 addi $a1,$a1,320
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINT_GHOST:
 add $t1, $zero, $a1
 li $t9,255
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 addi $a1,$a1,320
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $t9,1($a1)
 sb $0,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $t9,5($a1)
 sb $0,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $0,1($a1)
 sb $0,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $0,5($a1)
 sb $0,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 addi $a1,$a1,320
 sb $a2,0($a1)
 sb $a2,1($a1)
 sb $a2,2($a1)
 sb $a2,3($a1)
 sb $a2,4($a1)
 sb $a2,5($a1)
 sb $a2,6($a1)
 sb $a2,7($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINTCOIN:
 add $t1, $zero, $a1
 li $t8,0x7f
 addi $a1,$a1,320
 addi $a1,$a1,320
 sb $t8,3($a1)
 sb $t8,4($a1)
 addi $a1,$a1,320
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 addi $a1,$a1,320
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 addi $a1,$a1,320
 sb $t8,3($a1)
 sb $t8,4($a1)
 addi $a1,$a1,320
 addi $a1,$a1,320
 add $a1, $zero, $t1
 jr $ra
 
 PRINTWALL:
 add $t1, $zero, $a1
 li $t8,0x02
 li $t7,0x04
 li $t6,0x0b
 li $t5,0x16
 li $t4,0
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t7,3($a1)
 sb $t7,4($a1)
 sb $t7,5($a1)
 sb $t7,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t6,0($a1)
 sb $t6,1($a1)
 sb $t6,2($a1)
 sb $t7,3($a1)
 sb $t7,4($a1)
 sb $t7,5($a1)
 sb $t7,6($a1)
 sb $t6,7($a1)
 addi $a1,$a1,320
 sb $t6,0($a1)
 sb $t6,1($a1)
 sb $t6,2($a1)
 sb $t5,3($a1)
 sb $t5,4($a1)
 sb $t5,5($a1)
 sb $t5,6($a1)
 sb $t6,7($a1)
 addi $a1,$a1,320
 sb $t7,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t5,3($a1)
 sb $t5,4($a1)
 sb $t5,5($a1)
 sb $t5,6($a1)
 sb $t7,7($a1)
 addi $a1,$a1,320
 sb $t7,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t7,7($a1)
 addi $a1,$a1,320
 sb $t5,0($a1)
 sb $t5,1($a1)
 sb $t5,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t5,0($a1)
 sb $t5,1($a1)
 sb $t5,2($a1)
 sb $t6,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t6,6($a1)
 sb $t5,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t6,3($a1)
 sb $t6,4($a1)
 sb $t6,5($a1)
 sb $t6,6($a1)
 sb $t8,7($a1)
 add $a1, $zero, $t1
 jr $ra
 
 PRINT9:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT8:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT7:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT6:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT5:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT4:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT3:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT2:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 
 PRINT1:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINT0:
 addi $sp,$sp,-4
 sw $ra,0($sp)
 jal PRINTWALL
 add $t1, $zero, $a1
 li $t4,0xff
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,1($t1)
 sb $t4,2($t1)
 sb $t4,5($t1)
 sb $t4,6($t1)
 addi $t1,$t1,320
 sb $t4,2($t1)
 sb $t4,3($t1)
 sb $t4,4($t1)
 sb $t4,5($t1)
 lw $ra,0($sp)
 addi $sp,$sp,4
 jr $ra
 
 PRINTHEART:
 add $t1, $zero, $a1
 ori $t7,$t8,0x92
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t7,1($a1)
 sb $t7,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,0($a1)
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 sb $t8,7($a1)
 addi $a1,$a1,320
 sb $t8,1($a1)
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 sb $t8,6($a1)
 addi $a1,$a1,320
 sb $t8,2($a1)
 sb $t8,3($a1)
 sb $t8,4($a1)
 sb $t8,5($a1)
 addi $a1,$a1,320
 sb $t8,3($a1)
 sb $t8,4($a1)
 add $a1, $zero, $t1
 jr $ra
