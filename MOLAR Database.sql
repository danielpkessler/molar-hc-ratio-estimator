-- Create the database if it doesn't exist
-- CREATE DATABASE IF NOT EXISTS MOLAR;
-- Use the database
USE MOLAR;

DROP TABLE IF EXISTS MuestraBiochar;

-- Creacion de tabla MuestraBiochar
CREATE TABLE MuestraBiochar (
    DetailID INT IDENTITY(1,1) PRIMARY KEY,
    SampleID INT,
    Hidrogeno DECIMAL (5, 2),
    Carbon DECIMAL (5, 2),
    Molar_H_Corg_Ratio DECIMAL,
    Biomasa VARCHAR(255),
    TemperaturaCelsius INT,
    TiempoResidenciaHHMM INT,
    BiomasaAlimentada DECIMAL(8, 3),
    BiocharObtenido DECIMAL(8, 3),
    BiocharSampleID AS (
        -- Create a unique primary key for each value and convert time of residence to HHMM format.
        LEFT(Biomasa, 3) + '-' + CAST(TemperaturaCelsius AS VARCHAR(10)) + '-' + RIGHT('00' + CAST(TiempoResidenciaHHMM / 100 AS VARCHAR(2)), 2) + RIGHT('00' + CAST(TiempoResidenciaHHMM % 100 AS VARCHAR(2)), 2)
    )
)



-- Inserciones de datos ficticios
INSERT INTO MuestraBiochar (SampleID, Hidrogeno, Carbon, Molar_H_Corg_Ratio, Biomasa, TemperaturaCelsius, TiempoResidenciaHHMM, BiomasaAlimentada, BiocharObtenido)
VALUES 
    (1, 0.15, 0.80, 2.0, 'Maiz', 500.00, 1200, 10.123, 9.234),
    (2, 0.12, 0.75, 1.8, 'Coco', 600.00, 1500, 11.345, 10.543),
    (3, 0.14, 0.78, 1.9, 'Maiz', 550.00, 1100, 9.876, 8.765);


-- Calculate the Molar H/Corg Ratio
SELECT
    BiocharSampleID,
    Biomasa,
    TemperaturaCelsius,
    TiempoResidenciaHHMM,
    BiomasaAlimentada,
    BiocharObtenido,
    Hidrogeno,
    Carbon,
    (Hidrogeno / Carbon) * (12 / 1.0) AS Molar_H_Corg_Ratio
FROM
    MuestraBiochar;

 SELECT
    BiocharSampleID,   
    Hidrogeno,
    Carbon,
    (Hidrogeno / Carbon) * (12 / 1.0) AS Molar_H_Corg_Ratio
FROM
    MuestraBiochar;