package com.scilab.manager;

public class SciNode implements Comparable<SciNode> {
	private int ID;
	private String NodeName;
	private String IPAddress;
	private int CpuCoreNum;
	private int TaskNumCnt;
	private float MainFrequence;
	private float NodePriorityValue;

	public SciNode(int ID, String NodeName, String IPAddress, int CpuCoreNum ,float MainFrequence) {
		this.ID = ID;
		this.NodeName = NodeName;
		this.IPAddress = IPAddress;
		this.CpuCoreNum = CpuCoreNum;
		this.MainFrequence=MainFrequence;
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

	public void plusTaskCnt() {
		TaskNumCnt++;
	}

	public void minusTaskCnt() {
		if (TaskNumCnt != 0)
			TaskNumCnt--;
	}

	public void setTaskNumCnt(int taskNumCnt) {
		TaskNumCnt = taskNumCnt;
	}

	public float getNodePriorityValue() {
		if(TaskNumCnt!=0)
		NodePriorityValue=CpuCoreNum*MainFrequence/TaskNumCnt;
		else
			NodePriorityValue=CpuCoreNum*MainFrequence/(float)0.5;
		return NodePriorityValue;
	}

	public void setNodePriorityValue(long nodePriorityValue) {
		NodePriorityValue = nodePriorityValue;
	}

	public void setMainFrequence(float mainFrequence) {
		MainFrequence = mainFrequence;
	}

	public float getMainFrequence() {
		return MainFrequence;
	}

	public int compareTo(SciNode o) {
		float arg0 = this.getNodePriorityValue();
		float arg1 = o.getNodePriorityValue();
		if (arg0 > arg1) {
			return -1;
		} else if (arg0 == arg1) {
			return 0;
		} else {
			return 1;
		}

	}
}