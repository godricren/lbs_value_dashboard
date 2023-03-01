with row_table as 
(SELECT
    `company_code` ,`vendor` ,`document_number` ,
    `document_type` ,`reference` ,`document_date` ,
    `document_currency`,`amount_in_doc_curr` ,`local_currency_2` ,
    `amount_in_loc_curr_2`,`amount_in_usd`,`clearing_document`,
    `terms_of_payment` ,`days_1`,`clearing_date` 
FROM 
    (SELECT 
        `company_code` ,`vendor` ,`document_number` ,
        `document_type` ,`reference` ,`document_date` ,
        `document_currency` ,`amount_in_doc_curr` ,`local_currency_2` ,
        `amount_in_loc_curr_2` ,`amount_in_usd`,`clearing_document` ,
        `terms_of_payment` ,`days_1` ,`clearing_date` ,
        row_number() over(partition by `company_code`,`vendor` ,`document_number`,`clearing_date`
            order by `dw_create_on`) as row_num
    FROM `proj_gtn_tmp`.`t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dwd`
    WHERE company_code in ('CN03','CN25', 'TW01','TW05')
    and document_type not in ('ZP','KZ')
    -- and cast(`clearing_date` as date) BETWEEN 
    --     date_add(last_day(add_months(current_date,-2)),1) 
    --     and last_day(add_months(current_date,-1))
    )
where row_num = 1)

, pp_table as 
(SELECT
    `company_code` ,`vendor` ,`document_number` ,
    `document_type` ,`reference` ,`document_date` ,
    `document_currency` ,`amount_in_doc_curr` ,`local_currency_2` ,
    `amount_in_loc_curr_2` ,`amount_in_usd` ,`clearing_document`,
    `terms_of_payment` ,`days_1` ,`clearing_date` 
FROM 
    (SELECT 
    `company_code` ,`vendor` ,`document_number` ,
    `document_type` ,`reference` ,`document_date` ,
    `document_currency` ,`amount_in_doc_curr` ,
    `local_currency_2` ,`amount_in_loc_curr_2` ,`amount_in_usd` ,
    `clearing_document`,`terms_of_payment` ,`days_1` ,`clearing_date` ,
    row_number() over(partition by `company_code`,`vendor` ,`document_number`,`clearing_date`
        order by `dw_create_on`) as row_num
    FROM 
    `proj_gtn_tmp`.`t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dwd`
    WHERE company_code in ('0001','CN01','CN04','CN09','CN12','CN27','CN34','CN35','CN60','CN65','CNA2','CNA5','CNC0','CNC7','CNH2','CNH4')
    and `clearing_document` like '09%'
    and `document_type` in ('DB','KG','KR','RE','SA')
    and `user_name` in (select distinct user_id from `proj_gtn_tmp`.`t_ptp_dalian_pp_user_id_ods`)
    -- and cast(`clearing_date` as date) BETWEEN 
    --     date_add(last_day(add_months(current_date,-2)),1) 
    --     and last_day(add_months(current_date,-1))
)
WHERE row_num = 1
)
insert into `proj_gtn_tmp`.`t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dm`
SELECT 
`company_code` ,`vendor` ,`document_number` ,
`document_type` ,`reference` ,`document_date` ,
`document_currency` ,`amount_in_doc_curr` ,`local_currency_2` ,
`amount_in_loc_curr_2` ,`amount_in_usd` ,`clearing_document` ,
`terms_of_payment` ,`days_1` ,`clearing_date`,
null  as `accelate_payment`,
null  as `accelate_payment_due_date`,
`clearing_date` as `expected_payment_proposal_date`,
`clearing_date` as `actual_proposal_run_date`,
'Meet' as `sla_result`,
null as `tat_miss_type`,
null as `exclusion_timeliness`,
null as `exclusion_reason_specific_work_level_timeliness`,
null  as `exclusion_reason_general_contract_level_timeliness`,
null as `exclusion_approved_by_timeliness`,
'Meet'  as `accuracy_sla_result`,
null as `miss_type` ,
null as `exclusion_accuracy` ,
null as `exclusion_reason_specific_work_level_accuracy` ,
null as `exclusion_reason_general_contract_level_accuracy` ,
null as `exclusion_approved_by_accuracy` ,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddhhmm') `dw_create_on` ,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddhhmm') `dw_last_update` ,
'proj_gtn_tmp.t_ptp_s1a_bw_fi_zocwcs02l_cdl_deduplication_dwd' as `dw_source_table` 
FROM
(
SELECT 
`company_code` ,`vendor` ,`document_number` ,
`document_type` ,`reference` ,`document_date` ,
`document_currency` ,`amount_in_doc_curr` ,`local_currency_2` ,
`amount_in_loc_curr_2` ,`amount_in_usd` ,`clearing_document` ,
`terms_of_payment` ,`days_1` ,`clearing_date`
from row_table
UNION ALL 
SELECT 
`company_code` ,`vendor` ,`document_number` ,
`document_type` ,`reference` ,`document_date` ,
`document_currency` ,`amount_in_doc_curr` ,`local_currency_2` ,
`amount_in_loc_curr_2` ,`amount_in_usd` ,`clearing_document`,
`terms_of_payment` ,`days_1` ,`clearing_date` 
FROM pp_table
)  stg ;