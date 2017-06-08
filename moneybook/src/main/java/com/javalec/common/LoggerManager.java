package com.javalec.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerManager {
	
	public LoggerManager() {
	}
	
	public static void getInfoLogger(Class<?> clazz , String message) {
		
		Logger logger = (Logger) LoggerFactory.getLogger(clazz.getClass());
		
		logger.info(message);
	}
	
}
