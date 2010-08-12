package com.scilab.manager;

import java.util.Map;

import org.dom4j.DocumentException;

public class TaskDispatcher extends Thread {
	private static final TaskDispatcher _INSTANCE = new TaskDispatcher();
	private static int NodesCnt=0;
	private static Map<Integer, SciNode> nodesMap;
	public synchronized static TaskDispatcher getInstance() {
		return _INSTANCE;
	}
	public TaskDispatcher() {
		try {
			nodesMap = NodesManager.getAllNodes();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addTaskToNode(int NodeId) {
		if (nodesMap.containsKey(NodeId)) {
			SciNode tmpNode = nodesMap.get(NodeId);
			tmpNode.plusTaskCnt();
			nodesMap.put(NodeId, tmpNode);
		}
	}
	public void minusTaskToNode(int NodeId) {
		if (nodesMap.containsKey(NodeId)) {
			SciNode tmpNode = nodesMap.get(NodeId);
			System.out.println(tmpNode.getTaskNumCnt());
			tmpNode.minusTaskCnt();
			System.out.println(tmpNode.getTaskNumCnt());
			nodesMap.put(NodeId, tmpNode);
		}
	}
	public SciNode getCurrentNode(){
		System.out.println("nodecount"+NodesCnt);
		SciNode node=nodesMap.get(NodesCnt%nodesMap.size());
		NodesCnt++;
		System.out.println("nodecount"+NodesCnt);
		return node;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
	}

}
