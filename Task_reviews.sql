-- Task_distance
-- Цель: Найти доступные (available='t') объявления, у которых число отзывов от уникальных пользователей выше среднего.
-- Создать подзапрос
-- Объединить таблицы
-- Вывести топ 10 объявлений по заданному запросу и кол-во отзывов по каждому из них


WITH
(SELECT AVG(review_num) FROM (SELECT COUNT(DISTINCT(reviewer_id)) review_num, listing_id  FROM reviews GROUP BY listing_id)) AS avg_review


SELECT
    listing_id,
    review_num
FROM (
    SELECT
        COUNT(DISTINCT(reviewer_id)) review_num,
        listing_id
    FROM reviews
    GROUP BY listing_id
    ) AS r
JOIN (
    SELECT
        listing_id
    FROM calendar_summary
    WHERE available='t' 
    GROUP BY listing_id
    ) AS c
ON
	c.listing_id = r.listing_id
WHERE review_num > avg_review  
ORDER BY listing_id
LIMIT 10