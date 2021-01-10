# L-searcher

# URL：https://l-searcher.herokuapp.com/
(旧URL：https://l-searcher.com/)
## ※2021年1月10日にデプロイ先をAWSからherokuに変更いたしました。

# アプリケーション概要
- 知人の暇な時間帯を簡単に確認できるアプリケーションです。いつ誰が暇なのかを把握することで、知人に予定を確認する手間などを省くことを目的として作成しました。

# 制作の背景
- 友達とオンラインゲームをする機会が多かったのですが、誰がいつ暇なのかを一覧で確認できるようにすればスムーズに誘うことができるのではないかと考え、このアプリケーションを作成しました。

# 主な機能
- ユーザー機能
- スケジュール機能
- ユーザー検索機能
- フォロー機能
- タイムライン表示機能
- DM（ダイレクトメッセージ）機能
- 通知機能
- お気に入り機能

# テストアカウント

右上の"ゲストログイン（1）"から登録済みアカウントにログインできます。

※"ゲストログイン（2）"は通知機能の確認などにご使用ください。

# 利用方法

- 新規登録後、”スケジュール登録”から各曜日ごとに暇な時間帯と居住地を記入します。（※ゲストユーザーは登録済み）
 
  "スケジュールの変更"のリンクから変更ができます。

- スケジュールの登録が完了すると、”マイページ”のリンクから登録情報が確認ができます。

- トップページの”ユーザー検索”のリンクからユーザーIDを用いて別アカウントを検索することができます。自分以外のユーザーを検索してください。

  ゲスト（1）のユーザーID：10000000
  
  ゲスト（2）のユーザーID：20000000
  
  ゲスト（3）のユーザーID：30000000

- 検索されたIDが一致するとリンクが生成され、遷移先でアカウントをフォローすることができます。
※フォロー済みの場合は、解除後、フォローをお願い致します。
フォロー後、同ページの"DMルームへ"のリンクから対象のアカウントにDM（ダイレクトメッセージ）を送ることができます。
作成済みのルームはトップページの"ルーム一覧"のリンクから確認できます。

- トップページの”タイムライン”のリンクをクリックすると、フォローしたユーザーの当日のスケジュール（暇な時間帯）が一覧になって表示されます。

- タイトルバナーの回転している"★"マークをクリックすると、お気に入りに登録したユーザーの一覧ページに遷移します。また、遷移先右上の"お気に入りタイムライン"のリンクから、お気に入りユーザーのみのタイムラインが表示されるページに遷移可能です。

- トップページ右上にある”通知”のリンクから、別アカウントからのフォローやDMを受け取った際の通知が表示されます。  （ゲスト1からゲスト2に対してDMを送った場合は、ログアウト後にゲスト2でログインしていただくと、通知を確認できます）

- 各機能の確認後、ログアウトをお願いします。


# 環境/使用技術

## フロントエンド  
- HTML/CSS
- JavaScript

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
- AWS (EC2, VPC, Route53, ALB, ACM)
- Git, GitHub
- Capistrano : 3.14.1

## ER図

![ER](/app/assets/images/l-searcher.png)

# テスト
- RSpec

単体：80個,結合：14個

合計：94個



