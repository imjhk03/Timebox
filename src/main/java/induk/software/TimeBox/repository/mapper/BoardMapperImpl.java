package induk.software.TimeBox.repository.mapper;



import induk.software.TimeBox.model.ddayDTO;
import induk.software.TimeBox.model.f_fileDTO;
import induk.software.TimeBox.model.g_boardDTO;
import induk.software.TimeBox.model.g_fileDTO;
import induk.software.TimeBox.model.saveDTO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;



public class BoardMapperImpl implements BoardMapper{
	private SqlSessionTemplate sqlSession;	

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int boardWrite(g_boardDTO bdto) {
		// TODO Auto-generated method stub
		try {
			int result=0;
			String statement = "";
			
			statement = "induk.software.movie.repository.mapper.BoardMapper.boardInsert";
			
			result = sqlSession.insert(statement, bdto);
			
			return result;
		} finally {
			//sqlSession.close();

		}	
	}

	@Override
	public List<HashMap<String,String>> boardList(HashMap map) {
		// TODO Auto-generated method stub
		try{
			String statement = "";
		
			statement = "induk.software.movie.repository.mapper.BoardMapper.adboardList";
		
			List<HashMap<String,String>> list = sqlSession.selectList(statement,map);
			
			return list;
		}
		finally{

		}

	}
	@Override
	public HashMap boardDetail(String b_no){
		try{
			String statement = "induk.software.movie.repository.mapper.BoardMapper.boardDetail";
			HashMap ab = sqlSession.selectOne(statement,b_no);

			return sqlSession.selectOne(statement,b_no);
		}
		finally{
		}
	}
	@Override
	public void boardDelete(int b_no){
		try{
			String statement1 = "induk.software.movie.repository.mapper.BoardMapper.boardDelete";

			sqlSession.delete(statement1, b_no);
		}
		finally{
		}
	}


	@Override
	public int boardEdit(g_boardDTO bdto) {
		try{
			String statement = "induk.software.movie.repository.mapper.BoardMapper.boardEdit";

			return sqlSession.update(statement, bdto);
		}
		finally{
		}
	}

	@Override
	public int total(String id){

		try{
			String statement1 = "induk.software.movie.repository.mapper.BoardMapper.total";

			return sqlSession.selectOne(statement1, id);
		}
		finally{
		}
	}

	@Override
	public g_boardDTO searchCode(String usercode) {
		try{
			String statement1 = "induk.software.movie.repository.mapper.BoardMapper.searchCode";

			return sqlSession.selectOne(statement1, usercode);
		}
		finally{
		}
	}

	@Override
	public int fileWrite(g_fileDTO g_fdto) {
		try {
			int result=0;
			String statement = "";
			
			statement = "induk.software.movie.repository.mapper.BoardMapper.fileInsert";
			
			result = sqlSession.insert(statement, g_fdto);
			
			return result;
		} finally {
			//sqlSession.close();

		}	
	}

	@Override
	public int save(saveDTO savedto) {
		// TODO Auto-generated method stub
				try {
					int result=0;
					String statement = "";
					
					statement = "induk.software.movie.repository.mapper.BoardMapper.save";
					
					result = sqlSession.insert(statement, savedto);
					
					return result;
				} finally {
					//sqlSession.close();

				}	
	}

	@Override
	public List<HashMap<String,String>> taskList(){
		try{
			String statement = "";
		
			statement = "induk.software.movie.repository.mapper.BoardMapper.taskList";
		
			List<HashMap<String,String>> list = sqlSession.selectList(statement);
			
			return list;
		}
		finally{

		}
	}

	@Override
	public int ffileWrite(f_fileDTO f_fdto) {
		
		try {
			int result=0;
			String statement = "";
			
			statement = "induk.software.movie.repository.mapper.BoardMapper.ffileInsert";
			
			result = sqlSession.insert(statement, f_fdto);
			
			return result;
		} finally {
			//sqlSession.close();

		}	
}

	@Override
	public List<HashMap<String, String>> fileList() {
		try{
			String statement = "";
		
			statement = "induk.software.movie.repository.mapper.BoardMapper.fileList";
		
			List<HashMap<String,String>> list = sqlSession.selectList(statement);
			
			return list;
		}
		finally{

		}
	}

	@Override
	public int insertDay(ddayDTO day) {
		try {
			int result=0;
			String statement = "";
			
			statement = "induk.software.movie.repository.mapper.BoardMapper.insertDay";
			
			result = sqlSession.insert(statement, day);
			
			return result;
		} finally {
			//sqlSession.close();

		}	
	}

	@Override
	public List<HashMap<String, String>> selectDay() {
		try{
			String statement = "";
		
			statement = "induk.software.movie.repository.mapper.BoardMapper.selectDay";
		
			List<HashMap<String,String>> list = sqlSession.selectList(statement);
			
			return list;
		}
		finally{

		}
	}
}
