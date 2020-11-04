# アプリケーション名：L-searcher

# アプリケーション概要
- 本アプリケーションでは、フォローしているユーザーのその日のスケジュールをタイムラインで確認できます。ユーザーは自分のタスクのない時間（空き時間）を登録することで、予定確認のような無駄なメッセージの排除が可能になります。それぞれのユーザーIDを用いてフォローを行うので第三者にスケジュールを知られることはありません。

# 制作の背景
- 私は友達と複数人でプレイをするゲームをする際に、 『この時間空いてるかな？』『土日はバイトだったっけ？』などと考えることがよくありました。満を辞してメッセージを送ってみたら案の定予定が入っていたり、、、
- 帰省をした際などに久しぶりに飲み会に誘いたい友達がいたとして、その人は今どこに住んでいるのだろうと思うことが多々ありました。

このような問題を解決するべく、知人のその日空いてる時間帯が一覧に表示できるようにしました。

# 主な機能
- ユーザー機能
- スケジュール機能
- ユーザー検索機能（ユーザーID）
- フォロー機能
- タイムライン表示機能
- DM（ダイレクトメッセージ）機能
- 通知機能
- お気に入り機能

# URL：

# テストアカウント

ゲストログインから簡単ログインが可能です。

# 利用方法
- 新規登録後、”スケジュール登録”から各曜日の空いている時間帯と居住地を記入します。（※ゲストログインは登録済み）

- スケジュールの登録が完了すると、”マイページ”で確認ができます。このとき自分のユーザーIDも確認することができます。

- トップページの”ユーザー検索”から先ほどのユーザーIDを用いて別アカウントを検索することができます。  （ゲスト1でログインした場合はゲスト2のIDを検索してください。）

- 検索されたIDが一致すると、リンクが生成されますので遷移先でアカウントをフォローすることができます。（フォロー後、ユーザーのお気に入り登録も可能です）
※フォロー済みの場合は、解除後、フォローをお願い致します。
フォロー成功後、同ページのリンクから対象のアカウントにDM（ダイレクトメッセージ）を送ることができます。

- トップページの”タイムライン”から、フォローしたユーザーが当日の曜日のスケジュールを登録していた場合のみ表示されます。

- トップページの”ルーム一覧”から、作成済みのルームが確認できます。

- タイトルバナーの回転している"★"マークをクリックすると、お気に入りに登録したユーザーの一覧ページに遷移します。また、お気に入り一覧ページの"お気に入りタイムライン"のリンクから、お気に入りのみのタイムラインが表示されるページに遷移可能です。

- トップページ上部の”通知”から、別アカウントからのフォローやDMを受け取った際の履歴が表示されます。  （ゲスト1からゲスト2に対してDMを送った場合は、ログアウト後にゲスト2でログインしていただくと、通知を確認できます）

- 各機能の確認後、ログアウトをお願いします。


# 環境・使用技術

## フロントエンド  
- HTML/CSS
- JavaScript
- jQuery

## バックエンド  
- Ruby 2.6.5
- Rails 6.0.3

## Webサーバー  
- Nginx : 1.18.0

## アプリケーションサーバー  
- （開発環境）Puma : 4.3.3
- （本番環境）Unicorn : 5.4.1

## データベース  
- （開発環境）MySQL 5.6.47
- （本番環境）MariaDB : 5.5.64

## インフラ  
- AWS (EC2, S3, VPC, Route53, ALB, ACM)
- Git, GitHub
- Capistrano : 3.14.1

## ER図

![ER](/app/assets/images/l-searcher.png)

# テスト
- RSpec

単体：80個、結合：14個

合計：94個
