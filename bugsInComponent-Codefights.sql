/*
This is the solution to the Codefights challenges BugsinComponents -- https://codefights.com/challenge/J4KgQoXNdutJBGARw/main
*/


CREATE PROCEDURE bugsInComponent()
BEGIN
    select Bug.title as bug_title, Component.title as component_title, cant as bugs_in_component
        from(
            select bug_bigger_two,component_id
            from
            (
                select bug_num as bug_bigger_two  
                from BugComponent      
                group by bug_num
                having count(*)>1) 
                    as bbt left join BugComponent on bug_bigger_two = BugComponent.bug_num
            ) as bugcom left join
            (
                select component_id,count(*) as cant
                from BugComponent
                group by component_id
            ) as comp_cant on bugcom.component_id = comp_cant.component_id
            join Bug on Bug.num=bug_bigger_two
            join Component on bugcom.component_id = Component.id
    
        order by bugs_in_component desc, id, num
    ;
END