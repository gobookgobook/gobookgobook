package com.gobook.aop;

import java.util.logging.Logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class GoBookAspect {
	public static Logger logger=Logger.getLogger(GoBookAspect.class.getName());
	
	public static final String logMsg="logMsg-------------";
	
	@Around("within(com.gobook..*)")
	public Object advice(ProceedingJoinPoint joinPoint){
		Object obj=null;
		
		try{
			logger.info(logMsg+joinPoint.getTarget().getClass().getName() + "\t" + joinPoint.getSignature().getName());
			obj=joinPoint.proceed();
		}catch(Throwable e){
			e.printStackTrace();
		}
		
		return obj;
	}
}
