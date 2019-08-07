-- List of Unmanaged Detectors (thanks to greg12)
-- https://www.symantec.com/connect/articles/handy-sql-queries-sepm-v14

USE [sem5]

SELECT CL.COMPUTER_NAME AS "Unmanaged Detector",
	DD.DELETED,
	DD.IP_ADDRESS_TEXT
FROM V_LAN_DEVICE_DETECTED AS DD
INNER JOIN SEM_CLIENT AS CL ON DD.COMPUTER_ID = CL.COMPUTER_ID