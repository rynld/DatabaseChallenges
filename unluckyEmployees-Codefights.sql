/*
This is the solution to the Codefights challenges unluckyEmployees -- https://codefights.com/challenge/XfJHK58ksduhL9MCQ
*/

CREATE PROCEDURE unluckyEmployees()
BEGIN
    select dep_name, IFNULL(emp_number, 0) as emp_number, IFNULL(total_salary, 0)  as total_salary
    from(
            select *,@rn := @rn + 1 as rn
            from
            (
                select Department.name as dep_name, count(department) as emp_number, sum(salary) as total_salary
                from Employee right join Department on Employee.department = Department.id
                group by Department.id
                having count(department) < 6 
                order by sum(salary) desc, count(department) desc, Department.id asc
            ) as t  join (select @rn := 0) i 
        ) as r
    where r.rn%2=1
    
;
END