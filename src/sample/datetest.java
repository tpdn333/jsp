package sample;

import java.util.*;

public class datetest {
	public static void main(String[] args) {
		
		List<Board> list = new ArrayList<Board>(); 
		Board bd = new Board();
		bd.setTitle("title");
		bd.setWriter("son");
		list.add(bd);
		
		System.out.println(list.size());
	}
}
