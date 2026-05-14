; WAVFX Professional Installer Configuration (Custom VST3 Path Support)
#define MyAppName "WAVFX"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "WAVFIN"
#define MyAppURL "https://wavfinaudio.com"
#define MyAppExeName "WAVFX.exe"

[Setup]
AppId={{D37D80F1-ED7E-4F2A-B98A-E67CEB9B880C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
DefaultDirName={commonpf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=License.txt
OutputBaseFilename=WAVFX_Installer_v1.0.0
Compression=lzma
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Components]
Name: "vst3"; Description: "VST3 Plugin (64-bit)"; Types: full custom; Flags: fixed
Name: "standalone"; Description: "Standalone Application"; Types: full custom

[Files]
; The VST3 plugin uses the custom path from the Selection Page
Source: "..\..\build\WAVFX_artefacts\Release\VST3\WAVFX.vst3\*"; DestDir: "{code:GetVST3Dir}\WAVFX.vst3"; Flags: recursesubdirs createallsubdirs; Components: vst3
; The Standalone executable uses the standard app path
Source: "..\..\build\WAVFX_artefacts\Release\Standalone\WAVFX.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: standalone

[Dirs]
Name: "{userdocs}\WAVFX\Presets\Stock"

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Components: standalone
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; Components: standalone

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent; Components: standalone

[Code]
var
  VST3Page: TInputDirWizardPage;

procedure InitializeWizard;
begin
  // Create a custom page for the VST3 destination
  VST3Page := CreateInputDirPage(wpSelectDir,
    'Select VST3 Destination Location', 'Where should the VST3 plugin be installed?',
    'Select the folder where you want to install the WAVFX VST3 plugin, then click Next.',
    False, '');
    
  // Add the standard VST3 path as the default suggestion
  VST3Page.Add('Recommended VST3 Location:');
  
  // Try to load previous path or use common files
  VST3Page.Values[0] := ExpandConstant('{commoncf64}\VST3');
end;

function GetVST3Dir(Param: String): String;
begin
  // This tells the [Files] section where to move the VST3
  Result := VST3Page.Values[0];
end;

procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
  // Save the VST3 path so it remembers it during updates
  SetPreviousData(PreviousDataKey, 'VST3Dir', VST3Page.Values[0]);
end;
