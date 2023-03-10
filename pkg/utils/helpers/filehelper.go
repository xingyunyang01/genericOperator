package helpers

import (
	"io/ioutil"
	"os"
)

func MustLoadFile(path string) []byte {
	b, err := LoadFile(path)
	if err != nil {
		panic(err)
	}
	return b
}
func FileIsExist(file string) bool {
	_, err := os.Stat(file)
	if os.IsNotExist(err) {
		return false
	}
	return true

}

// 判断文件是否必须存在，不存在会panic
func MustFileExists(file string) {
	_, err := os.Stat(file)

	if os.IsNotExist(err) {
		panic("文件:" + file + "不存在")
	}

}

// 加载指定目录的文件, 全部取出内容
func LoadFile(path string) ([]byte, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	b, err := ioutil.ReadAll(f)
	if err != nil {
		return nil, err
	}
	return b, err
}
func CurrentBinPath() {

}
