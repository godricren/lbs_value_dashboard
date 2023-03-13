CREATE TABLE IF NOT EXISTS `proj_gtn_tmp`.`t_ptp_bw_lcfc_fbl1n_ods`
(
`Company_Code` string,
`Account` string,
`Document_Number` string,
`Document_Type` string,
`Reference` string,
`Document_Date` string,
`Document_currency` string,
`Amount_in_doc__curr_` string,
`Local_currency_2` string,
`Amount_in_loc_curr_2` string,
`Clearing_date` string,
`Clearing_Document` string,
`Terms_of_Payment` string,
`Days_1` string,
`User_name` string,
`dw_create_on` string,
`dw_last_update_on` string,
`dw_source_table` string)
ROW FORMAT DELIMITED  FIELDS TERMINATED BY '\u0001'