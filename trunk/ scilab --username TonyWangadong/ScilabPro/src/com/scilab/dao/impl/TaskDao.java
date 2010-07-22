package com.scilab.dao.impl;

import java.util.*;

import org.hibernate.Session;
import com.scilab.hibernate.HibernateSessionFactory;
import com.scilab.manager.Task;
import com.scilab.pojo.TaskInfo;

public class TaskDao extends BaseDao {
	public boolean saveOrUpdateTask(TaskInfo taskinfo) {
		if (saveOrUpdateObj(taskinfo)) {
			return true;
		} else
			return false;
	}

	public HashMap<String, Task> getAllTaskFromDB() {
		HashMap<String, Task> map =new HashMap<String, Task>();
		List tasklist = getAllItems("from TaskInfo task");
		Iterator it = tasklist.iterator();
		while (it.hasNext()) {
			TaskInfo taskinfo = (TaskInfo) it.next();
			Task task = new Task(taskinfo.getTaskName(), taskinfo
					.getTaskContent(), taskinfo.getUserId());
			map.put(task.getTaskQueryId(), task);
		}
		return map;

	}
	public boolean deleteAllMyTaskIdFromDB(long userId){
		List tasklist=getAllItems("from TaskInfo task where task.userId="+userId);
		Iterator it=tasklist.iterator();
		while(it.hasNext()){
			TaskInfo taskinfo=(TaskInfo)it.next();
			deleObj((TaskInfo)taskinfo);
		}
		Session session = null;
		session = HibernateSessionFactory.getSession();
		
		if(getAllItems("from TaskInfo task where task.userId="+userId).isEmpty())
			return true;
		else return false;
		
	}

	/*public static void main(String[] args) {
		TaskInfo taskinfo=new TaskInfo();
		taskinfo.setTaskName("taskName");
		taskinfo.setUserId((long)1);
		taskinfo.setTaskStatue(0);
		taskinfo.setTaskContent("dflksjlkdjf;alkdjf;alkjd");
		taskinfo.setResultFolder("dkjflkdsjfldksjf");
		taskinfo.setSaveTime(new Date());
		TaskDao dao=new TaskDao();
		dao.saveOrUpdateTask(taskinfo);
		HashMap map=new TaskDao().getAllTaskFromDB();
		System.out.println(map.isEmpty());
		System.out.println(dao.deleteAllMyTaskIdFromDB((long)1));
	}
*/
}
