/*
Task_distance
Цель: Найти топ-10 квартир, максимально приближанных к центру города (ориентир - 13.4050, 52.5200).
Привести данные к нужному формату.
Вывести ценник за неделю по каждому пункту (учитываем минимально возможное кол-во дней для брони - 6).
*/
SELECT 
    id,
    host_id,
    room_type,
    cast(minimum_nights as integer)                             minimum_nights,
    (toFloat64OrNull(replaceRegexpAll(price, '[$,]', '')))*7    week_price,
    toFloat64OrNull(latitude)                                   latitude,
    toFloat64OrNull(longitude)                                  longitude,
    geoDistance(13.4050, 52.5200, longitude, latitude)          dist
FROM listings
WHERE minimum_nights  <= 6
ORDER BY 8 
LIMIT 10