INSERT INTO `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dwd`
(select
    `company_code` ,
    `clear_date`,
    `vendor`,
    `province` ,
    `city` ,
    `amount_in_local_currency` ,
    `comments` ,
    `clearing_team` ,
    'RMB' as `currency`
    ,cast(cast(loc.`amount_in_local_currency` as decimal(20,2))/
    cast(replace(ex.unknown_text_4,'/','') 
    as decimal(10,5)) as decimal(20,3)) `amount_in_usd`
    ,null as `accelate_payment`
    ,null as `accelate_payment_due_date`
    ,`clear_date` as `expected_payment_proposal_date`
    ,null `payment_term`
    ,null `days`
    ,'Meet' as `sla_result_timeliness`
    ,null  as `exclusion_timeliness`
    ,null as `exclusion_reason_specific_work_level_timeliness`
    ,null as `exclusion_reason_general_contract_level_timeliness`
    ,null as `exclusion_approved_by_timeliness`
    ,'Meet' as `sla_result_accuracy`
    ,null as `miss_type`
    ,null as `exclusion_accuracy`
    ,null as `exclusion_reason_specific_work_level_accuracy`
    ,null as `exclusion_reason_general_contract_level_accuracy`
    ,null as `exclusion_approved_by_accuracy`
    ,date_format(current_timestamp, 'yyyyMMddHHmmss')
    ,date_format(current_timestamp, 'yyyyMMddHHmmss')
    ,'proj_gtn_tmp.t_ptp_gp_zt_kt_sq_local_currency_invoice_summary_ods'
FROM(
    SELECT
        `company_code` ,
        `clear_date`,
        `vendor`,
        `province`,
        `city` ,
        `amount_in_local_currency` ,
        `comments` ,
        `clearing_team` ,
        'RMB' as `currency`
    FROM
    `proj_gtn_tmp`.`t_ptp_gp_zt_kt_sq_local_currency_invoice_summary_ods`) loc
LEFT JOIN `proj_gtn_tmp`.`t_ptp_currency_exchange_ods` ex
    on loc.`currency` = ex.`unknown_text_3`

UNION ALL
SELECT
`company_code`
,`clearing_date`
,`vendor`
,null as `province`
,null as `city`
,`clearing_amount`
,null  
,null
,`currency`
,`clearing_amount`
,null as `accelate_payment`
,null as `accelate_payment_due_date`
,`clearing_date` as `expected_payment_proposal_date`
,null `payment_term`
,null `days`
,'Meet' as `sla_result_timeliness`
,null  as `exclusion_timeliness`
,null as `exclusion_reason_specific_work_level_timeliness`
,null as `exclusion_reason_general_contract_level_timeliness`
,null as `exclusion_approved_by_timeliness`
,'Meet' as `sla_result_accuracy`
,null as `miss_type`
,null as `exclusion_accuracy`
,null as `exclusion_reason_specific_work_level_accuracy`
,null as `exclusion_reason_general_contract_level_accuracy`
,null as `exclusion_approved_by_accuracy`
,date_format(current_timestamp, 'yyyyMMddHHmmss')
,date_format(current_timestamp, 'yyyyMMddHHmmss')
,'proj_gtn_tmp.t_ptp_gp_zt_kt_sq_foreign_currency_invoice_summary_ods'
FROM
  `proj_gtn_tmp`.`t_ptp_gp_zt_kt_sq_foreign_currency_invoice_summary_ods`
where `gp_pp`in( 'GP','gp'));
 