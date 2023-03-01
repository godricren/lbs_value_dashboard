INSERT INTO `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dwd`
select
    `法人` ,
    `付款日期`,
    `供应商`,
    `省` ,
    `市` ,
    `金额` ,
    `备注` ,
    `入账Team` ,
    'RMB' as `币种`
    ,cast(cast(loc.`金额` as decimal(20,2))/
    cast(replace(ex.unknown_text_4,'/','') 
    as decimal(10,5)) as decimal(20,3)) `USD金额`
    ,null as `accelate_payment`
    ,null as `accelate_payment_due_date`
    ,`付款日期` as `expected_payment_proposal_date`
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
        `法人` ,
        `付款日期`,
        `供应商`,
        `省`,
        `市` ,
        `金额` ,
        `备注` ,
        `入账Team` ,
        'RMB' as `币种`
    FROM
    `proj_gtn_tmp`.`t_ptp_gp_zt_kt_sq_local_currency_invoice_summary_ods`) loc
LEFT JOIN `proj_gtn_tmp`.`t_ptp_currency_exchange_ods` ex
    on loc.`币种` = ex.`unknown_text_3`;

INSERT INTO `proj_gtn_tmp`.`t_ptp_s3u_gp_zt_kt_sq_invoice_summary_dwd`
SELECT
`法人`
,`付款时间` as `付款日期`
,`供应商名称`
,null as `省`
,null as `市`
,`付款金额` as `金额`
,null  as `备注`
,null as `入账Team`
,`币种`
,`付款金额` as `USD金额`
,null as `accelate_payment`
,null as `accelate_payment_due_date`
,`付款时间` as `expected_payment_proposal_date`
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
where `gp_pp`in( 'GP','gp');
 