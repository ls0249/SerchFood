package com.sung.sf.dao;

import java.util.List;

import net.sf.json.JSONObject;

import java.util.HashMap;

public interface SearchDao {

	public List searchList(String searchCategory);
	
	public boolean search(String searchCategory);
	
	public String randomSearch();
	
}