package induk.software.TimeBox.service;

import induk.software.TimeBox.model.MemberDTO;
import induk.software.TimeBox.model.myschDTO;
import induk.software.TimeBox.model.ttDTO;
import induk.software.TimeBox.repository.mapper.MemberMapperImpl;

import java.util.HashMap;
import java.util.List;





public class MemberServiceImpl implements MemberService{
	private MemberMapperImpl memberMapper; // DaoImpl ==> MapperImpl 

	public void setMemberMapper(MemberMapperImpl memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public int join(MemberDTO dto) {
		try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			return memberMapper.join(dto);
		}
	}
	


	@Override
	public List<HashMap<String, String>> hak() {
		// TODO Auto-generated method stub
try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			return memberMapper.hak();
		}
	}

	@Override
	public List<HashMap<String, String>> seltt(int hak_no) {
		// TODO Auto-generated method stub
try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally{
			return memberMapper.seltt(hak_no);
		}
	}




	@Override
	public MemberDTO login(MemberDTO dto) {
		try {
			return memberMapper.login(dto);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@Override
	public Integer emailCheck(String id) {
		
		try {
			return	memberMapper.emailCheck(id);
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return null;
	}
	
	@Override
	public int update(MemberDTO dto) {
	      try {
	         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return memberMapper.update(dto);
	   }
	
@Override
public Integer delete(MemberDTO dto) {
		
		try {
			return	memberMapper.delete(dto);
		} catch(Exception e) {
			e.printStackTrace(); 
		}
		return null;
	}

@Override
public ttDTO selectTTdata (int tt_no){
	
	try {
		return	memberMapper.selectTTdata(tt_no);
	} catch(Exception e) {
		e.printStackTrace(); 
	}
	return null;
}

@Override
public int insertMysch(myschDTO mydto) {
	// TODO Auto-generated method stub
	
	try {
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	finally{
		return memberMapper.insertMysch(mydto);
	}
	

}

@Override
public List<myschDTO>selectMyschData(String email) {
	try {
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	finally{
		return memberMapper.selectMyschData(email);
	}
}

@Override
public List<HashMap<String, String>> major() {
	try {
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	finally{
		return memberMapper.major();
	}
}

}


	/*
	

	
	public List<MemberDTO>list() {
		try {
		return memberMapper.list();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int count() {
		try {
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return memberMapper.count();
	}
	
	
	*/
	


