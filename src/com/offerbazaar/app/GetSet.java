package com.offerbazaar.app;

public class GetSet {
    private static int aid;
    private static String advertiserName;
    private static String advertiserBizName;
    

    public static String getAdvertiserBizName() {
		return advertiserBizName;
	}

	public static void setAdvertiserBizName(String abiz) {
		GetSet.advertiserBizName = abiz;
	}

	public static int getAid() {
        return aid;
    }

    public static void setAid(int a) {
        aid = a;
    }

    public static String getAdvertiserName() {
        return advertiserName;
    }

    public static void setAdvertiserName(String name) {
        advertiserName = name;
    }
    
    private static int uid;
    private static String userName;

    public static int getUid() {
        return uid;
    }

    public static void setUid(int id) {
        uid = id;
    }

    public static String getUserName() {
        return userName;
    }

    public static void setUserName(String name) {
        userName = name;
    }

    
}

	