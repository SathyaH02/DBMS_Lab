select s.ename from employee s join employee t on s.empno=t.mgrno 
group by s.empno,s.ename 
having count(t.empno)=(select max(emp_count) 
						from (select count(*) as emp_count from employee group by mgrno) as sub
					  );

SELECT e.ename
FROM employee e
JOIN employee m ON e.empno = m.mgrno
GROUP BY e.empno, e.ename, e.sal
HAVING e.sal > AVG(m.sal);

SELECT DISTINCT d.deptno,
       s2.ename AS second_level_manager
FROM employee e
JOIN employee s1 ON e.mgrno = s1.empno      -- first-level manager
JOIN employee s2 ON s1.mgrno = s2.empno     -- second-level manager
JOIN employee d  ON e.deptno = d.deptno     -- to get department
ORDER BY d.deptno, s2.ename;

SELECT e.*
FROM employee e
JOIN incentives i ON e.empno = i.empno
WHERE MONTH(i.incDate) = 1
  AND YEAR(i.incDate) = 2019
  AND i.incAmt = (
      SELECT MAX(incAmt)
      FROM incentives
      WHERE MONTH(incDate) = 1
        AND YEAR(incDate) = 2019
        AND incAmt < (
            SELECT MAX(incAmt)
            FROM incentives
            WHERE MONTH(incDate) = 1
              AND YEAR(incDate) = 2019
        )
  );
