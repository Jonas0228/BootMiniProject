package boot.study.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PhotoDto")
public class GuestPhotoDto {
	private int photo_idx;
	private int guest_idx;
	private String photoname;
}
