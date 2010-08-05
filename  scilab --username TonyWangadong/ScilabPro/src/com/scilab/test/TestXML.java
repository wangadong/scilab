package com.scilab.test;

import java.util.Map;

import org.dom4j.DocumentException;

import com.scilab.manager.NodesManager;
import com.scilab.manager.SciNode;

public class TestXML {
	public static void main(String[] args) throws DocumentException {
		Map<Integer,SciNode> nodesMap=NodesManager.getAllNodes();
		System.out.println(nodesMap.get(1).getID());
		System.out.println(nodesMap.get(2).getIPAddress());
		System.out.println(NodesManager.getHostIP());
		if(NodesManager.getHostIP()=="")
			System.out.println("hahaha");
		System.out.println(NodesManager.getNodesNum());
		
	}
}
