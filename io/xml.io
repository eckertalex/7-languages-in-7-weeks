#!/usr/bin/env io

Builder := Object clone

Builder indentLevel := 0

Builder indent := method(" " repeated(indentLevel))

Builder forward := method(
  writeln(indent, "<", call message name, ">")
  indentLevel = indentLevel + 2
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(
      indent .. content
    )))
  indentLevel = indentLevel - 2
  writeln(indent, "</", call message name, ">")
)

Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")
)

OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg, r doMessage(arg))
  r
)

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

BuilderImproved := Builder clone

BuilderImproved forward := method(
  write(indent, "<", call message name)
  firsMessage := call message arguments first
  if(firsMessage != nil,
    attrs := doMessage(firsMessage)
    if(attrs isKindOf(Map), attrs foreach(key, value, write(" ", key, "=\"", value, "\"")))
  )
  writeln(">")
  indentLevel = indentLevel + 2
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(
      indent .. content
    )))
  indentLevel = indentLevel - 2
  writeln(indent, "</", call message name, ">")
)

str := "BuilderImproved ul({\"class\":\"prototyped\"}, li(\"Io\"), li(\"Lua\"), li(\"Javascript\") )"
doString(str)
