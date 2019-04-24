-- create table movie (
-- 	movie_id serial primary key,
--   title varchar,
--   media_type_id integer references media_type
--     -- if we leave off (media_type_id), references automatically uses the primary key
-- );

-- insert into movie (title, media_type_id)
-- values ('Dark Knight', 3);

-- select * 
-- from movie as m -- this is aliasing, m referes to the tble "movie" now
-- join media_type mt -- also aliasing, but with optional "as" keyword
-- on m.media_type_id = mt.media_type_id;

-- alter table movie
-- add column genre_id integer references genre
-- ;

-- insert into movie (title, media_type_id, genre_id)
-- values ('hot rod', 3, 22)
-- ;

-- select *
-- -- m.movie_id, m.title, mt.media_type_id, mt.name as "media type", g.genre_id, g.name
-- 		-- this removes the duplicate columns 
-- from movie as m
-- join media_type mt
-- on m.media_type_id = mt.media_type_id
-- join genre g
-- on m.genre_id = g.genre_id
-- ;

-- update movie 
-- set genre_id = 21
-- where movie_id = 1
-- ;

-- select * from track
-- where genre_id in (
--   select genre_id 
--   from genre
--   where name = 'Jazz' or name = 'Blues'
-- );

-- update employee
-- set phone = null
-- where employee_id = 1;

-- select * from employee
-- where phone is null; -- we use "is" and not "=" when dealing with null

-- select *
-- from customer
-- where company is null;

-- select ar.name, count(*) --how many albums total
-- from artist as ar
-- join album as al
-- on ar.artist_id = al.artist_id
-- group by ar.artist_id
-- order by count(*) desc;


-- select all albums who have earned more than $20
select title from album
where album_id in (
  select track.album_id
  from invoice_line as inv
  join track on track.track_id = inv.track_id
  group by track.album_id
  having sum(inv.unit_price * inv.quantity) > 20
  )
;
