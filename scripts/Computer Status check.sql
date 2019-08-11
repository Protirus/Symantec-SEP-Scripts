-- Computer Status check
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database
-- SebastianZ
SELECT SEM_AGENT.COMPUTER_ID,
	SEM_COMPUTER.COMPUTER_NAME,
	SEM_AGENT.STATUS
FROM SEM_AGENT
LEFT JOIN SEM_COMPUTER ON SEM_AGENT.COMPUTER_ID = SEM_COMPUTER.COMPUTER_ID
WHERE sem_agent.STATUS = 0