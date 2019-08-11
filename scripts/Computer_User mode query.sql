-- Computer/user mode query
-- reports on either computer mode ([POLICY_MODE] = 1) or user mode ([POLICY_MODE] = 0) on SEP Client
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database
-- SebastianZ
SELECT UPPER([COMPUTER_NAME]) AS COMPUTER_NAME,
	[USER_NAME],
	[POLICY_MODE]
FROM [SEM_CLIENT]
WHERE [POLICY_MODE] = 1
ORDER BY COMPUTER_NAME

SELECT UPPER([COMPUTER_NAME]) AS COMPUTER_NAME,
	[USER_NAME],
	[POLICY_MODE]
FROM [SEM_CLIENT]
WHERE [POLICY_MODE] = 0
ORDER BY COMPUTER_NAME