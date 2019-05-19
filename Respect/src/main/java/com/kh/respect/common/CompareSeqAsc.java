package com.kh.respect.common;

import java.util.Comparator;

import com.kh.respect.schedule.model.vo.ScheduleReport;

public class CompareSeqAsc implements Comparator<ScheduleReport>{
	 
    @Override
    public int compare(ScheduleReport o1, ScheduleReport o2) {
        // TODO Auto-generated method stub
        return o1.getReportDay() < o2.getReportDay()  ? -1 : o1.getReportDay()  > o2.getReportDay()  ? 1:0;
    }        
}


