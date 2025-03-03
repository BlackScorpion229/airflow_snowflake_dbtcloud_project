-- Combine with maintenance data
with MaintenanceData AS (
    SELECT
        m.DATETIME,
        m.MACHINEID,
        m.COMP
    FROM
        KNK_DB.raw_schema.PDM_MAINT m
)

select * from MaintenanceData