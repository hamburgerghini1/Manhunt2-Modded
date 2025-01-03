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
Compression=bzip/9
Uninstallable=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\tommi\Downloads\Manhunt2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{commondesktop}\Manhunt2-Modded"; Filename: "{app}\Manhunt2.exe"
Name: "{group}\Manhunt2-Modded"; Filename: "{app}\Manhunt2.exe"

[Code]
const
  InnoLicenseText = 
    'This installer is created using Inno Setup' + #13#10 +
    '' + #13#10 +
    'Inno Setup License' + #13#10 +
    '==================' + #13#10 +
    '' + #13#10 +
    'Except where otherwise noted, all of the documentation and software included in the Inno Setup' + #13#10 +
    'package is copyrighted by Jordan Russell.' + #13#10 +
    '' + #13#10 +
    'Copyright (C) 1997-2024 Jordan Russell. All rights reserved.' + #13#10 +
    'Portions Copyright (C) 2000-2024 Martijn Laan. All rights reserved.' + #13#10 +
    '' + #13#10 +
    'This software is provided "as-is," without any express or implied warranty. In no event shall the' + #13#10 +
    'author be held liable for any damages arising from the use of this software.' + #13#10 +
    '' + #13#10 +
    'Permission is granted to anyone to use this software for any purpose, including commercial' + #13#10 +
    'applications, and to alter and redistribute it, provided that the following conditions are met:' + #13#10 +
    '' + #13#10 +
    '1. All redistributions of source code files must retain all copyright notices that are currently in' + #13#10 +
    '   place, and this list of conditions without modification.' + #13#10 +
    '' + #13#10 +
    '2. All redistributions in binary form must retain all occurrences of the above copyright notice and' + #13#10 +
    '   web site addresses that are currently in place (for example, in the About boxes).' + #13#10 +
    '' + #13#10 +
    '3. The origin of this software must not be misrepresented; you must not claim that you wrote the' + #13#10 +
    '   original software. If you use this software to distribute a product, an acknowledgment in the' + #13#10 +
    '   product documentation would be appreciated but is not required.' + #13#10 +
    '' + #13#10 +
    '4. Modified versions in source or binary form must be plainly marked as such, and must not be' + #13#10 +
    '   misrepresented as being the original software.' + #13#10 +
    '' + #13#10 +
    '' + #13#10 +
    'Jordan Russell' + #13#10 +
    'jr-2020 AT jrsoftware.org' + #13#10 +
    'https://jrsoftware.org/';

var
  InnoLicensePage: TWizardPage;
  RichEdit: TRichEditViewer;

procedure InitializeWizard;
begin
  // Create a new page for the second license
  InnoLicensePage := CreateCustomPage(wpLicense, 'Additional License Agreement',
    'Please review the following license agreement:');
  
  RichEdit := TRichEditViewer.Create(InnoLicensePage);
  RichEdit.Parent := InnoLicensePage.Surface;
  RichEdit.Width := InnoLicensePage.SurfaceWidth;
  RichEdit.Height := InnoLicensePage.SurfaceHeight;
  RichEdit.ScrollBars := ssBoth;
  RichEdit.WordWrap := True;
  RichEdit.ReadOnly := True;
  RichEdit.Text := InnoLicenseText;
end;

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