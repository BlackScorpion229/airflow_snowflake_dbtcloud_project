-- Combine with failure data
with FailureData AS (
    SELECT
        f.DATETIME,
        f.MACHINEID,
        f.FAILURE
    FROM
        KNK_DB.raw_schema.PDM_FAILURES f
)

select * from FailureData