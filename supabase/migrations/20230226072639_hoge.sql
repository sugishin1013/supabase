create table "public"."hoge" (
    "id" integer generated always as identity not null,
    "name" text
);


CREATE UNIQUE INDEX hoge_pkey ON public.hoge USING btree (id);

alter table "public"."hoge" add constraint "hoge_pkey" PRIMARY KEY using index "hoge_pkey";


