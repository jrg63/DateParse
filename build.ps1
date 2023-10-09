$DOCDIR = 'F:\OneDrive\Documents'
$LIBDIR = $DOCDIR + '\AutoHotkey\Lib'
$DEVHOME = $DOCDIR + '\dev\projects\'
$SRCDIR = $DEVHOME + '\DateParse'
$SRC = $SRCDIR + '\DateParse.ahk'

# turn on tracing
Set-PSDebug -Trace 1

# get the parameter
$cmd = $args[0]
if (!$cmd)
{
    $cmd = 'install'
}

# if we are doing an install copy the file to the lib directory
if ($cmd -eq 'install')
{
    Copy-Item -Force -Verbose $SRC $LIBDIR
}
