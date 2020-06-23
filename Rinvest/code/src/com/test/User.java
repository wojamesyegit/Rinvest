package com.test;

public class User {
	 
	 private String usersname;
	 private String password;
	 
	 public User() {}
	 
	 public User(String usersname, String password) {
		 this.usersname=usersname;
		 this.password=password;
		 
	 }
	 
	 public  String getUsersname() {
		 return this.usersname;
	 }
	 public void setUsersname(String usersname) {
		 this.usersname = usersname;
	 }
	 public String getPassword() {
		 return password;
	 }
	 public void setPassword(String password) {
		 this.password = password;
	 }
}

