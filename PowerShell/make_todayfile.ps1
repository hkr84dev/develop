# 本日の日付を取得
$date = Get-Date -Format "yyyyMMdd"

# フォルダ名とファイル名を作成
$folder_name = $date
$file_name = $date + ".txt"

# フォルダを作成
New-Item -ItemType Directory -Path .\$folder_name

# ファイルを作成
New-Item -ItemType File -Path .\$folder_name\$file_name