package files

import (
	"fmt"
	"mime/multipart"
	"net/http"
	"os"
)

// 返回值说明：
//	7z、exe、doc 类型会返回 application/octet-stream  未知的文件类型
//	jpg	=>	image/jpeg
//	png	=>	image/png
//	ico	=>	image/x-icon
//	bmp	=>	image/bmp
//  xlsx、docx 、zip	=>	application/zip
//  tar.gz	=>	application/x-gzip
//  txt、json、log等文本文件	=>	text/plain; charset=utf-8   备注：就算txt是gbk、ansi编码，也会识别为utf-8

// GetFilesMimeByFileName 通过文件名获取文件mime信息
func GetFilesMimeByFileName(filepath string) string {
	f, err := os.Open(filepath)
	if err != nil {
		fmt.Println(err)
	}
	defer func(f *os.File) {
		err := f.Close()
		if err != nil {

		}
	}(f)

	// 只需要前 32 个字节就可以了
	buffer := make([]byte, 32)
	if _, err := f.Read(buffer); err != nil {
		return ""
	}

	return http.DetectContentType(buffer)
}

// GetFilesMimeByFp 通过文件指针获取文件mime信息
func GetFilesMimeByFp(fp multipart.File) string {

	buffer := make([]byte, 32)
	if _, err := fp.Read(buffer); err != nil {

		return ""
	}

	return http.DetectContentType(buffer)
}
