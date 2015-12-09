package com.phoebus.abfragen.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.phoebus.abfragen.utils.ExcelReportView;

@Configuration
@EnableWebMvc
@Import({WebSocketConfig.class, SecurityConfig.class})
@ComponentScan( {"com.phoebus.abfragen.web"})
public class WebConfig extends WebMvcConfigurerAdapter {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**") .addResourceLocations("/resources/");
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("login");
		registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
	};
	
	@Bean
	public ExcelReportView excelReportView() {
		return new ExcelReportView();
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tiles = new TilesConfigurer();
		tiles.setDefinitions(new String[] {
				"/WEB-INF/layout/tiles.xml"
		});
		tiles.setCheckRefresh(true);
		return tiles;
	}
	
	@Bean
	public ViewResolver viewResolver() {
		return new TilesViewResolver();
	}
	
}
