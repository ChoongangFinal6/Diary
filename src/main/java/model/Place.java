package model;

public class Place {

	String pName; // 장소 이름
	String pType; // 장소 타입
	String pImg; // 장소 이미지
	Double pMapY; // y좌표
	Double pMapX; // x좌표

	// mybatis 파라미터용 변수
	String pCat2Code;
	String pCat2Name;


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

	public String getpCat2Code() {
		return pCat2Code;
	}

	public void setpCat2Code(String pCat2Code) {
		this.pCat2Code = pCat2Code;
	}

	public String getpCat2Name() {
		return pCat2Name;
	}

	public void setpCat2Name(String pCat2Name) {
		this.pCat2Name = pCat2Name;
	}

	public String toString() {
		return "Place [pType=" + pType + ", pName=" + pName + ", pImg=" + pImg
				+ ", pMapX=" + pMapX + ", pMapY=" + pMapY + ", pCat2Code="
				+ pCat2Code + ", pCat2Name=" + pCat2Name + "]";
	}


	
}
