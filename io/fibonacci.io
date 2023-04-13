#!/usr/bin/env io

fibonacci := method(n,
  if(n < 2,
    1,
    fibonacci(n-1) + fibonacci(n-2)
  )
)

fibonacci(6) println

fibonacciLoop := method(n,
  if(n < 2,
    1,
    n1 := 1
    n2 := 1
    sum := 2
    for(i, 2, n,
      sum = n1 + n2
      n2 = n1
      n1 = sum
    )
    sum
  )
)

fibonacciLoop(6) println
