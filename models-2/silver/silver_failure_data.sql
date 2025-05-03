-- Combine with failure data
with FailureData AS (
    SELECT
        f.DATETIME,
        f.MACHINEID,
        f.FAILURE
    FROM
        {{ ref("bronze_pdm_failures") }} f
)
select * from FailureData