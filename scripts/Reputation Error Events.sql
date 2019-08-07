--Reputation Error Events (thanks to tknorr)
-- https://www.symantec.com/connect/articles/handy-sql-queries-sepm-v14

USE [sem5]

SELECT [USN],
	[DOMAIN_ID],
	[GROUP_ID],
	[COMPUTER_ID],
	[TIME_STAMP],
	[EVENT_TIME],
	[HOST_NAME],
	[EVENT_SOURCE],
	[EVENT_DESC],
	[SEVERITY],
	dateadd(s, convert(BIGINT, [TIME_STAMP]) / 1000, ' 01-01-1970 01:00:00') AS [Calculated_Time_Stamp]
FROM [sem5].[dbo].[AGENT_SYSTEM_LOG_1]
WHERE EVENT_SOURCE LIKE '%rep%'
	AND EVENT_DESC LIKE '%408%' --Eventfilter (413,502,503,403,408)
GROUP BY [HOST_NAME],
	[USN],
	[DOMAIN_ID],
	[GROUP_ID],
	[COMPUTER_ID],
	[TIME_STAMP],
	[EVENT_TIME],
	[HOST_NAME],
	[EVENT_SOURCE],
	[EVENT_DESC],
	[SEVERITY]
ORDER BY TIME_STAMP DESC