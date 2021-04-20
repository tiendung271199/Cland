package edu.vinaenter.util;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import edu.vinaenter.constant.GlobalConstant;

public class FileUtil {

	// create method to upload file
	public static String uploadFile(MultipartFile multipartFile) {
		String fileName = GlobalConstant.EMPTY;
		if (!multipartFile.getOriginalFilename().equals(GlobalConstant.EMPTY)) {
			String pathProject = System.getenv(GlobalConstant.PATH_PROJECT);
			String dirPath = pathProject + File.separator + GlobalConstant.DIR_UPLOAD;
			File saveDir = new File(dirPath);
			if (!saveDir.exists()) {
				saveDir.mkdirs();
			}
			fileName = renameFile(multipartFile.getOriginalFilename());
			String filePath = dirPath + File.separator + fileName;
			try {
				multipartFile.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}
	
	// rename file
	public static String renameFile(String fileName) {
		if (!fileName.equals(GlobalConstant.EMPTY)) {
			StringBuilder bd = new StringBuilder();
			bd.append(FilenameUtils.getBaseName(fileName)).append("_").append(System.nanoTime()).append(".")
					.append(FilenameUtils.getExtension(fileName));
			return bd.toString();
		}
		return GlobalConstant.EMPTY;
	}
	
	// method delete file
	public static boolean deleteFile(String fileName) {
		String pathProject = System.getenv(GlobalConstant.PATH_PROJECT);
		String dirPath = pathProject + File.separator + GlobalConstant.DIR_UPLOAD;
		String filePath = dirPath + File.separator + fileName;
		File file = new File(filePath);
		return file.delete();
	}
	
}
