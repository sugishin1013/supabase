# Supabase のローカル開発環境の構築と GraphQL API へのアクセス

Supabase と GraphQL API 両方に興味があるので、学習用にシンプルな環境を構築してみた

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

## マイグレーション

1. ダッシュボード上の SQL エディタで以下の SQL を実行してサンプルのテーブルを作成

```
create table hoge (
    id integer primary key generated always as identity,
    name text
);
```

`hoge` テーブルが作成されてることをダッシュボード上のテーブルエディタ上で確認

2. 以下のコマンドを実行して、マイグレーションファイルを作成

```
$ supabase db diff -f hoge
```

`2023XXXXXXXXX_hoge.sql`

```
create table "public"."hoge" (
    "id" integer generated always as identity not null,
    "name" text
);

```

3. サンプルデータ追加するためにシーダーを作成する。supabase/seed.sql を新しく作って以下の SQL を追加する。

```
insert into public.hoge (name)
values
  ('Erlich Backman'),
  ('Richard Hendricks'),
  ('Monica Hall');
```

4. 以下のコマンドで、マイグレーションとシーダーのスクリプトを再実行させて、シーダーのデータを反映

```
$ supabase db reset
```

## GraphQL API へのアクセス

1. [Apollo Studio sandbox](https://studio.apollographql.com/sandbox/explorer)にアクセス

2. 設定は[コチラ](https://zenn.dev/monicle/articles/097d93b021f28a#graphql%E3%81%AE%E3%82%A8%E3%83%B3%E3%83%89%E3%83%9D%E3%82%A4%E3%83%B3%E3%83%88%E3%82%92%E5%8F%A9%E3%81%84%E3%81%A6%E3%81%BF%E3%82%8B)を参照

3. 以下のクエリでデータを取得できるか確認

```
query Query {
  hogeCollection {
    edges {
      node {
        name
      }
    }
  }
}
```

## Postgres クライアントからのローカル DB へのアクセス

https://supabase.com/docs/guides/cli/local-development#access-services

1. Postgres クライアントの[pgAdmin](https://www.pgadmin.org/)をインストール

2. 「$ supabase status」の情報を確認し、サーバーに接続

3. supabase ダッシュボード上で既にテーブルを作成している場合は、「postgres」→「スキーマ」→「public」→「Tables」上で確認できる

## 備考

ダッシュボード上から GUI で作成したテーブルはなぜか GraphQL API へのアクセスでデータの取得ができませんでした。

そのため Supabase 上のデータに GraphQL API でアクセスする場合は上記マイグレーションとシーダーのスクリプトでテーブルの作成&データの挿入をおこなう必要があるようです。

## References

https://zenn.dev/monicle/articles/097d93b021f28a
