/*package com.scilab.manager;

import java.util.concurrent.*;

public class Scheduler1 implements Runnable{
	private ExecutorService exec;
	private int cpuCoreNumber;
    public Scheduler1() {   
        cpuCoreNumber = Runtime.getRuntime().availableProcessors();   
        exec = Executors.newFixedThreadPool(cpuCoreNumber);   
    }
	@Override
	public void run() {
		while (!exec.isShutdown()) {
			while (!ScilabTaskHost.getInstance().getTaskList().isEmpty()) {
				Task1 currentTask = (Task1) ScilabTaskHost.getInstance().getTaskList()
						.pop();
				if (currentTask != null) {
					try {
						exec.submit(currentTask).get();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ExecutionException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}

				currentTask = null;
			}

		}
	} 
}
*/