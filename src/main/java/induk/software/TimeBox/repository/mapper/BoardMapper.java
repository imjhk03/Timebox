package induk.software.TimeBox.repository.mapper;
import induk.software.TimeBox.model.ddayDTO;
import induk.software.TimeBox.model.f_fileDTO;
import induk.software.TimeBox.model.g_boardDTO;
import induk.software.TimeBox.model.g_fileDTO;
import induk.software.TimeBox.model.saveDTO;

import java.util.HashMap;
import java.util.List;





public interface BoardMapper {
	public int fileWrite(g_fileDTO g_fdto);
	public int boardWrite(g_boardDTO bdto);
	public List<HashMap<String,String>> boardList(HashMap map);
	public HashMap boardDetail(String b_no);
	public void boardDelete(int b_no);
	public int boardEdit(g_boardDTO bdto);
	public int total(String id);
	public int save (saveDTO savedto);
	public g_boardDTO searchCode(String usercode);
	public int ffileWrite(f_fileDTO f_fdto);
	public List<HashMap<String,String>> taskList();
	public List<HashMap<String,String>>	selectDay();
	public List<HashMap<String,String>> fileList();
	public int insertDay(ddayDTO day);
}
