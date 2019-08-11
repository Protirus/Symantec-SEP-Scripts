-- Mapping policies against groups
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database#comment-11432341
-- interchk
SELECT COMPUTER_NAME,
	Name,
	sa.PROFILE_SERIAL_NO
FROM SEM_AGENT AS SA
LEFT OUTER JOIN V_SEM_COMPUTER AS COMP ON SA.COMPUTER_ID = COMP.COMPUTER_ID
LEFT OUTER JOIN IDENTITY_MAP AS ID_MAP ON ID_MAP.ID = SA.GROUP_ID

-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database#comment-11611451
-- interchk
SELECT Name,
	Sa.PROFILE_SERIAL_NO,
	COUNT(*) AS Total
FROM SEM_AGENT AS SA
LEFT OUTER JOIN IDENTITY_MAP AS ID_MAP ON ID_MAP.ID = SA.GROUP_ID
GROUP BY sa.PROFILE_SERIAL_NO,
	NAME
ORDER BY Total DESC
