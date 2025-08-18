function Get-Choco-PackageNames
{
    $items =
    #"dbforge-sql-studio",
    #"dbforge-sql-doc",
    #"dbforge-mysql-studio-pro",
    #"sql-server-management-studio",
    #"linqpad5",
    #"linqpad",
    "html-help-workshop",
    #"ozcode",
    #"powerautomatedesktop",
    "winaero-tweaker",
    "databasenet"
    #"tortoisegit",
    #"wox",
    #"everything",
    #"7zip",
    #"drawio"
    #"powertoys"
    #"snagit",
    #"Camtasia",
    ;

}

function Get-Winget-PackageNames
{
    $items =
    #"Git.Git",
    #"Docker.DockerDesktop",
	"Microsoft.DotNet.SDK.9",
	"Microsoft.DotNet.SDK.8",
    "Microsoft.DotNet.SDK.7",
    "Microsoft.DotNet.SDK.6",
    "Microsoft.DotNet.SDK.5",
    "Microsoft.DotNet.SDK.3_1",
    "Microsoft.DotNet.Framework.DeveloperPack_4",
    #"Microsoft.VisualStudioCode",
    #"RicoSuter.NSwagStudio",
    #"Amazon.SAM-CLI",
    #"Google.CloudSDK",
    #"LINQPad.LINQPad.8",
    #"LINQPad.LINQPad.7",
    #"LINQPad.LINQPad.6",
    #"LINQPad.LINQPad.5",
    "Microsoft.SQLServerManagementStudio",
    "7zip.7zip",
    "voidtools.Everything",
    #"Microsoft.WindowsTerminal",
    "Microsoft.PowerAutomateDesktop",
    "TortoiseGit.TortoiseGit",
    "Microsoft.PowerToys",
    #"Microsoft.Edge",
    "JGraph.Draw",
	#"Docker.DockerCompose",
	#"Docker.DockerCLI"
    #"TechSmith.Snagit.2021"
    ;
    return $items;
}

function Get-Scoop-PackageNames
{
    $items =
    "aria2",
    "scoop-search",
    "nodejs-lts",
    #"jetbrains-toolbox",
	"rider",
	"dotmemory",
	"dottrace",
	"DataGrip",
	"goland",
	#"git",
    "forcoop",
	"powershell",
    "task",
    "make",
    #"adoptopenjdk11-openj9", # 11.0.12-7-0.27.0 約198M	
    #"adoptopenjdk16-openj9", # 16.0.2-7-0.27.0 約198M
    "openjdk",
    "python",
    "dbeaver",
    "tableplus",
    "sqlitebrowser",
    "sql-workbench",
    "keystore-explorer",
    "openssl",
    "openvpn",
    "curl",
    "wireshark",
    "sysinternals",
    "typora",
    "markdown-monster",
    "firefox",
    #"microsoft-edge",
    "vivaldi",
    "brave",
    "googlechrome",
    "notepadplusplus",
    "teamviewer",
	"vscode",
    "microsoft-teams",
    #"line"
    "slack",
    "telegram",
    "wox",
    #"everything",需要管理員權限
    #"powertoys",
    "carnac",
    #"7zip",需要檔案總管需要右鍵,需要管理員權限
    "anydesk",
    #"drawio",
    "paint.net",
    "foxit-reader",
    "ditto",
    "windterm",
    "nswagstudio",
    "ilspy",
    "dnspy",
    "apifox",
    #"tortoisegit",
    "fork",
    "sourcetree",
    "obsidian",
    "neovim",
    "allure",
    "jmeter",
    "vifm",
    "vim",
    "podman",
    "putty",
    "nvm",
    "wget",
    "dark",
    "nushell",
    "cmder",
    "windows-terminal",
    "windterm" # 跨平台 ssh 終端機
    "winscp" # 跨平台 SFTP 用戶端,
    "jq",
	"wise-disk-cleaner",
	"treesize-free",
	"uuidgen",
	"linqpad",
	"warp-terminal",
	"k6",
	"docker",
	"docker-compose"
    ;
    return $items;
}

function Get-Scoop-Default-Buckets
{
    $items =
    "main",
    "extras",
    "versions",
    "main",
    "extras",
    "nirsoft",
    "sysinternals",
    "php",
    "nerd-fonts",
    "nonportable",
    "java",
    "games"
    ;
    return $items;
}

function Install-Scoop
{
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser;
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

function Install-Scoop-Buckets
{
    $bucketNams = Get-Scoop-Default-Buckets;
    foreach ($item in $bucketNams)
    {
        scoop bucket rm $item;
        scoop bucket add $item;
    }
    scoop bucket rm apps;
    scoop bucket add apps https://github.com/kkzzhizhou/scoop-apps;

    scoop bucket rm jetbrains;
    scoop bucket add jetbrains https://github.com/Ash258/Scoop-JetBrains;

    scoop bucket rm dorado;
    scoop bucket add dorado https://github.com/h404bi/dorado;
	
	scoop bucket rm awesome;
	scoop bucket add awesome https://github.com/tapannallan/awesome-scoop
}

function Install-Scoop-Packages
{
    $PackageNames = Get-Scoop-PackageNames;
    foreach ($item in $PackageNames)
    {
        try
        {
            Write-Host scoop install $item;
            scoop install $item;
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message;
            $FailedItem = $_.Exception.ItemName;
            Write-Host $ErrorMessage + $FailedItem;
        }
    }
}

function Update-Scoop-Packages
{
    $PackageNames = Get-Scoop-PackageNames;
    foreach ($item in $PackageNames)
    {
        try
        {
            Write-Host scoop update $item;
            scoop update $item;
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message;
            $FailedItem = $_.Exception.ItemName;
            Write-Host $ErrorMessage + $FailedItem;
        }
    }
}

function Install-Winget-Packages
{
    $PackageNames = Get-Winget-PackageNames;
    foreach ($item in $PackageNames)
    {
        try
        {
            Write-Host winget install $item --accept-package-agreements --accept-source-agreements;
            winget install $item --accept-package-agreements --accept-source-agreements
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message;
            $FailedItem = $_.Exception.ItemName;
            Write-Host $ErrorMessage + $FailedItem;
        }
    }
}

function Update-Winget-Packages
{
    winget install gerardog.gsudo
    gsudo winget upgrade --all
}

function Install-Choco-Packages
{
    $PackageNames = Get-Choco-PackageNames;
    foreach ($item in $PackageNames)
    {
        try
        {
            Write-Host choco install --yes $item;
            choco install --yes $item;
        }
        catch
        {
            $ErrorMessage = $_.Exception.Message;
            $FailedItem = $_.Exception.ItemName;
            Write-Host $ErrorMessage + $FailedItem;
        }
    }
}

function Update-Choco-Packages
{
    choco upgrade all --yes
}

function Say
{
    Write-Host "Hello, World!";
}