CREATE TABLE IF NOT EXISTS `proj_gtn_tmp`.`t_ptp_gp_zt_kt_sq_foreign_currency_invoice_summary_ods`
(
`供应商名称` string,
`法人` string,
`对账单号_单据号` string,
`收单日` string,
`发票日期` string,
`NC_Date` string,
`NC_Reason` string,
`NC_Close_Date` string,
`发给税务缴税` string,
`缴税完成` string,
`约款` string,
`邮寄资料时间` string,
`付款时间` string,
`付款金额` string,
`币种` string,
`入账时间` string,
`due_date` string,
`Processor` string,
`GP_PP` string,
`贸易或非贸易付汇` string,
`QC` string,
`经办人` string,
`dw_create_on` string,
`dw_last_update_on` string,
`dw_source_table` string
)
ROW FORMAT DELIMITED  FIELDS TERMINATED BY '\u0001';