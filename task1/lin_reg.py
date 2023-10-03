import numpy as np
import pandas as pd

# Загрузка данных
data = pd.read_csv('california_housing_train.csv')

# Определение целевой переменной и признаков
X = data.drop(columns=['median_house_value'])
y = data['median_house_value']

# Обработка отсутствующих значений (заполнение средними значениями)
X.fillna(X.mean(), inplace=True)

# Нормировка данных
X = (X - X.mean()) / X.std()
X['intercept'] = 1  # Добавляем столбец с единицами для учета свободного члена

# Разделение данных на обучающий и тестовый наборы (80% - 20%)
np.random.seed(42)
mask = np.random.rand(len(X)) < 0.8
X_train = X[mask]
y_train = y[mask]
X_test = X[~mask]
y_test = y[~mask]

# Реализация метода наименьших квадратов для первой модели (все признаки)
coefficients1 = np.linalg.lstsq(X_train, y_train, rcond=None)[0]

# Реализация метода наименьших квадратов для второй модели (подмножество признаков)
selected_features = ['median_income', 'total_rooms', 'housing_median_age', 'latitude', 'longitude']
X_train2 = X_train[selected_features]
X_test2 = X_test[selected_features]
coefficients2 = np.linalg.lstsq(X_train2, y_train, rcond=None)[0]

# Реализация метода наименьших квадратов для третьей модели (наиболее значимые признаки)
selected_features = ['median_income', 'total_rooms']
X_train3 = X_train[selected_features]
X_test3 = X_test[selected_features]
coefficients3 = np.linalg.lstsq(X_train3, y_train, rcond=None)[0]

# Получение предсказаний для всех трех моделей
y_pred1 = np.dot(X_test, coefficients1)
y_pred2 = np.dot(X_test2, coefficients2)
y_pred3 = np.dot(X_test3, coefficients3)

# Оценка производительности моделей (коэффициент детерминации)
def r2_score(y_true, y_pred):
    SSR = np.sum((y_pred - y_true)**2)
    SST = np.sum((y_true - np.mean(y_true))**2)
    r2 = 1 - (SSR / SST)
    return r2

r2_1 = r2_score(y_test, y_pred1)
r2_2 = r2_score(y_test, y_pred2)
r2_3 = r2_score(y_test, y_pred3)

# Вывод результатов
print("R-squared for Model 1 (all features):", r2_1)
print("R-squared for Model 2 (subset of features):", r2_2)
print("R-squared for Model 3 (most significant features):", r2_3)
