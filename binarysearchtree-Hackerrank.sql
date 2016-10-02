/*
This is the solution to the Hackerrank challenges bst -- https://www.hackerrank.com/challenges/binary-search-tree-1
*/

select N ,
		case 
			when P is null then 'Root'
			when cant is null then 'Leaf'
            else 'Inner'
		end as Type
from 
(
	select BST.N,BST.P,cant
	from BST left join
	(
	select P ,count(*) as cant from BST 
	group by P
	) as childs on BST.N = childs.P
) as tree
order by N


