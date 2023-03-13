INSERT INTO `proj_gtn_tmp`.`t_ptp_s1a_bw_lcfc_fbl1n_dwd`
(SELECT 
`Company_Code` as `company_code`,
`Account` as `vendor` ,
`Document_Number` as `document_number` ,
`Document_Type` as `document_type` ,
`Reference` as `reference` ,
`Document_Date` as `document_date` ,
`Document_currency` as `document_currency` ,
`Amount_in_doc__curr_` as `amount_in_doc_curr` ,
`Local_currency_2` as `local_currency_2` ,
`Amount_in_loc_curr_2` as `amount_in_loc_curr_2` ,
CASE WHEN `Amount_in_loc_curr_2` like '0%' 
    then cast(cast(`Amount_in_doc__curr_` as 
         decimal(20,2)) / cast(replace(ex.unknown_text_4,'/','') 
        as decimal(10,5))  as decimal(20,2))
    ELSE `Amount_in_loc_curr_2` end as `amount_in_usd`,
`Clearing_Document` as `clearing_document` ,
`Terms_of_Payment` as `terms_of_payment` ,
`Days_1` as `days_1` ,
`Clearing_date` as `clearing_date` ,
null as `net_due_date` ,
null as `baseline_payment_dte` ,
null as `posting_date` ,
null as `text` ,
null as `payment_block` ,
null as `debit_credit_ind` ,
`User_name` as `user_name` ,
null as `object_key` ,
null as `business_area` ,
null as `entry_date` ,
null as `gl_account` ,
null as `cost_center` ,
null as `profit_center` ,
null as `assignment` ,
null as `vendor_name_1` ,
null as `tax_code` ,
null as `pmt_meth_supplement` ,
null as `document_header_text` ,
null as `doc_status` ,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') ,
'proj_gtn_tmp.t_ptp_bw_lcfc_fbl1n_ods' 
FROM `proj_gtn_tmp`.`t_ptp_bw_lcfc_fbl1n_ods` fbl 
LEFT JOIN `proj_gtn_tmp`.`t_ptp_currency_exchange_ods` ex
    on fbl.`Document_currency` = ex.`unknown_text_3`

UNION ALL

SELECT 
`Company_Code` as `company_code`
, `Vendor` as `vendor`
, `Document_Number` as `document_number`
,`Document_Type` as `document_type`
,null as `reference`
,`Document_Date` as `document_date`
,`Document_currency` as `document_currency`
,`Amount_in_doc__curr_` as `amount_in_doc_curr`
,`Local_currency_2` as `local_currency_2`
,`Amount_in_loc_curr_2` as `amount_in_loc_curr_2`
,CASE WHEN `Amount_in_loc_curr_2` like '0%' 
    then cast(cast(`Amount_in_doc__curr_` as 
         decimal(20,2)) / cast(replace(ex.unknown_text_4,'/','') 
        as decimal(10,5))  as decimal(20,2))
    ELSE `Amount_in_loc_curr_2` end as `amount_in_usd`
,`Clearing_Document` as `clearing_document`
,null as `terms_of_payment`
,null as `days_1`
,`Clearing_date` as `clearing_date`
,`Net_due_date` as `net_due_date`
,null as `baseline_payment_dte`
,`Posting_Date` as `posting_date`
,`Text` as `text`
,null as `payment_block`
,null as `debit_credit_ind`
,`User_name` as `user_name`
,null as `object_key`
,null as `business_area`
,null as `entry_date`
,null as `gl_account`
,`Cost_Center` as `cost_center`
,`Profit_Center` as `profit_center`
,null  as `assignment`
,null as `vendor_name_1`
,null as `tax_code` 
,null as `pmt_meth_supplement` 
,`Document_Header_Text` as `document_header_text` 
,null `doc_status`
,DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss')
,DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddHHmmss') 
,'proj_gtn_tmp.t_ptp_bw_lcfc_fbl3n_ods' 
FROM `proj_gtn_tmp`.`t_ptp_bw_lcfc_fbl3n_ods` fbl
LEFT JOIN `proj_gtn_tmp`.`t_ptp_currency_exchange_ods` ex
    on fbl.`Document_currency` = ex.`unknown_text_3`);