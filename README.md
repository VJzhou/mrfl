一个简单的RF测试库

## 安装robotframework
    pip install robotframework


## 安装库相关依赖库
1. 安装requests    
    
    ```pip install robotframework-requests```

2. 安装数据库依赖
    
    `pip install robotframework-databaselibrary`

3. web 自动化依赖库
    
    `pip install robotframework-selenium2library`
    
    下载浏览器驱动,选择对应的chrome版本[http://npm.taobao.org/mirrors/chromedriver]
    
    解压安压缩包
    unzip 
    
    将可执行文件移动到可执行文件夹
    
    `mv  chromedriver  /usr/bin`
    
    添加执行权限 
     
    `chmod +x  chromedriver`
    
    测试能否打开chrome , 如果安装了多个python 版本,需要指定安装了依赖库的python可执行程序执行
    
    from selenium import webdriver
    driver = webdriver.Chrome()
    
    若找不到对应的版本,可下载相近版本驱动
    94.0.4606.81  --64   下载的驱动 94.0.4606.61
    
    