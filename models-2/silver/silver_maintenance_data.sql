-- Combine with maintenance data
with MaintenanceData AS (
    SELECT
        m.DATETIME,
        m.MACHINEID,
        m.COMP
    FROM
        {{ ref("bronze_pdm_maint") }} m
)
select * from MaintenanceData