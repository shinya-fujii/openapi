use manage_docs;

create table organization(
    id char(36) primary key
);

create table join_organization(
    organization_id char(36) references organization(id) on delete cascade,
    user_id char(36) references user(id) on delete cascade,
    registered_at timestamp not null,
    primary key (organization_id, user_id)
);

create table user(
    id char(36) primary key,
    name text not null
);

create table user_icon(
    user_id char(36) primary key references user(id) on delete cascade,
    icon_path text not null
);

create table article(
    id char(36) primary key,
    title text not null,
    content text not null
);

create table post_article(
    article_id char(36) references article(id) on delete cascade,
    user_id char(36) references user(id) on delete cascade,
    registered_at timestamp not null,
    primary key (article_id, user_id)
);

