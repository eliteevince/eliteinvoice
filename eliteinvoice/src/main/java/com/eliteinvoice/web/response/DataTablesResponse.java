package com.eliteinvoice.web.response;

import java.util.Collection;

public class DataTablesResponse<T> {
	
    private int sEcho;    
    private long iTotalRecords;
    private long iTotalDisplayRecords;
    private Collection<T> aaData;

    /**
     * @return the sEcho
     */
    public int getsEcho() {
        return this.sEcho;
    }

    /**
     * @param sEcho the sEcho to set
     */
    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
    }

    /**
     * @return the iTotalRecords
     */
    public long getiTotalRecords() {
        return this.iTotalRecords;
    }

    /**
     * @param resultCount the iTotalRecords to set
     */
    public void setiTotalRecords(long resultCount) {
        this.iTotalRecords = resultCount;
    }

    /**
     * @return the iTotalDisplayRecords
     */
    public long getiTotalDisplayRecords() {
        return this.iTotalDisplayRecords;
    }

    /**
     * @param iTotalDisplayRecords the iTotalDisplayRecords to set
     */
    public void setiTotalDisplayRecords(long iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

	/**
	 * @return the aaData
	 */
	public Collection<T> getAaData() {
		return this.aaData;
	}

	/**
	 * @param aaData the aaData to set
	 */
	public void setAaData(Collection<T> aaData) {
		this.aaData = aaData;
	}

	//Introducing the dummy constructor for json <-> POJO
	public DataTablesResponse() {
		
	}
	
	public DataTablesResponse(int sEcho, long iTotalRecords) {
		this.sEcho = sEcho;
		this.iTotalRecords = iTotalRecords;
		this.iTotalDisplayRecords = iTotalRecords;
	}	
}