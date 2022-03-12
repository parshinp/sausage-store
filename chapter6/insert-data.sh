#!/bin/bash

#export PSQL_CONNECTION="postgresql://$PSQL_ADMIN:$PSQL_PASSWORD@$PSQL_HOST:$PSQL_PORT/$PSQL_DBNAME"
PSQL_CONNECTION="postgresql://sa:password@rc1a-5xcy25zgi3jzfg6u.mdb.yandexcloud.net:6432/testdb"

touch init.sql

echo "drop table product;" >> init.sql
echo "drop table orders;" >> init.sql
echo "drop table order_product;" >> init.sql

echo "create table product(id bigint generated by default as identity, name varchar(255) not null, picture_url varchar(255), price double precision);" >> init.sql

echo "insert into product (id, name, picture_url, price) values (1, 'Сливочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320.00);" >> init.sql
echo "insert into product (id, name, picture_url, price) values (2, 'Особая', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 179.00);" >> init.sql
echo "insert into product (id, name, picture_url, price) values (3, 'Молочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 225.00);" >> init.sql
echo "insert into product (id, name, picture_url, price) values (4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315.00);" >> init.sql
echo "insert into product (id, name, picture_url, price) values (5, 'Мюнхенская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 330.00);" >> init.sql
echo "insert into product (id, name, picture_url, price) values (6, 'Русская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 189.00);" >> init.sql

echo "create table orders(id bigint generated by default as identity, status varchar(255), date_created date default current_date);" >> init.sql
echo "create table order_product(quantity integer not null, order_id bigint not null, product_id bigint not null);" >> init.sql

echo "insert into orders (id, status) select i, left(md5(random()::text), 4) from generate_series(1, 10000000) s(i);" >> init.sql
echo "insert into order_product (quantity, order_id, product_id) select floor(1+random()*50)::int, i, 1 + floor(random()*6)::int % 6 from generate_series(1, 10000000) s(i);" >> init.sql

psql $PSQL_CONNECTION -f init.sql

rm -f init.sql
