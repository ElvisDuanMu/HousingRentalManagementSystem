package com.dlu.Test;

import com.dlu.pojo.ComputingEquipment;
import org.junit.jupiter.api.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestDate {
    @Test
    public void m1() throws ParseException {
        String stateDate = "2019-05-01";
        String endDate = "2019-07-31";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date s1 = simpleDateFormat.parse(stateDate);
        Date s2 = simpleDateFormat.parse(endDate);
        System.out.println(ComputingEquipment.dayComparePrecise(s1,s2));
        System.out.println(ComputingEquipment.dayCompare(s1,s2));
    }
}
