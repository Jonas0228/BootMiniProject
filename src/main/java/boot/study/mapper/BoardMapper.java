package boot.study.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.study.dto.BoardDto;

@Mapper
public interface BoardMapper {
	public int getMaxNum();
	public int getTotalCount();
	public void updateStep(Map<String, Integer> map); //map: ref,step
	public void insertBoard(BoardDto dto);
	public List<BoardDto> getPagingList(Map<String, Integer> map); //map:start,perpage
	public void updateReadCount(int num);
	public BoardDto getData(int num);
	public int isEqualPass(Map<String, Object> map); //map에는 num하고 pass가 들어있어야함
	public void deleteBoard(int num);
	public void updateBoard(BoardDto dto);
}
