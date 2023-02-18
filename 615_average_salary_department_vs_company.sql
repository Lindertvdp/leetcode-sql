WITH average_wage AS (
    SELECT DATE_FORMAT(s.pay_date,'%Y-%m') pay_month, avg(s.amount) avg_company
    FROM Salary s 
    JOIN Employee e on e.employee_id = s.employee_id
    GROUP BY DATE_FORMAT(s.pay_date,'%Y-%m')
),
average_wage_by_department AS (
    SELECT DATE_FORMAT(s.pay_date,'%Y-%m') date, avg(s.amount) avg_department, department_id
    FROM Salary s 
    JOIN Employee e on e.employee_id = s.employee_id
    GROUP BY DATE_FORMAT(s.pay_date,'%Y-%m'), department_id
)
SELECT pay_month, department_id, CASE WHEN department.avg_department > company.avg_company then 'higher'
                                      WHEN department.avg_department < company.avg_company then 'lower'
                                      ELSE 'same'
                                  END AS comparison
FROM average_wage company
JOIN average_wage_by_department department ON company.pay_month = department.date


