-- Check the size of the stored content in GB (without client packages) in the database (thanks to greg12)
-- https://www.symantec.com/connect/articles/handy-sql-queries-sepm-v14

USE [sem5]

SELECT SUM(DATALENGTH(CONTENT)) / 1024.0 / 1024 / 1024 AS "content size (GB)"
FROM BINARY_FILE
WHERE TYPE = 'DownloadedContentFile'