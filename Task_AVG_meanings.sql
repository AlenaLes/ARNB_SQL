-- Task_AVG_meanings
-- Цель: сгруппировать данные по типу жилья и вывести средние значения цены за ночь, размера депозита и цены уборки. 
-- Преобразовать тип данных при необходимости (есть значки $ и запятых в больших суммах). 
-- Вывести результирующую таблицу

SELECT
    room_type,
    AVG(toFloat64OrNull(replaceRegexpAll(price, '[$,]', ''))) as avg_price,
    AVG(toFloat64OrNull(replaceRegexpAll(security_deposit, '[$,]', ''))) as avg_deposit,
    AVG(toFloat64OrNull(replaceRegexpAll(cleaning_fee, '[$,]', ''))) as avg_cleaning
FROM 
    listings
GROUP BY
    room_type
limit 10