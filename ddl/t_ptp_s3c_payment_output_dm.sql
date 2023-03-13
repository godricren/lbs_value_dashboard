CREATE TABLE IF NOT EXISTS `proj_gtn_tmp`.`t_ptp_s3c_payment_output_dm`
(`metrics_type` string,
`metrics_no` string,
`metrics_name` string,
`definition` string,
`unit` string,
`gp_pp` string,
`po_non_po` string,
`cash_credit_card` string,
`sub_process` string,
`category` string,
`center` string,
`month` string,
`value` string,
`n_d` string,
`ariba_or_non_ariba` string,
`comments` string,
`owner_update_value` string,
`dw_create_on` string,
`dw_last_update_on` string,
`dw_source_table` string)
STORED AS PARQUET;


