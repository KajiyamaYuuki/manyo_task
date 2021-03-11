# README

# Taskテーブル
| id | title | content | created_at | updated_at |
|:--:|:-----:|:-------:|:----------:|:----------:|
| td |  td   |   td    |     td     |     td     |


# Herokuデプロイ手順
1. Herokuにログインする
```
  $ heroku login
```
以下のメッセージが表示されたら、何かしらのキーを入力する
```
  heroku: Press any key to open up the browser to login or q to exit:
```
入力すると、ブラウザが起動し、ログイン画面が表示されるので、画面の指示に従い、「Log In」をクリック
<br>

2. アセットプリコンパイルをする
アセット（app/assets/以下のファイルの総称）を本番環境で実行できる形式に変換する
```
  $ rails assets:precompile RAILS_ENV=production
```
<br>

3. git commit コマンドを使用してコミットする
```
  $ git add -A
  $ git commit -m "init"
```
<br>

4. Herokuに新しいアプリケーションを作成
```
  $ heroku create
```
<br>

5. Herokustackを変更する
```
  $ heroku stack:set heroku-18
```
<br>

6. Heroku buildpackを追加する
作成したアプリケーションをHeroku上でコンパイルするためのもの
```
  $ heroku buildpacks:set heroku/ruby
  $ heroku buildpacks:add --index 1 heroku/nodejs
```
<br>

7. Herokuにデプロイする
```
  $git push heroku master
```
<br>

8. データベースの移行
マイグレーションを手動で実行する必要がある
```
  $ heroku run rails db:migrate
```

9. アプリケーションにアクセスする
Herokuアプリのアドレスは、https://アプリ名.herokuapp.com/のように設定されています
```
  $ heroku config
```
上記のコマンドでアプリ名を確認することができる
