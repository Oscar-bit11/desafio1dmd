use diego;

select * from SpaCentro_m20191007;
select * from SpaEscalon_i20191007;
select * from SpaSantaTecla_m20191007;

---VISIITAS POR SUCURSAL
SELECT
    'SpaCentro_m20191007' AS Sucursal,
    SUM(PromVisit) AS Total_PromVisit
FROM SpaCentro_m20191007
UNION ALL
SELECT
    'SpaEscalon_i20191007' AS Sucursal,
    SUM(PromVisit) AS Total_PromVisit
FROM SpaEscalon_i20191007
UNION ALL
SELECT
    'SpaSantaTecla_m20191007' AS Sucursal,
    SUM(PromVisit) AS Total_PromVisit
FROM SpaSantaTecla_m20191007;

------------------------------------------------------------------------
--INGRESOS POR SUCURSAL
SELECT Sucursal,
       ROUND(SUM(Ingresos), 2) AS Total_Ingresos
FROM (
    SELECT 'SpaCentro_m20191007' AS Sucursal, Ingresos FROM SpaCentro_m20191007
    UNION ALL
    SELECT 'SpaEscalon_i20191007' AS Sucursal, Ingresos FROM SpaEscalon_i20191007
    UNION ALL
    SELECT 'SpaSantaTecla_m20191007' AS Sucursal, Ingresos FROM SpaSantaTecla_m20191007
) AS Subconsulta
GROUP BY Sucursal;
------------------------------------------------------------------------
--INGRESOS EN GENERAL POR LA EMPRESA
SELECT
    'Total Ingresos' AS Descripcion,
    ROUND(SUM(Ingresos),2) AS Total
FROM (
    SELECT Ingresos FROM SpaCentro_m20191007
    UNION ALL
    SELECT Ingresos FROM SpaEscalon_i20191007
    UNION ALL
    SELECT Ingresos FROM SpaSantaTecla_m20191007
) AS Subconsulta;

-----------------------------------------------------------------------------
--CANTIDAD DE HOMBRES Y MUJERES POR SUCURSALES
--CENTRO
SELECT
    'Sucursal centro' AS Tabla,
    SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) AS Total_Hombres,
    SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) AS Total_Mujeres
FROM SpaCentro_m20191007

UNION ALL
--ESCALON
SELECT
    'Sucursal Escalon' AS Tabla,
    SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) AS Total_Hombres,
    SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) AS Total_Mujeres
FROM SpaEscalon_i20191007

UNION ALL
--SANTATECLA
SELECT
    'Sucursal Escalon' AS Tabla,
    SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) AS Total_Hombres,
    SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) AS Total_Mujeres
FROM SpaSantaTecla_m20191007;

-------------------------------------------------------
--TOTAL DE HOMBRES Y MUJERES CLIENTES EN TODA LA EMPRESA
SELECT
    'Total' AS Tabla,
    SUM(CASE WHEN Sexo = 1 THEN 1 ELSE 0 END) AS Total_Hombres,
    SUM(CASE WHEN Sexo = 0 THEN 1 ELSE 0 END) AS Total_Mujeres
FROM (
    SELECT Sexo FROM SpaCentro_m20191007
    UNION ALL
    SELECT Sexo FROM SpaEscalon_i20191007
    UNION ALL
    SELECT Sexo FROM SpaSantaTecla_m20191007
) AS TodasLasTablas;
-----------------------------------------------------------------------------
--USO DE GRUPOS DE PERSONAS MAYORES A 35 AÑO
--CENTRO

SELECT 'Sauna' AS Grupo, SUM(CASE WHEN Sauna = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007
UNION ALL
SELECT 'Masaje' AS Grupo, SUM(CASE WHEN Masaje = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007
UNION ALL
SELECT 'Yoga' AS Grupo, SUM(CASE WHEN Yoga = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007
UNION ALL
SELECT 'Hidro' AS Grupo, SUM(CASE WHEN Hidro = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007;

--ESCALON

SELECT 'Sauna' AS Grupo, SUM(CASE WHEN Sauna = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007
UNION ALL
SELECT 'Masaje' AS Grupo, SUM(CASE WHEN Masaje = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007
UNION ALL
SELECT 'Yoga' AS Grupo, SUM(CASE WHEN Yoga = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007
UNION ALL
SELECT 'Hidro' AS Grupo, SUM(CASE WHEN Hidro = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007;

--SANTATECLA

SELECT 'Sauna' AS Grupo, SUM(CASE WHEN Sauna = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007
UNION ALL
SELECT 'Masaje' AS Grupo, SUM(CASE WHEN Masaje = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007
UNION ALL
SELECT 'Yoga' AS Grupo, SUM(CASE WHEN Yoga = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007
UNION ALL
SELECT 'Hidro' AS Grupo, SUM(CASE WHEN Hidro = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007;

--USO DE GRUPOS DE PERSONAS MAYORES A 35 AÑOS EN TODAS LAS SUCURSALES
SELECT Grupo, SUM(Cantidad) AS Total
FROM (
    -- SpaCentro_m20191007
    SELECT 'Sauna' AS Grupo, SUM(CASE WHEN Sauna = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007
    UNION ALL
    SELECT 'Masaje' AS Grupo, SUM(CASE WHEN Masaje = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007
    UNION ALL
    SELECT 'Yoga' AS Grupo, SUM(CASE WHEN Yoga = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007
    UNION ALL
    SELECT 'Hidro' AS Grupo, SUM(CASE WHEN Hidro = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaCentro_m20191007
    
    UNION ALL
    
    -- SpaEscalon_i20191007
    SELECT 'Sauna' AS Grupo, SUM(CASE WHEN Sauna = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007
    UNION ALL
    SELECT 'Masaje' AS Grupo, SUM(CASE WHEN Masaje = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007
    UNION ALL
    SELECT 'Yoga' AS Grupo, SUM(CASE WHEN Yoga = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007
    UNION ALL
    SELECT 'Hidro' AS Grupo, SUM(CASE WHEN Hidro = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaEscalon_i20191007
    
    UNION ALL
    
    -- SpaSantaTecla_m20191007
    SELECT 'Sauna' AS Grupo, SUM(CASE WHEN Sauna = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007
    UNION ALL
    SELECT 'Masaje' AS Grupo, SUM(CASE WHEN Masaje = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007
    UNION ALL
    SELECT 'Yoga' AS Grupo, SUM(CASE WHEN Yoga = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007
    UNION ALL
    SELECT 'Hidro' AS Grupo, SUM(CASE WHEN Hidro = 1 AND Edad > 35 THEN 1 ELSE 0 END) AS Cantidad FROM SpaSantaTecla_m20191007
) AS Subconsulta
GROUP BY Grupo;

