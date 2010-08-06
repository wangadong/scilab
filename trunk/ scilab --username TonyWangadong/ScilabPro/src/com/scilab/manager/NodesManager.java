package com.scilab.manager;

import java.io.*;
import java.util.*;
import org.dom4j.*;
import org.dom4j.io.*;

public class NodesManager {
	static Map<Integer, SciNode> nodesMap = new HashMap<Integer, SciNode>();
	public static Map<Integer, SciNode> getAllNodes() throws DocumentException {
		SAXReader reader = new SAXReader();
		Document document = reader.read(new File(Thread.currentThread().getContextClassLoader().getResource("").getFile()).getParent()+"\\NodesManager.xml");
		Element nodesinfo = document.getRootElement().element("NodesInfo");
		for (Iterator<?> it = nodesinfo.elementIterator(); it.hasNext();) {

			Element element = (Element) it.next();
			SciNode node = new SciNode(Integer.parseInt(element.attribute("ID")
					.getValue()), (String) element.attribute("NodeName")
					.getValue(), (String) element.attribute("IPAddress")
					.getValue(), Integer.parseInt(element.attribute(
					"CpuCoreNum").getValue()));
			nodesMap.put(node.getID(), node);
		}
		return nodesMap;
	}
	public static String getHostIP() throws DocumentException{
		SAXReader reader = new SAXReader();
		Document document = reader.read(new File(Thread.currentThread().getContextClassLoader().getResource("").getFile()).getParent()+"\\NodesManager.xml");
		String HostIP=document.getRootElement().element("HostIP").attributeValue("IPAddress");
		return HostIP;
	}
	public static int getNodesNum(){
		return nodesMap.size();
	}
}
