$m1=$env:PROCESSOR_ARCHITECTURE
$m2=$(Get-WmiObject Win32_OperatingSystem).OSArchitecture
$m3=$(wmic os get OSArchitecture)[2]
$m4=if([System.IntPtr]::Size -eq 4){
    "32-bit"
    }else{
        "64-bit"
        }

echo ==========================================
echo " "

echo "DETERMINES IF THE OS IS 32bit or 64bit"
echo " "
echo ==========================================

echo " "


 
echo "running the command $env:PROCESSOR_ARCHITECTURE...architecture: $m1"

echo " "

echo "running the command (Get-WmiObject Win32_OperatingSystem).OSArchitecture...architecture: $m2"

echo " "

echo "running the command (wmic os get OSArchitecture)[2]...architecture: $m3"

echo " "

echo "running the if statement...architecture: $m4"