package com.scilab.manager;

public class SciNode {
	private int ID;
	private String NodeName;
	private String IPAddress;
	private int CpuCoreNum;
	private int TaskNumCnt;
	private long NodePriorityValue;

	public SciNode(int ID, String NodeName, String IPAddress, int CpuCoreNum) {
		this.ID = ID;
		this.NodeName = NodeName;
		this.IPAddress = IPAddress;
		this.CpuCoreNum = CpuCoreNum;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getNodeName() {
		return NodeName;
	}

	public void setNodeName(String nodeName) {
		NodeName = nodeName;
	}

	public String getIPAddress() {
		return IPAddress;
	}

	public void setIPAddress(String iPAddress) {
		IPAddress = iPAddress;
	}

	public int getCpuCoreNum() {
		return CpuCoreNum;
	}

	public void setCpuCoreNum(int cpuCoreNum) {
		CpuCoreNum = cpuCoreNum;
	}

	public int getTaskNumCnt() {
		return TaskNumCnt;
	}
	public void plusTaskCnt(){
		TaskNumCnt++;
	}
	public void minusTaskCnt(){
		if(TaskNumCnt!=0)
			TaskNumCnt--;
	}
	public void setTaskNumCnt(int taskNumCnt) {
		TaskNumCnt = taskNumCnt;
	}

	public long getNodePriorityValue() {
		return NodePriorityValue;
	}

	public void setNodePriorityValue(long nodePriorityValue) {
		NodePriorityValue = nodePriorityValue;
	}
}