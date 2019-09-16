package dto;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {
	private MultipartFile filename;
	private String upload;
	public FileDTO() {
		// TODO Auto-generated constructor stub
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}
}
