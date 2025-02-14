# Guest Account Management for Azure AD

This repository contains a PowerShell script for automating guest account creation in Azure AD via an Enterprise Application. The solution includes guest invite tracking, SharePoint integration for request management, and automated email notifications.

## Features
- ✅ Automated guest user invitation via Azure AD Enterprise Application.  
- 📊 SharePoint-based tracking for invite approval status.  
- 📧 Email notifications for invite acceptance, expiration, and reminders.  
- 🖥️ Front-end interface for request submission and tracking.  
- ⏳ Auto-expiration of pending invites after **7 days**.  

---

## Prerequisites  
Ensure you have the following before setting up:
- An **Azure AD tenant** with permissions to create guest users.
- A **registered Enterprise Application** in Azure AD.
- **PowerShell 7+** installed on your local machine.
- **Microsoft Graph API permissions** for managing guest users.
- A **configured SharePoint List** for tracking guest requests.

---

## Setup Instructions  

### 1️⃣ Clone the Repository  
```sh
git clone https://github.com/yourusername/guest-account-automation.git
cd guest-account-automation


## 2️⃣ Configure Azure AD Application  

1. Register a **new Enterprise Application** in **Azure AD**.  
2. Assign the following **Microsoft Graph API permissions**:  

   - `User.Invite.All`  
   - `User.ReadWrite.All`  
   - `Directory.Read.All`  

3. **Create a client secret** and note the following values:  

   - **Application (client) ID**  
   - **Directory (tenant) ID**  
   - **Client Secret**  

4. Grant **Admin Consent** for the application.  

---

## 3️⃣ Set Up SharePoint List  

Create a **new list** in **SharePoint Online** and add the following columns:  

| Column Name      | Type                                         |
|------------------|---------------------------------------------|
| **Guest Email**  | Single line of text                        |
| **Status**       | Choice: Pending, Accepted, Expired, Cancelled |
| **Request Date** | Date & Time                                 |

---

## 4️⃣ Configure Environment Variables  

Set up environment variables by adding them to a `.env` file or your PowerShell session:  

```powershell
$env:AZURE_TENANT_ID = "your-tenant-id"
$env:AZURE_CLIENT_ID = "your-client-id"
$env:AZURE_CLIENT_SECRET = "your-client-secret"
$env:SHAREPOINT_SITE_URL = "https://yourtenant.sharepoint.com/sites/guest-tracking"

## 5️⃣ Run the Script
Execute the script to invite a guest user:

```powershell
.\invite-guest.ps1 -GuestEmail "guest@example.com"

## 6️⃣ Automate with Azure Function or Logic App (Optional)
To run the script automatically:

- Deploy it as an Azure Function using a PowerShell runtime.
- Trigger execution based on new SharePoint requests.
- Use Logic Apps for approval workflows.

## 🛠 Troubleshooting
- 🔹 Ensure the Azure AD app has admin consent.
- 🔹 Check PowerShell execution policies if scripts don’t run.
- 🔹 Verify SharePoint API permissions if data isn’t updating.

## 🤝 Contributing
Feel free to fork the repo and submit pull requests for improvements.

## 📜 License
This project is licensed under the MIT License.
