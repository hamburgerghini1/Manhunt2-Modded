#define MyAppId "{{00cd92d9-df05-472b-b71d-0aba0a644941}}"
#define MyAppName "Manhunt 2 Modded"

[Setup]
AppId={#MyAppId}
AppName={#MyAppName}
AppVersion=1.0
DefaultDirName={commonpf}\Manhunt 2
OutputDir=.
OutputBaseFilename=Manhunt2Modded-Setup
PrivilegesRequired=admin
AppPublisher=Rockstar North, modded by Hamburgerghini1
DefaultGroupName=Manhunt 2 Modded
LicenseFile=copyright.txt
UninstallDisplayIcon={app}\Manhunt2.exe
DiskSpanning=true
SolidCompression=yes
Compression=bzip/7
Uninstallable=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\tommi\Downloads\Manhunt2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{commondesktop}\Manhunt2-Modded"; Filename: "{app}\Manhunt2.exe"
Name: "{group}\Manhunt2-Modded"; Filename: "{app}\Manhunt2.exe"

[Registry]
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}"; ValueType: string; ValueName: "DisplayName"; ValueData: "{#MyAppName}"; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}"; ValueType: string; ValueName: "UninstallString"; ValueData: """{uninstallexe}"""; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}"; ValueType: string; ValueName: "DisplayIcon"; ValueData: "{app}\Manhunt2.exe"; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}"; ValueType: string; ValueName: "Publisher"; ValueData: "Rockstar North, modded by Hamburgerghini1"; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Microsoft\Windows\CurrentVersion\Uninstall\{#MyAppId}"; ValueType: string; ValueName: "URLInfoAbout"; ValueData: "https://github.com/hamburgerghini1/manhunt2-Modded/"; Flags: uninsdeletevalue

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*"
Type: files; Name: "{commondesktop}\Manhunt2-Modded.lnk"
Type: files; Name: "{group}\Manhunt2-Modded.lnk"
Type: dirifempty; Name: "{app}"

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssDone then
  begin
    // Check if the installation was successful
    if not FileExists(ExpandConstant('{app}\Manhunt2.exe')) then
    begin
      MsgBox('Installation failed. Please check the installation files.', mbError, MB_OK);
    end;
  end;
end;
