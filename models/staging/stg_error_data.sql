-- Combine with error data
with ErrorData AS (
    SELECT
        e.DATETIME,
        e.MACHINEID,
        e.ERRORID
    FROM
        KNK_DB.raw_schema.PDM_ERRORS e
)

SELECT * from ErrorData