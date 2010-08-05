package com.scilab.manager;

public class SciNode{
	private int ID;
	private String NodeName;
	private String IPAddress;
	private int CpuCoreNum;
	public SciNode(int ID,String NodeName,String IPAddress,int CpuCoreNum){
		this.ID=ID;
		this.NodeName=NodeName;
		this.IPAddress=IPAddress;
		this.CpuCoreNum=CpuCoreNum;
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
	
}