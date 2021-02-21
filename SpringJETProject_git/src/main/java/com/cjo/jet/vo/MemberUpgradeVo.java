package com.cjo.jet.vo;

import java.sql.Date;

public class MemberUpgradeVo {
	private int jet_member_upgrade_no;
	private int jet_member_no;	
	private Date jet_member_upgrade_date;
	public MemberUpgradeVo() {
		super();
	}
	public MemberUpgradeVo(int jet_member_upgrade_no, int jet_member_no, Date jet_member_upgrade_date) {
		super();
		this.jet_member_upgrade_no = jet_member_upgrade_no;
		this.jet_member_no = jet_member_no;
		this.jet_member_upgrade_date = jet_member_upgrade_date;
	}
	public int getJet_member_upgrade_no() {
		return jet_member_upgrade_no;
	}
	public void setJet_member_upgrade_no(int jet_member_upgrade_no) {
		this.jet_member_upgrade_no = jet_member_upgrade_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public Date getJet_member_upgrade_date() {
		return jet_member_upgrade_date;
	}
	public void setJet_member_upgrade_date(Date jet_member_upgrade_date) {
		this.jet_member_upgrade_date = jet_member_upgrade_date;
	}

	
	
}
