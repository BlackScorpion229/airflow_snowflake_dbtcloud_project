-- Combine with error data
with ErrorData AS (
    SELECT
        e.DATETIME,
        e.MACHINEID,
        e.ERRORID
    FROM
        {{ ref("bronze_pdm_errors") }} e
)
SELECT * from ErrorData