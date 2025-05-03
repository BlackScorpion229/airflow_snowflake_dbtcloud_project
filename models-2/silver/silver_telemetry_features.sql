-- Combine telemetry data with machine features
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
)

select * from TelemetryFeatures