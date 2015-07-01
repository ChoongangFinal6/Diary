package model;

public class Food {
    private int foodCode;
    private int typeCode;
    private int kindCode;
    private String foodName;
    private String foodImage;
    private int kcal;
    private int gram;
    private String amount;
    
	public int getFoodCode() {
		return foodCode;
	}
	public void setFoodCode(int foodCode) {
		this.foodCode = foodCode;
	}
	public int getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}
	public int getKindCode() {
		return kindCode;
	}
	public void setKindCode(int kindCode) {
		this.kindCode = kindCode;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodImage() {
		return foodImage;
	}
	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public int getGram() {
		return gram;
	}
	public void setGram(int gram) {
		this.gram = gram;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	@Override
	public String toString() {
		return "Food [foodCode=" + foodCode + ", typeCode=" + typeCode
				+ ", kindCode=" + kindCode + ", foodName=" + foodName
				+ ", foodImage=" + foodImage + ", kcal=" + kcal + ", gram="
				+ gram + ", amount=" + amount + "]";
	}
    
	 
	
   /* @Override
    public String toString() {
    	
    	return ""+foodCode + " " +typeCode + " " +kindCode + " " +foodName + " " +foodImage+;
    private int kcal;
    private int gram;
    private String amount;
    }*/

    
}
