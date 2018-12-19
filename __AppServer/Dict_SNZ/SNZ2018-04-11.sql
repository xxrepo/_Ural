
CREATE VIEW [dbo].[VW_UserHR]
as
SELECT id_User FROM USR_User WHERE id_User in (-1, 108)

GO

/****** Object:  StoredProcedure [dbo].[RPT_NewRepTree_v3]    Script Date: 04/11/2018 21:40:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[RPT_NewRepTree_v3] 
  @Id_business INT = 43,
  @RepNum INT,
  @Year INT = 2013,

  @Str3 VARCHAR(255) = 'Сырьевые затраты в балансе, руб',
  @Str4 VARCHAR(255) = null,
  @M INT = 7,
  @id_User INT  = NULL

AS

EXEC RPT_NewRepTree @Id_business = @Id_business, @RepNum = @RepNum, @Year = @Year, @Str3 = @Str3, @Str4 = @Str4, @M = @M, @id_User = @id_User
return 

DECLARE @D1 DATETIME, @D2 DATETIME

  SET @D1 = CAST('01-01-' +CAST(@Year as VARCHAR(10)) as DATETIME)
  SET @D2 = DATEADD(mm, @M, @D1) + CAST('23:59:59' as DATETIME) - 1
  SET @D1 = DATEADD(mm, @M - 2, @D1)  

  DECLARE @id_Rez INT, @i INT
 
--select @D1, @D2 return

DECLARE @WWW TABLE (WorkSum FLOAT, id_OPer INT, ZZZ VARCHAR(255), id_Goods INT)

 SELECT ISNULL(id_OperWare, -1) as id_OperWare, CAST(NULL as FLOAT) as WorkSum, NULL as MMM, id_WareHouse, id_Acc, DateCreate, ISNULL(id_Goods, -1) as id_Goods, OC.id_Repr, CR.id_ContrAgent, BO.id_Rez, OC.id_Oper, PriceInv, OperRateDeltaCur = ISNULL(CRN_CurChDelta/*CRN_OperRateDelta*/, 0),CRN_OperSum_Inv, OperSummSysCur = CRN_OLD_OperSum_Offer, OperTotalDeltaCur = CRN_OperDelta + ISNULL(CRN_OperRateDelta, 0), CRN_CurChDelta, OperVid, OperTypeIn, Koeff, id_Manufact, id_Manufact_Ext
  INTO #WWW2
  FROM VW_Oper_WArc_prev_NEW OC (NOLOCK)
  LEFT JOIN BLN_Oper_v2 BO (NOLOCK) ON BO.id_Oper = OC.id_Oper
  LEFT JOIN CA_Repr CR (NOLOCK) ON CR.id_Repr = OC.id_Repr
  WHERE
  HidedOper = 0 AND Deleted = 0 AND
  (@id_business = OC.id_business) AND
  (DateCreate > @D1) AND (DateCreate <= @D2)
  AND OC.CheckDate IS NOT NULL
  AND (BO.id_Rez > @id_Rez OR @id_Rez IS NULL OR BO.id_Rez IS NULL)
 -- AND @M2 = MONTH(DateCreate)

--return
DELETE FROM #WWW2 WHERE id_ContrAgent=4329 AND NOT(OperVid = 1 AND OperTypeIn = 0)

SET @i = @M - 1
WHILE @i <= @M
BEGIN
  SET @D1 = CAST('01-01-' +CAST(@Year as VARCHAR(10)) as DATETIME)
  SET @D1 = DATEADD(mm, @i - 1, @D1)  

  SET @D2 = DATEADD(mm, 1, @D1) + CAST('23:59:59' as DATETIME) - 1

--select @i
  SELECT @id_Rez = MAX(id_Rez)
  FROM BLN_Rez_v2 (NOLOCK) 
  WHERE ddd = 0 AND id_business = @id_business AND (DateCreate < @D1) 
  
  UPDATE #WWW2 SET MMM = @i WHERE (DateCreate <= @D2)  AND (id_Rez > @id_Rez OR @id_Rez IS NULL OR id_Rez IS NULL) AND MMM IS NULL

  SET @i = @i + 1
END

--return
  
 -- DELETE FROM #WWW2 WHERE id_Rez < @id_Rez
 


 --- Несырь. затраты
/*
   INSERT INTO #WWW(ZZZ, id_Oper, id_Goods, WorkSum)
  SELECT 'Несырьевые затраты, руб', id_Oper, id_Goods, WorkSum = ISNULL(ISNULL(CASE WHEN PriceInv IS NOT NULL THEN CRN_OperSum_Inv ELSE -OperSummSysCur * CASE WHEN Koeff = -1 THEN -1 ELSE 1 END END, 0), 0)
  FROM #WWW2 (NOLOCK) WHERE MMM = @M2 AND ((Koeff = -1) OR (OperVid = 4 AND OperTypeIn = 1 AND Koeff = 0))

  INSERT INTO #WWW(ZZZ, id_Oper, id_Goods, WorkSum)
  SELECT 'Несырьевые затраты, руб', id_Oper, id_Goods, ISNULL(ISNULL(-OperTotalDeltaCur, 0), 0) 
  FROM #WWW2 (NOLOCK) WHERE MMM = @M2 AND ((OperVid = 1 AND OperTypeIn = 0 AND OperTotalDeltaCur < 0 AND Koeff = 0))

  INSERT INTO #WWW(ZZZ, id_Oper, id_Goods, WorkSum)
  SELECT 'Несырьевые затраты, руб', id_Oper, id_Goods, ISNULL(-CRN_CurChDelta, 0) 
  FROM #WWW2 (NOLOCK) WHERE MMM = @M2 AND (CRN_CurChDelta < 0 AND NOT(OperVid = 1 AND OperTypeIn = 0))
 */


-- ****************

-- Обсчет Сырьевые затраты
  IF @Str3 = 'Сырьевые затраты в балансе, руб' --and 1=2
  BEGIN
--select getdate()
    	UPDATE #WWW2 SET WorkSum = - OperSummSysCur
	WHERE MMM = @M AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 0) )  AND Koeff = 0
    	UPDATE #WWW2 SET WorkSum = OperSummSysCur
	WHERE MMM = @M AND (OperTypeIn = 1 AND id_Manufact IS NOT NULL) AND Koeff = 0


--select getdate()
    	UPDATE #WWW2 SET WorkSum = CASE WHEN id_Manufact IS NOT NULL THEN 1 ELSE -1 END * OperSummSysCur
	WHERE MMM = @M AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 1 AND id_Manufact_Ext <> 39) OR (OperTypeIn = 0 AND id_Manufact IS NOT NULL AND id_Manufact <> 39))  AND Koeff = 0
--select getdate() 
--return
/*  INSERT INTO @WWW(ZZZ, id_Oper, id_Goods, WorkSum)
  SELECT 'Сырьевые затраты в балансе, руб', id_Oper, id_Goods, 
  ISNULL(CASE WHEN id_Manufact IS NOT NULL THEN 1 ELSE -1 END * OperSummSysCur, 0) 
  FROM #WWW2 (NOLOCK) 
  WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 0) OR (OperTypeIn = 1 AND id_Manufact IS NOT NULL))  AND Koeff = 0
 
  UNION ALL

  SELECT 'Сырьевые затраты в балансе, руб', id_Oper, id_Goods, 
  ISNULL(CASE WHEN id_Manufact IS NOT NULL THEN 1 ELSE -1 END * OperSummSysCur, 0) 
  FROM #WWW2 (NOLOCK) 
  WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 1 AND id_Manufact_Ext <> 39) OR (OperTypeIn = 0 AND id_Manufact IS NOT NULL AND id_Manufact <> 39))  AND Koeff = 0
  return*/
  END

-- ****************

 /*
select sum(W.WorkSum), count(*) FROM #WWW W
select sum(R.WorkSum), count(*)  from aa_R R


select R.id_Oper, W.id_Oper, R.WorkSum, W.WorkSum
FROM #WWW W
LEFT JOIN aa_R R ON W.id_Oper = R.id_Oper AND Isnull(W.id_Goods, -1) = Isnull(R.id_Goods, -1) AND W.WorkSum = R.WorkSum 
where R.id_Oper is null
return
*/
 --select sum(WorkSum) from #WWW2 WHERE WorkSum IS NOT NULL --return

 -- SELECT OC.* INTO #Z FROM VW_Oper_WArc_Oper_New OC (NOLOCK) JOIN #WWW2 T ON OC.ID_Oper = T.ID_Oper AND Isnull(OC.id_OperWare, -1) = T.id_OperWare 
 -- WHERE WorkSum IS NOT NULL

--select * from #Z return

--return
  SELECT WorkSum, OC.*
  FROM #WWW2 T 
  JOIN VW_Oper_WArc_Oper_New OC (NOLOCK) ON OC.ID_Oper = T.ID_Oper AND Isnull(OC.id_OperWare, -1) = T.id_OperWare    
  WHERE WorkSum IS NOT NULL -- ZZZ = @Str3 OR @Str3 IS NULL
  ORDER BY WorkSum









GO

/****** Object:  StoredProcedure [dbo].[UN_AccCard_t]    Script Date: 04/11/2018 21:40:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO











ALTER PROCEDURE [dbo].[UN_AccCard_t]
  @DateFrom DATETIME = NULL,
  @DateTo DATETIME = NULL,
  @id_Acc INT = NULL, 
  @id_User INT = 1,
  @id_Currency INT = NULL,
  @Repr BIT = 1,
  @Src BIT = 1,
  @Imp_PayBasic BIT = 1,
  @AccInv_PayAssignment BIT = 1,     
  @Contract BIT = 1,
  @OpComment BIT = 1,
  @CalcRez BIT = 1
AS

SET NOCOUNT ON

CREATE TABLE #Tq (id_business INT)

INSERT INTO #Tq (id_business)
EXEC USR_UserGetBsnIDSByFunc @id_User,  Null


--select @DateFrom, @DateTo
-- ТУт надо читать валюту бизнеса!!!
DECLARE @RateMain FLOAT, @NAMEMain VARCHAR(255), @ID_xxx INT, @id_CurrencyMain INT

SELECT @RateMain = RealRate, @NAMEMain = C.Name, @ID_xxx = A.id_business, @id_CurrencyMain = C.id_Currency
FROM Acc_Acc A (NOLOCK)
JOIN Dic_business B (NOLOCK) ON B.id_business = A.id_business
JOIN VW_Currency C (NOLOCK) ON B.id_Currency = C.id_Currency
WHERE @id_Acc = id_Acc

/*
IF NOT EXISTS (SELECT * FROM #Tq (NOLOCK) WHERE id_business = @ID_xxx) 
BEGIN
  RAISERROR ('У вас нет прав на данный бизнес', 16, 1) 
  RETURN
END*/


CREATE TABLE #T34 (id_Oper INT, id_AccDef INT, id_Acc_ExtDef INT, is_Mirr BIT)

INSERT INTO #T34 (id_Oper, id_AccDef, id_Acc_ExtDef, is_Mirr)
SELECT id_Oper, id_AccDef = 1, id_Acc_ExtDef = 0, is_Mirr = 0
FROM OP_Oper2 OC (NOLOCK)
WHERE OC.Deleted = 0 AND HidedOper = 0 AND OC.CheckDate IS NOT NULL --AND Koeff = 0
AND (@id_Acc = id_Acc)
AND (DateCreate <= @DateTo)
--AND (DateCreate >= @DateFrom)

INSERT INTO #T34 (id_Oper, id_AccDef, id_Acc_ExtDef, is_Mirr)
SELECT id_Oper, id_AccDef = 0, id_Acc_ExtDef = 1, is_Mirr = 1
FROM OP_Oper2 OC (NOLOCK)
WHERE OC.Deleted = 0 AND HidedOper = 0 AND OC.CheckDate IS NOT NULL --AND Koeff = 0
AND (@id_Acc = id_Acc_Ext)
AND (DateCreate <= @DateTo)
--AND (DateCreate >= @DateFrom)


--SELECT COUNT(*) FROM #ZZZ
--SELECT COUNT(*) FROM #ZZZ2
--SELECT id_Oper INTO _e2 FROM #ZZZ
--SELECT id_Oper INTO _e3 FROM #ZZZ2

CREATE TABLE #Temp2(Tmp INT, IsRes BIT, TotalRez FLOAT, 
                   id_Oper INT, OperTypeIn BIT, OperVid INT, id_Repr INT, id_ContrAgent INT, DateCreate DATETIME,
                   CurrencyShortName VARCHAR(255), OperSummSysCur FLOAT,
                   OperSum_Offer FLOAT, Id_Currency_Offer INT, 
                   OperNum VARCHAR(255), isGrpOper BIT DEFAULT 0, id_Goods INT, is_Mirr BIT, 
                   Docz VARCHAR(1000), NNN INT DEFAULT 0,
                   id_Acc INT, id_Warehouse INT, id_Manufact INT, id_Repr_Ex INT,
                   S1 DECIMAL(18, 2), S2 DECIMAL(18, 2), SumIN DECIMAL(18, 2), SumOUT DECIMAL(18, 2),
                   ReprName VARCHAR(255), SrcName VARCHAR(255),
                   Imp_PayBasic VARCHAR(1000), AccInv_PayAssignment VARCHAR(1000),
                   Contract VARCHAR(1000), OpComment VARCHAR(1000),
                   Str1 VARCHAR(100), Str2 VARCHAR(100), Str3 VARCHAR(100), Str4 VARCHAR(100), Str5 VARCHAR(100),
                   Str6 VARCHAR(100), Str7 VARCHAR(100), Str8 VARCHAR(100), Str9 VARCHAR(100), Str10 VARCHAR(100),
                   Str11 VARCHAR(100), Str12 VARCHAR(100), Str13 VARCHAR(100), Str14 VARCHAR(100), Str15 VARCHAR(100),
                   Dig1 float, Dig2 float, Dig3 float, Dig4 float, Dig5 float, Dig6 float, Dig7 float, Dig8 float, Dig9 float, Dig10 float,
 Dig11 float, Dig12 float, Dig13 float, Dig14 float, Dig15 float ,
id_Acc_Ext INT, id_Warehouse_Ext INT)

DECLARE @NEED_OLD BIT
SET @NEED_OLD = 0
IF NOT EXISTS(SELECT * FROM Arc_OP (NOLOCK) WHERE ArcDate > @DateFrom AND id_Business = @ID_xxx) 
BEGIN
  SET @NEED_OLD = 1

  INSERT INTO #Temp2(Tmp, IsRes, TotalRez, id_Oper, OperTypeIn, OperVid, 
                   OperSum_Offer,   
                   OperNum, NNN, DateCreate, CurrencyShortName, Id_Currency_Offer, OperSummSysCur)
  SELECT Tmp = 1, 
  IsRes = CAST(0 AS BIT),
  TotalRez = CAST(0 AS FLOAT),
  id_Oper = -1, OperTypeIn, 
  OperVid = ISNULL(OperVid, 2), 
  CRN_OperSum = ABS(OperSumm) * CASE WHEN OperTypeIn = 0 THEN -1 ELSE 1 END, 
  OperNum = '', NNN = 0, @DateFrom - 1, 
  CurrencyShortName = COALESCE(COper.ShortName, COper.Name), Id_Currency_Offer = OC.id_Currency, CRN_OLD_OperSum -- OperSumm
  FROM Arc_Rem_Acc OC (NOLOCK)
  JOIN VW_Currency COper (NOLOCK) ON COper.Id_Currency = OC.Id_Currency
  WHERE id_Acc = @id_Acc

END
ELSE
BEGIN
  CREATE TABLE #T34_2 (id_Oper INT, id_AccDef INT, id_Acc_ExtDef INT, is_Mirr BIT)

  INSERT INTO #T34_2 (id_Oper, id_AccDef, id_Acc_ExtDef, is_Mirr)
  SELECT id_Oper, id_AccDef = 1, id_Acc_ExtDef = 0, is_Mirr = 0
  FROM Arc_OP_Oper OC (NOLOCK)
  WHERE (@id_Acc = id_Acc)
  AND (DateCreate <= @DateTo)

  INSERT INTO #T34_2 (id_Oper, id_AccDef, id_Acc_ExtDef, is_Mirr)
  SELECT id_Oper, id_AccDef = 0, id_Acc_ExtDef = 1, is_Mirr = 1
  FROM Arc_OP_Oper OC (NOLOCK)
  WHERE (@id_Acc = id_Acc_Ext)
  AND (DateCreate <= @DateTo)



  INSERT INTO #Temp2(Tmp, IsRes, TotalRez, id_Oper, OperTypeIn, OperVid, id_Repr, id_ContrAgent, DateCreate,
                   CurrencyShortName,
                   OperSum_Offer,Id_Currency_Offer, OperSummSysCur,
                   OperNum, isGrpOper, id_Goods, is_Mirr, Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
                   Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
                   Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, id_Acc, id_Warehouse, id_Manufact, id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext)
  SELECT 
       Tmp=CASE WHEN (@DateFrom <= DateCreate OR @DateFrom IS NULL) AND (@DateTo >= DateCreate OR @DateTo IS NULL) THEN 0 ELSE 1 END, 
--       Tmp=DATEDIFF(dd, DateCreate, getdate()), 
       IsRes = CAST(0 AS BIT),
       TotalRez = CAST(0 AS FLOAT),
       OC.id_Oper, OperTypeIn = CAST(CASE WHEN @id_Acc = id_Acc THEN OperTypeIn ELSE OperTypeIn ^ 1 END AS BIT), OperVid, OC.id_Repr, id_ContrAgent = Null, DateCreate,
       CurrencyShortName = ISNULL(COper.ShortName, COper.Name),
       OperSum_Offer = CASE WHEN OperTypeIn = 1 THEN 1 ELSE -1 END *PriceOper* CASE WHEN id_AccDef = 1 THEN 1 ELSE -1 END,
       Id_CurrencyOper, -CRN_OLD_OperSum* CASE WHEN id_AccDef = 1 THEN 1 ELSE -1 END,
  OperNum =   CAST(
    CONVERT(VARCHAR, OC.DateCreate, 4) + '-' +
    ISNULL(CAST(dbo.FormatInt(OrdNum, 4) AS VARCHAR(10)), '_') + '-' + 
--    ISNULL(CAST(OrdNum AS VARCHAR(10)), '_') + '-' + 
    CASE
      WHEN OC.OperVid = -1 THEN 'КУР'
      WHEN OC.OperVid = 0 THEN 'ПСТ'
      WHEN OC.OperVid = 1 THEN 'СКЛ'
      WHEN OC.OperVid = 2 THEN 'ФИН'
      WHEN OC.OperVid = 3 THEN 'УСЛ'
      WHEN OC.OperVid = 4 THEN 'ВЗЧ'

      WHEN OC.OperVid = 101 THEN 'СКЛ-ОСТ'
      WHEN OC.OperVid = 102 THEN 'ФИН-ОСТ'
      WHEN OC.OperVid = 103 THEN 'УСЛ-ОСТ'
    END + 
    ISNULL('-' + OC.BusinessNum, '') +
    ISNULL('-' + RR.ShortName, '-*') + 
 
    CASE WHEN OC.OperTypeIn = 1 THEN '-П-' ELSE '-Р-' END +
    CAST(OC.id_Oper AS VARCHAR(10)) +
    CASE WHEN OC.Correct = 1 THEN '-К' ELSE '' END +
    CASE WHEN OC.is_Mirr = 1 THEN '-Д' ELSE '' END    
  AS VARCHAR(255))
, isGrpOper = 0, id_Goods, OC.is_Mirr,
  Imp_PayBasic = CASE WHEN @Imp_PayBasic = 1 THEN Imp_PayBasic ELSE NULL END,
  AccInv_PayAssignment = CASE WHEN @AccInv_PayAssignment = 1 THEN AccInv_PayAssignment ELSE NULL END,
  Contract = CASE WHEN @Contract = 1 THEN Contract ELSE NULL END,
  OpComment = CASE WHEN @OpComment = 1 THEN OpComment ELSE NULL END,
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
  Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, id_Acc, id_Warehouse, id_Manufact, id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext
  FROM VW_Oper_WArc_prev_OLD OC (NOLOCK)
  LEFT JOIN RP_Replicator RR (NOLOCK) ON RR.id_Replicator = OC.id_Replicator
  LEFT JOIN VW_Currency COper (NOLOCK) ON COper.Id_Currency = OC.Id_Currency_Offer
  JOIN #T34_2 T (NOLOCK) ON T.id_Oper = OC.id_Oper --AND T.is_Mirr = OC.is_Mirr-- 1013
  WHERE (DateCreate <= @DateTo) 

  AND (id_Acc = @id_Acc OR id_Acc_Ext = @id_Acc)
  ORDER BY OC.DateCreate, OC.id_Oper, OC.is_Mirr


END

INSERT INTO #Temp2(Tmp, IsRes, TotalRez, id_Oper, OperTypeIn, OperVid, id_Repr, id_ContrAgent, DateCreate,
                   
                   CurrencyShortName, 
                   OperSum_Offer,Id_Currency_Offer, OperSummSysCur, 
                   OperNum, isGrpOper, id_Goods, is_Mirr, Imp_PayBasic, AccInv_PayAssignment, Contract, OpComment,
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
                   Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, id_Acc, id_Warehouse, id_Manufact, id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext)
SELECT 
       Tmp=CASE WHEN (@DateFrom <= DateCreate OR @DateFrom IS NULL) AND (@DateTo >= DateCreate OR @DateTo IS NULL) THEN 0 ELSE 1 END, 
--       Tmp=DATEDIFF(dd, DateCreate, getdate()), 
       IsRes = CAST(0 AS BIT),
       TotalRez = CAST(0 AS FLOAT),
       OC.id_Oper, OperTypeIn = CAST(CASE WHEN @id_Acc = id_Acc THEN OperTypeIn ELSE OperTypeIn ^ 1 END AS BIT), OperVid, OC.id_Repr, id_ContrAgent = Null, DateCreate,
       CurrencyShortName = ISNULL(COper.ShortName, COper.Name),

       OperSum_Offer = CASE WHEN OperTypeIn = 1 THEN 1 ELSE -1 END *PriceOper* CASE WHEN id_AccDef = 1 THEN 1 ELSE -1 END,
       Id_CurrencyOper, -CRN_OLD_OperSum* CASE WHEN id_AccDef = 1 THEN 1 ELSE -1 END,
OperNum =   CAST(
    CONVERT(VARCHAR, OC.DateCreate, 4) + '-' +
    ISNULL(CAST(dbo.FormatInt(OrdNum, 4) AS VARCHAR(10)), '_') + '-' + 
--    ISNULL(CAST(OrdNum AS VARCHAR(10)), '_') + '-' + 
    CASE
      WHEN OC.OperVid = -1 THEN 'КУР'
      WHEN OC.OperVid = 0 THEN 'ПСТ'
      WHEN OC.OperVid = 1 THEN 'СКЛ'
      WHEN OC.OperVid = 2 THEN 'ФИН'
      WHEN OC.OperVid = 3 THEN 'УСЛ'
      WHEN OC.OperVid = 4 THEN 'ВЗЧ'

      WHEN OC.OperVid = 101 THEN 'СКЛ-ОСТ'
      WHEN OC.OperVid = 102 THEN 'ФИН-ОСТ'
      WHEN OC.OperVid = 103 THEN 'УСЛ-ОСТ'
    END + 
    ISNULL('-' + OC.BusinessNum, '') +
    ISNULL('-' + RR.ShortName, '-*') + 
 
    CASE WHEN OC.OperTypeIn = 1 THEN '-П-' ELSE '-Р-' END +
    CAST(OC.id_Oper AS VARCHAR(10)) +
    CASE WHEN OC.Correct = 1 THEN '-К' ELSE '' END +
    CASE WHEN OC.is_Mirr = 1 THEN '-Д' ELSE '' END    
  AS VARCHAR(255))
, isGrpOper = 0, id_Goods, OC.is_Mirr, 
  Imp_PayBasic = CASE WHEN @Imp_PayBasic = 1 THEN Imp_PayBasic ELSE NULL END,
  AccInv_PayAssignment = CASE WHEN @AccInv_PayAssignment = 1 THEN AccInv_PayAssignment ELSE NULL END,
  Contract = CASE WHEN @Contract = 1 THEN Contract ELSE NULL END,
  OpComment = CASE WHEN @OpComment = 1 THEN OpComment ELSE NULL END,
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, id_Acc, id_Warehouse, id_Manufact, id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext
FROM VW_Oper_WArc_prev_New OC (NOLOCK)
LEFT JOIN RP_Replicator RR (NOLOCK) ON RR.id_Replicator = OC.id_Replicator
LEFT JOIN VW_Currency COper (NOLOCK) ON COper.Id_Currency = OC.Id_Currency_Offer
JOIN #T34 T (NOLOCK) ON T.id_Oper = OC.id_Oper --AND T.is_Mirr = OC.is_Mirr-- 1013
WHERE OC.Deleted = 0 AND HidedOper = 0 AND OC.CheckDate IS NOT NULL --AND Koeff = 0
--AND (DateCreate <= @DateTo)
AND (id_Acc = @id_Acc OR id_Acc_Ext = @id_Acc)
ORDER BY OC.DateCreate, OC.id_Oper, OC.is_Mirr

--SELECT * FROM #Temp2
--SELECT SUM(OperSum_Offer) FROM #Temp2 WHERE OperVid <> -1 GROUP BY Id_Currency_Offer RETURN

--SELECT CurrencyOperShortName FROM #Temp2
IF @Repr = 1 
BEGIN
  UPDATE #Temp2 SET ReprName = (
  SELECT MIN(CR.Name) 

  FROM VW_CA_Repr CR (NOLOCK) WHERE CR.id_Repr = ISNULL(#Temp2.id_Repr, #Temp2.id_Repr_Ex))
  WHERE TMP = 0 AND (#Temp2.id_Repr IS NOT NULL OR #Temp2.id_Repr_Ex IS NOT NULL) 

  UPDATE #Temp2 SET ReprName = (SELECT MIN(ADest.Name) FROM Acc_Acc ADest (NOLOCK) WHERE ADest.id_Acc = #Temp2.id_Acc_Ext)
  WHERE TMP = 0 AND id_Acc_Ext IS NOT NULL

  UPDATE #Temp2 SET ReprName = (SELECT MIN(WHDest.Name) FROM WH_Warehouse WHDest (NOLOCK) WHERE WHDest.id_Warehouse = #Temp2.id_Warehouse_Ext)
  WHERE TMP = 0 AND id_Warehouse_Ext IS NOT NULL

-- UPDATE #Temp2 SET ReprName = (SELECT MIN(MnDest.Name) FROM Mn_Manufact MnDest (NOLOCK) WHERE ASrc.id_Acc = #Temp2.id_Manufact_Ext)
--  WHERE TMP = 0 AND id_Manufact_Ext IS NOT NULL


END

IF @Src = 1 
BEGIN
--  SELECT id_Acc, id_Warehouse, id_Manufact FROM #Temp2
  UPDATE #Temp2 SET SrcName = (SELECT MIN(ASrc.Name) FROM Acc_Acc ASrc (NOLOCK) WHERE ASrc.id_Acc = #Temp2.id_Acc)
  WHERE TMP = 0 AND id_Acc IS NOT NULL

  UPDATE #Temp2 SET SrcName = (SELECT MIN(WHSrc.Name) FROM WH_Warehouse WHSrc (NOLOCK) WHERE WHSrc.id_Warehouse = #Temp2.id_Warehouse)
  WHERE TMP = 0 AND id_Warehouse IS NOT NULL

  UPDATE #Temp2 SET SrcName = (SELECT MIN(MnSrc.Name) FROM Mn_Manufact MnSrc (NOLOCK) WHERE MnSrc.id_Manufact = #Temp2.id_Manufact)
  WHERE TMP = 0 AND id_Manufact IS NOT NULL
END

--SELECT * FROM #Temp2 RETURN

UPDATE #Temp2 SET NNN = 20 WHERE Tmp = 0 AND OperVid = -1

--SELECT * FROM #Temp2

DECLARE @Summ FLOAT, @Summ2 FLOAT, @D DATETIME, @CNT INT

SELECT @Summ = SUM(OperSum_Offer), @D = MAX(DateCreate), @CNT = COUNT(id_OPer)
FROM #Temp2 (NOLOCK) 
WHERE OperVid = -1 AND Tmp = 0

IF @CNT > 0 
  INSERT INTO #Temp2(Tmp, isGrpOper, IsRes, TotalRez, id_Oper, OperTypeIn, OperVid, 
                   OperSum_Offer, OperSummSysCur, Id_Currency_Offer, CurrencyShortName,  
                   OperNum, NNN, DateCreate)
  SELECT Tmp = 0, isGrpOper = 0,
  IsRes = CAST(0 AS BIT),
  TotalRez = CAST(0 AS FLOAT),
  id_Oper = -1, OperTypeIn = CASE WHEN @Summ >= 0 THEN 0 ELSE 1 END, 
  OperVid = -1, 
  OperSum_Offer = @Summ, OperSummSysCur = @Summ, 
  Id_Currency_Offer = @id_CurrencyMain, CurrencyShortName = @NameMain, OperNum = 'Сумма курсовых изменений', NNN = 10, @DateTo + 1

--SELECT @NameMain
UPDATE #Temp2
SET OperSum_Offer = NULL, OperSummSysCur = NULL
WHERE NNN = 20


SELECT TmpID = IDENTITY(INT, 1, 1), * 
INTO #Temp
FROM #Temp2 (NOLOCK)
ORDER BY DateCreate, id_Oper, isGrpOper DESC

--   SELECT OperSummSysCur, isGrpOper, TmpID, NNN, IsRes, * FROM #Temp ORDER BY DateCreate

--SELECT * FROM #Temp

--SELECT OperSum_Offer, id_Oper, Tmp, isGrpOper, * FROM #Temp

DECLARE @S1 DECIMAL(18, 2), @S2 DECIMAL(18, 2)
--DECLARE @S1 DECIMAL(18, 2), @S2 FLOAT

SELECT @S1 = Sum(ISNULL(OperSummSysCur, 0))
FROM #Temp T (NOLOCK) 
WHERE NNN <> 2 AND T.Tmp = 1 AND (@DateFrom >= DateCreate OR @DateFrom IS NULL) AND IsRes = 0

SET @S1 = ISNULL(@S1, 0)

SELECT @S2 = ISNULL(Sum(OperSummSysCur), 0) 
FROM #Temp T (NOLOCK) 
--WHERE id_Oper <> -1

IF @id_Currency IS NULL AND @CalcRez = 1
BEGIN
  UPDATE #Temp
  SET TotalRez = @S1 + 
  (SELECT Sum(ISNULL(OperSummSysCur, 0)) FROM #Temp T (NOLOCK) WHERE T.TmpID <= #Temp.TmpID AND T.NNN <> 20 AND T.Tmp = 0)
  WHERE IsRes = 0 AND NNN <> 20 AND Tmp = 0
END

--SELECT COUNT(*) FROM #Temp
-- SELECT @S1, @S2 return
/*
IF @id_Currency IS NULL
BEGIN
  UPDATE #Temp
  SET ExtInfo = 'Входящий итог: ' + CAST(ROUND(CAST(DayRez AS MONEY),2) AS VARCHAR) + ' ' + @NAMEMain + 
    CHAR(13) + CHAR(10) + 'Исходящий итог: ' + CAST(ROUND(CAST(@Dept AS MONEY),2) AS VARCHAR) + ' ' + @NAMEMain --+ 
--  CHAR(13) + CHAR(10) + 'Итог дня: ' + CAST(ROUND(DayRez,2) AS VARCHAR) + ' ' + @NAMEMain
  WHERE IsRes = 1
END
*/
--SELECT @Dept

-- ********************************************
SELECT *, GrpOper = 0, OperSum_OfferABS = ABS(OperSum_Offer)
INTO #Tmp_Rezult
FROM #Temp (NOLOCK)
ORDER BY TmpID, IsRes, DateCreate, isGrpOper DESC -- id_Oper

SELECT Tmp, 
  DaySumm = CAST(Sum(COALESCE(OperSum_Offer, 0)) AS money),
  id_cur = Id_Currency_Offer, 
  CurName = Min(CurrencyShortName)
INTO #RezTmp
FROM #Temp (NOLOCK)
WHERE IsRes = 0 AND isGrpOper = 0
GROUP BY Tmp, Id_Currency_Offer
HAVING Sum(COALESCE(OperSum_Offer, 0)) <> 0
ORDER BY Tmp DESC

-- SELECT * FROM #Temp
--SELECT * FROM #RezTmp RETURN

DECLARE @Tmp INT, @Tmp_old INT
DECLARE @DaySumm money
DECLARE @CurName VARCHAR(255)
DECLARE @RezStr VARCHAR(255)
/*
SELECT DISTINCT Id_Currency_Offer, CurrencyShortName
INTO #RRR
FROM #Temp (NOLOCK)
WHERE IsRes = 0
*/

SELECT Tmp = 0, R.Id_Currency_Offer, CurrencyShortName = MIN(R.CurrencyShortName), Rezz = CAST(0 AS money), SumIn = CAST(0 AS money), SumOut = CAST(0 AS money)
INTO #CurRez
FROM #Temp R (NOLOCK)
WHERE IsRes = 0
GROUP BY R.Id_Currency_Offer

UNION ALL

SELECT Tmp = 1, R.Id_Currency_Offer, CurrencyShortName = MIN(R.CurrencyShortName), Rezz = CAST(0 AS money), SumIn = CAST(0 AS money), SumOut = CAST(0 AS money)
FROM #Temp R (NOLOCK)
WHERE IsRes = 0 
GROUP BY R.Id_Currency_Offer


--SELECT * FROM #CurRez RETURN


IF NOT EXISTS(SELECT * FROM #CurRez (NOLOCK))
BEGIN
  INSERT INTO #CurRez(Tmp, Id_Currency_Offer, CurrencyShortName) VALUES(0, @id_CurrencyMain, @NAMEMain)
  INSERT INTO #CurRez(Tmp, Id_Currency_Offer, CurrencyShortName) VALUES(1, @id_CurrencyMain, @NAMEMain)
END

UPDATE #CurRez
SET Rezz = (SELECT ISNULL(Sum(COALESCE(OperSum_Offer, 0)), 0) FROM #Temp T (NOLOCK) WHERE T.Tmp >= #CurRez.Tmp AND T.id_Currency_Offer = #CurRez.Id_Currency_Offer AND OperVid <> -1 /*AND isGrpOper = 0*/)


UPDATE #CurRez
SET SumIn = (SELECT ISNULL(Sum(COALESCE(ABS(OperSum_Offer), 0)), 0) FROM #Temp T (NOLOCK) WHERE T.Tmp = 0 AND T.id_Currency_Offer = #CurRez.Id_Currency_Offer AND OperVid <> -1 /*AND isGrpOper = 0*/ AND OperTypeIn = 1)
WHERE Tmp = 0

UPDATE #CurRez
SET SumOut = (SELECT ISNULL(Sum(COALESCE(ABS(OperSum_Offer), 0)), 0) FROM #Temp T (NOLOCK) WHERE T.Tmp = 0 AND T.id_Currency_Offer = #CurRez.Id_Currency_Offer AND OperVid <> -1 /*AND isGrpOper = 0*/ AND OperTypeIn = 0)
WHERE Tmp = 0

-- SELECT OperSum_Offer, SummSys, PriceOper, AmountOper, Tmp, id_CurrencySys, id_CurrencyOper, OperVid, isGrpOper FROM #Temp
-- SELECT *, -(SELECT ISNULL(Sum(SIGN(OperSum_Offer)* COALESCE(SummSys, PriceOper*CASE WHEN AmountOper = 0 THEN 1 ELSE ISNULL(AmountOper, 1) END, 0)), 0) FROM #Temp T (NOLOCK) WHERE T.Tmp >= #CurRez.Tmp AND COALESCE(T.id_CurrencySys, T.id_CurrencyOper) = #CurRez.Id_Currency_Offer AND OperVid <> -1 AND isGrpOper = 0) FROM #CurRez RETURN
 
-- SELECT * FROM #Temp

--SELECT * FROM #Temp T (NOLOCK) WHERE T.Tmp = 0 AND T.id_Currency_Offer = 121 AND OperVid <> -1 AND isGrpOper = 0 AND OperTypeIn = 0
--SELECT * FROM #Temp T (NOLOCK) WHERE T.Tmp = 0 AND T.id_Currency_Offer = 121 AND OperVid <> -1 AND isGrpOper = 0 AND OperTypeIn =1

--SELECT * FROM #CurRez RETURN

/*
CREATE TABLE #CalcedCurRez(Tmp INT, ExtInfo VARCHAR(1000) )

DECLARE Rez_cursor CURSOR FOR
SELECT Tmp, Rezz, CurrencyShortName FROM #CurRez (NOLOCK) WHERE Rezz <> 0 ORDER BY Tmp DESC, CurrencyShortName
SET @RezStr = ''
OPEN Rez_cursor

FETCH NEXT FROM Rez_cursor
INTO @Tmp, @DaySumm, @CurName

SET @Tmp_old = @Tmp

WHILE @@FETCH_STATUS = 0
BEGIN
  IF @Tmp_old <> @Tmp 
  BEGIN
    INSERT INTO #CalcedCurRez (Tmp, ExtInfo) VALUES(@Tmp_old, @RezStr)

    SET @RezStr = ''
    SET @Tmp_old = @Tmp
  END
  
  IF ISNULL(@RezStr, '') = '' 
    SET @RezStr = CAST(ROUND(@DaySumm, 2) AS VARCHAR) + ' ' + @CurName
  ELSE
    SET @RezStr = ISNULL(@RezStr, '') + CHAR(13) + CHAR(10) + CAST(ROUND(@DaySumm,2) AS VARCHAR) + ' ' + @CurName

--SELECT  @Tmp, @DaySumm, @CurName, @RezStr
 
  FETCH NEXT FROM Rez_cursor
  INTO @Tmp, @DaySumm, @CurName
END

INSERT INTO #CalcedCurRez (Tmp, ExtInfo) VALUES(@Tmp_old, @RezStr)

CLOSE Rez_cursor
DEALLOCATE Rez_cursor

UPDATE #Tmp_Rezult 
SET ExtInfo = ISNULL(ExtInfo + CHAR(13) + CHAR(10), '') + ISNULL('Входящее состояние повалютно:' + ISNULL((SELECT CHAR(13) + CHAR(10) + ExtInfo FROM #CalcedCurRez (NOLOCK) WHERE #CalcedCurRez.Tmp = 1), ' 0 ' + @NameMain), '') 
WHERE Tmp = 0 AND isRes = 1

UPDATE #Tmp_Rezult 
SET ExtInfo = ISNULL(ExtInfo+ CHAR(13) + CHAR(10), '') + ISNULL('Исходящее состояние повалютно:' + ISNULL((SELECT  CHAR(13) + CHAR(10) + ExtInfo FROM #CalcedCurRez (NOLOCK) WHERE #CalcedCurRez.Tmp = 0), ' 0 ' + @NameMain), '') 

WHERE Tmp = 0 AND isRes = 1
*/

DECLARE @ID INT
SELECT @ID = Min(TmpID) FROM #Tmp_Rezult (NOLOCK) WHERE isRes = 1


--SELECT * FROM #CurRez RETURN

SELECT *
INTO #FT
FROM #Tmp_Rezult T (NOLOCK)
WHERE ((@DateFrom <= DateCreate OR @DateFrom IS NULL) AND (@DateTo >= DateCreate OR @DateTo IS NULL) AND isRes = 0
AND (@id_Currency IS NULL OR (@id_Currency = Id_Currency_Offer))
)
OR (TmpID = @ID) OR NNN <> 0
ORDER BY isRes, NNN, DateCreate, id_Oper, isGrpOper DESC


INSERT INTO #FT (GrpOper, NNN, Id_Currency_Offer, CurrencyShortName, S2, SumIN, SumOUT)
SELECT GrpOper = 0, -100, Id_Currency_Offer, COper.Name, Rezz, SumIN, SumOUT 
FROM #CurRez C (NOLOCK) 
JOIN VW_Currency COper (NOLOCK) ON COper.Id_Currency = C.Id_Currency_Offer
WHERE Tmp = 0 
ORDER BY CurrencyShortName 

---SELECT * FROM #FT RETURN

UPDATE #FT SET S1 = (SELECT SUM(Rezz) FROM #CurRez C (NOLOCK) WHERE Tmp = 1 AND C.Id_Currency_Offer = #FT.Id_Currency_Offer)


INSERT INTO #FT (GrpOper, NNN, Id_Currency_Offer, CurrencyShortName, S1, S2)
VALUES(0, -200, @Id_CurrencyMain, @NameMain, @S1, @S2)


/*
IF @id_Currency IS NOT NULL
  INSERT INTO #FT(OperNum, isRes, NNN, 
                  OperSummABS_D, CurrencyOperShortName_D, SummSysCurABS_D, NAMEMain, 
                  OperSummABS_K, CurrencyOperShortName_K, SummSysCurABS_K)
  SELECT OperNum = 'Итог',
   isRes = 0, NNN = 3, 
   OperSummABS_D = SUM(CASE WHEN @id_Currency = Id_Currency_Offer THEN OperSummABS_D ELSE 0 END), 
   CurrencyOperShortName_D = MIN(CurrencyOperShortName_D), 
   SummSysCurABS_D = SUM(CASE WHEN @id_Currency = Id_CurrencySys THEN SummSysCurABS_D ELSE 0 END),
   NAMEMain = @NAMEMain, 
   OperSummABS_K = SUM(CASE WHEN @id_Currency = Id_CurrencyOper THEN OperSummABS_K ELSE 0 END),
   MIN(CurrencyOperShortName_K), 
   SummSysCurABS_K = SUM(CASE WHEN @id_Currency = Id_CurrencySys THEN SummSysCurABS_K ELSE 0 END)
  FROM  #FT T (NOLOCK)
  WHERE OperTypeIn IS NOT NULL AND OperVid <> -1 AND (@id_Currency = Id_CurrencyOper OR @id_Currency = Id_CurrencySys)
  AND isGrpOper = 0
--  AND Tmp = 1
 -- HAVING SUM(OperSummABS_D) <> 0 OR SUM(SummSysCurABS_D) <> 0
*/

SET NOCOUNT OFF

if ISNULL(@id_User, 0) not in (SELECT Z.id_User FROM VW_UserHR Z) AND @id_Acc in (482, 468) 
BEGIN
  DELETE FROM #FT WHERE tmp is not null
  UPDATE #FT SET S1 = null, S2 = null, SumIN = null, SumOUT = null
END

SELECt * FROM #FT (NOLOCK) ORDER BY isRes, NNN, DateCreate, id_Oper, isGrpOper DESC, CurrencyShortName






GO

/****** Object:  StoredProcedure [dbo].[RPT_NewRepTree]    Script Date: 04/11/2018 21:40:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[RPT_NewRepTree] 
  @Id_business INT,
  @RepNum INT,
  @Year INT,

  @Str3 VARCHAR(255) = NULL,
  @Str4 VARCHAR(255) = NULL,
  @M INT = NULL,
  @id_User INT = NULL



-- @RepNum = -26 - не вошли в отчет
-- @RepNum = *100 - налоги
-- *@RepNum = *200 - расходы по офисам
-- *@RepNum = 300 - свод
-- *@RepNum = 400 - расходы производства

AS

 --select @RepNum return

DECLARE @isNew BIT
SET @isNew = 0
IF @Id_business < 0 SET @isNew = 1
SET @Id_business = ABS(@Id_business)


  IF @RepNum = 0
  BEGIN --select 1 return
    EXEC RPT_NewRepTree_CH @Id_business = @Id_business, @Year = @Year, @Str3 = @Str3, @M2 = @M, @id_User = @id_User
    RETURN
  END


DECLARE @IsRep INT

IF @RepNum < 0 
  SET @IsRep = 1
ELSE
  SET @IsRep = 0
   

SET @RepNum = ABS(@RepNum)


DECLARE @NAL INT

SET @NAL = Null
IF CHARINDEX('--нал--', @Str3) > 0 SET  @NAL = 1
IF CHARINDEX('--безнал--', @Str3)> 0  SET  @NAL = -1

--select @NAL


SET @Str3 = REPLACE(@Str3,'--нал--','')
SET @Str3 = REPLACE(@Str3,'--безнал--','')

  DECLARE @Sql NVARCHAR(4000), @SSS NVARCHAR(4000) 
  DECLARE @MN VARCHAR(255)
  DECLARE @MMM INT

  SET @MMM = MONTH(getdate()) - 1

  IF YEAR(getdate()) > @Year SET @MMM = 12

  IF @M = 0 SET @M = NULL

  SET @MN = Cast(@MMM as VARCHAR)

--select @MN

  CREATE TABLE #T(ID INT NOT NULL IDENTITY(1, 1), PID INT, ForOrder INT,
                  Name VARCHAR(255), ParentName VARCHAR(255),
                  M1_C FLOAT, M1_NC FLOAT, M1_TOTAL FLOAT,
                  M2_C FLOAT, M2_NC FLOAT, M2_TOTAL FLOAT,
                  M3_C FLOAT, M3_NC FLOAT, M3_TOTAL FLOAT,
                  M4_C FLOAT, M4_NC FLOAT, M4_TOTAL FLOAT,
                  M5_C FLOAT, M5_NC FLOAT, M5_TOTAL FLOAT,
                  M6_C FLOAT, M6_NC FLOAT, M6_TOTAL FLOAT,
                  M7_C FLOAT, M7_NC FLOAT, M7_TOTAL FLOAT,
                  M8_C FLOAT, M8_NC FLOAT, M8_TOTAL FLOAT,
                  M9_C FLOAT, M9_NC FLOAT, M9_TOTAL FLOAT,
                  M10_C FLOAT, M10_NC FLOAT, M10_TOTAL FLOAT,
                  M11_C FLOAT, M11_NC FLOAT, M11_TOTAL FLOAT,
                  M12_C FLOAT, M12_NC FLOAT, M12_TOTAL FLOAT,
                  Y_C FLOAT, Y_NC FLOAT, Y_TOTAL FLOAT,
                  AVG_C FLOAT, AVG_NC FLOAT, AVG_TOTAL FLOAT)


CREATE TABLE #WWW2(MMM INT, DateCreate DATETIME, id_Rez INT, id_OPer INT, id_Goods INT, WorkSum FLOAT, OperVid INT, OperTypeIn INT, Koeff INT, FormalName VARCHAR(255), FuncName VARCHAR(255), id_ContrAgent INT, CAName VARCHAR(255), AccName VARCHAR(255), ZZZ VARCHAR(255), Tmp VARCHAR(255))

DECLARE @D1 DATETIME, @D2 DATETIME
DECLARE @id_Rez INT
DECLARE @i INT


  SET @D1 = CAST('01-01-' +CAST(@Year as VARCHAR(10)) as DATETIME)
  SET @D2 = DATEADD(yy, 1, @D1) + CAST('23:59:59' as DATETIME) - 1


  INSERT INTO #WWW2(MMM, DateCreate, id_Rez, id_OPer, id_Goods, WorkSum, OperVid, OperTypeIn, Koeff, FormalName, FuncName, id_ContrAgent, CAName, AccName)
  SELECT @i, DateCreate, BO.id_Rez, OC.id_Oper, id_Goods, WorkSum = ISNULL(-CRN_OLD_OperSum_Offer * CASE WHEN Koeff = -1 THEN -1 ELSE 1 END, 0), OperVid, OperTypeIn, Koeff, FD.Name, FND.Name, CR.id_ContrAgent, CA.Name, isnull(Acc.Name, '666')
  FROM VW_Oper_WArc_prev_NEW OC (NOLOCK)
  LEFT JOIN OP_FormalDistrib FD (NOLOCK) ON FD.id_FormalDistrib=OC.id_FormalDistrib
  LEFT JOIN OP_FuncDistrib FND (NOLOCK) ON FND.id_FuncDistrib=OC.id_FuncDistrib
  LEFT JOIN BLN_Oper_v2 BO (NOLOCK) ON BO.id_Oper = OC.id_Oper
  LEFT JOIN VW_CA_Repr CR (NOLOCK) ON CR.id_Repr = OC.id_Repr
  LEFT JOIN Acc_Acc Acc (NOLOCK) ON Acc.id_Acc = OC.id_Acc
  LEFT JOIN CA_ContrAgent CA (NOLOCK) ON CA.id_ContrAgent = CR.id_ContrAgent
  WHERE
--  OC.OperVid >= 1 AND 
OC.HidedOper = 0 AND OC.Deleted = 0 AND
  (@id_business IS NULL OR @id_business = OC.id_business) AND
  (OC.DateCreate > @D1) AND (DateCreate <= @D2)
  AND OC.CheckDate IS NOT NULL
  AND (BO.id_Rez > @id_Rez OR @id_Rez IS NULL OR BO.id_Rez IS NULL)
  AND ((Koeff = -1) -- Помечена как затрата

  OR (OperVid = 4 AND OperTypeIn = 1 AND Koeff = 0))  


/*IF @RepNum = 300
begin
  UPDATE #WWW2 SET ZZZ = FuncName 
  UPDATE #WWW2 SET FuncName = FormalName 
  UPDATE #WWW2 SET FormalName = ZZZ 
end*/

--select FormalName from #WWW2 group by FormalName

IF @RepNum = -26 
BEGIN
  DELETE FROM #WWW2 WHERE (lower(FormalName) like '%асходы производства%' or lower(FuncName) like '%налог%' or
                           lower(FuncName) like '%налог%' or lower(FormalName) like '%кутузовский%' or lower(FormalName) like '%екатеринбург%' or lower(FormalName) like '%снежинск%'
                             or lower(FormalName) like '%челябинск%'
                             or lower(FormalName) like '%овгород%' or lower(FormalName) like '%офис%')
END
ELSE
IF @RepNum = 300 
BEGIN
  DELETE FROM #WWW2 WHERE (FuncName <> @Str4 and @Str4 is not null)
  DELETE FROM #WWW2 WHERE (FormalName <> @Str3 and @Str3 is not null)
 -- UPDATE #WWW2 SET Tmp = FuncName;
 -- UPDATE #WWW2 SET FuncName = FormalName;
 -- UPDATE #WWW2 SET FormalName = Tmp;
END
ELSE
IF @RepNum = 400 
BEGIN
  DELETE FROM #WWW2 WHERE not(lower(FormalName) like '%асходы производства%')

  DELETE FROM #WWW2 WHERE (FuncName <> @Str4 and @Str4 is not null)
 -- UPDATE #WWW2 SET Tmp = FuncName;
 -- UPDATE #WWW2 SET FuncName = FormalName;
 -- UPDATE #WWW2 SET FormalName = Tmp;
END
ELSE
IF @RepNum = 100 
BEGIN
  DELETE FROM #WWW2 WHERE not(lower(FuncName) like '%налог%')
--select * from #WWW2
 -- DELETE FROM #WWW2 WHERE (FormalName <> @Str3 and @Str3 is not null)

  DELETE FROM #WWW2 WHERE (AccName <> @Str4 and @Str4 is not null)
  DELETE FROM #WWW2 WHERE (FuncName <> @Str3 and @Str3 is not null)
  

 -- if not (@Str3 is null and @RepNum <> -26)
  BEGIN

    UPDATE #WWW2 SET FormalName = AccName;


    UPDATE #WWW2 SET Tmp = FuncName;
    UPDATE #WWW2 SET FuncName = FormalName;
    UPDATE #WWW2 SET FormalName = Tmp;

  END

 -- select * from #WWW2

END
ELSE
IF @RepNum = 200 
BEGIN
  DELETE FROM #WWW2 WHERE not(lower(FormalName) like '%кутузовский%' or lower(FormalName) like '%екатеринбург%' or lower(FormalName) like '%снежинск%'
                             or lower(FormalName) like '%челябинск%'

                             or lower(FormalName) like '%овгород%' or lower(FormalName) like '%офис%')
  DELETE FROM #WWW2 WHERE (FuncName <> @Str4 and @Str4 is not null)
  DELETE FROM #WWW2 WHERE (FormalName <> @Str3 and @Str3 is not null)

END
ELSE
BEGIN 
  SET @i = 1
 -- DELETE FROM #WWW2 WHERE (lower(CAName) like '%налог%' or lower(CAName) like '%кутузовский%' or lower(CAName) like '%екатеринбург%'
 --                            or lower(CAName) like '%челябинск%'
 --                            or lower(CAName) like '%Новгород%'
 --                            or lower(CAName) like '%рябиновой%' or lower(FormalName) like '%откат%')

--select * FROM #WWW2 WHERE (lower(CAName) like '%Екатеринбург%')
END

--select count(*) from #WWW2 return

IF @RepNum = 300 
BEGIN
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Зарпла%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Преми%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like '%мерческие%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Финансовые услуги%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Снежинск, офис%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Москва%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Челябинск%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Екатеринбург%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like '%Новгород%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Транспорт%' GROUP BY FormalName
  insert into #T(Name) select FormalName from #WWW2 (NOLOCK) WHERE FormalName like 'Расходы%' GROUP BY FormalName
  insert into #T(Name) select 'ИТОГО' WHERE @isNew = 1
END


insert into #T(Name)
select FormalName from #WWW2 (NOLOCK) 
WHERE not FormalName in (select FormalName from #T (NOLOCK) )
GROUP BY FormalName
ORDER BY FormalName

--select * from #T return

insert into #T(Name, PID)
select '  ' + FuncName, PID = (SELECT MAX(ID) FROM #T WHERE Name = #WWW2.FormalName) 
from #WWW2 (NOLOCK) 
GROUP BY FuncName, FormalName
ORDER BY FuncName

UPDATE #T SET ParentName = (Select MAX(Name) FROM #T X WHERE X.ID = #T.PID)
UPDATE #T SET ForOrder = ID WHERE PID IS NULL
UPDATE #T SET ForOrder = PID WHERE PID IS NOT NULL

SET @i = 1

WHILE @i <= 12
BEGIN
  SET @D1 = CAST('01-01-' +CAST(@Year as VARCHAR(10)) as DATETIME)
  SET @D1 = DATEADD(mm, @i - 1, @D1)  

  SET @D2 = DATEADD(mm, 1, @D1) + CAST('23:59:59' as DATETIME) - 1

--select @i
  SELECT @id_Rez = MAX(id_Rez)
  FROM BLN_Rez_v2 (NOLOCK) 
  WHERE ddd = 0 AND id_business = @id_business AND (DateCreate < @D1) 
  
  UPDATE #WWW2 SET MMM = @i
  WHERE (DateCreate <= @D2)  AND (id_Rez > @id_Rez OR @id_Rez IS NULL OR id_Rez IS NULL)
  AND MMM IS NULL

  SET @SQL = N'update #T set ' +
  ' M' + Cast(@i as VARCHAR) + '_TOTAL=(select SUM(WorkSum) from #WWW2 where ltrim(Name)=FuncName and ParentName=FormalName and MMM = ' + Cast(@i as VARCHAR) + ')' +
  ', M' + Cast(@i as VARCHAR) + '_C=(select SUM(WorkSum) from #WWW2 where AccName like ''%касса%'' and ltrim(Name)=FuncName and ParentName=FormalName and MMM = ' + Cast(@i as VARCHAR) + ')' +
  ', M' + Cast(@i as VARCHAR) + '_NC=(select SUM(WorkSum) from #WWW2 where AccName not like ''%касса%'' and ltrim(Name)=FuncName and ParentName=FormalName and MMM = ' + Cast(@i as VARCHAR) + ')'
 -- select @SQL
  EXEC sp_executesql @SQL

  SET @SQL = N'update #T set ' +
  ' M' + Cast(@i as VARCHAR) + '_TOTAL=(select SUM(M' + Cast(@i as VARCHAR) + '_TOTAL) from #T X where X.PID=#T.ID)' +
  ', M' + Cast(@i as VARCHAR) + '_C=(select SUM(M' + Cast(@i as VARCHAR) + '_C) from #T X where X.PID=#T.ID)' +
  ', M' + Cast(@i as VARCHAR) + '_NC=(select SUM(M' + Cast(@i as VARCHAR) + '_NC) from #T X where X.PID=#T.ID)' +
  ' WHERE PID IS NULL'
  EXEC sp_executesql @SQL


  SET @SQL = N'update #T set ' +
  ' M' + Cast(@i as VARCHAR) + '_TOTAL=(select SUM(M' + Cast(@i as VARCHAR) + '_TOTAL) from #T X where X.PID IS NULL)' +
  ', M' + Cast(@i as VARCHAR) + '_C=(select SUM(M' + Cast(@i as VARCHAR) + '_C) from #T X  where X.PID IS NULL)' +
  ', M' + Cast(@i as VARCHAR) + '_NC=(select SUM(M' + Cast(@i as VARCHAR) + '_NC) from #T X  where X.PID IS NULL)' +
  ' WHERE Name=' + '''' + 'ИТОГО' + ''''
  EXEC sp_executesql @SQL


  SET @SSS = 'CASE WHEN ' + @MN + '>= ' + Cast(@i as VARCHAR) + ' THEN 1 ELSE 0 END *'
  SET @SQL = N'update #T set Y_C=isnull(Y_C, 0)+' + @SSS + 'isnull(M' + Cast(@i as VARCHAR) + '_C, 0), ' +
         'Y_NC=isnull(Y_NC, 0)+' + @SSS + 'isnull(M' + Cast(@i as VARCHAR) + '_NC, 0), ' +
         'Y_TOTAL=isnull(Y_TOTAL, 0)+' + @SSS + 'isnull(M' + Cast(@i as VARCHAR) + '_TOTAL, 0)'
  EXEC sp_executesql @SQL

--select @SQL

  SET @i = @i + 1
END



--select @MMM

if @MMM >= 1 
  UPDATE #T set AVG_C=Y_C/@MMM, AVG_NC=Y_NC/@MMM, AVG_TOTAL=Y_TOTAL/@MMM

UPDATE #T set  Name = REPLACE(Name, '*', ''), ParentName = REPLACE(ParentName, '*', '')
--select * from #WWW2 ORDER BY DateCreate

--select FormalName, FuncName, CAName, AccName from #WWW2 GROUP BY FormalName, FuncName, CAName, AccName

--select count(*) from #WWW2

delete from #WWW2 where isnull(MMM, -1) <> @M and @M > 0

--select * from #WWW2 return


if @Str3 is null and @RepNum <> -26 and @IsRep <> 1
BEGIN

  if ISNULL(@id_User, 0) not in (SELECT Z.id_User FROM VW_UserHR Z) AND @RepNum = 300 -- AND 1=2
  BEGIN
    DELETE FROM #T
  END

 -- UPDATE #T SET Name = '			' + name where PID IS NOT NULL  
  select * from #T ORDER BY ForOrder, PID, Name
END
else
BEGIN

IF @NAL = 1 DELETE FROM #WWW2 WHERE not (AccName like '%касса%')
IF @NAL = -1 DELETE FROM #WWW2 WHERE (AccName like '%касса%')


  SELECT WorkSum, OC.*
  FROM VW_Oper_WArc_Oper_New OC (NOLOCK)
  LEFT JOIN OP_FormalDistrib FD (NOLOCK) ON FD.id_FormalDistrib=OC.id_FormalDistrib
  LEFT JOIN OP_FuncDistrib FND (NOLOCK) ON FND.id_FuncDistrib=OC.id_FuncDistrib
  JOIN #WWW2 T (NOLOCK) ON OC.ID_Oper = T.ID_Oper AND Isnull(OC.id_Goods, -1) = Isnull(T.id_Goods, -1) 
END








GO

/****** Object:  StoredProcedure [dbo].[RPT_NewRepTree_CH]    Script Date: 04/11/2018 21:40:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[RPT_NewRepTree_CH] 
  @Id_business INT = 43,
  @Year INT = 2013,

  @Str3 VARCHAR(255) = 'Сырьевые затраты в балансе, руб',
  @M2 INT = 7,
  @id_User INT = NULL

AS  
if ISNULL(@id_User, 0) not in (SELECT Z.id_User FROM VW_UserHR Z) AND @Str3 = 'Несырьевые затраты, руб'-- AND 1=2
BEGIN
  SELECT @Year = 1900
 -- DELETE FROM #WWW2  
END


SET @Str3 = ltrim(@Str3)
DECLARE @D1 DATETIME, @D2 DATETIME

  SET @D1 = CAST('01-01-' +CAST(@Year as VARCHAR(10)) as DATETIME)
  SET @D2 = DATEADD(mm, @M2, @D1) + CAST('23:59:59' as DATETIME) - 1
  SET @D1 = DATEADD(mm, @M2 - 2, @D1)  

  DECLARE @id_Rez INT, @i INT
 
--select @D1, @D2 return

DECLARE @WWW TABLE (WorkSum FLOAT, id_OPer INT, ZZZ VARCHAR(255), id_Goods INT)

 SELECT ISNULL(id_OperWare, -1) as id_OperWare, CAST(NULL as FLOAT) as WorkSum, NULL as MMM, id_WareHouse, id_Acc, 
DateCreate, ISNULL(id_Goods, -1) as id_Goods, OC.id_Repr, CR.id_ContrAgent, BO.id_Rez, OC.id_Oper, PriceInv, 
OperRateDeltaCur = ISNULL(CRN_CurChDelta/*CRN_OperRateDelta*/, 0),CRN_OperSum_Inv, OperSummSysCur = CRN_OLD_OperSum_Offer, 
OperTotalDeltaCur = CRN_OperDelta + ISNULL(CRN_OperRateDelta, 0), CRN_CurChDelta, OperVid, OperTypeIn, Koeff, id_Manufact, id_Manufact_Ext, OpComment,
id_FormalDistrib, id_FuncDistrib 
  INTO #WWW2
  FROM VW_Oper_WArc_prev_NEW OC (NOLOCK)
  LEFT JOIN BLN_Oper_v2 BO (NOLOCK) ON BO.id_Oper = OC.id_Oper
  LEFT JOIN CA_Repr CR (NOLOCK) ON CR.id_Repr = OC.id_Repr
  WHERE
  HidedOper = 0 AND Deleted = 0 AND
  (@id_business = OC.id_business) AND
  (DateCreate > @D1) AND (DateCreate <= @D2)
  AND OC.CheckDate IS NOT NULL
  AND (BO.id_Rez > @id_Rez OR @id_Rez IS NULL OR BO.id_Rez IS NULL)
 -- AND @M2 = MONTH(DateCreate)

--return
DELETE FROM #WWW2 WHERE id_ContrAgent=4329 AND NOT(OperVid = 1 AND OperTypeIn = 0)

SET @i = @M2 - 1
WHILE @i <= @M2
BEGIN
  SET @D1 = CAST('01-01-' +CAST(@Year as VARCHAR(10)) as DATETIME)
  SET @D1 = DATEADD(mm, @i - 1, @D1)  

  SET @D2 = DATEADD(mm, 1, @D1) + CAST('23:59:59' as DATETIME) - 1

--select @i
  SELECT @id_Rez = MAX(id_Rez)
  FROM BLN_Rez_v2 (NOLOCK) 
  WHERE ddd = 0 AND id_business = @id_business AND (DateCreate < @D1) 
  
  UPDATE #WWW2 SET MMM = @i WHERE (DateCreate <= @D2)  AND (id_Rez > @id_Rez OR @id_Rez IS NULL OR id_Rez IS NULL) AND MMM IS NULL

  SET @i = @i + 1
END

--return
  
 -- DELETE FROM #WWW2 WHERE id_Rez < @id_Rez
 


 --- Несырь. затраты
/*
   INSERT INTO #WWW(ZZZ, id_Oper, id_Goods, WorkSum)
  SELECT 'Несырьевые затраты, руб', id_Oper, id_Goods, WorkSum = ISNULL(ISNULL(CASE WHEN PriceInv IS NOT NULL THEN CRN_OperSum_Inv ELSE -OperSummSysCur * CASE WHEN Koeff = -1 THEN -1 ELSE 1 END END, 0), 0)
  FROM #WWW2 (NOLOCK) WHERE MMM = @M2 AND ((Koeff = -1) OR (OperVid = 4 AND OperTypeIn = 1 AND Koeff = 0))

  INSERT INTO #WWW(ZZZ, id_Oper, id_Goods, WorkSum)
  SELECT 'Несырьевые затраты, руб', id_Oper, id_Goods, ISNULL(ISNULL(-OperTotalDeltaCur, 0), 0) 
  FROM #WWW2 (NOLOCK) WHERE MMM = @M2 AND ((OperVid = 1 AND OperTypeIn = 0 AND OperTotalDeltaCur < 0 AND Koeff = 0))

  INSERT INTO #WWW(ZZZ, id_Oper, id_Goods, WorkSum)
  SELECT 'Несырьевые затраты, руб', id_Oper, id_Goods, ISNULL(-CRN_CurChDelta, 0) 
  FROM #WWW2 (NOLOCK) WHERE MMM = @M2 AND (CRN_CurChDelta < 0 AND NOT(OperVid = 1 AND OperTypeIn = 0))
 */


  IF @Str3 = 'Курсовые - поставщики, руб' --and 1=2
  BEGIN
--select getdate()
    	UPDATE #WWW2 SET WorkSum = OperSummSysCur -- PriceFinOper * CASE WHEN OperTypeIn = 1 THEN -1 ELSE 1 END
	WHERE MMM = @M2 AND (id_FormalDistrib=159 AND id_FuncDistrib=224 ) AND OperVid=4
        AND id_ContrAgent in (select id_ContrAgent from CA_ContrAgent CA, CA_CAGroup CAG WHERE CAG.id_CAGroup=CA.id_CAGroup AND CAG.name like 'Поставщики%') 
   END  
  IF @Str3 = 'Курсовые - покупатели, руб' --and 1=2
  BEGIN
--select getdate()
    	UPDATE #WWW2 SET WorkSum = OperSummSysCur -- PriceFinOper * CASE WHEN OperTypeIn = 1 THEN -1 ELSE 1 END
	WHERE MMM = @M2 AND (id_FormalDistrib=159 AND id_FuncDistrib=224 ) AND OperVid=4
        AND id_ContrAgent in (select id_ContrAgent from CA_ContrAgent CA, CA_CAGroup CAG WHERE CAG.id_CAGroup=CA.id_CAGroup AND CAG.name like 'Покупатели%') 
   END  
  IF @Str3 = 'Курсовые - неопр, руб' --and 1=2
  BEGIN
--select getdate()
    	UPDATE #WWW2 SET WorkSum = OperSummSysCur -- PriceFinOper * CASE WHEN OperTypeIn = 1 THEN -1 ELSE 1 END
	WHERE MMM = @M2 AND (id_FormalDistrib=159 AND id_FuncDistrib=224 ) AND OperVid=4
        AND id_ContrAgent in (select id_ContrAgent from CA_ContrAgent CA, CA_CAGroup CAG WHERE CAG.id_CAGroup=CA.id_CAGroup AND CAG.name not like 'Покупатели%' AND CAG.name not like 'Поставщики%') 
   END  

-- Обсчет Сырьевые затраты
  IF @Str3 = 'Сырьевые затраты в балансе, руб' --and 1=2
  BEGIN
--select getdate()
    	UPDATE #WWW2 SET WorkSum = - OperSummSysCur
	WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 0) )  AND Koeff = 0
    	UPDATE #WWW2 SET WorkSum = OperSummSysCur
	WHERE MMM = @M2 AND (OperTypeIn = 1 AND id_Manufact IS NOT NULL) AND Koeff = 0


    	UPDATE #WWW2 SET WorkSum = CASE WHEN id_Manufact IS NOT NULL THEN 1 ELSE -1 END * OperSummSysCur
	WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 1 AND id_Manufact_Ext <> 39) OR (OperTypeIn = 0 AND id_Manufact IS NOT NULL AND id_Manufact <> 39))  AND Koeff = 0
  END  

  IF @Str3 = 'Затраты на образцы, руб' --and 1=2
  BEGIN
--select getdate()
    	UPDATE #WWW2 SET WorkSum = - OperSummSysCur
	WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 0) )  AND Koeff = 0
	  AND (OpComment like '%Заказ №%т-%'  OR OpComment like '%Заказ №%о-%' )

    	UPDATE #WWW2 SET WorkSum = OperSummSysCur
	WHERE MMM = @M2 AND (OperTypeIn = 1 AND id_Manufact IS NOT NULL) AND Koeff = 0
        AND (OpComment like '%Заказ №%т-%'  OR OpComment like '%Заказ №%о-%' )



    	UPDATE #WWW2 SET WorkSum = CASE WHEN id_Manufact IS NOT NULL THEN 1 ELSE -1 END * OperSummSysCur
	WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 1 AND id_Manufact_Ext <> 39) OR (OperTypeIn = 0 AND id_Manufact IS NOT NULL AND id_Manufact <> 39))  AND Koeff = 0
	AND (OpComment like '%Заказ №%т-%'  OR OpComment like '%Заказ №%о-%' )
  END  

  IF @Str3 = 'Остальные cырьевые затраты, руб' --and 1=2
  BEGIN
--select getdate()
    	UPDATE #WWW2 SET WorkSum = - OperSummSysCur
	WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 0) )  AND Koeff = 0
	  AND not (OpComment like '%Заказ №%т-%' OR OpComment like '%Заказ №%о-%' )

    	UPDATE #WWW2 SET WorkSum = OperSummSysCur
	WHERE MMM = @M2 AND (OperTypeIn = 1 AND id_Manufact IS NOT NULL) AND Koeff = 0
        AND not (OpComment like '%Заказ №%т-%'  OR OpComment like '%Заказ №%о-%' )



    	UPDATE #WWW2 SET WorkSum = CASE WHEN id_Manufact IS NOT NULL THEN 1 ELSE -1 END * OperSummSysCur
	WHERE MMM = @M2 AND ((id_Manufact_Ext IS NOT NULL AND OperTypeIn = 1 AND id_Manufact_Ext <> 39) OR (OperTypeIn = 0 AND id_Manufact IS NOT NULL AND id_Manufact <> 39))  AND Koeff = 0
	AND not (OpComment like '%Заказ №%т-%'  OR OpComment like '%Заказ №%о-%' )
  END  


  IF @Str3 = 'Несырьевые затраты, руб' --and 1=2
  BEGIN
 	UPDATE #WWW2 SET WorkSum = CASE WHEN PriceInv IS NOT NULL THEN CRN_OperSum_Inv ELSE -OperSummSysCur * CASE WHEN Koeff = -1 THEN -1 ELSE 1 END END
        WHERE MMM = @M2 AND ( (Koeff = -1) OR (OperVid = 4 AND OperTypeIn = 1 AND Koeff = 0) )
    	
	UPDATE #WWW2 SET WorkSum = -OperTotalDeltaCur
	WHERE MMM = @M2 AND ((OperVid = 1 AND OperTypeIn = 0 AND OperTotalDeltaCur < 0 AND Koeff = 0))


    	UPDATE #WWW2 SET WorkSum = -CRN_CurChDelta
	WHERE MMM = @M2 AND (CRN_CurChDelta < 0 AND NOT(OperVid = 1 AND OperTypeIn = 0))
  END

  IF @Str3 = 'Выручка, руб' --and 1=2
  BEGIN
 	UPDATE #WWW2 SET WorkSum = CASE WHEN OperVid = 4 THEN
     OperSummSysCur 
    ELSE 
      CASE WHEN OperRateDeltaCur < 0 AND id_Goods IS NOT NULL AND OperTypeIn = 0 AND Koeff = 0 THEN 
        OperTotalDeltaCur - CRN_CurChDelta
      ELSE 
        OperTotalDeltaCur END 
    END
        WHERE MMM = @M2 AND (
    ((id_Goods IS NOT NULL AND OperTypeIn = 0 AND Koeff = 0) OR (OperVid = 4 AND OperTypeIn = 0))
    AND id_Repr IS NOT NULL AND NOT (OperVid = 1 AND OperTypeIn = 0 AND OperTotalDeltaCur < 0 AND Koeff = 0) -- Складские операции, с отрицательной прибылью
      )
    	
	UPDATE #WWW2 SET WorkSum = CASE WHEN PriceInv IS NOT NULL THEN -CRN_OperSum_Inv ELSE -OperSummSysCur * CASE WHEN OperVid = 4 THEN -1 ELSE 1 END END
	WHERE MMM = @M2 AND (Koeff = 1)

    	UPDATE #WWW2 SET WorkSum = -OperSummSysCur
	WHERE MMM = @M2  AND (id_Manufact_Ext  =39 AND id_WareHouse IS NOT NULL) AND OperTypeIn = 1 AND Koeff = 0


    	UPDATE #WWW2 SET WorkSum = -OperTotalDeltaCur
	WHERE MMM = @M2  AND id_ContrAgent=4329 AND NOT(OperVid = 1 AND OperTypeIn = 0)


  END

-- ****************

 /*
select sum(W.WorkSum), count(*) FROM #WWW W
select sum(R.WorkSum), count(*)  from aa_R R


select R.id_Oper, W.id_Oper, R.WorkSum, W.WorkSum
FROM #WWW W
LEFT JOIN aa_R R ON W.id_Oper = R.id_Oper AND Isnull(W.id_Goods, -1) = Isnull(R.id_Goods, -1) AND W.WorkSum = R.WorkSum 
where R.id_Oper is null
return
*/
 --select sum(WorkSum) from #WWW2 WHERE WorkSum IS NOT NULL --return

 -- SELECT OC.* INTO #Z FROM VW_Oper_WArc_Oper_New OC (NOLOCK) JOIN #WWW2 T ON OC.ID_Oper = T.ID_Oper AND Isnull(OC.id_OperWare, -1) = T.id_OperWare 
 -- WHERE WorkSum IS NOT NULL

--select WorkSum, OC.id_OperWare, ID_Oper INTO AAA_T1  from #WWW2 OC return



  SELECT WorkSum, OC.*
  FROM #WWW2 T 
  JOIN VW_Oper_WArc_Oper_New OC (NOLOCK) ON OC.ID_Oper = T.ID_Oper AND Isnull(OC.id_OperWare, -1) = T.id_OperWare    
  WHERE ISNULL(WorkSum, 0) <> 0 -- ZZZ = @Str3 OR @Str3 IS NULL
  ORDER BY WorkSum







GO

/****** Object:  StoredProcedure [dbo].[BJ_TreeGet_Det]    Script Date: 04/11/2018 21:40:08 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO









ALTER PROCEDURE [dbo].[BJ_TreeGet_Det]
  @id_BJ_Obj INT,
  @id_Acc INT = NULL,
  @id_ContrAgent INT = NULL,
  @id_BJ_Item INT = NULL,
  @id_Oper INT = NULL,
  @DateRep DATETIME = NULL,
  @id_User INT = NULL
AS

SET NOCOUNT ON

CREATE TABLE #T (id_Oper2 INT, S_Pay FLOAT, S_Off FLOAT)

CREATE TABLE #RRR (id_BJ_Tree int, id_BJ_Item int, id_Acc INT, id_ContrAgent INT, isInState BIT, isDeb BIT) 

INSERT INTO #RRR(id_BJ_Item, id_Acc, id_ContrAgent, isDeb, isInState)
SELECT id_BJ_Item, id_Acc, id_ContrAgent, isDeb, ISNULL(isInState, 0)
FROM BJ_Item I (NOLOCK) 
JOIN BJ_Tree T (NOLOCK) ON T.id_BJ_Tree = I.id_BJ_Tree
WHERE T.id_BJ_Obj = @id_BJ_Obj AND I.Disabled = 0 AND T.Disabled = 0
--AND isInState = 0

  DECLARE @StartDate DATETIME, @StopDate DATETIME, @id_business INT

  SELECT @StartDate = StartDate, @StopDate = StopDate + 1, @id_business = id_business FROM BJ_Obj (NOLOCK) WHERE id_BJ_Obj = @id_BJ_Obj
  
  CREATE TABLE #T_OP (ID INT IDENTITY (1, 1), id_Oper INT, CRN_OLD_OperSum_Offer FLOAT, CRN_OLD_OperSum FLOAT, 
                      id_Acc INT, id_Acc_Ext INT, id_ContrAgent INT, id_BJ_Item int, OperVid INT, Koeff INT, OperTypeIn INT)

  SELECT OC.id_Oper
  INTO #www 
  FROM OP_Oper2 OC (NOLOCK)
  LEFT JOIN BJ_OperRel ORel (NOLOCK) ON ORel.id_Oper = OC.id_Oper AND ORel.id_BJ_Obj = @id_BJ_Obj
  WHERE (OC.id_Oper = @id_Oper OR @id_Oper IS NULL) AND
  OC.OperVid in (-1, 2, 102, 4) AND HidedOper = 0 AND Deleted = 0 AND OC.CheckDate IS NOT NULL AND
  @id_business = OC.id_business AND
  (OC.DateCreate >= @StartDate AND OC.DateCreate <= @StopDate)
  AND (@DateRep IS NULL OR @id_Oper IS NOT NULL OR OC.DateCreate <= @DateRep)
  AND (ISNULL(NotUse, 0) = 0)
--  and OC.id_Oper <= 224408 -- 225769
--and OC.OperVid = -1
  GROUP BY OC.id_Oper

  INSERT INTO #T_OP(id_Oper, CRN_OLD_OperSum_Offer, CRN_OLD_OperSum, id_Acc, id_Acc_Ext, id_ContrAgent, id_BJ_Item, OperVid, Koeff, OperTypeIn)
  SELECT w.id_Oper, CRN_OLD_OperSum_Offer, CRN_OLD_OperSum, OC.id_Acc, id_Acc_Ext, 
  id_ContrAgent = ISNULL(id_ContrAgent_Ex, CR.id_ContrAgent), 
  BI.id_BJ_Item, --id_BJ_Item = CASE WHEN T.id_BJ_Obj IS NULL THEN NULL ELSE BI.id_BJ_Item END, 
  OperVid, Koeff, OperTypeIn 
  FROM VW_Oper_WArc_prev_New OC
  JOIN #www w (NOLOCK) ON w.id_Oper = OC.id_Oper 
  LEFT JOIN CA_Repr CR (NOLOCK) ON CR.id_Repr = OC.id_Repr
  LEFT JOIN BJ_OperRel ORel (NOLOCK) ON ORel.id_Oper = OC.id_Oper AND ORel.id_BJ_Obj = @id_BJ_Obj
  LEFT JOIN BJ_Item BI (NOLOCK) ON BI.id_BJ_Item = ORel.id_BJ_Item AND BI.Disabled = 0

 -- SELECT *  FROM #www G (NOLOCK)
 -- SELECT id_Oper  FROM #T_OP G (NOLOCK)

  -- счета -- 
IF @id_Acc IS NOT NULL
BEGIN  
  INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
  SELECT id_Oper, CASE WHEN isDeb = 1 THEN -1 ELSE 1 END * -CRN_OLD_OperSum, NULL
  FROM #T_OP G (NOLOCK)
  JOIN #RRR R (NOLOCK) ON R.id_Acc = G.id_Acc
  WHERE G.id_Acc = @id_Acc

  INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
  SELECT id_Oper, CASE WHEN isDeb = 1 THEN -1 ELSE 1 END * CRN_OLD_OperSum, NULL
  FROM #T_OP G (NOLOCK)
  JOIN #RRR R (NOLOCK) ON R.id_Acc = G.id_Acc_Ext
  WHERE G.id_Acc_Ext = @id_Acc

--select 1
  -- счета  конец -- 
END


IF @id_ContrAgent IS NOT NULL
BEGIN  
  -- КА -- 
  
  INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
  SELECT id_Oper, 
         CASE WHEN OperVid <> 4 THEN 1 ELSE NULL END * CASE WHEN isDeb = 1 THEN -1 ELSE 1 END * CRN_OLD_OperSum_Offer,
         CASE WHEN OperVid =  4 THEN 1 ELSE NULL END * CASE WHEN isDeb = 1 THEN -1 ELSE 1 END * CRN_OLD_OperSum_Offer
  FROM #T_OP G (NOLOCK)
  JOIN #RRR R (NOLOCK) ON R.id_ContrAgent = G.id_ContrAgent
  WHERE G.id_ContrAgent = @id_ContrAgent AND /*G.id_BJ_Item IS NULL AND*/ Koeff = 0
--select 13
  -- КА  конец -- 
END
IF @id_BJ_Item IS NOT NULL
BEGIN  
  -- Статьи -- 
    SELECT id_ContrAgent 
    INTO #RRR_CA
    FROM #RRR (NOLOCK) 
    WHERE id_ContrAgent IS NOT NULL
    GROUP BY id_ContrAgent


  INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
  SELECT id_Oper, 
         CASE WHEN isDeb = 1 THEN -1 ELSE 1 END * CRN_OLD_OperSum * CASE WHEN OperVid = 4 THEN Null ELSE 1 END,
         CASE WHEN isDeb = 1 THEN -1 ELSE 1 END * -CRN_OLD_OperSum * CASE WHEN OperVid <> 4 THEN Null ELSE 1 END
         * CASE WHEN C.id_ContrAgent IS NULL THEN -1 ELSE 1 END
  FROM #T_OP G (NOLOCK)
  JOIN #RRR R (NOLOCK) ON R.id_BJ_Item = G.id_BJ_Item
  LEFT JOIN #RRR_CA C (NOLOCK) ON C.id_ContrAgent = G.id_ContrAgent
  WHERE G.id_BJ_Item = @id_BJ_Item
--select * FROM #RRR Where id_Acc=530
--select 199
  IF @id_BJ_Item < 0 
  BEGIN
    SELECT id_Acc 
    INTO #RRR_ACC
    FROM #RRR (NOLOCK) 
    WHERE id_Acc IS NOT NULL
    GROUP BY id_Acc

    IF @id_BJ_Item = -4
    BEGIN
      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      JOIN #RRR_Acc R2 (NOLOCK) ON R2.id_Acc = OP.id_Acc_Ext  --1013
      LEFT JOIN #RRR_Acc R (NOLOCK) ON R.id_Acc = OP.id_Acc
      WHERE OP.id_Acc is not null AND R.id_Acc is null and OP.id_BJ_Item is null and Koeff=0

      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      JOIN #RRR_CA R2 (NOLOCK) ON R2.id_ContrAgent = OP.id_ContrAgent  --1013
      LEFT JOIN #RRR_Acc R (NOLOCK) ON R.id_Acc = OP.id_Acc
      WHERE OP.id_Acc is not null AND R.id_Acc is null and OP.id_BJ_Item is null and Koeff=0

      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      JOIN #RRR R2 (NOLOCK) ON R2.id_BJ_Item = OP.id_BJ_Item  --1013
      LEFT JOIN #RRR_Acc R (NOLOCK) ON R.id_Acc = OP.id_Acc
      LEFT JOIN #RRR_CA R4 (NOLOCK) ON R4.id_ContrAgent = OP.id_ContrAgent
      WHERE OP.id_Acc is not null AND R.id_Acc is null and OP.id_BJ_Item is NOT null 
      AND COALESCE(R4.id_ContrAgent, R.id_Acc) IS NULL

    

      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, -CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      JOIN #RRR_Acc R2 (NOLOCK) ON R2.id_Acc = OP.id_Acc --1013
      LEFT JOIN #RRR R (NOLOCK) ON R.id_Acc = OP.id_Acc_Ext
      WHERE OP.id_Acc_Ext is not null AND R.id_Acc is null and OP.id_BJ_Item is null and Koeff=0

    END
    IF @id_BJ_Item = -5
    BEGIN
      SELECT id_Acc, isDeb  INTO #RRR_EEE FROM #RRR (NOLOCK) WHERE id_Acc IS NOT NULL AND isInState = 0 GROUP BY id_Acc, isDeb 

      INSERT INTO #T(id_Oper2, S_Pay, S_Off)
      SELECT id_Oper, -CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      JOIN #RRR_EEE R (NOLOCK) ON R.id_Acc = OP.id_Acc 
      WHERE OP.OperVid = -1

      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, CRN_OLD_OperSum_Offer - CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      LEFT JOIN #RRR_CA R (NOLOCK) ON R.id_ContrAgent = OP.id_ContrAgent 
      LEFT JOIN #RRR_Acc R2 (NOLOCK) ON R2.id_Acc = OP.id_Acc 
      WHERE (ISNULL(CRN_OLD_OperSum_Offer - CRN_OLD_OperSum, 0) <> 0) AND OP.id_ContrAgent IS NOT NULL AND OP.Koeff = 0
      AND COALESCE(R.id_ContrAgent, R2.id_Acc) IS NOT NULL
      AND OP.id_BJ_Item IS NULL


      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, CRN_OLD_OperSum_Offer - CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      WHERE (ISNULL(CRN_OLD_OperSum_Offer - CRN_OLD_OperSum, 0) <> 0) AND OP.id_BJ_Item IS NOT NULL
    END
    IF @id_BJ_Item = -3
    BEGIN
      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, -CRN_OLD_OperSum_Offer, Null
      FROM #T_OP OP (NOLOCK) 
      JOIN #RRR_Acc R2 (NOLOCK) ON R2.id_Acc = OP.id_Acc 
      LEFT JOIN #RRR_CA R (NOLOCK) ON R.id_ContrAgent = OP.id_ContrAgent
      WHERE OP.id_ContrAgent  is not null AND R.id_ContrAgent is null and OP.id_BJ_Item is null and Koeff=0
    END
    IF @id_BJ_Item = -33
    BEGIN
      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, -CRN_OLD_OperSum_Offer, Null
      FROM #T_OP OP (NOLOCK) 
      LEFT JOIN #RRR_CA R (NOLOCK) ON R.id_ContrAgent = OP.id_ContrAgent
      WHERE OP.id_ContrAgent is not null AND R.id_ContrAgent is null and Koeff=0 AND OperVid=4 AND OP.id_BJ_Item is NOT null

    END
    IF @id_BJ_Item = -2
    BEGIN
      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      LEFT JOIN #RRR_Acc R (NOLOCK) ON R.id_Acc = OP.id_Acc
      LEFT JOIN #RRR_CA R4 (NOLOCK) ON R4.id_ContrAgent = OP.id_ContrAgent
      WHERE OP.id_BJ_Item is null and OP.Koeff=1 AND COALESCE(R4.id_ContrAgent, R.id_Acc) IS NOT NULL
    END
    IF @id_BJ_Item = -1
    BEGIN
      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, CRN_OLD_OperSum, Null
      FROM #T_OP OP (NOLOCK) 
      LEFT JOIN #RRR_Acc R (NOLOCK) ON R.id_Acc = OP.id_Acc
      LEFT JOIN #RRR_CA R4 (NOLOCK) ON R4.id_ContrAgent = OP.id_ContrAgent
      WHERE OP.id_BJ_Item is null and OP.Koeff=-1 AND COALESCE(R4.id_ContrAgent, R.id_Acc) IS NOT NULL

    END
    IF @id_BJ_Item = -10
    BEGIN

  SELECT id_Oper, CRN_OLD_OperSum = CRN_OLD_OperSum , id_ContrAgent, id_BJ_Item 
  INTO #T_CA_Off
  FROM #T_OP G (NOLOCK)
  WHERE G.id_ContrAgent IS NOT NULL AND Koeff = 0 AND OperVid = 4 AND id_BJ_Item IS NULL

--select * from #T_CA_Off

      INSERT INTO #T(id_Oper2, S_Pay, S_Off) 
      SELECT id_Oper, Null, /*-CASE WHEN isDeb = 1 THEN -1 ELSE 1 END **/ CRN_OLD_OperSum
      FROM #T_CA_Off T (NOLOCK), #RRR (NOLOCK)
      WHERE T.id_ContrAgent = #RRR.id_ContrAgent 
      AND isInState = 0 AND #RRR.id_ContrAgent IS NOT NULL
      AND T.id_BJ_Item IS NULL

--select * from #RRR WHERE id_ContrAgent = 516

    END
/*    IF @id_BJ_Item = -4
    BEGIN
    END
    IF @id_BJ_Item = -4
    BEGIN
    END*/

  END
END

if ISNULL(@id_User, 0) not in (SELECT Z.id_User FROM VW_UserHR Z) 
BEGIN
  DELETE FROM #T  
END

  SELECT T.*, OP.*
  FROM VW_Oper_WArc_Oper_New OP (NOLOCK)
  JOIN #T T (NOLOCK) ON OP.ID_Oper = T.ID_Oper2 --AND (T.id_OperWare2 IS NULL OR OP.id_OperWare = T.id_OperWare2)







GO

/****** Object:  StoredProcedure [dbo].[UN_ArcBy_v3]    Script Date: 04/11/2018 21:40:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO








ALTER PROCEDURE [dbo].[UN_ArcBy_v3]
  @id_business INT = NULL,
  @HasViza BIT = NULL,
  @DateFrom DATETIME = NULL,
  @DateTo DATETIME = NULL,
  @id_ContrAgent INT = NULL, -- ID контрагента
  @id_CAGroup INT = NULL, 
  @id_Repr INT = NUll, -- ID представителя
  @id_Warehouse INT = NULL,
  @id_Acc INT = NULL,
  @id_Manufact INT = NULL,
  @id_user INT = NULL,

  @Correct BIT = NULL,
  @Deleted BIT = NULL,
  @OperVid INT = NULL,
  @Koeff INT = NULL,

  @DoUP BIT = NULL, -- Прибыль
  @DoDOWN BIT = NULL, -- Затрата


  @OperFin BIT = 1,
  @OperWare BIT = 1,
  @OperService BIT = 1,
  @OperOffset BIT = 1,
  @OperCrn BIT = 1,
  @OperEmpty BIT = 1,
  @Oper201 BIT = 1,
  @is_Mirr BIT = 1,
  @id_OperParent INT = NULL,

  @OpComm VARCHAR(255) = NULL,
  @OrderNum INT = NULL,
  @id_Acc_Group INT = NULL,
  @id_Warehouse_Group INT = NULL,
  @id_Manufact_Group INT = NULL
AS
SET NOCOUNT ON

DECLARE @D DATETIME
SET @D = getdate()


--SELECT @id_OperParent

DECLARE @OP TABLE (
	MeasureName varchar (10) COLLATE Cyrillic_General_CI_AI NULL,
	RealKoef float NULL,
	id_Oper int NULL,
	DateCreate datetime NULL,
	OperVid int NULL,
	id_business int NULL,
	Correct bit NULL,
	OperTypeIn bit NULL,
	AmountOper float NOT NULL,
	id_Replicator int NULL,
	id_Measure int NULL,
	id_ContrAgent_ex int NULL,
	id_FormalDistrib int NULL,
	id_FuncDistrib int NULL,
	id_OperParent int NULL,
	id_old_Oper int NULL,
	id_LC_Oper int NULL,
	Businessid_Currency int NOT NULL,
	BusinessName varchar (50) COLLATE Cyrillic_General_CI_AI NOT NULL,
	BusinessNum varchar (5) COLLATE Cyrillic_General_CI_AI NOT NULL,
	id_UserCreator int NULL,
	DateLocal datetime NULL,
	Id_CurrencyOper int NULL,
	Id_CurrencySys int NULL,
	RateOper float NULL,
	RateInv float NULL,
	OrdNum int NULL,
	HidedOper bit NULL,
	RateSys float NULL,
	Id_CurrencyInv int NULL,
	RateMain float NULL,
	id_DocType int NULL,
	CRN_OperDelta float NULL,
	CRN_CurChDelta float NULL,
	OperSum_Offer float NULL,
	CRN_OLD_OperSum float NULL,
	CRN_OLD_OperSum_Offer float NULL,
	CRN_OperSum_Inv float NULL,
	id_OperWare int NULL,
	AmountOperReal float NOT NULL,
	PriceOper float NULL,
	SummSys float NULL,
	id_Acc int NULL,
	id_Warehouse int NULL,
	id_Manufact int NULL,
	id_Repr int NULL,
	id_Repr_Ex int NULL,
	id_Acc_Ext int NULL,
	id_Warehouse_Ext int NULL,
	id_Manufact_Ext int NULL,
	PriceInv float NULL,
	id_Goods int NULL,
	Koeff int NULL,
	CheckDate datetime NULL,
	id_UserChecker int NULL,
	Deleted bit NULL,
	OperDelta float NULL,
	OperRateDelta float NULL,
	OperTotalDelta float NULL,
	OperState int NULL,
	Imp_PayBasic varchar (1000) COLLATE Cyrillic_General_CI_AI NULL,
	AccInv_PayAssignment varchar (1000) COLLATE Cyrillic_General_CI_AI NULL,
	Contract varchar (1000) COLLATE Cyrillic_General_CI_AI NULL,
	Blocked bit NULL,
	OpComment varchar (1000) COLLATE Cyrillic_General_CI_AI NULL,
	RealDataCreate datetime NULL,
	Dig1 float NULL,
	Dig2 float NULL,
	Dig3 float NULL,
	Dig4 float NULL,
	Dig5 float NULL,
	Dig6 float NULL,
	Dig7 float NULL,
	Dig8 float NULL,
	Dig9 float NULL,
	Dig10 float NULL,
	Dig11 float NULL,
	Dig12 float NULL,
	Dig13 float NULL,
	Dig14 float NULL,
	Dig15 float NULL,
	Str1 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str2 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str3 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str4 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str5 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str6 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str7 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str8 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str9 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str10 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str11 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str12 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str13 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str14 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	Str15 varchar (100) COLLATE Cyrillic_General_CI_AI NULL,
	is_Mirr bit NULL,
	VatIn bit NULL,
	AutoGen bit NULL,
id_ContrAgent INT, ReprName VARCHAR(255) COLLATE Cyrillic_General_CI_AI NULL, ReprID_Main INT
) 

-- SELECT 1, getdate() - @D 

INSERT INTO @OP(MeasureName, RealKoef, id_Oper, DateCreate, OperVid, id_business, Correct, OperTypeIn, AmountOper, 
id_Replicator, id_Measure, id_ContrAgent_ex,
id_FormalDistrib, id_FuncDistrib, id_OperParent, id_old_Oper,id_LC_Oper,Businessid_Currency,BusinessName,BusinessNum,
id_UserCreator, DateLocal,Id_CurrencyOper, Id_CurrencySys,RateOper, RateInv, OrdNum,
HidedOper,RateSys, Id_CurrencyInv, RateMain,id_DocType,
CRN_OperDelta, CRN_CurChDelta,OperSum_Offer, CRN_OLD_OperSum, CRN_OLD_OperSum_Offer, CRN_OperSum_Inv, id_OperWare,

AmountOperReal, PriceOper, SummSys, id_Acc, id_Warehouse, id_Manufact, 
id_Repr, id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext, id_Manufact_Ext, 
PriceInv, id_Goods, Koeff, CheckDate, id_UserChecker, Deleted, 
OperDelta, OperRateDelta, OperTotalDelta, OperState, Imp_PayBasic, AccInv_PayAssignment, Contract, 
Blocked, OpComment, RealDataCreate,  
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, 
is_Mirr, VatIn, AutoGen,
id_ContrAgent, ReprName, ReprID_Main)
SELECT MeasureName, RealKoef, id_Oper, DateCreate, OperVid, OP.id_business, Correct, OperTypeIn, AmountOper, 

id_Replicator, id_Measure, id_ContrAgent_ex,
id_FormalDistrib, id_FuncDistrib, id_OperParent, id_old_Oper,id_LC_Oper,Businessid_Currency,BusinessName,BusinessNum,
id_UserCreator, DateLocal,Id_CurrencyOper, Id_CurrencySys,RateOper, RateInv, OrdNum,
HidedOper,RateSys, Id_CurrencyInv, RateMain,id_DocType,
CRN_OperDelta, CRN_CurChDelta,OperSum_Offer, CRN_OLD_OperSum, CRN_OLD_OperSum_Offer, CRN_OperSum_Inv, id_OperWare,
AmountOperReal, PriceOper, SummSys, id_Acc, id_Warehouse, id_Manufact, 
OP.id_Repr, OP.id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext, id_Manufact_Ext, 
PriceInv, id_Goods, Koeff, CheckDate, id_UserChecker, Deleted, 
OperDelta, OperRateDelta, OperTotalDelta, OperState, Imp_PayBasic, AccInv_PayAssignment, Contract, 
Blocked, OpComment, RealDataCreate,  
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, 
is_Mirr, VatIn, AutoGen,
id_ContrAgent = ISNULL(CR.id_ContrAgent, id_ContrAgent_ex), ReprName = CR.Name, CR.ID_Main
FROM VW_Oper_WArc_prev_New OP (NOLOCK)
LEFT JOIN VW_CA_Repr CR (NOLOCK) ON CR.id_Repr = ISNULL(OP.id_Repr, id_Repr_Ex)
WHERE 
HidedOper = 0 AND
((OP.id_business = @id_business) OR (@id_business IS NULL))
AND (@DateFrom <= DateCreate OR @DateFrom IS NULL)
AND (@DateTo >= DateCreate OR @DateTo IS NULL)  AND (DateCreate <> @DateTo)
AND (@id_ContrAgent IS NULL OR @id_ContrAgent = ISNULL(CR.id_ContrAgent, id_ContrAgent_ex))
AND ((CheckDate IS NULL AND @HasViza = 0) OR (CheckDate IS NOT NULL AND @HasViza = 1) OR @HasViza IS NULL)
AND(@id_Warehouse IS NULL OR @id_Warehouse = id_Warehouse OR @id_Warehouse = id_Warehouse_Ext)

AND(@id_Acc IS NULL OR @id_Acc = id_Acc OR @id_Acc = id_Acc_Ext)

AND(@id_Manufact IS NULL OR @id_Manufact = id_Manufact OR @id_Manufact = id_Manufact_Ext)

AND(@Correct IS NULL OR @Correct = Correct)
AND(@Deleted IS NULL OR @Deleted = Deleted)
AND(@OperVid IS NULL OR @OperVid = OperVid)

AND(@id_Repr IS NULL OR @id_Repr = OP.id_Repr)
AND ((@id_OperParent IS NULL OR @id_OperParent = OP.id_OperParent) AND Deleted = 0)

AND (
(@OperFin = 1 AND OperVid in (2, 102)) OR
(@OperWare = 1 AND OperVid in (1, 101)) OR
(@OperService = 1 AND OperVid in (3, 103)) OR
(@OperOffset = 1 AND OperVid in (4, 104)) OR
(@OperCrn = 1 AND OperVid = -1) OR
(@OperEmpty = 1 AND OperVid = 0)OR
(@Oper201 = 1 AND OperVid = 201)

)

--SELECT 2, getdate() - @D, COUNT(*) FROM @OP

--SELECT getdate() - @D
DECLARE @NEED_OLD BIT
SET @NEED_OLD = 0
IF EXISTS(SELECT * FROM Arc_OP (NOLOCK) WHERE ArcDate > @DateFrom) 
BEGIN
  SET @NEED_OLD = 1


INSERT INTO @OP(MeasureName, RealKoef, id_Oper, DateCreate, OperVid, id_business, Correct, OperTypeIn, AmountOper, 
id_Replicator, id_Measure, id_ContrAgent_ex,
id_FormalDistrib, id_FuncDistrib, id_OperParent, id_old_Oper,id_LC_Oper,Businessid_Currency,BusinessName,BusinessNum,
id_UserCreator, DateLocal,Id_CurrencyOper, Id_CurrencySys,RateOper, RateInv, OrdNum,
HidedOper,RateSys, Id_CurrencyInv, RateMain,id_DocType,
CRN_OperDelta, CRN_CurChDelta,OperSum_Offer, CRN_OLD_OperSum, CRN_OLD_OperSum_Offer, CRN_OperSum_Inv, id_OperWare,

AmountOperReal, PriceOper, SummSys, id_Acc, id_Warehouse, id_Manufact, 
id_Repr, id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext, id_Manufact_Ext, 
PriceInv, id_Goods, Koeff, CheckDate, id_UserChecker, Deleted, 
OperDelta, OperRateDelta, OperTotalDelta, OperState, Imp_PayBasic, AccInv_PayAssignment, Contract, 
Blocked, OpComment, RealDataCreate,  
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, 
is_Mirr, VatIn, AutoGen,
id_ContrAgent, ReprName, ReprID_Main)
SELECT MeasureName, RealKoef, id_Oper, DateCreate, OperVid, OP.id_business, Correct, OperTypeIn, AmountOper, 

id_Replicator, id_Measure, id_ContrAgent_ex,
id_FormalDistrib, id_FuncDistrib, id_OperParent, id_old_Oper,id_LC_Oper,Businessid_Currency,BusinessName,BusinessNum,
id_UserCreator, DateLocal,Id_CurrencyOper, Id_CurrencySys,RateOper, RateInv, OrdNum,
HidedOper,RateSys, Id_CurrencyInv, RateMain,id_DocType,
CRN_OperDelta, CRN_CurChDelta,OperSum_Offer, CRN_OLD_OperSum, CRN_OLD_OperSum_Offer, CRN_OperSum_Inv, id_OperWare,
AmountOperReal, PriceOper, SummSys, id_Acc, id_Warehouse, id_Manufact, 
OP.id_Repr, OP.id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext, id_Manufact_Ext, 
PriceInv, id_Goods, Koeff, CheckDate, id_UserChecker, Deleted, 
OperDelta, OperRateDelta, OperTotalDelta, OperState, Imp_PayBasic, AccInv_PayAssignment, Contract, 
Blocked, OpComment, RealDataCreate,  
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, 
is_Mirr, VatIn, AutoGen,
id_ContrAgent = ISNULL(CR.id_ContrAgent, id_ContrAgent_ex), ReprName = CR.Name, CR.ID_Main
FROM VW_Oper_WArc_prev_OLD OP (NOLOCK)
LEFT JOIN VW_CA_Repr CR (NOLOCK) ON CR.id_Repr = ISNULL(OP.id_Repr, id_Repr_Ex)
WHERE 
HidedOper = 0 AND
((OP.id_business = @id_business) OR (@id_business IS NULL))
AND (@DateFrom <= DateCreate OR @DateFrom IS NULL)
AND (@DateTo >= DateCreate OR @DateTo IS NULL) AND (DateCreate <> @DateTo)
AND (@id_ContrAgent IS NULL OR @id_ContrAgent = ISNULL(CR.id_ContrAgent, id_ContrAgent_ex))
AND ((CheckDate IS NULL AND @HasViza = 0) OR (CheckDate IS NOT NULL AND @HasViza = 1) OR @HasViza IS NULL)
AND(@id_Warehouse IS NULL OR @id_Warehouse = id_Warehouse OR @id_Warehouse = id_Warehouse_Ext)

AND(@id_Acc IS NULL OR @id_Acc = id_Acc OR @id_Acc = id_Acc_Ext)

AND(@id_Manufact IS NULL OR @id_Manufact = id_Manufact OR @id_Manufact = id_Manufact_Ext)

AND(@Correct IS NULL OR @Correct = Correct)
AND(@Deleted IS NULL OR @Deleted = Deleted)
AND(@OperVid IS NULL OR @OperVid = OperVid)

AND(@id_Repr IS NULL OR @id_Repr = OP.id_Repr)

AND(@id_OperParent IS NULL OR @id_OperParent = OP.id_OperParent)

AND (
(@OperFin = 1 AND OperVid in (2, 102)) OR
(@OperWare = 1 AND OperVid in (1, 101)) OR
(@OperService = 1 AND OperVid in (3, 103)) OR
(@OperOffset = 1 AND OperVid in (4, 104)) OR
(@OperCrn = 1 AND OperVid = -1) OR
(@OperEmpty = 1 AND OperVid = 0)OR
(@Oper201 = 1 AND OperVid = 201)
)

END

--SELECT 3, getdate() - @D, COUNT(*) FROM @OP -- return


IF @is_Mirr = 1

BEGIN
INSERT INTO @OP(MeasureName, RealKoef, id_Oper, DateCreate, OperVid, id_business, Correct, OperTypeIn, AmountOper, 

id_Replicator, id_Measure, id_ContrAgent_ex,
id_FormalDistrib, id_FuncDistrib, id_OperParent, id_old_Oper,id_LC_Oper,Businessid_Currency,BusinessName,BusinessNum,
id_UserCreator, DateLocal,Id_CurrencyOper, Id_CurrencySys,RateOper, RateInv, OrdNum,
HidedOper,RateSys, Id_CurrencyInv, RateMain,id_DocType,
CRN_OperDelta, CRN_CurChDelta,OperSum_Offer, CRN_OLD_OperSum, CRN_OLD_OperSum_Offer, CRN_OperSum_Inv, id_OperWare,

AmountOperReal, PriceOper, SummSys, id_Acc, id_Warehouse, id_Manufact, 
id_Repr, id_Repr_Ex, id_Acc_Ext, id_Warehouse_Ext, id_Manufact_Ext, 
PriceInv, id_Goods, Koeff, CheckDate, id_UserChecker, Deleted, 
OperDelta, OperRateDelta, OperTotalDelta, OperState, Imp_PayBasic, AccInv_PayAssignment, Contract, 
Blocked, OpComment, RealDataCreate,  
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, 
is_Mirr, VatIn, AutoGen,
id_ContrAgent, ReprName, ReprID_Main)
SELECT MeasureName, RealKoef, id_Oper, DateCreate, OperVid, id_business, Correct, OperTypeIn = CAST(OperTypeIn ^ 1 AS BIT), AmountOper, 

id_Replicator, id_Measure, id_ContrAgent_ex,
id_FormalDistrib, id_FuncDistrib, id_OperParent, id_old_Oper,id_LC_Oper,Businessid_Currency,BusinessName,BusinessNum,
id_UserCreator, DateLocal,Id_CurrencyOper, Id_CurrencySys,RateOper, RateInv, OrdNum,
HidedOper,RateSys, Id_CurrencyInv, RateMain,id_DocType,
CRN_OperDelta, CRN_CurChDelta,OperSum_Offer, CRN_OLD_OperSum, CRN_OLD_OperSum_Offer, CRN_OperSum_Inv, id_OperWare,

AmountOperReal, PriceOper, SummSys, id_Acc = id_Acc_Ext, id_Warehouse = id_Warehouse_Ext, id_Manufact = id_Manufact_Ext, 
id_Repr, id_Repr_Ex, id_Acc_Ext = id_Acc, id_Warehouse_Ext = id_Warehouse, id_Manufact_Ext = id_Manufact, 
PriceInv, id_Goods, Koeff, CheckDate, id_UserChecker, Deleted, 
OperDelta, OperRateDelta, OperTotalDelta, OperState, Imp_PayBasic, AccInv_PayAssignment, Contract, 
Blocked, OpComment, RealDataCreate,  
Dig1, Dig2, Dig3, Dig4, Dig5, Dig6, Dig7, Dig8, Dig9, Dig10, Dig11, Dig12, Dig13, Dig14, Dig15, 
Str1, Str2, Str3, Str4, Str5, Str6, Str7, Str8, Str9, Str10, Str11, Str12, Str13, Str14, Str15, 
is_Mirr = @is_Mirr, VatIn, AutoGen,
id_ContrAgent, ReprName, ReprID_Main
FROM @OP OP
WHERE (id_Acc IS NOT NULL AND id_Acc_Ext IS NOT NULL) OR (id_Manufact IS NOT NULL AND id_Manufact_Ext IS NOT NULL )
OR (id_Warehouse IS NOT NULL AND id_Warehouse_Ext IS NOT NULL)
AND (OperVid in (1, 2))
END

--  SELECT 4, getdate() - @D





CREATE TABLE #AAA (id_Acc INT)
CREATE TABLE #AAA_CA (id_ContrAgent INT)
DECLARE @isPPP BIT

IF @id_User = NULL
  SET @isPPP = 0
ELSE
BEGIN
  SELECT @isPPP = isPPP FROM USR_USER (NOLOCK) WHERE id_User = @id_User
--SELECT @isPPP
  IF @isPPP = 1 
  BEGIN
    INSERT #AAA (id_Acc)
    SELECT id_Acc 
    FROM (
    SELECT id_Acc
    FROM RRR_Permit R (NOLOCK)
    JOIN USR_UserToGrp G (NOLOCK) ON G.id_Group = R.id_Group
    WHERE G.id_User = @id_User AND R.ID_Business = @ID_Business AND id_Acc IS NOT NULL

    UNION

    SELECT A.id_Acc
    FROM RRR_Permit R (NOLOCK)
    JOIN USR_UserToGrp G (NOLOCK) ON G.id_Group = R.id_Group
    JOIN Acc_Acc A (NOLOCK) ON A.id_Acc_Group = R.id_Acc_Group
    WHERE G.id_User = @id_User AND R.ID_Business = @ID_Business AND R.id_Acc_Group IS NOT NULL) T
    GROUP BY id_Acc


    INSERT #AAA_CA (id_ContrAgent)
    SELECT id_ContrAgent 
    FROM (
    SELECT id_ContrAgent
    FROM RRR_Permit R (NOLOCK)
    JOIN USR_UserToGrp G (NOLOCK) ON G.id_Group = R.id_Group
    WHERE G.id_User = @id_User AND R.ID_Business = @ID_Business AND id_ContrAgent IS NOT NULL

    UNION

    SELECT A.id_ContrAgent
    FROM RRR_Permit R (NOLOCK)
    JOIN USR_UserToGrp G (NOLOCK) ON G.id_Group = R.id_Group
    JOIN CA_ContrAgent A (NOLOCK) ON A.id_CAGroup = R.id_CAGroup
    WHERE G.id_User = @id_User AND R.ID_Business = @ID_Business AND R.id_CAGroup IS NOT NULL) T
    GROUP BY id_ContrAgent

    SELECT id_Oper 
    INTO #NEED_DEL
    FROM @OP OP 
    LEFT JOIN #AAA A (NOLOCK) ON A.id_Acc = OP.id_Acc
    WHERE OP.id_Acc IS NOT NULL AND A.id_Acc IS NULL
  
    INSERT INTO #NEED_DEL(id_Oper)
    SELECT id_Oper 
    FROM @OP OP 
    LEFT JOIN #AAA A (NOLOCK) ON A.id_Acc = OP.id_Acc_Ext
    WHERE OP.id_Acc_Ext IS NOT NULL AND A.id_Acc IS NULL

    INSERT INTO #NEED_DEL(id_Oper)
    SELECT id_Oper 
    FROM @OP OP 
    LEFT JOIN #AAA_CA A (NOLOCK) ON A.id_ContrAgent = OP.id_ContrAgent
    WHERE OP.id_ContrAgent IS NOT NULL AND A.id_ContrAgent IS NULL


    DELETE FROM @OP WHERE id_Oper in (SELECT id_Oper FROM #NEED_DEL (NOLOCK))

  END
END

SET NOCOUNT OFF

if ISNULL(@id_User, 0) not in (SELECT Z.id_User FROM VW_UserHR Z)  
BEGIN
  DELETE FROM @OP WHERE id_Acc in (482, 468) OR id_Acc_Ext in (482, 468)
END

SELECT 
 OC.id_Oper, OC.id_OperParent,
  OC.id_old_Oper, DateCreate = OC.DateCreate + CASE WHEN OC.is_Mirr = 1 THEN 0.000001 ELSE 0 END,
 OC.id_LC_Oper, OC.OperVid,
 OC.id_Replicator, 
 ReplicatorShortName = CAST(Null AS VARCHAR(10)), --RR.ShortName,
 OC.id_UserCreator,
 OC.id_business, Id_CurrencyBsn = OC.Businessid_Currency,
 BusinessName = OC.BusinessName, BusinessNum = OC.BusinessNum, 
 OC.DateLocal, OC.Correct, OC.OperTypeIn,
 OC.Id_CurrencyOper, 
 CurrencyOperName = COper.Name, CurrencyOperShortName = COper.ShortName,
 AmountOper = CASE WHEN OC.OperVid in (1, 3, 101, 101, 103, 201) THEN OC.AmountOper ELSE NULL END,  
 AmountOper2 = OC.AmountOper,  
 OC.PriceOper, OC.RateOper,
 OC.id_Measure,
 MeasureName, 
 RealKoef,
 AmountOperBaseMS = RealKoef * CASE WHEN OC.OperVid in (1, 3, 101, 101, 103, 201) THEN OC.AmountOper ELSE NULL END,  
 
 OC.Id_CurrencySys, 
 CurrencySysName = CSys.Name, CurrencySysShortName = CSys.ShortName,
 OC.SummSys, OC.RateSys, 
 OC.id_Acc,
 OC.id_Warehouse, 
 OC.id_Manufact, 
 SrcName = COALESCE(ASrc.Name, WHSrc.Name, MnSrc.Name),
 SrcID_Main = COALESCE(ASrc.ID_Main, WHSrc.ID_Main, MnSrc.ID_Main),

 OC.id_Repr, 
 OC.id_Acc_Ext,
 OC.id_Warehouse_Ext,
 OC.id_Manufact_Ext, 
 ReprName = COALESCE(
       ADest.Name, WHDest.Name, MnDest.Name, ReprName),
 ReprID_Main = COALESCE(
       ADest.ID_Main, WHDest.ID_Main, MnDest.ID_Main, ReprID_Main
),
 OC.Id_CurrencyInv, OC.PriceInv,  OC.RateInv,
CurrencyInvName = CASE WHEN Id_CurrencyInv IS NULL THEN NULL ELSE ISNULL(CBsn.ShortName, CBsn.Name) END, 
CurrencyInvShortName = CASE WHEN Id_CurrencyInv IS NULL THEN NULL ELSE ISNULL(CBsn.ShortName, CBsn.Name) END,
 OC.id_Goods,
 WareName = PGds.Name, 
 WareID_Main = PGds.ID_Main, 

 OC.Koeff,
  KoeffName = CAST(
  CASE
    WHEN OC.Koeff = -1 THEN 'Затрата'
    WHEN OC.Koeff = 0 THEN 'Расчет с контрагентом'
    WHEN OC.Koeff = 1 THEN 'Прибыль'
  END AS VARCHAR(50)),
  OC.CheckDate,
 OC.id_UserChecker, 
 OC.id_FormalDistrib,
 FormalDistribName = FrmD.Name, 
 OC.id_FuncDistrib,
 FuncDistribName = FncD.Name,
 Deleted = OC.Deleted,
 OC.id_ContrAgent, ContrAgentName = CASE WHEN ISNULL(OC.id_Repr, OC.id_ContrAgent_Ex) IS NULL THEN NULL ELSE CA.Name END, 
id_CAGroup = CA.id_CAGroup, 
  SummOper = CASE WHEN AmountOper = 0 THEN 1 ELSE ISNULL(AmountOper, 1) END * OC.PriceOper, 
 TypeName = CAST(CASE WHEN OC.OperTypeIn = 1 THEN 'Приход' ELSE 'Расход' END AS VARCHAR(30)),
OperNum =   CAST(
    CONVERT(VARCHAR(10), OC.DateCreate, 20) + '-' +
    ISNULL(CAST(dbo.FormatInt(OrdNum, 4) AS VARCHAR(10)), '_') + '-' + 
--    ISNULL(CAST(OrdNum AS VARCHAR(10)), '_') + '-' + 
    CASE
      WHEN OC.OperVid = -1 THEN 'КУР'
      WHEN OC.OperVid = 0 THEN 'ПСТ'
      WHEN OC.OperVid = 1 THEN 'СКЛ'
      WHEN OC.OperVid = 2 THEN 'ФИН'
      WHEN OC.OperVid = 3 THEN 'УСЛ'
      WHEN OC.OperVid = 4 THEN 'ВЗЧ'

      WHEN OC.OperVid = 101 THEN 'СКЛ-ОСТ'
      WHEN OC.OperVid = 102 THEN 'ФИН-ОСТ'
      WHEN OC.OperVid = 103 THEN 'УСЛ-ОСТ'

      WHEN OC.OperVid = 201 THEN 'РЕЗ'
    END + 
    ISNULL('-' + OC.BusinessNum, '') +
    ISNULL('-' + RR.ShortName, '-*') + 
 
    CASE WHEN OC.OperTypeIn = 1 THEN '-П-' ELSE '-Р-' END +
    CAST(OC.id_Oper AS VARCHAR(10)) +
    CASE WHEN OC.Correct = 1 THEN '-К' ELSE '' END +
    CASE WHEN OC.is_Mirr = 1 THEN '-Д' ELSE '' END    
  AS VARCHAR(255)),
OperDelta, 
OperRateDelta, 
OperTotalDelta,
DTDiff = DateDiff(DD, OC.DateCreate, getdate()),
HasViza = CAST(CASE WHEN OC.CheckDate IS NULL THEN 0 ELSE 1 END AS BIT),
OC.OperState,
OC.HidedOper,
OperSummSys = COALESCE(SummSys*RateSys, PriceOper*ISNULL(CASE WHEN AmountOper = 0 THEN 1 ELSE ISNULL(AmountOper, 1) END, 1) *RateOper, 0), 
OC.RateMain,
OC.id_Repr_Ex, 

id_DocType,
Imp_PayBasic, AccInv_PayAssignment, Contract,
OperDeltaCrn = CRN_OperDelta, 
OperRateDeltaCrn = CRN_CurChDelta,-- CRN_OperRateDelta, 
OperTotalDeltaCrn = CRN_OperDelta + CRN_CurChDelta,
OperCrnName = COper.Name, OC.OperSum_Offer,
--OC.OperSum_Inv,

CRN_OLD_OperSum,
CRN_OLD_OperSum_Offer,
CRN_OperSum_Inv = CASE WHEN Id_CurrencyInv IS NULL THEN Null ELSE CRN_OperSum_Inv END, 
OperSumCalced = SIGN(PriceOper)*ABS(CRN_OLD_OperSum), 
OperSum_OfferCalced = SIGN(SummSys)*ABS(CRN_OLD_OperSum_Offer), 
Blocked, ISNULL(CBsn.ShortName, CBsn.Name),
id_Ctg_Goods_2 = PGds.id_Ctg_Goods,
OC.OpComment, RealDataCreate,
OperTypeSIGN = CASE WHEN OperTypeIn = 1 THEN 1 ELSE -1 END,
-- Проверяем наличие редакций
HasChild = CAST(0 AS INT),
Dig1, 
Dig2, 
Dig3, 
Dig4, 
Dig5, 
Dig6, 
Dig7, 
Dig8,
Dig9, 
Dig10,
Dig11, 
Dig12,
Dig13, 
Dig14, 
Dig15,

Str1, 
Str2, 
Str3, 
Str4, 
Str5, 
Str6, 
Str7, 
Str8,
Str9, 
Str10,
Str11, 
Str12,
Str13, 
Str14, 
Str15,
OC.id_OperWare,
OperVidName = CAST(
  CASE
    WHEN OC.OperVid = -1 THEN 'Курс. '
    WHEN OC.OperVid = 0 THEN ' Пустая'
    WHEN OC.OperVid = 1 THEN ' Складская'
    WHEN OC.OperVid = 2 THEN ' Финансовая'
    WHEN OC.OperVid = 3 THEN ' Услуги'
    WHEN OC.OperVid = 4 THEN ' Взаимозачет'

    WHEN OC.OperVid = 101 THEN ' Складская-ост.'
    WHEN OC.OperVid = 102 THEN ' Финансовая-ост.'
    WHEN OC.OperVid = 103 THEN ' Услуги-ост.'

    WHEN OC.OperVid = 201 THEN ' Резерв'
  END AS VARCHAR(50))
,
CRN_OperSumRez = CASE WHEN OperTypeIn = 1 THEN 1 ELSE -1 END * ISNULL(SIGN(SummSys)*ABS(CRN_OLD_OperSum_Offer), SIGN(PriceOper)*ABS(CRN_OLD_OperSum)),
OnlyDate = CONVERT(DATETIME, FLOOR(CAST(OC.DateCreate AS FLOAT))),
is_Mirr,
id_Acc_Group = ISNULL(ASrc.id_Acc_Group, -1),
id_Warehouse_Group = ISNULL(WHSrc.id_Warehouse_Group, -1),
id_Manufact_Group = ISNULL(MnSrc.id_Manufact_Group, -1), VatIn, AutoGen,   
CurrencyBsnName = ISNULL(CBsn.ShortName, CBsn.Name)
--OnlyDate = CAST(CONVERT(VARCHAR, OC.DateCreate, 1) AS DATETIME)
FROM
@OP OC 
JOIN VW_Currency CBsn (NOLOCK) ON Businessid_Currency = CBsn.id_Currency
LEFT JOIN VW_Currency COper (NOLOCK) ON COper.Id_Currency = OC.Id_CurrencyOper
LEFT JOIN VW_Currency CSys (NOLOCK) ON CSys.Id_Currency = OC.Id_CurrencySys

LEFT JOIN RP_Replicator RR (NOLOCK) ON RR.id_Replicator = OC.id_Replicator

-- Источники
LEFT JOIN Acc_Acc ASrc (NOLOCK) ON ASrc.id_Acc = OC.id_Acc
LEFT JOIN WH_Warehouse WHSrc (NOLOCK) ON WHSrc.id_Warehouse = OC.id_Warehouse
LEFT JOIN Mn_Manufact MnSrc (NOLOCK) ON MnSrc.id_Manufact = OC.id_Manufact

-- Получатели
LEFT JOIN Acc_Acc ADest (NOLOCK) ON ADest.id_Acc = OC.id_Acc_Ext
LEFT JOIN WH_Warehouse WHDest (NOLOCK) ON WHDest.id_Warehouse = OC.id_Warehouse_Ext
LEFT JOIN Mn_Manufact MnDest (NOLOCK) ON MnDest.id_Manufact = OC.id_Manufact_Ext

-- Контрагент
LEFT JOIN CA_ContrAgent CA (NOLOCK) ON CA.id_ContrAgent = OC.id_ContrAgent

-- Объект передачи
LEFT JOIN PL_Goods PGds (NOLOCK) ON PGds.id_Goods = OC.id_Goods

-- Дополнительные атрибуты
LEFT JOIN OP_FormalDistrib FrmD (NOLOCK) ON FrmD.id_FormalDistrib = OC.id_FormalDistrib
LEFT JOIN OP_FuncDistrib FncD (NOLOCK) ON FncD.id_FuncDistrib = OC.id_FuncDistrib

WHERE (@id_CAGroup IS NULL OR @id_CAGroup = CA.id_CAGroup)

AND (@id_Acc_Group IS NULL OR @id_Acc_Group = ASrc.id_Acc_Group OR @id_Acc_Group = ADest.id_Acc_Group)
AND (@id_Warehouse_Group IS NULL OR @id_Warehouse_Group = WHSrc.id_Warehouse_Group OR @id_Warehouse_Group = WHDest.id_Warehouse_Group)
AND (@id_Manufact_Group IS NULL OR @id_Manufact_Group = MnSrc.id_Manufact_Group OR @id_Manufact_Group = MnDest.id_Manufact_Group)

AND (is_Mirr = 0 OR @is_Mirr = 1) 

-- SELECT 5, getdate() - @D




GO


