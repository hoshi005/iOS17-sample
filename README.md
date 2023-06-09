# iOS17のサンプルアプリ

## SwiftData

- Swift向けに再構築されたデータモデリング用のフレームワーク
- Swift版CoreData
- CoreDataのような外部ファイルは不要

## ScrollViewの新しいAPI

- 簡単にPagingができるようになった
- 画面幅・任意幅でのページングが可能
- 表示要素を指定してのスクロール位置指定などもできる

## ScrollのTransition

- ScrollViewの要素について、表示時・非表示時のトランジションを指定可能
- 消える際にフェードアウトさせる
- 表示する際に回転させる
- など

## カスタムtransition

- Viewをアニメーションによる表示などを行う際、トランジションの設定が可能
- 消える際にフェードアウトさせる
- 表示する際に回転させる
- など

## アニメーションコールバック

- Viewアニメーションに対して、簡単にコールバックが設定可能
- 連続するアニメーションの場合「各アニメーションごとに呼び出す」o「全て終わった後に呼び出す」が選択可能

## onChange

- modifier`onChange`が、初期表示時にも呼び出させるようになった
- 選択可能

## @Observable と @Bindable

- 以前は、Observableオブジェクトを作るためには`ObservableObject`をimplementする必要があり、変数には`@Published`を宣言する必要があった
- マクロのおかげで簡単になった
- `@Observable`を宣言するだけで、Observableオブジェクトになる
- 各変数に`@Published`を宣言したのと同じになる
- View側では、`@ObservedObject`ではなく`@Bindable`をつければ良い

--- 

- @Stateと@Environment だけになった
- モデルクラスにObservableObject, @Published をつけていたが、@Observableマロだけで良くなった
- プロパティは自動的に @Published になる

- View側は、@ObservedObject は不要になった
- Viewが参照しているプロパティが更新されたらViewが再評価される
- Viewが参照していないプロパティが更新されても、Viewは再評価されない

## UnevenRoundedRectangle

- 四隅バラバラに定義できるRoundedRectangle

## Haptic Feecback

- haptic feedback を鳴らす

## Visual Effect

## symbol image animation

- シンボルイメージに対してアニメーションを設定する

## Phase Animation

- ローテーションさせる

## Keyframe Animation

- SwiftUIでこのようなアニメーションは可能ですが、遅延アニメーションの使用、複数のインスタンスの同時監視などを含む長いプロセスが必要です。しかし、iOS17のリリースでは、必要に応じてアニメーションを定義できるkeyframesというクールなAPIが追加されています。これは、iOS17で実装されたいくつかのSwiftUIの改良点のひとつに過ぎません。
- キーフレーム修飾子を使用して既に定義されたビューを修正するか、新しいKeyFrameAnimator APIを使用して別のビューを構築することができますが、どちらも同じです。
- しかし、複数の値をまとめてアニメートする必要がある場合は、それらのプロパティを持つ構造体を作成し、それらのプロパティは、keyPathを介してアクセスすることができます。
- SwiftUIで通常行うように、ビューをアニメーション化または修正することができます。
- スプリング、キュービック、リニアなど、コンテンツをアニメーションさせるために利用できる多くのアニメーションキータイプがあります。このビデオでは、私はスプリングとキュービックを組み合わせて使用する予定です。