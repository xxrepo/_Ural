if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_DW_DOCBASE_DW_BSN]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[DW_DOCBASE] DROP CONSTRAINT FK_DW_DOCBASE_DW_BSN
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DW_BSN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DW_BSN]
GO

CREATE TABLE [dbo].[DW_BSN] (
	[id_BSN] [int] IDENTITY (1, 1) NOT NULL ,
	[BsnName] [varchar] (255) NOT NULL , Bsndeleted bit default 0 not null
) ON [PRIMARY]
GO
alter table DW_BSN add primary KEY (id_BSN) 
GO
insert into DW_BSN(BsnName) values('Бизнес 1')

go
if not exists(select * from dbo.syscolumns where id = object_id(N'[dbo].[DW_DOCBASE]') and name = 'id_BSN')
  alter table DW_DOCBASE add id_BSN INT
GO
update DW_DOCBASE SET id_BSN = (SELECT MAX(id_BSN) FROM DW_BSN)

GO
alter table DW_DOCBASE ALTER COLUMN id_BSN INT NOT NULL
GO
alter table DW_DOCBASE add FOREIGN KEY (id_BSN) REFERENCES  DW_BSN (id_BSN)

if not exists(select * from dbo.syscolumns where id = object_id(N'[dbo].[DW_LIST]') and name = 'id_BSN')
  alter table DW_LIST add id_BSN INT
GO
update DW_LIST SET id_BSN = (SELECT MAX(id_BSN) FROM DW_BSN)

GO
alter table DW_LIST ALTER COLUMN id_BSN INT NOT NULL
GO
alter table DW_LIST add FOREIGN KEY (id_BSN) REFERENCES  DW_BSN (id_BSN)
GO


if not exists(select * from dbo.syscolumns where id = object_id(N'[dbo].[DW_DOCTYPE]') and name = 'id_BSN')
  alter table DW_DOCTYPE add id_BSN INT
GO
update DW_DOCTYPE SET id_BSN = (SELECT MAX(id_BSN) FROM DW_BSN)

GO
alter table DW_DOCTYPE ALTER COLUMN id_BSN INT NOT NULL
GO
alter table DW_DOCTYPE add FOREIGN KEY (id_BSN) REFERENCES  DW_BSN (id_BSN)
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VW_DOC]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VW_DOC]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW VW_DOC
AS


SELECT     D.*, DT.NAME AS DTName, 

CA.NAME AS OrgName, 
CA2.ID_CA AS ID_CAParent, 
CA2.NAME AS OrgNameParent, 

Rep.NAME AS RepName, 
Rep2.ID_CA AS ID_RepParent,  
Rep2.NAME AS RepNameParent, 
 
C.CURNAME AS CURNAME, ET.name as EventTypeName, ISNULL(datediff(dd, EV_DATE, getdate()), 0) as XDay
FROM DW_DOCBASE D (NOLOCK)
LEFT JOIN  DW_DOCTYPE DT (NOLOCK)  ON DT.ID_DOCTYPE = D.ID_DOCTYPE 

LEFT JOIN VW_CA CA (NOLOCK) ON CA.ID_CA = D.ID_CA 
LEFT JOIN VW_CA CA2 (NOLOCK) ON CA.PID = CA2.ID_CA 

LEFT JOIN VW_CL Rep (NOLOCK) ON Rep.ID_CA = D.id_REP 
LEFT JOIN VW_CL Rep2 (NOLOCK) ON Rep.PID = Rep2.ID_CA
 
LEFT JOIN DW_CUR C (NOLOCK) ON C.ID_CUR = D.ID_CUR

LEFT JOIN  DW_DOCTYPE ET (NOLOCK)  ON ET.ID_DOCTYPE = D.id_EventType 

WHERE     (D.DELETED = 0)
 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DW_UTB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DW_UTB]
GO

CREATE TABLE [dbo].[DW_UTB] (
	[id_UTB] [int] IDENTITY (1, 1) NOT NULL ,
	[id_BSN] [int] NOT NULL ,
	[ID_USER] [int] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DW_UTB] WITH NOCHECK ADD 
	CONSTRAINT [PK_DW_UTB] PRIMARY KEY  CLUSTERED 
	(
		[id_UTB]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DW_UTB] ADD 
	CONSTRAINT [FK_DW_UTB_DW_BSN] FOREIGN KEY 
	(
		[id_BSN]
	) REFERENCES [dbo].[DW_BSN] (
		[id_BSN]
	),
	CONSTRAINT [FK_DW_UTB_DW_USER] FOREIGN KEY 
	(
		[ID_USER]
	) REFERENCES [dbo].[DW_USER] (
		[ID_USER]
	)
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DW_DOC_LIST]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DW_DOC_LIST]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DW_GetTypeList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[DW_GetTypeList]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE DW_DOC_LIST
  @id_DocType INT,
  @id_CA INT,
  @ID_USER INT,
  @XDay INT,
  @ShowClosed INT = 1,
  @id_BSN INT = 1
 AS

--select @ShowClosed

select * FROM VW_DOC D
WHERE (
D.id_DocType = @id_DocType OR @id_DocType = -26 
OR (@id_DocType = -126 and ID_DOCBASE in (SELECT ID_DOCBASE FROM DW_LIST WHERE id_USER = @id_USER))
OR (@id_DocType = -666 and DateClosed is null and xDay >= @XDay)
)
AND (D.id_CA = @id_CA OR @id_CA = -1 OR id_Rep=@id_CA)
AND ((@ShowClosed = 1 AND DateClosed IS not NULL) OR @ShowClosed IS NULL OR (@ShowClosed = 0 AND DateClosed IS NULL))
AND (id_BSN = @id_BSN -- OR @id_BSN IS NULL
)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE DW_GetTypeList
  @AType INT = 0,
  @MODE INT = 1, -- 1 - все, 0 - только с доками
  @id_BSN INT = 1
AS

SELECT * INTO #T 
FROM DW_DocType (NOLOCK)
where deleted=0
AND (Atype = @AType or @AType is null)
AND ( id_BSN=@id_BSN OR @id_BSN IS NULL)
ORDER BY OrdID

IF @AType = 0 AND @MODE = 0 
BEGIN
  
--SELECT *  FROM #T WHERE IS_GRP = 0 and NOT (ID_DocType IN (SELECT ID_DocType FROM DW_DOCBASE))

  DELETE FROM #T WHERE IS_GRP = 0 and NOT (ID_DocType IN (SELECT ID_DocType FROM DW_DOCBASE (NOLOCK) WHERE id_BSN=@id_BSN OR @id_BSN IS NULL))
 
 -- SELECT * FROM #T WHERE IS_GRP = 1 AND NOT (ID_DocType IN (SELECT PID FROM #T (NOLOCK) WHERE PID IS NOT NULL))
  DELETE FROM #T WHERE IS_GRP = 1 AND NOT (ID_DocType IN (SELECT PID FROM #T (NOLOCK) WHERE PID IS NOT NULL))
  DELETE FROM #T WHERE IS_GRP = 1 AND NOT (ID_DocType IN (SELECT PID FROM #T (NOLOCK) WHERE PID IS NOT NULL))
  DELETE FROM #T WHERE IS_GRP = 1 AND NOT (ID_DocType IN (SELECT PID FROM #T (NOLOCK) WHERE PID IS NOT NULL))
  DELETE FROM #T WHERE IS_GRP = 1 AND NOT (ID_DocType IN (SELECT PID FROM #T (NOLOCK) WHERE PID IS NOT NULL))
  DELETE FROM #T WHERE IS_GRP = 1 AND NOT (ID_DocType IN (SELECT PID FROM #T (NOLOCK) WHERE PID IS NOT NULL))
  DELETE FROM #T WHERE IS_GRP = 1 AND NOT (ID_DocType IN (SELECT PID FROM #T (NOLOCK) WHERE PID IS NOT NULL))


END

SELECT * FROM #T (NOLOCK)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

