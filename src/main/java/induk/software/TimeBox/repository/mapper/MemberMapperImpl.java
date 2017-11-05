package induk.software.TimeBox.repository.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import induk.software.TimeBox.model.MemberDTO;
import induk.software.TimeBox.model.myschDTO;
import induk.software.TimeBox.model.ttDTO;



public class MemberMapperImpl implements MemberMapper {

	private SqlSessionTemplate sqlSession;	

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;

	}
	@Override
	public int join(MemberDTO dto)
	{
		try {
			String statement = 
					"induk.software.TimeBox.repository.mapper.MemberMapper.join";
			return sqlSession.insert(statement, dto);
		}
		finally{
			
		}
		
	
	}
	
	@Override
	public int insertMysch(myschDTO dto) {
		try {
			String statement = 
					"induk.software.TimeBox.repository.mapper.MemberMapper.insertMysch";
			return sqlSession.insert(statement, dto);
		}
		finally{
			
		}
	}
	
	@Override
	public List<HashMap<String, String>> hak() {
		try{
			String statement = "induk.software.TimeBox.repository.mapper.MemberMapper.selecthak";
		
			//System.out.println(sqlSession.selectList(statement));
			return sqlSession.selectList(statement);
			}
			finally{
				
			}
	}
	
	@Override
	public List<HashMap<String, String>> seltt(int hak_no) {
		try{
			String statement = "induk.software.TimeBox.repository.mapper.MemberMapper.seltt";
			return sqlSession.selectList(statement,hak_no);
			}
			finally{
				
			}
	}
	

	@Override
	public MemberDTO login(MemberDTO dto)
	{

		try {
			String statement = "induk.software.TimeBox.repository.mapper.MemberMapper.login";
			
			return sqlSession.selectOne(statement,dto);

		}
		finally
		{

		}
	}
	
	
	@Override
	public Integer emailCheck(String id)
	{
		

		try {
			String statement = 
					"induk.software.TimeBox.repository.mapper.MemberMapper.emailCheck";
			
			
			return sqlSession.selectOne(statement,id);
			
			
		}
		finally
		{

		}
	}
	
	@Override
	public int update(MemberDTO dto) {
	      try {
	         String statement = 
	            "induk.software.TimeBox.repository.mapper.MemberMapper.update";
	         return sqlSession.update(statement, dto);
	      } finally {
	        
	      }
	   }
	
	@Override
	public Integer delete(MemberDTO dto)
	{	
		int result=0;
			
		try {
			String statement = 
					"induk.software.TimeBox.repository.mapper.MemberMapper.delete";
			result =sqlSession.delete(statement,dto);
			System.out.println(result);
				return result;
			
			
		}
		finally
		{
			
		}
		

		
	
	}
	@Override
	public ttDTO selectTTdata (int tt_no){
		
		try {
			String statement = 
					"induk.software.TimeBox.repository.mapper.MemberMapper.selectTTdata";
			
				return sqlSession.selectOne(statement,tt_no);
			
			
		}
		finally
		{
			
		}
		
		
	}
	
	@Override
	public List<myschDTO> selectMyschData(String email) {
		try{
			String statement = "induk.software.TimeBox.repository.mapper.MemberMapper.selectMyschData";
		
			//System.out.println(sqlSession.selectList(statement));
			return sqlSession.selectList(statement,email);
			}
			finally{
				
			}
	}
	/*
	

	
	

	public List<MemberDTO>list()
	{

		try{
			String id ="";
			//System.out.println("留듯띁濡� �꽆�뼱�삤�땲 "+name);
			String statement = 
					"induk.software.b_201112068.repository.mapper.MemberMapper.list";
			
			List<MemberDTO> mListModel = sqlSession.selectList(statement);
			
			System.out.println(sqlSession.selectList(statement));
			
			
			mListModel = sqlSession.selectList(statement);
			

			//System.out.println(sqlSession.selectList(statement, dong));
			//zListModel.add(zdto);

			return mListModel;
		}

		finally{

		}
	}
	public int count()
	{
		int totalPage = 0;
		String statement = 
				"induk.software.b_201112068.repository.mapper.MemberMapper.count";
		
		totalPage = sqlSession.selectOne(statement);
		
		return totalPage;
		
	}
	

	*/
	@Override
	public List<HashMap<String, String>> major() {
		try{
			String statement = "induk.software.TimeBox.repository.mapper.MemberMapper.selectmajor";
		
			//System.out.println(sqlSession.selectList(statement));
			return sqlSession.selectList(statement);
			}
			finally{
				
			}
	}
	


}

