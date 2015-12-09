package com.gobook.location.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.member.dao.IMemberDao;

@Component
public class LocationService implements ILocationService {

	@Autowired
	private IMemberDao iMemberDao;
}
