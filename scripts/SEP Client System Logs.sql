-- SEP Client System Logs
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database
-- SebastianZ
SELECT DATEADD(s, CONVERT(BIGINT, l.EVENT_TIME) / 1000, '01/01/1970 00:00:00') AS TIME,
	c.NAME,
	l.HOST_NAME,
	l.EVENT_DESC
FROM V_SERVERS c,
	(
		SELECT *
		FROM AGENT_SYSTEM_LOG_1
		
		UNION
		
		SELECT *
		FROM AGENT_SYSTEM_LOG_2
		) l
WHERE c.ID = l.server_id
ORDER BY l.EVENT_TIME DESC;