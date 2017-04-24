package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@Namespace("/upload")
@ResultPath("/")
public class FileUploadAction extends ActionSupport{
	private List<File>uploads=new ArrayList<File>();
	private List<String>uploadsFileName=new ArrayList<String>();
	private List<String>uploadsContentType=new ArrayList<String>();
	private String desc="";

	@Action(value="multiUploadFile",results={@Result(name="success",location="success.jsp"),
			@Result(name="input",location="error.jsp")},
			interceptorRefs={@InterceptorRef(params={"allowedTypes","image/jpeg,application/zip","maximumSize","1000000"},value="fileUpload"),
			@InterceptorRef("defaultStack"),
			@InterceptorRef("validation")
	}
	)
	public String multiUploadFile(){
		int i=0;
		for(File file: uploads){
			FileInputStream fin;
			try {
				fin = new FileInputStream(file);
				String fileName=uploadsFileName.get(i);
				String contentType=uploadsContentType.get(i);
				FileOutputStream fout=new FileOutputStream("F:/Nikhil"+fileName);
				byte b[]=new byte[1024];
				while((fin.read())!=-1){
					fout.write(b);
				}
				desc+=fileName+"";
				fout.close();
				fin.close();
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			i++;
		}
		return SUCCESS;
	}

	public List<File> getUploads() {
		return uploads;
	}

	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}

	public List<String> getUploadsFileName() {
		return uploadsFileName;
	}

	public void setUploadsFileName(List<String> uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}

	public List<String> getUploadsContentType() {
		return uploadsContentType;
	}

	public void setUploadsContentType(List<String> uploadsContentType) {
		this.uploadsContentType = uploadsContentType;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
