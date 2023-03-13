CREATE TABLE IF NOT EXISTS `proj_gtn_tmp`.`t_ptp_gp_zt_kt_sq_local_currency_invoice_summary_ods`
(
`company_code` string,
`clear_date` string,
`vendor` string,
`province` string,
`city` string,
`amount_in_local_currency` string,
`comments` string,
`clearing_team` string,
`dw_create_on` string,
`dw_last_update_on` string,
`dw_source_table` string)
ROW FORMAT DELIMITED  FIELDS TERMINATED BY '\u0001';