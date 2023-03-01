TRUNCATE TABLE `proj_gtn_tmp`.`t_ptp_bw_fi_zocwcs02l_cdl_deduplication_ods`;
INSERT INTO `proj_gtn_tmp`.`t_ptp_bw_fi_zocwcs02l_cdl_deduplication_ods`
SELECT
`fiscvarnt` ,`fiscper` ,
`zacct_com` ,`ac_doc_no` ,
`item_num` ,`zsourcemt` ,
`co_area` ,`zbpcdcat1` ,
`zwc_allo` ,`ea_docino` ,
`zwc_cmpy` ,`recordmode` ,
`balance` ,`fiscyear` ,
`credit` ,`debit` ,
`currency` ,`chrt_accts` ,
`gl_account` ,`func_area` ,
`zregion2` ,`zcountry1` ,
`pstng_date` ,`bill_num` ,
`bill_item` ,`vendor` ,
`ref_doc_nr` ,`refer_itm` ,`ref_doc_fy` ,
`material` ,`plant` ,
`oi_ebeln` ,`oi_ebelp` ,
`zsgtxt` ,`z_blart` ,
`z_activ` ,`doc_date` ,
`fi_docstat` ,`sp_gl_ind` ,
`clear_date` ,`bus_area` ,
`netduedate` ,`pymt_meth` ,
`bline_date` ,`acct_type` ,
`country` ,`zfingeo` ,
`profit_ctr` ,`customer` ,
`zwc_actp1` ,`zwc_bgl` ,
`zwc_bwbu` ,`zwc_bpcbu` ,
`zwc_actp2` ,`zwc_actp3` ,
`zwc_actp4` ,`zwc_age` ,
`zalloflag` ,`zwc_prd` ,`fi_dbcrind` ,
`credit_lc` ,`zamtlocl` ,
`debit_lc3` ,`debit_lc` ,
`credit_lc3` ,`loc_currc3` ,
`loc_currcy` ,`flag` ,
`zamtusd` ,`clr_doc_no` ,
`zflagind` ,`zc_accamt` ,
`exchg_rate` ,`inv_doc_no` ,
`inv_item` ,`inv_year` ,
`zwc_perd` ,`zwcc_bg` ,
`zwcc_geo` ,`zwcc_reg` ,
`zwccbpcbu` ,`zbsl_loc` ,
`zbsl_rat` ,`zwcc_cty` ,
`zwcc_prd` ,`zpdate` ,
`deb_cre_l2` ,`loc_currc2` ,
`zamtlocl2` ,`deb_cre_dc` ,
`doc_currcy` ,`ref_doc_no` ,
`zwcc_gppp` ,`createdon` ,
`pmnt_block` ,`zpostby` ,
`pmnttrms` ,`zadd_tx` ,
`alloc_nmbr` ,`bbp_inv_id` ,
`update_timestamp` ,
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddhhmm'),
DATE_FORMAT(CURRENT_TIMESTAMP, 'yyyyMMddhhmm') ,
'proj_gtn_tmp.bw_fi_zocwcs02l_cdl_deduplication'
FROM `proj_gtn_tmp`.`bw_fi_zocwcs02l_cdl_deduplication`
WHERE to_date(clear_date,'yyyyMMdd') BETWEEN date_add(last_day(add_months(current_date,-2)),1) and last_day(add_months(current_date,-1))