$build = ''
$sure = 0
$title = ''
DO {
    $build = Read-Host -Prompt 'Release Build';
    $title = "Release Build: $($build)"
    $ans = Read-Host -Prompt "Is this correct '$($title)'? (y/N)"
    if($ans -eq 'y') {
        $sure = 1
    }
}While($sure -eq 0)

svn add . --force
svn commit -m $title

git add .
git commit -m $title
git push -u origin master


Write-Host "$($title) Successfuly Committed"
