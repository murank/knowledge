-- ユーザの称号
drop table if exists USER_BADGES cascade;

create table USER_BADGES (
  USER_ID INTEGER not null
  , NO INTEGER not null
  , INSERT_USER integer
  , INSERT_DATETIME timestamp
  , UPDATE_USER integer
  , UPDATE_DATETIME timestamp
  , DELETE_FLAG integer
  , constraint USER_BADGES_PKC primary key (USER_ID,NO)
) ;

-- アクティビティ
drop table if exists ACTIVITIES cascade;

create table ACTIVITIES (
  NO BIGSERIAL not null
  , USER_ID INTEGER not null
  , TYPE integer not null
  , TARGET BIGINT not null
  , POINT integer not null
  , INSERT_USER integer
  , INSERT_DATETIME timestamp
  , UPDATE_USER integer
  , UPDATE_DATETIME timestamp
  , DELETE_FLAG integer
  , constraint ACTIVITIES_PKC primary key (NO)
) ;

create index IDX_ACTIVITIES_USER_ID
  on ACTIVITIES(USER_ID);

create index IDX_ACTIVITIES_TYPE_TARGET
  on ACTIVITIES(TYPE,TARGET);

-- 称号
drop table if exists BADGES cascade;

create table BADGES (
  NO SERIAL not null
  , NAME character varying(128) not null
  , DISPLAY_TEXT character varying(32) not null
  , DESCRIPTION text
  , IMAGE_CATEGORY integer
  , INSERT_USER integer
  , INSERT_DATETIME timestamp
  , UPDATE_USER integer
  , UPDATE_DATETIME timestamp
  , DELETE_FLAG integer
  , constraint BADGES_PKC primary key (NO)
) ;

comment on table USER_BADGES is 'ユーザの称号';
comment on column USER_BADGES.USER_ID is 'ユーザID';
comment on column USER_BADGES.NO is '番号';
comment on column USER_BADGES.INSERT_USER is '登録ユーザ';
comment on column USER_BADGES.INSERT_DATETIME is '登録日時';
comment on column USER_BADGES.UPDATE_USER is '更新ユーザ';
comment on column USER_BADGES.UPDATE_DATETIME is '更新日時';
comment on column USER_BADGES.DELETE_FLAG is '削除フラグ';

comment on table ACTIVITIES is 'アクティビティ';
comment on column ACTIVITIES.NO is '番号';
comment on column ACTIVITIES.USER_ID is 'ユーザID';
comment on column ACTIVITIES.TYPE is '種類';
comment on column ACTIVITIES.TARGET is 'ターゲットID';
comment on column ACTIVITIES.POINT is '獲得ポイント';
comment on column ACTIVITIES.INSERT_USER is '登録ユーザ';
comment on column ACTIVITIES.INSERT_DATETIME is '登録日時';
comment on column ACTIVITIES.UPDATE_USER is '更新ユーザ';
comment on column ACTIVITIES.UPDATE_DATETIME is '更新日時';
comment on column ACTIVITIES.DELETE_FLAG is '削除フラグ';

comment on table BADGES is '称号';
comment on column BADGES.NO is '番号';
comment on column BADGES.NAME is '名称';
comment on column BADGES.DISPLAY_TEXT is '表示名';
comment on column BADGES.DESCRIPTION is '説明';
comment on column BADGES.IMAGE_CATEGORY is '画像の種類';
comment on column BADGES.INSERT_USER is '登録ユーザ';
comment on column BADGES.INSERT_DATETIME is '登録日時';
comment on column BADGES.UPDATE_USER is '更新ユーザ';
comment on column BADGES.UPDATE_DATETIME is '更新日時';
comment on column BADGES.DELETE_FLAG is '削除フラグ';


ALTER TABLE KNOWLEDGES DROP COLUMN IF EXISTS POINT;
ALTER TABLE KNOWLEDGES ADD COLUMN POINT integer default 0 not null;
comment on column KNOWLEDGES.POINT is 'ポイント';

