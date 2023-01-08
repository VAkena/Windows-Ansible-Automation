$packages_to_uninstall = 
@("Clipchamp", 
    "Cortana", 
    "Microsoft News", 
    "MSN Weather", 
    "Xbox", 
    "Get Help", 
    "Microsoft Tips", 
    "Office", 
    "Microsoft Solitaire Collection", 
    "Microsoft Sticky Notes", 
    "Paint", 
    "Microsoft People", 
    "Microsoft To Do", 
    "Windows Camera", 
    "Feedback Hub", 
    "Windows Maps", 
    "Xbox Game Bar", 
    "Your Phone", 
    "Films & TV", 
    "Quick Assist", 
    "Microsoft Teams", 
    "Mail and Calendar")

foreach ($package in $packages_to_uninstall) {
    Write-Host("Uninstalling " + $package)
    winget uninstall $package
}