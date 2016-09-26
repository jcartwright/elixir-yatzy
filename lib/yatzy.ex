defmodule Yatzy do

  @doc """
  Scores the total of the sum of the face values of all 5 dice.

  ## Examples:
    iex> Yatzy.chance(1, 2, 3, 4, 5)
    15
    iex> Yatzy.chance(6, 1, 6, 1, 6)
    20
  """
  def chance(d1, d2, d3, d4, d5), do: chance([d1, d2, d3, d4, d5])
  def chance(dice) when is_list(dice) do
    Enum.reduce(dice, fn(x, acc) -> x + acc end)
  end

  @doc """
  Scores a yatzy worth 50 points when all 5 dice are the same, and a score of 0 otherwise.

  ## Examples:
    iex> Yatzy.yatzy(5, 5, 5, 5, 5)
    50
    iex> Yatzy.yatzy(1, 2, 1, 1, 1)
    0
  """
  def yatzy(d1, d2, d3, d4, d5), do: yatzy([d1, d2, d3, d4, d5])

  def yatzy(dice) when is_list(dice) do
    d1 = List.first(dice)

    if Enum.count(dice) == 5 && Enum.all?(dice, &(&1 == d1)),
    do: 50,
    else: 0
  end

  @doc """
  Scores the total face values of all 1's rolled.

  ## Examples:
    iex> Yatzy.ones(1, 2, 3, 4, 5)
    1
    iex> Yatzy.ones(1, 1, 1, 1, 1)
    5
  """
  def ones(d1, d2, d3, d4, d5), do: ones([d1, d2, d3, d4, d5])
  def ones(dice),   do: score_the_dice(1, dice)

  @doc """
  Scores the total face values of all 2's rolled.

  ## Examples:
    iex> Yatzy.twos(1, 2, 3, 4, 5)
    2
    iex> Yatzy.twos(2, 1, 2, 1, 2)
    6
  """
  def twos(d1, d2, d3, d4, d5), do: twos([d1, d2, d3, d4, d5])
  def twos(dice),   do: score_the_dice(2, dice)

  @doc """
  Scores the total face values of all 3's rolled.

  ## Examples:
    iex> Yatzy.threes(1, 2, 3, 4, 5)
    3
    iex> Yatzy.threes(1, 3, 1, 3, 1)
    6
  """
  def threes(d1, d2, d3, d4, d5), do: threes([d1, d2, d3, d4, d5])
  def threes(dice), do: score_the_dice(3, dice)

  @doc """
  Scores the total face values of all 4's rolled.

  ## Examples:
    iex> Yatzy.fours(1, 2, 3, 4, 5)
    4
    iex> Yatzy.fours(4, 4, 4, 4, 1)
    16
  """
  def fours(d1, d2, d3, d4, d5), do: fours([d1, d2, d3, d4, d5])
  def fours(dice),  do: score_the_dice(4, dice)
  
  @doc """
  Scores the total face values of all 5's rolled.

  ## Examples:
    iex> Yatzy.fives(1, 2, 3, 4, 5)
    5
    iex> Yatzy.fives(1, 5, 5, 5, 5)
    20
  """
  def fives(d1, d2, d3, d4, d5), do: fives([d1, d2, d3, d4, d5])
  def fives(dice),  do: score_the_dice(5, dice)
  
  @doc """
  Scores the total face values of all 6's rolled.

  ## Examples:
    iex> Yatzy.sixes(1, 2, 3, 4, 5)
    0
    iex> Yatzy.sixes(1, 6, 6, 1, 6)
    18
  """
  def sixes(d1, d2, d3, d4, d5), do: sixes([d1, d2, d3, d4, d5])
  def sixes(dice),  do: score_the_dice(6, dice)

  defp score_the_dice(face_value, dice) when is_list(dice) do
    Enum.sum(for die <- dice, do: if die == face_value, do: face_value, else: 0)
  end

end
