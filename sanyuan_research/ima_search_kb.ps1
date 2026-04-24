$creds = & "D:/QQBrowser/QClaw/resources/openclaw/config/skills/ima/get-token.ps1" | ConvertFrom-Json
$headers = @{
    "ima-openapi-clientid" = $creds.client_id
    "ima-openapi-apikey"   = $creds.api_key
    "Content-Type" = "application/json"
}
$body = @{
    query = ""
    cursor = ""
    limit = 20
} | ConvertTo-Json -Depth 5

$utf8Bytes = [System.Text.Encoding]::UTF8.GetBytes($body)
$result = Invoke-RestMethod -Uri "https://ima.qq.com/openapi/wiki/v1/search_knowledge_base" `
    -Method Post -Headers $headers `
    -Body $utf8Bytes -ContentType "application/json; charset=utf-8"
$result | ConvertTo-Json -Depth 20
