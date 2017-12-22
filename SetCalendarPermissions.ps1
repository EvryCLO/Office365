$allmailbox = Get-Mailbox -Resultsize Unlimited
 
Foreach ($Mailbox in $allmailbox)
{
    $path = $Mailbox.alias + ":\" + (Get-MailboxFolderStatistics $Mailbox.alias | Where-Object { $_.Foldertype -eq "Calendar" } | Select-Object -First 1).Name
    Set-mailboxfolderpermission –identity ($path) –user Default –Accessrights Reviewer
}
