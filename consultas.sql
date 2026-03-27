SELECT Anio, SUM(Visitantes) as Total_Turistas
FROM llegadas
GROUP BY Anio
ORDER BY Anio;