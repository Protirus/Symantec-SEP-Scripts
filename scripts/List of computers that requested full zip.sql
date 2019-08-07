--List of computers that requested full zip (thanks to Arjun2228)
-- https://www.symantec.com/connect/articles/handy-sql-queries-sepm-v14
-- symantec.com/connect/forums/sql-query-get-list-computers-requested-full-zip
USE [sem5]

SELECT SEM_COMPUTER.COMPUTER_NAME,
	CONTENT_EVENTS.*
FROM CONTENT_EVENTS
INNER JOIN SEM_AGENT ON CONTENT_EVENTS.AGENT_ID = SEM_AGENT.AGENT_ID
INNER JOIN SEM_COMPUTER ON SEM_AGENT.COMPUTER_ID = SEM_COMPUTER.COMPUTER_ID
WHERE CONTENT_CATEGORY = 'AV_DEFS'
	AND CONTENT_NAME LIKE '%Definitions%'