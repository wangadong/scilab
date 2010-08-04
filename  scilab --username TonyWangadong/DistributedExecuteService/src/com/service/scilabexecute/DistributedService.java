package com.service.scilabexecute;

public class DistributedService {
	public void submitTask(String codes, String savePath, String hostIP){
		ScilabService.getInstance().submitTask(codes, savePath, hostIP);
	}
	public int getTaskNum(){
		return ScilabService.getInstance().getTaskNum();
	}
}
