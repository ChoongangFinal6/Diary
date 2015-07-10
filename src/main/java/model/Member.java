package model;

public class Member {
	private String mEmail;
	private String mName;
	private String mPass;
	
	
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPass() {
		return mPass;
	}
	public void setmPass(String mPass) {
		this.mPass = mPass;
	}
	@Override
	public String toString() {
		return "Member [mEmail=" + mEmail + ", mName=" + mName + ", mPass="
				+ mPass + "]";
	}
	
	
}



