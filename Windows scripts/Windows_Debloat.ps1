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
    "Mail and Calendar",
    "HP Enhanced Lighting",
    "HP PC Hardware Diagnostics Windows",
    "HP Privacy Settings",
    "HP QuickDrop",
    "myHP",
    "Windows Sound Recorder",
    "Xbox Game Bar Plugin",
    "Phone Link",
    "Spotify Music",
    "HP Display Control Service",
    "HP Audio Switch",
    "WebAdvisor by McAfee"
    "HP Smart"
    "HP System Event Utility"
    "HP Documentation"
    "McAfee LiveSafe"
    "Minecraft: Education Edition"
    "Mixed Reality Portal"
    "Power Automate"
    "Microsoft Family"
    "ExpressVPN")

foreach ($package in $packages_to_uninstall) {
    Write-Host("Uninstalling " + $package)
    winget uninstall $package
}