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
Compression=bzip
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
    'This is the content of the second license file. ' +
    'You can add more lines here as needed.';

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