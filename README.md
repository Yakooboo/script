Guest Account Management for Azure AD

This repository contains a PowerShell script for automating guest account creation in Azure AD via an Enterprise Application. The solution includes guest invite tracking, SharePoint integration for request management, and automated email notifications.

Features

Automated guest user invitation via Azure AD Enterprise Application.

SharePoint-based tracking for invite approval status.

Email notifications for invite acceptance, expiration, and reminders.

Front-end interface for request submission and tracking.

Auto-expiration of pending invites after 7 days.

Prerequisites

Ensure you have the following before setting up:

An Azure AD tenant with permissions to create guest users.

A registered Enterprise Application in Azure AD.

PowerShell 7+ installed on your local machine.

Microsoft Graph API permissions for managing guest users.

A configured SharePoint List for tracking guest requests.

Setup Instructions

1. Clone the Repository

git clone https://github.com/yourusername/guest-account-automation.git
cd guest-account-automation

2. Configure Azure AD Application

Register a new Enterprise Application in Azure AD.

Assign User.Invite.All, User.ReadWrite.All, and Directory.Read.All API permissions.
![image](https://github.com/user-attachments/assets/89f4f3d6-1d00-417b-95a7-ca511ee9e46b)

Create a client secret and note the Application (client) ID, Directory (tenant) ID, and Client Secret.

Grant admin consent for the application.

3. Set Up SharePoint List

Create a new list in SharePoint Online.

Add columns:

Guest Email (Single line of text)

Status (Choice: Pending, Accepted, Expired, Cancelled)

Request Date (Date & Time)

4. Configure Environment Variables

Update your PowerShell environment with the required variables:

$env:AZURE_TENANT_ID = "your-tenant-id"
$env:AZURE_CLIENT_ID = "your-client-id"
$env:AZURE_CLIENT_SECRET = "your-client-secret"
$env:SHAREPOINT_SITE_URL = "https://yourtenant.sharepoint.com/sites/guest-tracking"

5. Run the Script

Execute the script to invite a guest user:

.\invite-guest.ps1 -GuestEmail "guest@example.com"

6. Automate with Azure Function or Logic App (Optional)

To run the script automatically:

Deploy it as an Azure Function using a PowerShell runtime.

Trigger execution based on new SharePoint requests.

Use Logic Apps for approval workflows.

Troubleshooting

Ensure the Azure AD app has admin consent.

Check PowerShell execution policies if scripts don’t run.

Verify SharePoint API permissions if data isn’t updating.

Contributing

Feel free to fork the repo and submit pull requests for improvements.

License

This project is licensed under the MIT License.
