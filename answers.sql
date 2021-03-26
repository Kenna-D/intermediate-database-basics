Joins
select * from customer
join invoice_line il on il.invoice_id = i.invoice_id
where il.unit_price > 0.99;

select i.invoice_date, c.first_name, c.last_name, i.total 
from invoice i
join customer c on i.customer_id = c.customer_id;

select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e on c.support_rep_id = e.employee_id;

select al.title, a.name 
from album al
join artist a on al.artist_id = a.artist_id;

select pt.track_id
from playlist_track pt
join playlist  p on pt.playlist_id = p.playlist_id
where p.name = 'Music';

select t.name from track t
join playlist_track pt on t.track_id = pt.track_id
where pt.playlist_id = 5;

select t.name, p.name from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist p on pt.playlist_id = p.playlist_id;

select t.name, a.title from track t
join album a on t.album_id = a.album_id
join genre g on t.genre_id = g.genre_id
where g.name = 'Alternative & Punk';


Nested Queries
select * from invoice
where invoice_id in (select invoice_id from invoice_line where unit_price > 0.99);

select * from playlist_track
where playlist_id in (select playlist_id from playlist where name = 'Music');

select name from track
where track_id in (select track_id from playlist_track where playlist_id = 5);

select * from track
where genre_id in (select genre_id from genre where name = 'Comedy');

select * from track
where album_id in (select  album_id from album where title = 'Fireball');

select * from track
where album_id in
(select album_id from album where artist_id in 
(select artist_id from artist where name = 'Queen'));


Updating Rows
update customer
set fax = null
where fax is not null;

update customer
set company = 'Self'
where company is null;

update customer
set last_name = 'Thompson'
where first_name = 'Julia';

update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';

update track
set composer = 'The darkness around us'
where genre_id = (select genre_id from genre where name = 'Metal') and composer is null;


Group By
select count(*), g.name from track t
join genre g on t.genre_id = g.genre_id
group by g.name;

select count(*), g.name from track t
join genre g on t.genre_id = g.genre_id
where g.name = 'Pop' or g.name = 'Rock'
group by g.name;

select a.name, count(*) from album al
join artist a on a.artist_id = al.artist_id
group by a.name;


Use Distinct
select distinct composer
from track;

select distinct billing_postal_code from invoice;

select distinct company from customer;


Delete Rows
delete from practice_delete where type = 'bronze';

delete from practice_delete where type = 'silver';

delete from practice_delete where value = 150;


E Commerce 
create table users (user_is serial primary key, name text, email varchar(250));
create table products (product_id serial primary key, name text, price int);
create table orders (order_id serial primary key, product_id int references products(product_id), quantity int);

insert into users(name, email)
values ('ken', 'ken@m.com'), ('ben', 'ben@m.com'), ('jen', 'jn@m.com');

insert into products(name, price)
values ('apple', 1), ('shoe', 5), ('hat', 10);

insert into orders (product_id, quantity) 
values (1, 3), (2, 10), (3, 1);

select product_id from order
where order = 1;

select * from orders;
