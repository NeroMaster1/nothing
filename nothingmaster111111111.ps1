# === CONFIG ===
$token   = "8279576875:AAGCH5LvylPPaUReAB9kcyZELGGTL9JZ5LU"
$chat_id = "8278886318"

# === GET PUBLIC IP ===
try {
    # Try IPv6 first
    $ip = Invoke-RestMethod -Uri "https://api64.ipify.org"
    $ipType = "IPv6"
}
catch {
    # Fallback to IPv4
    $ip = Invoke-RestMethod -Uri "https://api.ipify.org"
    $ipType = "IPv4"
}

# === MESSAGE ===
$payload = @{
    chat_id = $chat_id
    text    = "Public IP ($ipType): $ip"
}

# === SEND TO TELEGRAM ===
Invoke-RestMethod `
    -Uri "https://api.telegram.org/bot$token/sendMessage" `
    -Method Post `
    -ContentType "application/json" `
    -Body ($payload | ConvertTo-Json -Compress)
