package com.eliteinvoice.web.request;

public class DataTablesRequest {

	 private int sEcho;    
	 private int iDisplayStart;
	 private int iDisplayLength;

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
	 * @return the iDisplayStart
	 */
	public int getiDisplayStart() {
		return this.iDisplayStart;
	}
	
	/**
	 * @param iDisplayStart the iDisplayStart to set
	 */
	public void setiDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}
	
	/**
	 * @return the iDisplayLength
	 */
	public int getiDisplayLength() {
		return this.iDisplayLength;
	}
	
	/**
	 * @param iDisplayLength the iDisplayLength to set
	 */
	public void setiDisplayLength(int iDisplayLength) {
		this.iDisplayLength = iDisplayLength;
	} 
}