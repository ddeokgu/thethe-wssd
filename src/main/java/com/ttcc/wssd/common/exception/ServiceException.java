package com.ttcc.wssd.common.exception;

public class ServiceException extends RuntimeException
{
	private String errorCode;
	private String errorMsg;
	private Object[] rep;
	private Object details;
	/**
	 * 생성자 - 기본
	 */
	public ServiceException() 
	{
		
	}

	/**
	 * 생성자 - 코드
	 */
	public ServiceException(String errorCode)
	{
		this.errorCode = errorCode;
	}

	/**
	 * 생성자 - 코드 + 메시지
	 */
	public ServiceException(String errorCode, String errorMsg)
	{
		this.errorCode = errorCode;
		this.setErrorMsg(errorMsg);
	}
	
	/**
	 * 생성자 - 코드 + 치환 문자 배열
	 */
	public ServiceException(String errorCode, Object[] rep)
	{
		this.errorCode = errorCode;
		this.setRep(rep);
	}

	/**
	 * 생성자 - 코드 + 메시지 + 치환 문자 배열
	 */
	public ServiceException(String errorCode, String errorMsg, Object[] rep)
	{
		this.errorCode = errorCode;
		this.setErrorMsg(errorMsg);
		this.setRep(rep);
	}
	
	/**
	 * 생성자 - 다른 예외 중접
	 */
	public ServiceException(Throwable th)
	{
		super(th);
	}
	
	/**
	 * 상세 정보 추가
	 */
	public void setDetails(Object details) {
		this.details = details;
	}
	
	public Object getDetails() {
		return this.details;
	}

	/**
	 * 예외 메시지 가져오기
	 */
	public String getCode()
	{	
		return this.errorCode;
	}
	
	/**
	 * static - 최초 발생 예외 찾기
	 */
	public static Throwable getRootCause(Throwable ex)
	{
		Throwable cause = ex.getCause();
		Throwable rootCause = cause==null?ex:null;
		while(cause != null)
		{
			rootCause = cause;
			cause = cause.getCause();
		}
		return rootCause;
	}

	public Object[] getRep() {
		return rep;
	}

	public void setRep(Object[] rep) {
		this.rep = rep;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}	
}
