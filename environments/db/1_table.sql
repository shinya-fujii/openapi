use manage_docs;

create table organization(
    organization_id char(36) primary key
);

create table user(
    user_id char(36) primary key,
    name text not null
);

create table organization_member(
    organization_id char(36) not null,
    user_id char(36) not null,
    primary key (organization_id, user_id),
    foreign key (user_id) references user(user_id) on delete cascade,
    foreign key (organization_id) references organization(organization_id) on delete cascade
);

create table join_organization(
    organization_id char(36) not null,
    user_id char(36) not null,
    registered_at timestamp not null,
    primary key (organization_id, user_id),
    foreign key (user_id) references user(user_id) on delete cascade,
    foreign key (organization_id) references organization(organization_id) on delete cascade
);

create table user_icon(
    user_id char(36) primary key,
    icon_path text not null,
    foreign key (user_id) references user(user_id) on delete cascade
);

create table article(
    article_id char(36) primary key,
    title text not null,
    content text not null
);

create table article_owner(
    article_id char(36) not null,
    user_id char(36) not null,
    organization_id char(36) not null,
    primary key (article_id, user_id, organization_id),
    foreign key (article_id) references article(article_id) on delete cascade,
    foreign key (user_id) references user(user_id),
    foreign key (organization_id) references organization(organization_id) on delete cascade
);

create table update_article(
    article_id char(36) primary key,
    updated_at timestamp not null,
    foreign key (article_id) references article(article_id) on delete cascade
);

create table post_article(
    article_id char(36) primary key,
    registered_at timestamp not null,
    foreign key (article_id) references article(article_id) on delete cascade
);