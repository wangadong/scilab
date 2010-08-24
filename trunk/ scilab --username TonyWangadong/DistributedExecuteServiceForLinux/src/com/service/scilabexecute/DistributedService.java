package com.service.scilabexecute;

/**
 * Axis2 WebService<br>
 * Scilab分布式节点计算服务
 * 
 * @author wangadong
 * @version 1.0
 * @see ScilabService
 */
public class DistributedService {
	/**
	 * 提交任务到任务队列
	 * 
	 * @param codes
	 *            scilab任务代码
	 * @param savePath
	 *            任务结果保存路径
	 * @param hostIP
	 *            服务器主机IP地址
	 * 
	 */
	public void submitTask(String codes, String savePath, String hostIP) {
		ScilabService.getInstance().submitTask(codes, savePath, hostIP);
	}

	/**
	 * 获取当前节点队列内任务数
	 * 
	 * @return int 任务数
	 */
	public int getTaskNum() {
		return ScilabService.getInstance().getTaskNum();
	}
}
