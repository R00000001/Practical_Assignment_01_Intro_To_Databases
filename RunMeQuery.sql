-- магістр СТЕ, створив 3 експрешина
with dog_details as (
    select 
        dog.dog_id,
        dog.dog_name,
        dog.dog_age,
        dog_color.fur_color,
        dog_eye_color.eye_color,
        owner.owner_name,
        country.country_code
    from dog
    join dog_color on dog.dog_fur_color_id = dog_color.dog_color_id
    join dog_eye_color on dog.dog_eye_color_id = dog_eye_color.dog_eye_color_id
    join owner on dog.owner_id = owner.owner_id
    join country on dog.dog_country_id = country.dog_country_id
), -- джойнить всі таблиці через inner join

dogs_age_2_or_more as (
    select country_code, dog_id
    from dog_details
    where dog_age >= 2
), -- фільтрує всіх собак в 2+= років категорію

dogs_younger_than_2 as (
    select country_code, dog_id
    from dog_details
    where dog_age < 2
) -- фільтрує всіх собак в 2- років категорію

select country_code, count(*) as dog_count, 'age >= 2' as age_group
from dogs_age_2_or_more -- тільки песики старші 2-х років, або просто 2-х років
group by country_code -- групую по країні
having count(*) >= 2 -- фільтрую по кількості з 2 та більше песиків

union -- поєдную, тут все рівно union чи union all (логічно)

select country_code, count(*) as dog_count, 'age < 2' as age_group
from dogs_younger_than_2 -- тільки песики молодшці 2-х років
group by country_code --  групую по країні
having count(*) >= 2 -- фільтрую по кількості з 2 та більше песиків

order by country_code, age_group
limit 3; -- видасть тільки 3 рекорда відсортовані по алфавіту, але краще прибрати 



