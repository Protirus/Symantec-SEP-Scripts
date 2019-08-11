-- Database content size
-- https://www.symantec.com/connect/articles/compilation-sql-queries-sepm-database
-- SebastianZ
SELECT SUM(DATALENGTH(CONTENT)) / 1024.0 / 1024 / 1024 AS "content size (GB)"
FROM BINARY_FILE
WHERE TYPE = 'DownloadedContentFile'