--  Ver el total de visitantes por año (Una tendencia General)
SELECT Anio, SUM(Visitantes) as Total_Anual
FROM llegadas
GROUP BY Anio
ORDER BY Anio;

--  Comparación de Impacto: 2019 (Pre-Pandemia) vs 2020 (Pandemia)
SELECT 
    Tipo_Ingreso,
    SUM(CASE WHEN Anio = 2019 THEN Visitantes ELSE 0 END) as Antes_COVID,
    SUM(CASE WHEN Anio = 2020 THEN Visitantes ELSE 0 END) as Durante_COVID,
    ROUND(((SUM(CASE WHEN Anio = 2020 THEN Visitantes ELSE 0 END) - SUM(CASE WHEN Anio = 2019 THEN Visitantes ELSE 0 END)) * 100.0 / SUM(CASE WHEN Anio = 2019 THEN Visitantes ELSE 0 END)), 2) as Porcentaje_Caida
FROM llegadas
GROUP BY Tipo_Ingreso;

-- Identificar la vía de ingreso que más rápido se recuperó en 2023
SELECT Tipo_Ingreso, Visitantes as Total_2023
FROM llegadas
WHERE Anio = 2023
ORDER BY Visitantes DESC;