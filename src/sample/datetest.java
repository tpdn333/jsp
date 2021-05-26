package sample;

import java.text.SimpleDateFormat;
import java.util.Date;

public class datetest {
	public static void main(String[] args) {
		long time = System.currentTimeMillis();
		SimpleDateFormat date = new SimpleDateFormat("hh:mm:ss");
		String nowDate = date.format(new Date(time));
		System.out.println(nowDate);
	}
}
