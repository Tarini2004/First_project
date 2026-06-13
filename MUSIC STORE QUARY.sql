-- set 1
-- 1 who is the senior most employee on job title ?
select * from customer 
select employee_id , first_name , last_name, levels from employee 
order by levels desc 
limit 1

-- 2  which country have the most invoice 
select * from invoice 
select * from employee 

select  count(*) as c , billing_country  from invoice
group by billing_country 
order by  c desc ;

--3 what are top 3 values of total invoice ?

select  total from invoice 
order by total desc  
limit 3 

-- 4 which city has the best custmer ? we would like to throw a promotion music 
--festivals in the ciy we made the most money . 
-- write a quary that reurns one city that has highest sum of invoice totals .
-- return both the city name & sum of all invoice totals 

select * from invoice 
select sum(total) as invoice_total , billing_city
from invoice 
group by billing_city
order by invoice_total desc 

--5 whe is the best custmer ? the customer who has spent the most money will be declared the best custmer.
--  write a qaury that returns the person who spent the most money.

select customer.customer_id, customer.first_name ,customer.last_name , sum(invoice.total) as total 
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1


-- moderate set 2 

-- 1 write quary to return the email, name , las name & genre of all rock music listeners .
--return your list ordrs alphabeticallty by email statrting with a 
select * from invoice_line  

select email, first_name, last_name from customer

join invoice on customer.customer_id = invoice.invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id

where track_id in(
      select track_id from track 
	  join genre on track.genre_id = genre.genre_id
	  where genre.name like 'rock'
)
order by email;


--2 lets invite the artist who have written the most rock music in our dataset. 
-- wite a quary that return the artist name and total track count of the top 10 rock bands 

select artist.artist_id, artist.name , count(artist.artist_id)as number_of_song from track

join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id

where genre.name like 'rock'
group by artist.artist_id
order by number_of_song desc 
limit 10;


select * from track

select * from genre

-- 3  return all the track names that have song length longer than the average song length .
--returns the name and milliseconds for each track . order by he song lenth with longest song listed first .

select name , milliseconds from track 
where milliseconds > (
          select avg(milliseconds) as avg_track_lengh from track )
		  order by milliseconds desc ; 
		  






























