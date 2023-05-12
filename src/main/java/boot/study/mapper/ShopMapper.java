package boot.study.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.study.dto.ShopDto;

@Mapper
public interface ShopMapper {
	public int getTotalCount();
	public void insertShop(ShopDto dto);
	public List<ShopDto> getAllSangpums();
	public ShopDto getSangpum(int num);
	public void updatePhoto(Map<String, Object> map);
	public void updateShop(ShopDto dto);
	public void deleteShop(int num);
}