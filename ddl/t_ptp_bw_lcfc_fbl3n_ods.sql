CREATE TABLE IF NOT EXISTS `proj_gtn_tmp`.`t_ptp_bw_lcfc_fbl3n_ods`
(
  `company_code` string, 
  `year_month` string, 
  `account` string, 
  `document_number` string, 
  `document_date` string, 
  `posting_date` string, 
  `local_currency` string, 
  `amount_in_local_currency` string, 
  `document_currency` string, 
  `amount_in_doc__curr_` string, 
  `document_type` string, 
  `local_currency_2` string, 
  `amount_in_loc_curr_2` string, 
  `document_header_text` string, 
  `text` string, 
  `reference_key_1` string, 
  `reference_key_3` string, 
  `assignment` string, 
  `cost_center` string, 
  `profit_center` string, 
  `material` string, 
  `qty_in_un__of_entry` string, 
  `functional_area` string, 
  `order` string, 
  `user_name` string, 
  `vendor` string, 
  `clearing_document` string, 
  `clearing_date` string, 
  `net_due_date` string, 
  `dw_create_on` string, 
  `dw_last_update_on` string, 
  `dw_source_table` string)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\u0001' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
