# Cards

## Elixir Install
% brew install elixir

## 対話モード
- IExという対話シェルがElixirにはある
- 対話モード開始コマンド→ iex -S mix
- 対話モード終了コマンド→ control + c

## 基礎データ型
- 整数(Integers) iex> 217
- 浮動小数(Floats) iex> 3.12
- 真理値(Booleans) iex> true / false
- アトム(Atom) iex> :foo
- 文字列(Strings) iex> "Hello"

## リスト
複数のタイプを含む可能せのある値の単純なコレクション<br>
iex> list = [3.14, :pie, "Apple"]<br>
出力結果 -> [3.14, :pie, "Apple"]<br>

### リストの連結
リストの連結では ++演算子を使用<br>
iex> [1, 2] ++ [3, 4, 1]<br>
出力結果 -> [1, 2, 3, 4, 1]