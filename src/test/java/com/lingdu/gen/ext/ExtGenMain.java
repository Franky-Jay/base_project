package com.lingdu.gen.ext;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class ExtGenMain {
	// 常量
	public static final String javapkgSuffix_service = "/service/";
	public static final String javapkgSuffix_controller = "/controller/";
	public static final String Java_Type_Service = "Service";
	public static final String Java_Type_ServiceImp = "ServiceImp";
	public static final String Java_Type_Controller = "Controller";
	
	public static final String Page_Type_List = "list";
	public static final String Page_Type_Edit = "edit";
	
	
	// 变量
	private Map<String, Object> javaDataMap = new HashMap<String, Object>();
	private Map<String, Object> pageDataMap = new HashMap<String, Object>();
	private List<String> excludfields=new ArrayList<String>();
	private String javaPkgPrefix;
	private String pagePrefix;
	private String domainName;
	private String groupid;
	private String domainclass;

	public static void main(String[] args) throws Throwable {
		ExtGenMain extGen = new ExtGenMain();
		extGen.setDomainName("Menu");///TODO domian名字,首字母大写
		extGen.setGroupid("com.base");///TODO 包名
		
		//生成java类
		extGen.setJavaPkgPrefix("/src/main/java/com/base/");///TODO java类
		extGen.createJavaFile(javapkgSuffix_service, Java_Type_Service);
		extGen.createJavaFile(javapkgSuffix_service, Java_Type_ServiceImp);
		extGen.createJavaFile(javapkgSuffix_controller, Java_Type_Controller);
		//生成页面
		extGen.setPagePrefix("/src/main/webapp/WEB-INF/pages/");
		extGen.setDomainclass("com.base.menu.domain.MenuVO");//TODO domain全路径
		extGen.createPageFile(Page_Type_List);
		extGen.createPageFile(Page_Type_Edit);

	}

	public void createJavaFile(String javapkgSuffix, String javaType)
			throws Throwable {
		StringBuilder savepath = new StringBuilder(getProject());
		savepath.append(javaPkgPrefix).append(domainName.toLowerCase())
				.append(javapkgSuffix);
		File saveFile = new File(savepath.toString());
		saveFile.mkdirs();
		savepath.append(domainName).append(javaType).append(".java");
		System.out.println("savepath:" + savepath);
		Template template = config.getTemplate(javaType);
		Writer writer = new OutputStreamWriter(new FileOutputStream(
				savepath.toString()), "UTF-8");
		try {
			template.process(javaDataMap, writer);
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				writer.close();
			}
		}
	}
	
	public void createPageFile(String pageType)
			throws Throwable {
		beforeCreatePage();
		StringBuilder savepath = new StringBuilder(getProject());
		savepath.append(this.pagePrefix).append(domainName.toLowerCase())
				.append("/");
		File saveFile = new File(savepath.toString());
		saveFile.mkdirs();
		savepath.append(pageType).append(".jsp");
		System.out.println("savepath:" + savepath);
		Template template = config.getTemplate(pageType);
		Writer writer = new OutputStreamWriter(new FileOutputStream(
				savepath.toString()), "UTF-8");
		try {
			template.process(pageDataMap, writer);
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				writer.close();
			}
		}
	}
	
	private void beforeCreatePage(){
		pageDataMap.put("path","${path }");
		pageDataMap.put("entityid","${entity.id }");
		pageDataMap.put("controller",new StringBuilder(this.groupid).append(".")
				.append(this.domainName.toLowerCase()).append(".")
				.append(Java_Type_Controller.toLowerCase()).append(".")
				.append(this.domainName).append(Java_Type_Controller).toString());
		
	}

	private final Configuration config = new Configuration(
			Configuration.VERSION_2_3_26);

	public String getPagePrefix() {
		return pagePrefix;
	}

	public void setPagePrefix(String pagePrefix) {
		this.pagePrefix = pagePrefix;
	}
	
	public String getDomainclass() {
		return domainclass;
	}

	public void setDomainclass(String domainclass) {
		this.domainclass = domainclass;
		try {
			Class<?> domainClassObject=Class.forName(domainclass);
			Field[] fields=domainClassObject.getDeclaredFields();
			List<String> fieldList=new ArrayList<String>();
			for(Field field : fields){
				if(!this.excludfields.contains(field.getName())){
					fieldList.add(field.getName());
				}
			}
			pageDataMap.put("fieldList", fieldList);
			pageDataMap.put("fieldsize", fieldList.size());
			System.out.println("fieldList:"+fieldList);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public String getDomainName() {
		return domainName;
	}

	public void setDomainName(String domainName) {
		this.domainName = domainName;
		javaDataMap.put("domainName", domainName);
		pageDataMap.put("domainName", domainName);
	}

	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
		javaDataMap.put("groupid", groupid);
	}

	public String getJavaPkgPrefix() {
		return javaPkgPrefix;
	}

	public void setJavaPkgPrefix(String javaPkgPrefix) {
		this.javaPkgPrefix = javaPkgPrefix;
	}

	public ExtGenMain() {
		this.init();
	}

	private String getProject() {
		String projectpath = System.getProperty("user.dir");
		return projectpath.replaceAll("\\\\", "/");
	}

	private void init() {
		config.setLocale(Locale.CHINA);
		config.setDefaultEncoding("utf-8");
		config.setEncoding(Locale.CHINA, "utf-8");
		config.setClassForTemplateLoading(ExtGenMain.class, "");
		excludfields.add("serialVersionUID");
		excludfields.add("ctime");
		excludfields.add("lastmodifytime");
		excludfields.add("creatorDepartmentId");
		excludfields.add("creatorUserId");
		
	}

}
