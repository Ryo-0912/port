const cards = document.getElementsByClassName('cards') /* クラス名が「cards」の要素をすべて取得し、定数cardsとして代入する
                                                           ただ、ここで取得できるのは「配列に似ているが、実際には配列ではなく、HTMLcollectionオブジェクトを返す」 */
    for (let card of cards) {                              //for (仮変数 of 配列){(処理)} この構文では配列の中の値を出力
      card.addEventListener('click', () => {
        console.log(card);                                  //ここで呼び出される値は各cardの情報データ?
        open (card.dataset.url);                           //各cardのdata属性のURLを取得し、openメソッドを適用
      })
    }