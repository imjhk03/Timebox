package induk.software.TimeBox.service;

import java.util.HashMap;
import java.util.List;








import induk.software.TimeBox.model.MemberDTO;
import induk.software.TimeBox.model.myschDTO;
import induk.software.TimeBox.model.ttDTO;

public interface MemberService {
	public int join(MemberDTO dto);
	public List<HashMap<String,String>> hak();
	public List<HashMap<String,String>> seltt(int hak_no);
	public MemberDTO login(MemberDTO dto);
	public Integer emailCheck(String id);
	public int update(MemberDTO dto);
	public Integer delete(MemberDTO dto);
	public ttDTO selectTTdata (int tt_no);
	public int insertMysch(myschDTO mydto);
	public List<myschDTO> selectMyschData(String email);
	public List<HashMap<String,String>> major();
}
