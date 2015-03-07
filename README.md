# What?
If you use [SourceTree](http://www.sourcetreeapp.com/) on Windows and you have a lot of repositories then you've probably been annoyed by the fact that there's no way to search your bookmarks or automatically arrange them alphabetically.

This feature has been requested many times:

* https://answers.atlassian.com/questions/214099/is-it-possible-to-sort-repositories-alphabetically-in-the-repositories-list
* https://jira.atlassian.com/browse/SRCTREEWIN-2599
* https://jira.atlassian.com/browse/SRCTREEWIN-396
* https://jira.atlassian.com/browse/SRCTREEWIN-1513
* https://jira.atlassian.com/browse/SRCTREEWIN-1673

I'm sure this will be addressed one day, but for the moment the only option is to re-arrange them manually by dragging them into order.

This PowerShell script will automatically sort bookmarks alphabetically by modifying the underlying XML SourceTree uses to store bookmarks.

# Usage

1. I'd recommend closing SourceTree beforehand to avoid overwriting the re-ordered XML

2. Download the `reorder-sourcetree.ps1` script

3. If you haven't already [allowed PowerShell scripts to be run](https://technet.microsoft.com/en-us/library/bb613481.aspx) on your system then follow these steps:

1. Search for "powershell" from the start menu
2. Right click on powershell and click "Run as Administrator"
3. Paste in `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned` at the prompt
4. Hit enter and answer Y to the confirmation
5. Close the powershell window

4. Right click on the `reorder-sourcetree.ps1` file and click "Run with PowerShell"

5. Re-open SourceTree, your bookmarks should now be in order

# F.A.Q

### Halp, you destroyed my bookmarks!

Sorry! I can't guarantee SourceTree won't change the storage format in future which could be incompatible with this script.

Before saving any changes the script saves a backup of the current bookmarks.xml file which should be located somewhere like `C:\Users\MyUser\AppData\Local\Atlassian\SourceTree\bookmarks.xml.bak`.

Simply find that file and rename it back to `bookmarks.xml` and your bookmarks should be back to the way they were before.

If you do encounter problems, be careful not to re-run the script as it could overwrite the backup with the corrupted version. Try and save a copy of the backup file ASAP.

### Does it support folders?

Yes, it should re-order folders and the bookmarks within those folders.

### Why PowerShell?

It should be universally available on Windows systems without installing any additional software.

### What about OSX?

SourceTree for OSX [already has](https://blog.sourcetreeapp.com/2012/05/15/bookmarks-window-reloaded/) this feature.

![Source tree order](https://blog.sourcetreeapp.com/files/2012/05/Bookmarks_sort.png)


