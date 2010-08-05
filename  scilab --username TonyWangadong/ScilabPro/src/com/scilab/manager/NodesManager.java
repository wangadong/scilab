package com.scilab.manager;

import java.io.*;
import java.util.*;
import org.dom4j.*;
import org.dom4j.io.*;

public class NodesManager {
	public static Map<Integer, SciNode> getAllNodes() throws DocumentException {
		SAXReader reader = new SAXReader();
		Document document = reader.read(new File("src\\NodesManager.xml"));
		Element rootElm = document.getRootElement();

		Map<Integer, SciNode> nodesMap = new HashMap<Integer, SciNode>();
		for (Iterator it = rootElm.elementIterator(); it.hasNext();) {

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
}
