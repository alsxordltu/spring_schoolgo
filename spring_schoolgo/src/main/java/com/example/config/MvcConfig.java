package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

// Spring MVC에 대한 Bean 설정
@Configuration
@ComponentScan(basePackages={"com.example.controller"}) //<context:component-scan base-package="com.example.controller"/>
@EnableWebMvc //<mvc:annotation-driven />
public class MvcConfig extends WebMvcConfigurerAdapter {
	
	private final String PATH = "/WEB-INF/view/";
	
    @Bean
    public ViewResolver internalResourceViewResolver(){
    	InternalResourceViewResolver resolver = new InternalResourceViewResolver();
    	resolver.setPrefix("/WEB-INF/view/");
    	resolver.setSuffix(".jsp");
    	return resolver;
    }
    
    @Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
/*		registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/images/");
		registry.addResourceHandler("/img2/**").addResourceLocations("/WEB-INF/assets/css/images/");
		registry.addResourceHandler("/csds/**").addResourceLocations("/WEB-INF/assets/css/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/assets/fonts/");
		registry.addResourceHandler("/tutorials/**").addResourceLocations("/WEB-INF/tutorial/");
		registry.addResourceHandler("/views/**").addResourceLocations("/WEB-INF/view/");
		registry.addResourceHandler("/jss/**").addResourceLocations("/WEB-INF/assets/js/");*/
    	
    	//인텍스 페이지 관련 리소스 경로
    	registry.addResourceHandler("/index_css/**").addResourceLocations(PATH + "index/css/");
    	registry.addResourceHandler("/index_img/**").addResourceLocations(PATH + "index/images/");
    	registry.addResourceHandler("/index_font/**").addResourceLocations(PATH + "index/fonts/");
    	
    	//로그인 페이지 관련 리소스 경로
    	registry.addResourceHandler("/login_css/**").addResourceLocations(PATH + "login/css/");
    	registry.addResourceHandler("/login_img/**").addResourceLocations(PATH + "login/images/");
    	registry.addResourceHandler("/login_font/**").addResourceLocations(PATH + "login/fonts/");
    	
    	//회원가입 페이지 관련 리소스 경로
    	registry.addResourceHandler("/join_css/**").addResourceLocations(PATH + "join/css/");
    	registry.addResourceHandler("/join_img/**").addResourceLocations(PATH + "join/images/");
    	registry.addResourceHandler("/join_font/**").addResourceLocations(PATH + "join/fonts/");
    	registry.addResourceHandler("/join_js/**").addResourceLocations(PATH + "join/js/");
    	
    	//튜토리얼 페이지 관련 리소스 경로
    	registry.addResourceHandler("/tutorial_css/**").addResourceLocations(PATH + "tutorial/css/");
    	registry.addResourceHandler("/tutorial_img/**").addResourceLocations(PATH + "tutorial/images/");
    	registry.addResourceHandler("/tutorial_font/**").addResourceLocations(PATH + "tutorial/fonts/");
    	registry.addResourceHandler("/tutorial_js/**").addResourceLocations(PATH + "tutorial/js/");
		
		
    	//메인 페이지 관련 리소스 경로
    	registry.addResourceHandler("/main_css/**").addResourceLocations(PATH + "main/css/");
    	registry.addResourceHandler("/main_img/**").addResourceLocations(PATH + "main/images/");
    	registry.addResourceHandler("/main_font/**").addResourceLocations(PATH + "main/fonts/");
    	registry.addResourceHandler("/main_js/**").addResourceLocations(PATH + "main/js/");
		
    	//마이페이지 관련 리소스 경로
    	registry.addResourceHandler("/my_css/**").addResourceLocations(PATH + "mypage/css/");
    	registry.addResourceHandler("/my_img/**").addResourceLocations(PATH + "mypage/images/");
    	registry.addResourceHandler("/my_font/**").addResourceLocations(PATH + "mypage/fonts/");
    	registry.addResourceHandler("/my_js/**").addResourceLocations(PATH + "mypage/js/");
		
    	//루트 등록 관련 리소스 경로
    	registry.addResourceHandler("/insert_css/**").addResourceLocations(PATH + "insertroute/css/");
    	registry.addResourceHandler("/insert_img/**").addResourceLocations(PATH + "insertroute/images/");
    	registry.addResourceHandler("/insert_font/**").addResourceLocations(PATH + "insertroute/fonts/");
    	registry.addResourceHandler("/insert_js/**").addResourceLocations(PATH + "insertroute/js/");
		
		
		
		
	}

    /*<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
	        <!-- Example: a logical view name of 'showMessage' is mapped to '/WEB-INF/jsp/showMessage.jsp' -->
	        <property name="prefix" value="/WEB-INF/view/"/>
	        <property name="suffix" value=".jsp"/>
	</bean>*/

}
