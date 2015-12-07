package com.gobook.bookmanage.service;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.bookmanage.dao.IBookManageDao;
import com.gobook.bookmanage.dto.BookDto;

@Component
public class BookManageService implements IBookManageService {

	@Autowired
	private IBookManageDao iBookManageDao;
	
	@Override
	public void bookInsert(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bookInsertOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		BookDto bookDto=(BookDto)map.get("bookDto");
		
		bookDto.setBook_state(1);
		
		MultipartFile book_cover_file=request.getFile("book_cover_file");
		String book_cover_file_name=/*Long.toString(System.currentTimeMillis()) + "_" + */book_cover_file.getOriginalFilename();
		long book_cover_file_size=book_cover_file.getSize();
		
		if(book_cover_file_size!=0){
			MultipartFile book_preview_file1=request.getFile("book_preview_file1");
			MultipartFile book_preview_file2=request.getFile("book_preview_file2");
			MultipartFile book_preview_file3=request.getFile("book_preview_file3");
			
			String book_preview_file_name1=book_preview_file1.getOriginalFilename();
			String book_preview_file_name2=book_preview_file2.getOriginalFilename();
			String book_preview_file_name3=book_preview_file3.getOriginalFilename();
			
			long book_preview_file_size1=book_preview_file1.getSize();
			long book_preview_file_size2=book_preview_file2.getSize();
			long book_preview_file_size3=book_preview_file3.getSize();
			
			File path=new File("C:/gobook/bookimg/");
			path.mkdirs();
			
			if(path.exists() && path.isDirectory()){
				File cover_file=new File(path, book_cover_file_name);
				try{
					book_cover_file.transferTo(cover_file);
					
					bookDto.setBook_cover_file_name(book_cover_file_name);
					bookDto.setBook_cover_file_path(cover_file.getAbsolutePath());
					bookDto.setBook_cover_file_size(book_cover_file_size);
					
					if(book_preview_file_size1!=0){
						File preview_file1=new File(path, book_preview_file_name1);
						File preview_file2=new File(path, book_preview_file_name2);
						File preview_file3=new File(path, book_preview_file_name3);
						try{
							book_preview_file1.transferTo(preview_file1);
							book_preview_file2.transferTo(preview_file2);
							book_preview_file3.transferTo(preview_file3);
							
							bookDto.setBook_preview_file_name1(book_preview_file_name1);
							bookDto.setBook_preview_file_name2(book_preview_file_name2);
							bookDto.setBook_preview_file_name3(book_preview_file_name3);
							
							bookDto.setBook_preview_file_path1(preview_file1.getAbsolutePath());
							bookDto.setBook_preview_file_path2(preview_file2.getAbsolutePath());
							bookDto.setBook_preview_file_path3(preview_file3.getAbsolutePath());
							
							bookDto.setBook_preview_file_size1(book_preview_file_size1);
							bookDto.setBook_preview_file_size2(book_preview_file_size2);
							bookDto.setBook_preview_file_size3(book_preview_file_size3);
						}catch(Exception e){
							e.printStackTrace();
						}
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		int check=iBookManageDao.bookInsert(bookDto);
		
		mav.addObject("check", check);
		
		mav.setViewName("bookManage/bookInsertOk");
		
	}

}
