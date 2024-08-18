


SELECT 
    uc.table_name AS "Referenced Table",
    ao.object_type AS "Referenced Object Type",
    uc.constraint_name AS "Constraint Name",
    u1.table_name AS "Referencing Table",
    u1.constraint_type AS "Constraint Type"
FROM 
    all_constraints uc
JOIN 
    all_constraints u1 
    ON uc.constraint_name = u1.r_constraint_name
JOIN 
    all_objects ao 
    ON uc.owner = ao.owner AND uc.table_name = ao.object_name
WHERE 
    uc.owner = 'USER_COMMON' 
    AND u1.owner = 'USER1'
    AND u1.constraint_type = 'R';


----------------------------------------------------------------
SELECT 
    uc.table_name AS "Referenced Table",
    ao.object_type AS "Referenced Object Type",
    uc.constraint_name AS "Constraint Name",
    u1.table_name AS "Referencing Table",
    au.object_type AS "Referencing Object Type",
    u1.constraint_type AS "Constraint Type"
FROM 
    all_constraints uc
JOIN 
    all_constraints u1 
    ON uc.constraint_name = u1.r_constraint_name
JOIN 
    all_objects ao 
    ON uc.owner = ao.owner AND uc.table_name = ao.object_name
JOIN 
    all_objects au 
    ON u1.owner = au.owner AND u1.table_name = au.object_name
WHERE 
    uc.owner = 'USER_COMMON' 
    AND u1.owner = 'USER1'
    AND u1.constraint_type = 'R';
