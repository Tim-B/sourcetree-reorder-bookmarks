$path = $env:LOCALAPPDATA+'\Atlassian\SourceTree\bookmarks.xml'

Copy-Item $path -destination $path'.bak'

$xml = [xml](Get-Content $path)

$node = $xml.ArrayOfTreeViewNode.ChildNodes

$xml.SelectNodes("//ArrayOfTreeViewNode/TreeViewNode/Children") | % { 
    $parentNode = $_; $_.TreeViewNode | Sort-Object -Property Name | % { 
        $parentNode.AppendChild($_) | Out-Null
    } 
}

$xml.SelectNodes("//ArrayOfTreeViewNode") | % { 
    $parentNode = $_; $_.TreeViewNode | Sort-Object -Property Name | % { 
        $parentNode.AppendChild($_) | Out-Null
    } 
}

$xml.Save($path)

Write-Host "Finished"