# MP C4503 driver package

### Install tools

* `MP-C4503-macOS-pxlcolor.pkg` The installer package
* `release-cups-sandbox.command` CUPS configuration tool

### Important notice

Because the printing system in macOS is using Sandbox
which caused the driver to not functioning, please run
the `release-cups-sandbox.command` script to relax the
sandbox.

### About this directory

This is the sources of the installer package. The
installer will guide you through the installing
process of the drivers including it's dependencies
which includes:

* GPL Ghostscript
* Foomatic-RIP
* pxlmono

Those packages are located under the `requirements`
folder.

In order to use this driver, you must acknowledge
to the licenses provided by the packages listed.

    MIT Open Source License

    See http://www.opensource.org/

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
