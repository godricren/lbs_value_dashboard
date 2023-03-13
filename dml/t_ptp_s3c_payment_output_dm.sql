INSERT INTO `proj_gtn_tmp`.`t_ptp_s3c_payment_output_dm`
(SELECT
'Tower KPI' as `metrics_type`,
'18' as `metrics_no`,
'Early Payment Value' as `metrics_name`,
null as `definition`,
'$' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1) as `month`,
0 as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.bw_fi_zocwcs02l_cdl_deduplication_dwd, proj_gtn_tmp.t_ptp_gp_zt_kt_sq_invoice_summary_dwd'

UNION ALL

SELECT
'Tower KPI' as `metrics_type`,
'19' as `metrics_no`,
'Early Payment Volume' as `metrics_name`,
null as `definition`,
'volume' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1) as `month`,
0 as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.bw_fi_zocwcs02l_cdl_deduplication_dwd, proj_gtn_tmp.t_ptp_gp_zt_kt_sq_invoice_summary_dwd'

UNION ALL
SELECT
'Tower KPI' as `metrics_type`,
'20' as `metrics_no`,
'Late Payment Value' as `metrics_name`,
null as `definition`,
'$' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1) as `month`,
0 as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.bw_fi_zocwcs02l_cdl_deduplication_dwd, proj_gtn_tmp.t_ptp_gp_zt_kt_sq_invoice_summary_dwd'

UNION ALL
SELECT
'Tower KPI' as `metrics_type`,
'21' as `metrics_no`,
'Late Payment Volume' as `metrics_name`,
null as `definition`,
'volume' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1) as `month`,
0 as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.bw_fi_zocwcs02l_cdl_deduplication_dwd, proj_gtn_tmp.t_ptp_gp_zt_kt_sq_invoice_summary_dwd'

UNION ALL

SELECT
'Tower KPI' as `metrics_type`,
'16' as `metrics_no`,
'Total Payments value performed by COS' as `metrics_name`,
null as `definition`,
'$' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1),
sum(`value`) as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm,proj_gtn_tmp.t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm'
FROM
(SELECT
sum(`amount_in_usd`) as `value`
FROM
(   SELECT
        `amount_in_usd`,
        row_number() OVER(PARTITION BY company_code, vendor, document_number, clearing_date ORDER BY dw_create_on DESC) row_num
    FROM  `proj_gtn_tmp`.`t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm`
-- WHERE  cast(`clearing_date` as date) BETWEEN 
--         date_add(last_day(add_months(current_date,-2)),1) 
--         and last_day(add_months(current_date,-1))
)
WHERE row_num = 1
UNION ALL 
SELECT
SUM(`amount_in_usd`) as `value`
FROM
(SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY `company_code`,`clear_date`,`vendor`,
    `amount_in_local_currency`,`comments` ORDER BY `dw_create_on`) row_num
FROM `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm`
WHERE  cast(`clear_date` as date) BETWEEN 
        date_add(last_day(add_months(current_date,-2)),1) 
        and last_day(add_months(current_date,-1))
)
WHERE row_num = 1)

UNION ALL 

SELECT
'Tower KPI' as `metrics_type`,
'17' as `metrics_no`,
'Total Payments volume performed by COS' as `metrics_name`,
null as `definition`,
'volume' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1),
sum(`value`) as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm,proj_gtn_tmp.t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm'
FROM
(SELECT
count(1) as `value`
FROM
(   SELECT
        company_code, 
        vendor, 
        document_number, 
        clearing_date,
        row_number() OVER(PARTITION BY company_code, vendor, document_number, clearing_date ORDER BY dw_create_on DESC) row_num
    FROM  `proj_gtn_tmp`.`t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm`
-- WHERE  cast(`clearing_date` as date) BETWEEN 
--         date_add(last_day(add_months(current_date,-2)),1) 
--         and last_day(add_months(current_date,-1))
)
WHERE row_num = 1
UNION ALL 
SELECT
count(1) as `value`
FROM
(SELECT
    `company_code`,
    `clear_date`,
    `vendor`,
    `amount_in_local_currency`,
    `comments`,
    ROW_NUMBER() OVER(PARTITION BY `company_code`,`clear_date`,`vendor`,
    `amount_in_local_currency`,`comments` ORDER BY `dw_create_on`) row_num
FROM `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm`
WHERE  cast(`clear_date` as date) BETWEEN 
        date_add(last_day(add_months(current_date,-2)),1) 
        and last_day(add_months(current_date,-1))
)
WHERE row_num = 1)

UNION ALL

SELECT
'Tower KPI' as `metrics_type`,
'22' as `metrics_no`,
'On time Payment Value' as `metrics_name`,
null as `definition`,
'$' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1),
sum(`value`) as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm,proj_gtn_tmp.t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm'
FROM
(SELECT
sum(`amount_in_usd`) as `value`
FROM
(   SELECT
        `amount_in_usd`,
        row_number() OVER(PARTITION BY company_code, vendor, document_number, clearing_date ORDER BY dw_create_on DESC) row_num
    FROM  `proj_gtn_tmp`.`t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm`
-- WHERE  cast(`clearing_date` as date) BETWEEN 
--         date_add(last_day(add_months(current_date,-2)),1) 
--         and last_day(add_months(current_date,-1))
)
WHERE row_num = 1
UNION ALL 
SELECT
SUM(`amount_in_usd`) as `value`
FROM
(SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY `company_code`,`clear_date`,`vendor`,
    `amount_in_local_currency`,`comments` ORDER BY `dw_create_on`) row_num
FROM `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm`
WHERE  cast(`clear_date` as date) BETWEEN 
        date_add(last_day(add_months(current_date,-2)),1) 
        and last_day(add_months(current_date,-1))
)
WHERE row_num = 1)

UNION ALL 

SELECT
'Tower KPI' as `metrics_type`,
'23' as `metrics_no`,
'On time Payment Volume' as `metrics_name`,
null as `definition`,
'volume' as `unit`,
null as `gp_pp`,
null as `po_non_po`,
null as `cash_credit_card`,
null as `sub_process`,
null as `category`,
'Dalian' as `center`,
date_add(last_day(add_months(current_date,-2)),1),
sum(`value`) as `value`,
null as `n_d`,
null as `ariba_or_non_ariba`,
null as `comments`,
null as `owner_update_value`,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm,proj_gtn_tmp.t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm'
FROM
(SELECT
count(1) as `value`
FROM
(   SELECT
        company_code, 
        vendor, 
        document_number, 
        clearing_date,
        row_number() OVER(PARTITION BY company_code, vendor, document_number, clearing_date ORDER BY dw_create_on DESC) row_num
    FROM  `proj_gtn_tmp`.`t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm`
-- WHERE  cast(`clearing_date` as date) BETWEEN 
--         date_add(last_day(add_months(current_date,-2)),1) 
--         and last_day(add_months(current_date,-1))
)
WHERE row_num = 1
UNION ALL 
SELECT
count(1) as `value`
FROM
(SELECT
    `company_code`,
    `clear_date`,
    `vendor`,
    `amount_in_local_currency`,
    `comments`,
    ROW_NUMBER() OVER(PARTITION BY `company_code`,`clear_date`,`vendor`,
    `amount_in_local_currency`,`comments` ORDER BY `dw_create_on`) row_num
FROM `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm`
WHERE  cast(`clear_date` as date) BETWEEN 
        date_add(last_day(add_months(current_date,-2)),1) 
        and last_day(add_months(current_date,-1))
)
WHERE row_num = 1)

)
