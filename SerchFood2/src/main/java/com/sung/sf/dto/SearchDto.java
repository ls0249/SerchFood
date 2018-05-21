package com.sung.sf.dto;

public class SearchDto {

	private String title;			//검색 결과 업체, 기관명
	private String link;			//검색 결과 업체, 기관의 상세 정보가 제공되는 네이버 페이지의 하이퍼텍스트 link를 나타낸다.
	private String description;		//검색 결과 업체, 기관명에 대한 설명을 제공한다.
	private String telephone;		//검색 결과 업체, 기관명의 전화번호를 제공한다.
	private String address;			//검색 결과 업체, 기관명의 주소를 제공한다.
	private String roadaddress;		//검색 결과 업체, 기관명의 도로명 주소를 제공한다.
	private int mapx;				//검색 결과 업체, 기관명 위치 정보의 x좌표를 제공한다. 제공값은 카텍좌표계 값으로 제공된다. 이 좌표값은 지도 API와 연동 가능하다.
	private int mapy;				//검색 결과 업체, 기관명 위치 정보의 y좌표를 제공한다. 제공값은 카텍 좌표계 값으로 제공된다. 이 좌표값은 지도 API와 연동 가능하다.
	private String category;		//검색 결과 업체, 기관의 분류 정보를 제공한다.
	private int display;			//검색된 검색 결과의 개수이다.
	
	private String menu;			//랜덤추천에 사용
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoadaddress() {
		return roadaddress;
	}
	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}
	public int getMapx() {
		return mapx;
	}
	public void setMapx(int mapx) {
		this.mapx = mapx;
	}
	public int getMapy() {
		return mapy;
	}
	public void setMapy(int mapy) {
		this.mapy = mapy;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getDisplay() {
		return display;
	}
	public void setDisplay(String menu) {
		this.menu = menu;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
}