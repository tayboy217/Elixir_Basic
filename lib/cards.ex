defmodule Cards do
@moduledoc """
 Provides methods for creating and handing a deck of cards
"""
  def create_deck do #method
    values = ["Ace", "Two", "Three", "Four", "Five"] #line
    suits = ["Spades", "Clibs", "Hearts", "Diamonds"]


    for suit <- suits, value <- values do
          "#{value} of #{suit}"
    end
  end

  #構文(deck)は、関数の引数を指定する方法・deck関数に渡される引数shuffle
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  #save the file
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filrname) do
    case File.read(filrname) do
      #atom
      {:ok, binary }-> :erlang.binary_to_term binary
      {:error, _reason} -> "That file dose not exit"
    end
  end

  def create_hand(hand_size) do
    Cards .create_deck #pipe operater
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end


