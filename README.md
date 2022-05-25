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
<p></p>
iex> list = [3.14, :pie, "Apple"]<br>
出力結果 -> [3.14, :pie, "Apple"]<br>

### リストの連結
リストの連結では ++演算子を使用<br>
<p></p>
iex> [1, 2] ++ [3, 4, 1]<br>
出力結果 -> [1, 2, 3, 4, 1]

### リストの減算
リストの減算では --演算子を使用<br>
存在しない値を引いてもOK<br>
<p></p>
iex> ["foo", :bar, 42] -- [42, "bar"]<br>
出力結果 -> ["foo", :bar]

### 頭部/尾部
リストを扱う際、よくリストの頭部と尾部を利用する<br>
Elixirはこれらを扱うために、 hd と tl という2つの便利な関数を用意している<br>
<p></p>
iex> hd [3.14, :pie, "Apple"]<br>
出力結果 -> 3.14<br>
<p></p>
iex> tl [3.14, :pie, "Apple"]<br>
出力結果 -> [:pie, "Apple"]<br>
<p></p>
リストを頭部と尾部に分けるのにパターンマッチングやcons演算子(|)を使うこともできる。<br>
iex> [head | tail] = [3.14, :pie, "Apple"]<br>
出力結果 -> [3.14, :pie, "Apple"]<br>
<p></p>
iex> head<br>
出力結果 -> 3.14<br>
<p></p>
iex> tail<br>
出力結果 -> [:pie, "Apple"]<br>