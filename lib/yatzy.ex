defmodule Yatzy do
  @initial_value 0

  def chance(d1, d2, d3, d4, d5) do
    Enum.reduce([d1, d2, d3, d4, d5], 0, fn(x, acc) -> x + acc end)
  end

  def yatzy(d1, d2, d3, d4, d5), do: yatzy([d1, d2, d3, d4, d5])

  def yatzy(dice) when is_list(dice) do
    d1 = List.first(dice)

    if Enum.count(dice) == 5 && Enum.all?(dice, &(&1 == d1)),
    do: 50,
    else: 0
  end

  def ones(d1, d2, d3, d4, d5), do: ones([d1, d2, d3, d4, d5])
  def ones(dice),   do: score_the_dice(1, dice)

  def twos(d1, d2, d3, d4, d5), do: twos([d1, d2, d3, d4, d5])
  def twos(dice),   do: score_the_dice(2, dice)

  def threes(d1, d2, d3, d4, d5), do: threes([d1, d2, d3, d4, d5])
  def threes(dice), do: score_the_dice(3, dice)

  def fours(d1, d2, d3, d4, d5), do: fours([d1, d2, d3, d4, d5])
  def fours(dice),  do: score_the_dice(4, dice)
  
  def fives(d1, d2, d3, d4, d5), do: fives([d1, d2, d3, d4, d5])
  def fives(dice),  do: score_the_dice(5, dice)
  
  def sixes(d1, d2, d3, d4, d5), do: sixes([d1, d2, d3, d4, d5])
  def sixes(dice),  do: score_the_dice(6, dice)

  defp score_the_dice(face_value, dice) when is_list(dice) do
    Enum.sum(for die <- dice, do: if die == face_value, do: face_value, else: 0)
  end
end
