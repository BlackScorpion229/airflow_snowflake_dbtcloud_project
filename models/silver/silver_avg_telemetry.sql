WITH TelemetryFeatures AS (
    SELECT
        t.DATETIME,
        t.MACHINEID,
        t.VOLT,
        t.ROTATE,
        t.PRESSURE,
        t.VIBRATION,
        m.MODEL,
        m.AGE
    FROM
        {{ ref("bronze_pdm_telemetry") }} t
    JOIN {{ ref("bronze_pdm_machines") }} m ON t.MACHINEID = m.MACHINEID
),
AvgTelemetry AS (
    SELECT
        MACHINEID,
        AVG(VOLT) AS AVG_VOLT,
        AVG(ROTATE) AS AVG_ROTATE,
        AVG(PRESSURE) AS AVG_PRESSURE,
        AVG(VIBRATION) AS AVG_VIBRATION
    FROM
        TelemetryFeatures
    GROUP BY
        MACHINEID
)
SELECT * FROM AvgTelemetry
