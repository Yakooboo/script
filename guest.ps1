# Conectar a Microsoft Graph con autenticación interactiva y permisos extendidos
Connect-MgGraph -Scopes "User.Invite.All", "Mail.Send", "User.Read", "User.ReadWrite.All"

Write-Output "✅ Conectado correctamente a Microsoft Graph"

# Configuration
$guestEmail = "giacomoleto@pagegroup.eu"
$senderEmail = (Get-MgUser -UserId "me").Mail  # Retrieves the logged-in user's email

Write-Output "📤 Sending invitation from: $senderEmail"

# Create guest user invitation WITHOUT sending Microsoft email
$invitationBody = @{
    invitedUserEmailAddress = $guestEmail
    inviteRedirectUrl = "https://myapps.microsoft.com"
    sendInvitationMessage = $false  # Disable Microsoft's automatic email
} | ConvertTo-Json -Depth 4

# Send the invitation
try {
    $inviteResponse = Invoke-MgGraphRequest -Method Post -Uri "https://graph.microsoft.com/v1.0/invitations" -Body $invitationBody
    Write-Host "✅ Guest user invited successfully!"
} catch {
    Write-Error "❌ ERROR: Failed to create guest invitation: $_"
    exit
}
# Send a custom email from the authenticated user
$emailBody = @{
    message = @{
        subject = "You've been invited to our organization!"
        body = @{
            contentType = "HTML"
            content = "<p>Hello,</p><p>You have been invited to our organization. Click <a href='https://myapps.microsoft.com'>here</a> to accept the invitation.</p>"
        }
        toRecipients = @(@{emailAddress = @{address = $guestEmail}})
    }
} | ConvertTo-Json -Depth 4

try {
    Send-MgUserMail -UserId $senderEmail -BodyParameter $emailBody
    Write-Host "📧 Custom invitation email sent from $senderEmail to $guestEmail"
} catch {
    Write-Error "❌ ERROR: Failed to send custom email: $_"
}

# Desconectar de Microsoft Graph
Disconnect-MgGraph
Write-Host "🔌 Desconectado de Microsoft Graph"
