Karpov.courses Проект: вариант 2

### Задание 1

### basket_pattern.ipynb

		1. Окружающая среда

		import pandas as pd
		import numpy as np
		import itertools

		2. Описание проблемы

		Необходимо найти патерны покупок, что позволит оптимизировать размещение продуктов в магазине, для удобства пользователей и увеличения выручки.

		3. Набор данных

		id – означает покупку (в одну покупку входят все товары, купленные пользователем во время 1 похода в магазин)
		Товар – наименование товара
		Количество – число единиц купленного товара

		4. Подготовка данных

		5. функция basket_pattern

		Функция basket_pattern(column: pd.core.series.Series, num_of_common: int, num_of_comb: int) требует на вход pd.Series каждая строчка которой представляет собой лист, состоящий из покупки одного клиента с перечнем товаров, затем количество товаров, которые покупаю чаще всего вместе (в задании - 2), сколько паттернов нужно отобразить в таблице.
		Функция возвращает запрашиваемую таблицу.

### Задание 2

### sales_forecast.ipynb

		1. Окружающая среда

		import pandas as pd
		import datetime
		import numpy as np
		import matplotlib.pyplot as plt
		from sklearn.linear_model import LinearRegression
		from sklearn.metrics import mean_squared_error, r2_score
		import seaborn as sns

		2. Описание проблемы

		Необходимо спрогнозировать объем заказов в ближайшие три месяца понелельно

		3. Набор данных

		date – дата
		sales - объем заказов 

		4. Подготовка данных
		перевод даты в TimeStamp формат

		5. Для решения задачи использовалась Просталя линейная регрессия
		Проанализированы основные метрики оценки эффективности модели

### Задание 3

### sql_example.sql

        1. Описание проблемы

        Написать запрос, чтобы получить такую таблицу

		purchase_date – дата покупки
		purchase_id – id покупки
		client_id – id покупателя
		client_age – возраст покупателя
		client_registration_age – как долго человек пользуется вашими магазинами
		client_category – содержит new или old, если это первая или последующая покупка соответственно
		promotion_name – акция
		category_name – категория
		partner_name – партнёр
		client_city – город, где находится покупатель
		city – город
		revenue – сумма выручки
		quantity – число проданных единиц
		При этом в таблице должны присутствовать только значения, где в поле status стоит значение 1, и только те, где purchase_date находится в диапазоне от 01.05.2020 до 01.08.2020

        2. Структура таблиц в базе данных

		#### city
		city_id – id города, где проходит акция
		client_city_id – id города, где находится покупатель
		city – город
		client_city – город, где находится покупатель
		client
		client_id – id покупателя
		client_city_id – id города, где находится покупатель
		birth_date – дата рождения покупателя
		registration – дата регистрации покупателя

		#### promotion
		promotion_id – id акции
		category_id – id категории
		promotion_name – акция
		category_name – категория
		partner_id – id партнёра
		partner_name – партнёр

		#### purchase
		purchase_id – id покупки
		partner_id – id партнёра
		client_id – id покупателя
		city_id – id города
		promotion_id – id акции
		category_id – id категории
		purchase_date – дата покупки
		price – цена за единицу товара
		quantity – число проданных единиц
		status – статус покупки

		3. Пример SQL запроса
