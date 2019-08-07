--Get the Domain ID & name of your Domains (thanks to Ian_C.)
-- https://www.symantec.com/connect/articles/handy-sql-queries-sepm-v14

USE [sem5]

SELECT [ID],
	[TYPE],
	[DOMAIN_ID],
	[NAME],
	[DESCRIPTION]
FROM [SEM5].[dbo].[BASIC_METADATA]
WHERE [Type] = 'SemDomain'
