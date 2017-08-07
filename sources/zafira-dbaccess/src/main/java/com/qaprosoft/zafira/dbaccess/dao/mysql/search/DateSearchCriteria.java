package com.qaprosoft.zafira.dbaccess.dao.mysql.search;

import com.qaprosoft.zafira.models.db.Status;

import java.util.Date;

/**
 * Created by irina on 4.7.17.
 */
public interface DateSearchCriteria {

    Date getDate() ;

    void setDate(Date Date);

    Date getFromDate() ;

    void setFromDate(Date fromDate);

    Date getToDate();

    void setToDate(Date toDate);

    String getPeriod();

    void setPeriod(String period);
}
