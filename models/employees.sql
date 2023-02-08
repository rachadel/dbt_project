--model employees
with
    calc_employees as (
        select
            first_name || ' ' || last_name as name,
            date_part(year, current_date) - date_part(year, birth_date) as age,
            date_part(year, current_date)
            - date_part(year, hire_date) as lenghtofservice,
            *
        from {{ source("sources", "employees") }}
    )

select *
from calc_employees
