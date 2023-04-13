#!/usr/bin/env io

(4 / 0) println

Number origDiv := Number getSlot("/")

Number / = method(denom, if(denom == 0, 0, self origDiv(denom)))

(4 / 0) println
