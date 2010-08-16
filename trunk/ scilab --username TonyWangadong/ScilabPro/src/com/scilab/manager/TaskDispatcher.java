package com.scilab.manager;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Map;

import org.dom4j.DocumentException;

public class TaskDispatcher extends Thread {
	private static final TaskDispatcher _INSTANCE = new TaskDispatcher();
	private static int NodesCnt = 0;
	private static Map<Integer, SciNode> nodesMap;
	private static LinkedList<SciNode> nodelist = new LinkedList<SciNode>();

	public synchronized static TaskDispatcher getInstance() {
		return _INSTANCE;
	}

	public TaskDispatcher() {
		try {
			nodesMap = NodesManager.getAllNodes();
		} catch (DocumentException e) {
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

	public SciNode getCurrentNode() {
		//if (nodelist.isEmpty()) {
			System.out.println("nodecount" + NodesCnt);
			Collection<SciNode> list = nodesMap.values();
			System.out.println(list);
			nodelist.addAll(list);
			Collections.sort(nodelist);
		//}
		return nodelist.pop();

	}

	@Override
	public void run() {
		super.run();
	}

}
