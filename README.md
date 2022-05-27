# Elixir 基礎知識の整理

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

### リストの連結(List Concatenation)
リストの連結では ++演算子を使用<br>
<p></p>
iex> [1, 2] ++ [3, 4, 1]<br>
出力結果 -> [1, 2, 3, 4, 1]

### リストの減算(List Subtraction)
リストの減算では --演算子を使用<br>
存在しない値を引いてもOK<br>
<p></p>
iex> ["foo", :bar, 42] -- [42, "bar"]<br>
出力結果 -> ["foo", :bar]

### 頭部/尾部(Head/tail)
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

## タプル(Tuples)
タプルもリストと同じく、複数の値がまとめて納められている。<br>
要素をメモリに連続して納めることができる。<br>
<p></p>
iex> tuple = {3.14, :pie. true, "Apple"}</br>
出力結果 -> {3.14, :pie, true, "Apple"}</br>
iex> tuple_size(tuple)</br>
 ※長さ(要素数)を調べる関数はtuple_size</br>
出力結果 -> 4
<p></p>
iex> elem(tuple, 3)<br>
※elem/2関数を用いて、0からはじまる整数連番のインデックスで、要素を取り出すこともできる<br>
出力結果 -> "Apple"

## キーワードリスト
キーワードリストは最初の要素がアトムのタプルからなる特別なリストで、リストと同様の性能<br>
キーワードリストは関数にオプションを渡すために非常に良く用いられる<br>
理由は以下の通り<br>
・キーはアトム
・キーは順序付けされている
・キーの一意性は保証されない
<p></p>
iex> [foo: "bar", hello: "world"]<br>
出力結果 -> [foo: "bar", hello: "world"]
<p></p>
iex> [{:foo, "bar"}, {:hello, "world"}]<br>
出力結果 -> [foo: "bar", hello: "world"]

## マップ
マップはキーと値のペアコレクション<br>
マップは %{} 構文で定義することができる<br>
%{key => value, key => value}

<p></p>
iex> status = %{"AL" => "Alabama","WI" => "Wisconsin"}(文字列)<br>
出力結果 -> %{"AL" => "Alabama", "WI" => "Wisconsin"}
<p></p>
iex> respones = %{ {:error, :enoent } => :fatal, { :error, :busy } => :retry } （タプル)<br>
出力結果 -> %{{:error, :busy} => :retry, {:error, :enoent} => :fatal}

<p></p>
iex> colors = %{:red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff} (アトム)<br>
出力結果 -> %{blue: 255, green: 65280, red: 16711680}

## パターンマッチング
左辺の値と右辺の値を同じにする方法を探す<br>
変数それぞれに対応する値をセットすれば、両辺を同じにできる<br>
この処理をパターンマッチングと呼ぶ<br>

### マッチ演算子
Elixirにおける呼び名はマッチ演算子<br>
左の値が右の値と合致(マッチ)するかを試し、マッチすればその値が返され、しないときはエラーになる<br>
<p></p>
iex> x = 2<br>
2<br>
iex> x = 2<br>
2<br>

### ピン演算子
演算子の左が変数の場合、右の値が代入される<br>
だが、左の変数にピン演算子(^)を備えると、右とのマッチが求められる<br>
<p></p>
iex> x = 1<br>
1<br>
iex> x = 2<br>
2<br>
iex> ^x = 1<br>
** (MatchError) no match of right hand side value: 1<br>
iex> ^x = 2<br>
2<br>

### 演算子によるパターンマッチング
複数のデータを持つリストややプルにも、マッチ演算子が使える<br>
『リスト』<br>
iex> list = [1, 2, 3]<br>
出力結果 -> [1, 2, 3]<br>
iex> [1, 2, 3] = list<br>
出力結果 -> [1, 2, 3]<br>
<p></p>
iex> [a, b, c] = list<br>
出力結果 -> [1, 2, 3]<br>
iex> a<br>
1<br>
・<br>
・<br>
・<br>
『タプル』<br>
iex> {a, b, c} = {:hello, "world", 2018}<br>
出力結果 -> {:hello, "world", 2018}<br>
iex> a<br>
:hello<br>
・<br>
・<br>
・<br>
