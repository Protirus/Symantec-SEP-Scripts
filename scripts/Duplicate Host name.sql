-- Duplicate Host name.sql
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database#comment-11432331
-- interchk
DECLARE @TimeZoneDiff INT
SELECT @TimeZoneDiff = datediff(minute, getutcdate(), getdate())

SELECT UPPER([COMPUTER_NAME]) AS HOST_NAME,
	CASE 
		WHEN comp.STATUS = 1
			THEN 'ONLINE'
		ELSE 'OFFLINE'
		END AS STATUS,
	dateadd(s, convert(BIGINT, SA.TIME_STAMP) / 1000, '01-01-1970 00:00:00') AS TIME_STAMP,
	sa.[COMPUTER_ID],
	[HARDWARE_KEY],
	[CURRENT_LOGIN_USER],
	[IP_ADDR1_TEXT]
FROM [V_SEM_COMPUTER] AS sa
LEFT OUTER JOIN SEM_AGENT AS comp ON SA.COMPUTER_ID = comp.COMPUTER_ID
WHERE [COMPUTER_NAME] IN (
		SELECT [COMPUTER_NAME]
		FROM [V_SEM_COMPUTER]
		WHERE [DELETED] = 0
		GROUP BY [COMPUTER_NAME]
		HAVING COUNT([COMPUTER_NAME]) > 1
		)
ORDER BY COMPUTER_NAME