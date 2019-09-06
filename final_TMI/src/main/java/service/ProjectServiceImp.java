package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ProjectMapper;

@Service
public class ProjectServiceImp implements ProjectService{
	@Autowired
	private ProjectMapper mapper;
	
	@Override
	public void testPrn() {
		// TODO Auto-generated method stub
		System.out.println(mapper.test());
	}
	
}
