package com.medicine_inc.bbs.haejin;

import java.util.ArrayList;
import java.util.List;

import com.medicine_inc.bbs.domain.AnimalHospital;
import com.medicine_inc.bbs.domain.GuestReply;
import com.medicine_inc.bbs.domain.Hospital;
import com.medicine_inc.bbs.domain.Pharmacy;

public interface JinDao {
	
	/*현재 위치에서 반경300m 약국 구하는 메소드*/
	public abstract List<Pharmacy> radiansList(String lat, String lng);
	//현재 위치에서 반경300m 병원 구하는 메소드
	public abstract List<Hospital> radiansListHospital(String lat, String lng);
	
	public abstract Pharmacy getPharmacy(String no);
	public abstract Hospital getHospital(String no);
	
	//댓글
	public abstract void setGReply(GuestReply reply);
	public abstract List<GuestReply> greplyList(int bno, int btype);
	public boolean greplyPassCheck(int no, int pass);
	public void deletegReply(int no);
	public void reUpdate(GuestReply reply);
	
	//검색리스트 + 페이징
	public abstract List<Pharmacy> pSearchList(String sidoname, String name, int startRow, int num);
	public abstract int pgetListCount(String sidoname, String name);
	
	public abstract List<AnimalHospital> aniSearchList(String sidoname, String name, int startRow, int num);
	public abstract int aniSearchCount(String sidoname, String name);
}
