# Powershell
## 載入腳本

```
#下載腳本
$url = "https://raw.githubusercontent.com/yaochangyu/windows-soft-package/main/InstallPackage2.ps1"
$destination = "$HOME\InstallPackage2.ps1"  # 使用者個人資料夾的路徑

Invoke-WebRequest -Uri $url -OutFile $destination
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#載入腳本
. $destination

#執行函數
Say
```

上述語法貼到 Powershell，載入後就可以依照下列方法安裝

## 函數清單 
- Install-Scoop # 安裝 scoop
- Install-Scoop-Buckets # 安裝 scoop 的 bucket
- Get-Scoop-PackageNames # 列出套件
- Install-Scoop-Packages # 安裝套件
- Update-Scoop-Packages # 更新套件
- Get-Winget-PackageNames # 列出套件
## 需要管理員權限
- Install-Winget-Packages # 安裝套件
- Update-Winget-Packages # 更新套件

# 安裝 Scoop 以及相關軟體
```
Get-Scoop-PackageNames # 列出套件
```

安裝 bucket 和軟體
```
Install-Scoop 
Install-Scoop-Buckets 
Install-Scoop-Packages
```
# 用 Winget 安裝軟體
```
~~~~
```