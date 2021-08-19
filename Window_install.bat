copy source\.vimrc %HOMEDRIVE%%HOMEPATH% &&  echo "'copy source\.vimrc %HOMEDRIVE%%HOMEPATH%' execute successfully"
xcopy source\plugin %HOMEDRIVE%%HOMEPATH%\.vim\plugin /e /i && echo "'xcopy source\plugin %HOMEDRIVE%%HOMEPATH%\.vim\plugin /e /i '  executesuccessfully"
xcopy source\autoload %HOMEDRIVE%%HOMEPATH%\.vim\autoload /e /i && echo "'xcopy source\autoload %HOMEDRIVE%%HOMEPATH%\.vim\autoload /e /i '  executesuccessfully"
xcopy source\colors %HOMEDRIVE%%HOMEPATH%\.vim\colors /e /i && echo "'xcopy source\colors %HOMEDRIVE%%HOMEPATH%\.vim\colors /e /i' execute successfully"
