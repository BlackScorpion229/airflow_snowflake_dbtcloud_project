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
        KNK_DB.raw_schema.PDM_TELEMETRY t
    JOIN KNK_DB.raw_schema.PDM_MACHINES m ON t.MACHINEID = m.MACHINEID
)

select * from TelemetryFeatures