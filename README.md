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

## 日付と時間(Date n Time)
Calenderモジュールは、日付の操作に利用する暦法を表現する<br>

## 変数のスコープ
Elixirはレキシカルスコープ {静的スコープ（static scope）}<br>

### Doブロックスコープ
複数の式をグループ化する最も一般的な方法<br>
<p></p>
line_no = 50<br>
・・・・<br>
if (line_no == 50) do<br>
    IO.puts "new.page\f"<br>
    line_no = 0<br>
end<br>
Io.puts line_no<br>

## 無名関数(Anonymous Function)
無名関数はfnキーワードを使って作られる<br>
<p></p>
fn<br>
  parameter-list -> body<br>
  parameter-list -> body<br>
end<br>
<p></p>
iex> sum = fn(a, b) -> a + b end<br>
#Function<41.3316493/2 in :erl_eval.expr/6><br>
iex)> sum(1, 2)<br>
3<br>
<p></p>
iex> greet = fn -> IO.puts "Hello" end<br>
#Function<43.3316493/0 in :erl_eval.expr/6><br>
iex> greet.()<br>
Hello<br>
:ok<br>
iex> f1 = fn a, b -> a * b end<br>
#Function<41.3316493/2 in :erl_eval.expr/6><br>
iex> f1.(5, 6)<br>
30<br>
iex> f2 = fn -> 99 end<br>
#Function<43.3316493/0 in :erl_eval.expr/6><br>
iex> f2.()<br>
99<br>

### 関数とパターンマッチ
iex> sum = fn a, b, c -> a + b + c end<br>
#Function<40.3316493/3 in :erl_eval.expr/6><br>
ex(13)> sum.(1, 2, 3)<br>
6<br>
<p></p>
iex> list_concat = fn [:a, :b], [:c, :d] -> [:a , :b, :c, :d] end<br>
#Function<41.3316493/2 in :erl_eval.expr/6><br>
iex> list_concat.([:a, :b], [:c, :d])<br>
[:a, :b, :c, :d]<br>
<p></p>
iex> pair_tuple_to_list = fn [1234, 5678] -> [1234, 5678] end<br>
#Function<42.3316493/1 in :erl_eval.expr/6><br>
iex(17)> pair_tuple_to_list.([1234, 5678])<br>
[1234, 5678]<br>

## if, unless/else
他のプログラミング言語で親しまれているif~elseは、Elixirでは以下のように記述する<br>
<p></p>
iex> if true do<br>
...>   "みえる"<br>
...> else<br>
...>   "みえない"<br>
...> end<br>
"みえる"<br>

## case
caseはendで閉じ、その中の条件に応じた処理をいくつも書き換えることができる<br>
条件に合うかどうか決めるのは、パターンマッチング<br>
残るすべての場合を引き受けるには_を用いる<br>
<p></p>
iex> case {:ok, "hello world"} do<br>
...>   {:ok, result} -> result<br>
...>   {:error, error} -> error<br>
...>   _ -> "others"<br>
...> end<br>
出力結果 ->  "hello world"
<p></p>
iex> case {1, 2, 3} do<br>
...>   {4, 5, 6} -><br>
...>     "この条件にはマッチしない"<br>
...>   {1, x, 3} -><br>
...>     "この条件にマッチして、この文のスコープ変数xに2が代入される"<br>
...>   _ -><br>
...>     "_ はどの条件にもマッチする"<br>
...> end<br>
"この条件にマッチして、この文のスコープ変数xに2が代入される"<br>
<p></p>
case文は幾つかの値の中でマッチするのもを探しだすのに便利

## cond
幾つかの条件の中で最初にマッチするものを探し出したい場合はcond<br>
<p></p>
iex> cond do<br>
...>   2 + 2 == 5 -><br>
...>     "ちがう"<br>
...>   2 * 2 == 3 -><br>
...>     "これもちがう"<br>
...>   1 + 1 == 2 -><br>
...>     "これだ！"<br>
...> end<br>
"これだ！"<br>
<p></p>
最後までマッチされなかった時はエラーになる。<br>
<p></p>
iex> cond do<br>
...> 1 + 2 == 2 -><br>
...> "wow"<br>
...> end<br>
** (CondClauseError) no cond clause evaluated to a true value<br>