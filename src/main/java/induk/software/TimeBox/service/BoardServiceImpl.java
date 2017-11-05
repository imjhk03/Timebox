package induk.software.TimeBox.service;
import induk.software.TimeBox.model.ddayDTO;
import induk.software.TimeBox.model.f_fileDTO;
import induk.software.TimeBox.model.g_boardDTO;
import induk.software.TimeBox.model.g_fileDTO;
import induk.software.TimeBox.model.saveDTO;
import induk.software.TimeBox.repository.mapper.BoardMapperImpl;

import java.util.HashMap;
import java.util.List;




public class BoardServiceImpl implements BoardService{
	private BoardMapperImpl boardMapper; // DaoImpl ==> MapperImpl

	public void setmemberMapper(BoardMapperImpl boardMapper) {
		this.boardMapper =  boardMapper;
	}

	@Override
	public int boardWrite(g_boardDTO bdto) {
		// TODO Auto-generated method stub
		try {
			return boardMapper.boardWrite(bdto);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public List<HashMap<String,String>> boardList(HashMap map){
		try {
			return boardMapper.boardList(map);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public HashMap boardDetail(String b_no){
		
		HashMap<String,String> myMap = new HashMap<String,String>();
		try {
			return boardMapper.boardDetail(b_no);
		} catch(Exception e) {
			e.printStackTrace();
			return myMap;
		}
		
		
	}
	@Override
	public void boardDelete(int b_no){
		
		try {
			 boardMapper.boardDelete(b_no);
		} catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}

	
	@Override
	public int boardEdit(g_boardDTO bdto) {
		try {
			return boardMapper.boardEdit(bdto);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int total(String id){
		try {
			return boardMapper.total(id);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public g_boardDTO searchCode(String usercode) {
		try {
			return boardMapper.searchCode(usercode);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int fileWrite(g_fileDTO g_fdto) {
		try {
			return boardMapper.fileWrite(g_fdto);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int save(saveDTO savedto) {
	
		try {
			return boardMapper.save(savedto);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<HashMap<String,String>> taskList() {
		try {
			return boardMapper.taskList();
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int ffileWrite(f_fileDTO f_fdto) {
		try {
			return boardMapper.ffileWrite(f_fdto);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<HashMap<String, String>> fileList() {
		try {
			return boardMapper.fileList();
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int insertDay(ddayDTO day) {
		try {
			return boardMapper.insertDay(day);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<HashMap<String, String>> selectDay() {
		try {
			return boardMapper.selectDay();
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	

	
}
