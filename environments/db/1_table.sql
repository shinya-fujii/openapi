USE manage_docs;

CREATE TABLE organization(
    id char(36) primary key
);

create table organization_member(
    organization_id char(36) references organization(id) on delete cascade,
    user_id char(36) references user(id) on delete cascade,
    registered_at timestamp default now(),
    primary key (organization_id, user_id)
);

create table user(
    id char(36) primary key,
    name text not null
);

create table user_icon(
    user_id char(36) primary key references user(id) on delete cascade,
    icon_url text not null
);

create table article(
    id char(36) primary key
);

