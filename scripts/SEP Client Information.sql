-- SEP Client Information
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database
-- SebastianZ
SELECT i.COMPUTER_NAME,
	AGENT_VERSION,
	pat.version AS AV_REVISION,
	dateadd(s, convert(BIGINT, LAST_UPDATE_TIME) / 1000, '01-01-1970 00:00:00') LASTUPDATETIME,
	g.name AS GROUP_NAME,
	i.OPERATION_SYSTEM,
	i.CURRENT_LOGIN_USER,
	i.MAC_addr1 "MAC Address",
	IP_ADDR1_TEXT "IP Address",
	i.DELETED "Marked for deletion"
FROM sem_agent AS sa WITH (NOLOCK)
LEFT OUTER JOIN pattern pat ON sa.pattern_idx = pat.pattern_idx
INNER JOIN v_sem_computer i ON i.computer_id = sa.computer_id
INNER JOIN identity_map g ON g.id = sa.group_id
INNER JOIN identity_map p ON p.id = sa.last_server_id
INNER JOIN identity_map s ON s.id = sa.domain_id
INNER JOIN identity_map q ON q.id = sa.last_site_id
WHERE (
		sa.agent_type = '105'
		OR sa.agent_type = '151'
		)
	AND sa.deleted = '0'
	AND I.DELETED = 0
ORDER BY group_name,
	operation_system,
	i.COMPUTER_name