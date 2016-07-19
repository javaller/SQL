SELECT  TBL.DT_TO
FROM 
    (SELECT  RP.DT_FROM, 
             RP.DT_TO,  
            row_number () over (order by ID_FTR_RENT_PAYMENT desc) RN
    FROM    FTR.FTR_RENT_PAYMENT RP
    WHERE  ID_FTR_RENT = 390619521) TBL
WHERE rn = 2
