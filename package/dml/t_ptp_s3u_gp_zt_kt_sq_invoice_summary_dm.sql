INSERT INTO `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dm`
SELECT    
`company_code` ,`clear_date` ,`vendor` ,
`province` ,`city` ,`amount_in_local_currency` ,
`comments` ,`clearing_team` ,`currency` ,`amount_in_usd` ,
`accelate_payment` ,
`accelate_payment_due_date` ,
`expected_payment_proposal_date` ,
`payment_term` ,
`days` ,
`sla_result_timeliness` ,
`exclusion_timeliness` ,
`exclusion_reason_specific_work_level_timeliness` ,
`exclusion_reason_general_contract_level_timeliness` ,
`exclusion_approved_by_timeliness` ,
`sla_result_accuracy` ,
`miss_type` ,
`exclusion_accuracy` ,
`exclusion_reason_specific_work_level_accuracy` ,
`exclusion_reason_general_contract_level_accuracy` ,
`exclusion_approved_by_accuracy` ,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dwd'
FROM 
    (SELECT 
        `company_code` ,`clear_date` ,`vendor` ,`province` ,
        `city` ,`amount_in_local_currency` ,
        `comments` ,`clearing_team` ,`currency` ,`amount_in_usd` ,
        `accelate_payment` ,
        `accelate_payment_due_date` ,
        `expected_payment_proposal_date` ,
        `payment_term` ,
        `days`,
        `sla_result_timeliness` ,
        `exclusion_timeliness` ,
        `exclusion_reason_specific_work_level_timeliness` ,
        `exclusion_reason_general_contract_level_timeliness` ,
        `exclusion_approved_by_timeliness` ,
        `sla_result_accuracy` ,
        `miss_type` ,
        `exclusion_accuracy` ,
        `exclusion_reason_specific_work_level_accuracy` ,
        `exclusion_reason_general_contract_level_accuracy` ,
        `exclusion_approved_by_accuracy` ,
        `dw_create_on` ,
        `dw_last_update` ,
        `dw_source_table` ,
        row_number() over(partition by `company_code` ,`clear_date` 
        ,`vendor` ,`province` ,`city` ,`amount_in_local_currency`  
            order by dw_create_on desc) as row_num
    FROM `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dwd`
    WHERE cast(`clear_date` as date) BETWEEN 
        date_add(last_day(add_months(current_date,-2)),1) 
        and last_day(add_months(current_date,-1)))
WHERE row_num = 1;