-- Duplicated HWID query
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database
-- SebastianZ
DECLARE @TimeZoneDiff INT
SELECT @TimeZoneDiff = datediff(minute, getutcdate(), getdate())

SELECT UPPER([COMPUTER_NAME]),
	[COMPUTER_ID],
	[HARDWARE_KEY],
	[CURRENT_LOGIN_USER],
	dateadd(minute, @TimeZoneDiff, dateadd(second, [TIME_STAMP] / 1000, '01/01/1970')) AS [Time Stamp],
	[IP_ADDR1_TEXT]
FROM [V_SEM_COMPUTER]
WHERE [COMPUTER_NAME] IN (
		SELECT [COMPUTER_NAME]
		FROM [V_SEM_COMPUTER]
		WHERE [DELETED] = 0
		GROUP BY [COMPUTER_NAME]
		HAVING COUNT([COMPUTER_NAME]) > 1
		)
ORDER BY [COMPUTER_NAME],
	[Time Stamp] DESC