defmodule Lists do

  def len([]),    do: 0
  def len([_h|t]), do: 1 + len(t)

  def sum([]),    do: 0
  def sum([h|t]), do: h + sum(t)

  def square([]),    do: []
  def square([h|t]), do: [h*h | square(t)]

  def doubles([]),    do: []
  def doubles([h|t]), do: [ 2*h | doubles(t)]

  def plus([], _n),     do: []
  def plus([h|t], n),   do: [n+h | plus(t, n)]

  def mupps([], _func), do: []
  def mupps([h|t], func), do: [func.(h) | mupps(t, func)]

end
