; Name of the installer
OutFile "Manhunt2Modded-Setup.exe"

; Default installation directory
InstallDir "C:\Program Files (x86)\Manhunt 2"

; Request administrator privileges
RequestExecutionLevel admin

; Include Modern UI
!include "MUI2.nsh"

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Sections
Section "Install Application"
  ; Set output path to the installation directory
  SetOutPath "$INSTDIR"

  ; Create installation directory
  CreateDirectory "$INSTDIR"

  ; Extract 7za.exe (you need to include this in the installer)
  InitPluginsDir
  File "/oname=$PLUGINSDIR\7za.exe" "7za.exe"

  ; Include split parts of the ZIP file
  File "/oname=$PLUGINSDIR\Manhunt_2.zip.001" "Manhunt_2.zip.001"
  File "/oname=$PLUGINSDIR\Manhunt_2.zip.002" "Manhunt_2.zip.002"
  File "/oname=$PLUGINSDIR\Manhunt_2.zip.003" "Manhunt_2.zip.003"

  ; Use 7za.exe to extract the split archive
  nsExec::Exec '"$PLUGINSDIR\7za.exe" x "$PLUGINSDIR\Manhunt_2.zip.001" -o"$INSTDIR" -y'

  ; Display a message if extraction fails
  IfErrors 0 +2
    MessageBox MB_OK "Extraction failed. Please check the archive files."


; Uninstaller Section
Section "Uninstall"
  ; Remove installed files
  RMDir /r "$INSTDIR"

  ; Remove desktop shortcut
  Delete "$DESKTOP\Manhunt2-Modded.lnk"
SectionEnd
