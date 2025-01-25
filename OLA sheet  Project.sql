create database ola;
use ola;


create view successful_bookings as
select * from bookings
where booking_status = 'success';
select * from successful_bookings;


create view ride_distance_for_each_vehicle as
select vehicle_type, avg(ride_distance)
as avg_distance from bookings
group by vehicle_type;
select * from ride_distance_for_each_vehicle;


create view canceled_by_coustomer as
select count(*) from bookings
where booking_status = 'canceled by coustomer';
select * from canceled_by_coustomer;


create view top_5_customer as
select customer_id, count(booking_id) as total_rides from bookings
group by customer_id 
order by total_rides desc limit 5;
select* from top_5_customer;


create view rides_canceled_by_drivers_personal_car_issues as
select count(*) from bookings where canceled_rides_by_driver = 'personal & car related issue';
select * from rides_canceled_by_drivers_personal_car_issues;


create view max_min_driver_rating as 
select max(driver_ratings) as max_rating,
min(driver_ratings) as min_rating
from bookings where vehicle_type = 'prime sedan'; 
select * from max_min_driver_rating;


create view upi_payment as
select * from bookings where payment_method = 'upi';
select * from upi_payment ;


create view  avg_customer_rating as
select vehicle_type, avg(customer_rating) as avg_customer_rating from bookings
group by vehicle_type;
select * from avg_customer_rating;


create view total_successful_ride_value as
select sum(booking_value) as total_successful_ride_value from bookings
where booking_status = 'success';
select * from total_successful_ride_value;


create view incomplete_rides_reason as
select booking_id, incomplete_rides_reason from bookings 
where incomplete_rides = 'yes';
select * from incomplete_rides_reason;
















