package sample2.controller;

import java.sql.Date;

public class test {

	public static void main(String[] args) {
		String yy = "2016";
		String mm = "05";
		String dd = "31";
		String birth = yy + "-" + mm + "-" + dd;
		System.out.println(Date.valueOf(birth));

	}

}
