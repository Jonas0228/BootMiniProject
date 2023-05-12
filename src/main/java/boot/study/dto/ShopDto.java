package boot.study.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ShopDto")
public class ShopDto {
	private int num;
	private String sangpum;
	private String color;
	private int price;
	private int cnt;
	private String photo;
	private Timestamp ipgoday;
}