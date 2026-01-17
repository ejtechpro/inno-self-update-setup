; =========================================================
; Inno Setup Script (Update-Safe Version)
; =========================================================

#define MyAppName "innoselfupdate"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "ejtechpro"
#define MyAppURL "https://www.ejtechpro.com/"
#define MyAppExeName "innoselfupdate.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
AppId={{F9EF85EE-5139-4071-962A-62B131945677}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
CloseApplications=force
RestartApplications=yes
DisableDirPage=yes
DisableProgramGroupPage=yes
CreateUninstallRegKey=yes
ChangesAssociations=yes
OutputBaseFilename=innoselfupdate_v1.0.0
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\Dev\Python\inno-self-update-setup\dist\innoselfupdate\{#MyAppExeName}"; \
    DestDir: "{app}"; Flags: ignoreversion overwritereadonly

Source: "D:\Dev\Python\inno-self-update-setup\dist\innoselfupdate\_internal\*"; \
    DestDir: "{app}\_internal"; Flags: ignoreversion overwritereadonly recursesubdirs createallsubdirs

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; \
    ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; \
    ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; \
    ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; \
    ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; \
    Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; \
    Flags: nowait postinstall skipifsilent
