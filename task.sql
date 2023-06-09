--Найти информацию о всех контрактах, связанных с сотрудниками департамента «Logistic». Вывести: contract_id, employee_name

     SELECT ex.contract_id, em.name FROM employees em
     JOIN department dp ON em.department_id = dp.id
     JOIN executor ex ON em.id = ex.tab_no
     WHERE dp.name = 'Logistic'

     --Найти среднюю стоимость контрактов, заключенных  сотрудником IvanIvanov. Вывести: среднее значение amount

SELECT ROUND(AVG(cn.amount), 2) FROM employees em
     JOIN executor ex ON em.id = ex.tab_no
	 JOIN contract cn ON ex.contract_id = cn.id
WHERE em.name = 'Ivan Ivanov'

--Найти самую часто встречающуюся локации среди всех заказчиков. Вывести: location, count

SELECT location, COUNT(location) FROM customer
GROUP BY location
ORDER BY COUNT(location)
DESC
LIMIT 1

--Найти контракты одинаковой стоимости. Вывести count, amount

SELECT amount, COUNT(amount) FROM contract
GROUP BY amount 
HAVING COUNT(amount) > 1

--Найти заказчика с наименьшей средней стоимостью контрактов. Вывести customer_name, среднее значение amount

SELECT cu.customer_name, ROUND(AVG(cn.amount), 2) FROM executor ex
     JOIN contract cn ON ex.contract_id = cn.id
	 JOIN customer cu ON cn.customer_id = cu.id
GROUP BY cu.customer_name
ORDER BY AVG(cn.amount)
ASC
LIMIT 1

--Найти отдел, заключивший контрактов на наибольшую сумму. Вывести: department_name, sum

SELECT dp.name, SUM(amount) FROM employees em
     JOIN department dp ON em.department_id = dp.id
	 JOIN executor ex ON em.id = ex.tab_no
	 JOIN contract cn ON ex.contract_id = cn.id
GROUP BY dp.name
ORDER BY SUM(amount)
DESC
LIMIT 1
