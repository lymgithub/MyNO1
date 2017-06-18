package com.cn.hnust.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;
import com.mysql.fabric.xmlrpc.base.Data;

@Controller
@RequestMapping("/user")
public class UserController {  
	@Resource
	private IUserService userService;
	
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,Model model){
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		model.addAttribute("user", user);
		return "showUser";
	}
	
	@RequestMapping("/arr")
	public String arr(HttpServletRequest request,@RequestBody List<User> list,Model model){
		System.out.println(list);
		//model.addAttribute("user", user);
		return "showUser";
	}
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public List<User> selectAll(){
		
		long start = System.currentTimeMillis();
		List<User> l = userService.selectAll();
		/*要执行的程序*/
		long end = System.currentTimeMillis();
		long data = start-end;
		System.out.println(data);
		return l;
	}
	
	@RequestMapping("/selectLike/{p}")
	@ResponseBody
	public List<User> selectLike(@PathVariable("p") String p){
		
		long start = System.currentTimeMillis();
		List<User> l = userService.selectLike(p);
		/*要执行的程序*/
		long end = System.currentTimeMillis();
		long data = start-end;
		System.out.println(data);
		return l;
	}
	@RequestMapping("/delById/{id}")
	@ResponseBody
	public int delById(@PathVariable("id") int id){
		
		long start = System.currentTimeMillis();
		int l = userService.delById(id);
		/*要执行的程序*/
		long end = System.currentTimeMillis();
		long data = start-end;
		System.out.println(data);
		return l;
	}
}
