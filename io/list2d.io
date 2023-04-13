#!/usr/bin/env io

List sum2d := method(flatten sum)

List myAverage := method(
  containsNonNumber := select(e, e asNumber() isNan()) size > 0
  if(containsNonNumber, Exception raise("An item in the list is not a number"))

  flatList := self flatten
  flatList sum / flatList size
)

l2d := list(
  list(1, 2, 3),
  list(4, 5, 6),
  list(7, 8, 9))

l2d sum2d println

l := list(1, 2, 3, 4, 5, 6, 7, 8, 9)
l myAverage println

c := list("one", 2, 3)
# c myAverage println

List2D := List clone

List2D dim := method(x, y,
  y repeat(
    l := list()
    x repeat(l push(nil))
    self append(l)
  )
)

List2D set := method(x, y, value,
  self at(x) atPut(y, value)
)

List2D get := method(x, y,
  self at(x) at(y)
)

flipFirstTowArgs := method(slotName,
  self getSlot(slotName) setArgumentNames( list(
    self getSlot(slotName) argumentNames at(1),
    self getSlot(slotName) argumentNames at(0),
    self getSlot(slotName) argumentNames rest rest
  ) flatten)
)

List2D transpose := method(
  self get = flipFirstTowArgs("get")
  self set = flipFirstTowArgs("set")
)

l2d := List2D dim(5, 3)
l2d set(1, 2, "Hello")
l2d println
l2d get(1, 2) println

"transposing" println
l2d transpose

l2d get(1, 2) println
l2d get(2, 1) println

f := File with("matrix.txt")
f remove
f openForUpdating
f write(l2d join(", "))
f close

f = File with("matrix.txt")
f openForReading
lines := f readLines
f close

matrix := lines at(0) split(", ")
matrix println
