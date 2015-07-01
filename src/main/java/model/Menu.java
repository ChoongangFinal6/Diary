package model;

public class Menu {
	private int kindCode; //음식종류 코드
	private int typeCode; //음식타입 코드
    private String foodType; // 음식 타임
	private String foodKind; // 음식 종류
	
	public int getKindCode() {
		return kindCode;
	}
	public void setKindCode(int kindCode) {
		this.kindCode = kindCode;
	}
	public int getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}
	@Override
	public String toString() {
		return "Menu [kindCode=" + kindCode + ", typeCode=" + typeCode
				+ ", foodType=" + foodType + ", foodKind=" + foodKind + "]";
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public String getFoodKind() {
		return foodKind;
	}
	public void setFoodKind(String foodKind) {
		this.foodKind = foodKind;
	} 
  
	
}
