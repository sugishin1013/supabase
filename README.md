# Supabase

[Supabase](https://supabase.com/)

## ローカル開発環境への導入

https://supabase.com/docs/guides/cli/local-development#log-in-to-the-supabase-cli

```
# Dockerをインストール・起動

# プロジェクトのディレクトリ作成
Supabaseのサイトでアカウント作成し、

https://app.supabase.com/account/tokens

でアクセストークンを作成

# Supabase CLIのインストール
https://supabase.com/docs/guides/cli
https://github.com/supabase/cli

# ローカルでSupabaseにログイン、上記で作成したアクセストークンを入力
$ supabase login

# プロジェクトのディレクトリ作成
$ mkdir <my-supabase-project>
$ cd <my-supabase-project>
$ git init

# プロジェクト初期化
$ supabase init

# 起動
$ supabase start

# ローカルのsupabaseダッシュボードを表示
http://localhost:54323/
```

## ローカル DB へのアクセス

https://supabase.com/docs/guides/cli/local-development#access-services

1. Postgres クライアントの[pgAdmin](https://www.pgadmin.org/)をインストール

2. 「$ supabase status」の情報を確認し、サーバーに接続

3. supabase ダッシュボード上で既にテーブルを作成している場合は、「postgres」→「スキーマ」→「public」→「Tables」上で確認できる
