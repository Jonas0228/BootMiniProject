package boot.study.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BoardDto")
public class BoardDto {
	private int num;
	private String writer;
	private String filename;
	private String subject;
	private String content;
	private String pass;
	private int readcount;
	private int ref;
	private int step;
	private int depth;
	private Timestamp writeday;
}
