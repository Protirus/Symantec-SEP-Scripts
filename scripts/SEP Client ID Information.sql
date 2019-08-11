-- SEP Client ID information
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database
-- SebastianZ
SELECT [Comp].[COMPUTER_NAME],
	[Agent].[DELETED],
	[Agent].[CURRENT_CLIENT_ID],
	[Comp].[HARDWARE_KEY],
	[Comp].[COMPUTER_ID],
	dateadd(s, convert(BIGINT, [Comp].[TIME_STAMP]) / 1000, '01-01-1970 13:00:00') AS Time_Stamp,
	[Agent].[STATUS],
	dateadd(s, convert(BIGINT, [Agent].[CREATION_TIME]) / 1000, '01-01-1970 13:00:00') AS Creation_Time,
	dateadd(s, convert(BIGINT, [Agent].[LAST_UPDATE_TIME]) / 1000, '01-01-1970 13:00:00') AS Last_Update_Time,
	[Comp].[OPERATION_SYSTEM],
	[Agent].[AGENT_VERSION]
FROM [dbo].[SEM_AGENT] AS [Agent]
    INNER JOIN [dbo].[SEM_COMPUTER] AS [Comp] ON [Agent].[COMPUTER_ID] = [Comp].[COMPUTER_ID]
    /* where [Comp].[COMPUTER_ID] like 'Computer ID as used in the database' */
    /* where [Comp].[COMPUTER_NAME] like 'NetBIOS name of computer' */
    /* where [Agent].[CURRENT_CLIENT_ID] like 'Unique ID as displayed on General tab of client properties in console' */
ORDER BY [Comp].[COMPUTER_NAME] ASC
