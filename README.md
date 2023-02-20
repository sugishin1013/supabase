# Supabase(local)

[Supabase](https://supabase.com/)

```
# Dockerをインストール・起動

# プロジェクトのディレクトリ作成
Supabaseのサイトでアカウント作成し、

https://app.supabase.com/account/tokens

でアクセストークンを作成

# Supabase CLIのインストール
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
http://localhost:54323
```

## References

https://supabase.com/docs/guides/cli/local-development

https://zenn.dev/razokulover/articles/db984ebfcf4bf6
