-- Combinaciones de productos m�s populares en SanSalvador
SELECT
    'SanSalvador' AS Departamento,
    'El Salvador' AS Pais,
    'Combinacion de San Salvador' AS Categoria,
    CONCAT_WS(',',
        CASE WHEN [Rosas] = 1 THEN 'Rosas' ELSE NULL END,
        CASE WHEN [Claveles] = 1 THEN 'Claveles' ELSE NULL END,
        CASE WHEN [Macetas] = 1 THEN 'Macetas' ELSE NULL END,
        CASE WHEN [Tierra] = 1 THEN 'Tierra' ELSE NULL END,
        CASE WHEN [Girasoles] = 1 THEN 'Girasoles' ELSE NULL END,
        CASE WHEN [Hortensia] = 1 THEN 'Hortensia' ELSE NULL END,
        CASE WHEN [Globos] = 1 THEN 'Globos' ELSE NULL END,
        CASE WHEN [Tarjetas] = 1 THEN 'Tarjetas' ELSE NULL END,
        CASE WHEN [fOrquídias] = 1 THEN 'FOrqu�dias' ELSE NULL END,
        CASE WHEN [Carmesí] = 1 THEN 'Carmes�' ELSE NULL END,
        CASE WHEN [Lirios] = 1 THEN 'Lirios' ELSE NULL END,
        CASE WHEN [Aurora] = 1 THEN 'Aurora' ELSE NULL END,
        CASE WHEN [Tulipanes] = 1 THEN 'Tulipanes' ELSE NULL END,
        CASE WHEN [Listón] = 1 THEN 'List�n' ELSE NULL END
    ) AS Combinacion,
    COUNT(*) AS TotalVentas
FROM SanSalvador_i20191007
WHERE
    [Rosas] = 1 OR
    [Claveles] = 1 OR
    [Macetas] = 1 OR
    [Tierra] = 1 OR
    [Girasoles] = 1 OR
    [Hortensia] = 1 OR
    [Globos] = 1 OR
    [Tarjetas] = 1 OR
    [fOrquídias] = 1 OR
    [Carmesí] = 1 OR
    [Lirios] = 1 OR
    [Aurora] = 1 OR
    [Tulipanes] = 1 OR
    [Listón] = 1
GROUP BY
    CONCAT_WS(',',
        CASE WHEN [Rosas] = 1 THEN 'Rosas' ELSE NULL END,
        CASE WHEN [Claveles] = 1 THEN 'Claveles' ELSE NULL END,
        CASE WHEN [Macetas] = 1 THEN 'Macetas' ELSE NULL END,
        CASE WHEN [Tierra] = 1 THEN 'Tierra' ELSE NULL END,
        CASE WHEN [Girasoles] = 1 THEN 'Girasoles' ELSE NULL END,
        CASE WHEN [Hortensia] = 1 THEN 'Hortensia' ELSE NULL END,
        CASE WHEN [Globos] = 1 THEN 'Globos' ELSE NULL END,
        CASE WHEN [Tarjetas] = 1 THEN 'Tarjetas' ELSE NULL END,
        CASE WHEN [fOrquídias] = 1 THEN 'FOrqu�dias' ELSE NULL END,
        CASE WHEN [Carmesí] = 1 THEN 'Carmes�' ELSE NULL END,
        CASE WHEN [Lirios] = 1 THEN 'Lirios' ELSE NULL END,
        CASE WHEN [Aurora] = 1 THEN 'Aurora' ELSE NULL END,
        CASE WHEN [Tulipanes] = 1 THEN 'Tulipanes' ELSE NULL END,
        CASE WHEN [Listón] = 1 THEN 'List�n' ELSE NULL END
    )
HAVING COUNT(*) > 0
ORDER BY TotalVentas DESC;
