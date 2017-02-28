#!/bin/bash

#
# Because the installer scripts will run in a system sandbox, there's no
# way to adjust CUPS settings. This script is used to solve this problem,
# to relax the CUPS sandboxing so that the driver could access external
# softwares.
#
# Marcus Zhou <other.marcus@icloud.com>
#
# MIT Open Source License
#
# See http://www.opensource.org/
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#

LAUNCH_CTL_TOOL="$(which launchctl)"
CAT_TOOL="$(which cat)"
GREP_TOOL="$(which grep)"
SUDO_TOOL="$(which sudo)"

CUPS_CONFIG="/etc/cups/cups-files.conf"
CUPS_DAEMON="/System/Library/LaunchDaemons/org.cups.cupsd.plist"

cat <<'INFO'

Post-install script for Ricoh MP C4503 PXL mac driver

Because the installer is running in a sandboxed enviorment, it is impossible
to modify the settings of the protected CUPS settings. This script will
release the sandbox of CUPS so that the driver could access external programs
that is used to interprate your printing jobs.

If you can not print files normally using this driver (usually the problem will
appears like the print job was sent to the printer but nothing came out the
printer), please proceed. After the script finished, you can remove this file.

This script is released under the MIT Open Source License
See http://www.opensource.org/

Marcus Zhou <other.marcus@icloud.com>

INFO

if [ -z "$("$CAT_TOOL" "$CUPS_CONFIG" | "$GREP_TOOL" "Sandboxing Relaxed")" ]; then
  printf "Press 'y' to continue, press any other key to abort: "
  read -r -n1 choice
  if [ "$choice" == "y" ]; then
    echo
    echo "Please enter your password if prompted"
    "$SUDO_TOOL" "bash" "-c" "echo 'Sandboxing Relaxed' >> '$CUPS_CONFIG'"
    if [ $? -eq 0 ]; then
      echo "CUPS Sandboxing has been relaxed"
      echo "Restarting Printing Service..."
      "$SUDO_TOOL" "$LAUNCH_CTL_TOOL" "unload" "$CUPS_DAEMON"
      "$SUDO_TOOL" "$LAUNCH_CTL_TOOL" "load" "$CUPS_DAEMON"
      echo "You should now be able to print normally"
    else
      cat <<'INFO'
User aborted or permission declined
Please try again
INFO
    fi
  else
    echo
    echo "User Aborted"
  fi
else
  echo "Your CUPS sandbox has been relaxed"
fi
