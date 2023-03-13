CREATE TABLE IF NOT EXISTS `proj_gtn_tmp`.`t_ptp_gp_zt_kt_sq_foreign_currency_invoice_summary_ods`
(
`vendor` string,
`company_code` string,
`document_no` string,
`receive_date` string,
`invoice_date` string,
`NC_Date` string,
`NC_Reason` string,
`NC_Close_Date` string,
`send_for_tax_payment` string,
`tax_payment` string,
`reservation` string,
`delivery_date` string,
`clearing_date` string,
`clearing_amount` string,
`currency` string,
`payment_receiving_date` string,
`due_date` string,
`Processor` string,
`GP_PP` string,
`trade_non_trade` string,
`QC` string,
`agent` string,
`dw_create_on` string,
`dw_last_update_on` string,
`dw_source_table` string
)
ROW FORMAT DELIMITED  FIELDS TERMINATED BY '\u0001';