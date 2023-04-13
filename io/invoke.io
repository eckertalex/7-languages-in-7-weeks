#!/usr/bin/env io

invokeMe := method("Invoked" println)

invoke := method(name, perform(name))

invoke("invokeMe")
