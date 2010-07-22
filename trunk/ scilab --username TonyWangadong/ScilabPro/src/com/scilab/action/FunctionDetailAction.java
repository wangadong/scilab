package com.scilab.action;

import java.util.Date;
import java.util.List;
//import org.hibernate.HibernateException;
//import org.hibernate.exception.DataException;

import com.scilab.dao.IBaseDao;
import com.scilab.dao.impl.BaseDao;

import com.scilab.pojo.FunctionInfo;


public class FunctionDetailAction extends BaseAction {

	/**
	 * 
	 */
	//private static final long serialVersionUID = -2802597147831438693L;
	private static FunctionInfo functionInfo;//=findById(tbl_function,long id)
	private static IBaseDao dao = new BaseDao();

        public FunctionInfo getFunctionInfo() {
        	return functionInfo;
        }
        public void setFunctionInfo(FunctionInfo functionInfo) {
        	this.functionInfo = functionInfo;
        }
   
        	
        public static List getAllFunctions()//throws HibernateException
        {   
        	String inputuserid="1";
        	int userid=Integer.parseInt(inputuserid);
        	return dao.getAllItems("from FunctionInfo f where f.userId=userid");
        	}
        public static FunctionInfo getFunInfoById(long id1){
        	functionInfo=(FunctionInfo)dao.findById(FunctionInfo.class,id1); 
        	return functionInfo;      	
        	
        }
        //测试方法
   /*     public static void main(String[]args){
        	List list=FunctionDetailAction.getAllFunctions();
        	if(!list.isEmpty()){
        		FunctionInfo finfo=(FunctionInfo)list.get(0);
        		System.out.println(finfo.getFunName());
        	}
        }
}
       
        String funname;
        String funcontent;
        String funhelp;
        String funexemple;
        Date savetime;
        String funstatue; 
        List list=FunctionDetailAction.getAllFunctions();
        public String execute(){
        	for(int i=0;i<list.size();i++)
           {        	    
        	    FunctionInfo finfo=(FunctionInfo)list.get(i);
        	    funname=finfo.getFunName();
        	    funcontent=finfo.getFunContent();
        	    funhelp=finfo.getFunHelp();
        	    funexemple=finfo.getFunExample();  
        	    savetime=finfo.getSaveTime();
        	 
        	   int m=finfo.getFunStatue();
        	   if(m==0)
        		    funstatue="未发布";
        		   else  {funstatue="已发布"; }  
             }
			return "success";  
        }
          
            
            public String getfunname(){
        		return funname;
        	};
        	 public String getfuncontent(){
         		return funcontent;
         	}; 
         	public String getfunhelp(){
        		return funhelp;
        	}; 
        	public String getfunexemple(){
        		return funexemple;
        	};
        	public Date getsavetime(){
        		return savetime;
        	}; 
           


        */
}