defmodule TriangularStorageTest do
  use ExUnit.Case
  doctest TriangularStorage

  test "get triangulars error handling" do
    assert_raise ArgumentError, fn -> TriangularStorage.get_nth_triangular(0) end
    assert_raise ArgumentError, fn -> TriangularStorage.get_nth_triangular(-1) end
    assert_raise ArgumentError, fn -> TriangularStorage.get_nth_triangular(-100000) end
  end

  test "get triangulars default seeded" do
    assert TriangularStorage.get_nth_triangular(1) == 1
    assert TriangularStorage.get_nth_triangular(1) == 1
    assert TriangularStorage.get_nth_triangular(2) == 3
    assert TriangularStorage.get_nth_triangular(3) == 6
    assert TriangularStorage.get_nth_triangular(612) == 187578
    assert TriangularStorage.get_nth_triangular(11111) == 61732716
    assert TriangularStorage.get_nth_triangular(100000) == 5000050000
  end

  test "get triangulars custom seeded" do
    assert TriangularStorage.get_nth_triangular(5, 1, 1) == 11
    assert TriangularStorage.get_nth_triangular(3, 3, 2) == 8
    assert TriangularStorage.get_nth_triangular(4, 6, 3) == 18
  end

  test "x and y test" do
    assert TriangularStorage.answer(2, 2) == "5"
    assert TriangularStorage.answer(2, 4) == "12"
    assert TriangularStorage.answer(4, 1) == "10"
    assert TriangularStorage.answer(4, 2) == "14"
    assert TriangularStorage.answer(612, 231) == "354673"
    assert TriangularStorage.answer(11111, 11111) == "246886421"
    assert TriangularStorage.answer(100000, 100000) == "19999800001"
  end

end
