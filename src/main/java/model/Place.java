package model;

public class Place {

	int pCode; // 장소 코드
	String pType; // 장소 타입
	String pName; // 장소 이름
	String pImg; // 장소 이미지
	Double pMapX; // x좌표
	Double pMapY; // y좌표

	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public String getpType() {
		return pType;
	}
	public void setpType(String pType) {
		this.pType = pType;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public Double getpMapX() {
		return pMapX;
	}
	public void setpMapX(Double pMapX) {
		this.pMapX = pMapX;
	}
	public Double getpMapY() {
		return pMapY;
	}
	public void setpMapY(Double pMapY) {
		this.pMapY = pMapY;
	}

	@Override
	public String toString() {
		return pCode + pType + pName + pImg + pMapX + pMapY;
	}

}
