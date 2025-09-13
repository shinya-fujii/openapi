create table organization(
    id: uuid primary key,
);

create table organization_member(
    organization_id: uuid references organization(id),
    user_id: uuid references user(id),
    registered_at: timestamp with time zone default now(),
    primary key (organization_id, user_id)
);

create table user(
    id: uuid primary key,
);

create table article(
    id: uuid primary key
);

