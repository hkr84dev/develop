
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$gSCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path

$gPUB_KEY = ""
$gPRI_KEY = ""
$gAUTH_INFO = [Convert]:ToBase64String(
  [Text.Encoding]::ASCII.GetBytes(
    ("{0}:{1}" -f $PUB_KEY, $PRI_KEY)
  )
)
$gAUTH_HEADER = @{Authorization=("Basic {0}" -f $gAUTH_INFO)}

$gTODAY = Get-Date
$TIMESTAMP = (Get-Date).ToUniversalTime().ToString("r")
$gFIN_YEAR = $gTODAY,AddMonths(-3).ToString("yyyy")
[int]$OFFCET = ([DayOfWeek]::Monday - $gTODAY.DayOfWeek)
if ($OFFCET -gt 0) {
  $OFFCET = -6
}

function createHashKey ($ENDPOINT,$TIMESTAMP) {
  $NEW_DATA = ""
  $KEY  = [System.Text.Encoding]::UTF8.GetBytes($gPRI_KEY)
  $BASE = [System.Text.Encoding]::UTF8.GetBytes($gNEWDATA)
  $HMAC = New-Object System.Security.Cryptography.HMACSHA256
  $HMAC_KEY = $KEY
  $HASHED = $HMAC.ComputeHash($BASE)
  $HMAC.Dispose()
  
  foreach($H_BYTE in $HASHED){
    $HEX_DIGEST += $H_BYTE.ToString("x2")
  }

  Return $HEX_DIGEST  
}