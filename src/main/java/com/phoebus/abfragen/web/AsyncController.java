package com.phoebus.abfragen.web;

import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AsyncController {

	@RequestMapping(value="/asyncTest") 
	public String asyncTest() {
		return "asyncTest";
	}
	
	@RequestMapping(value="/startAjax") 
	public @ResponseBody Callable<String> startAjax() throws InterruptedException, ExecutionException {
		
		System.out.println("Entering controller");
		
        Callable<String> asyncTask = new Callable<String>() {

			@Override
			public String call() throws Exception {
				return doSlowWork();
			}
        	
		};
		
		System.out.println("Leaving controller");
		
		return asyncTask;
	}
	
	// runs in background
	public String doSlowWork() throws InterruptedException {
		
		System.out.println("Starting slow work");
		Thread.sleep(2000);
		System.out.println("Finishing slow work");
		
		return "-result-";
	}
	
	@RequestMapping(value="/startAjax2") 
	public @ResponseBody CompletableFuture<String> startAjax2() throws InterruptedException, ExecutionException {
		
		System.out.println("Entering controller");
		
        CompletableFuture<String> result = getResult();
		
		System.out.println("Leaving controller");
		
		return result;
	}
	
	public CompletableFuture<String> getResult() {
		return CompletableFuture.supplyAsync(() -> {
			System.out.println("Starting hard work...");
			try { Thread.sleep(2000); } catch (Exception e) { e.printStackTrace(); }
			System.out.println("Finishing hard work...");
			return "hello completable future";
		});
	}
}
