
# なーぜかTLSバージョン指定しないとアクセスできないエンドポイントがある（実はクライアント環境依存）。
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# GETはあんま難しくないはず。
$URI = "http://$Site/$Version/$Method"
$Redponse = Invoke-RestMethod -Method GET -Uri $URI
  -Headers @{
    'Some Request Key' = "$Key"
    'Content-Type'     = "application/json"
  }

# リクエストボディはAPIによって構造が異なるので注意する。
if ($Param1) {$Paramators.param1 = $Param1}
if ($Param2) {$Paramators.param2 = $Param2}
$Body = $Parametors | ConvertTo-Json



