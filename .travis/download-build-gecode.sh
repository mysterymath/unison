#!/bin/bash
./.accept-svn-certificate anonymous robcasloz@gmail.com https://svn.gecode.org/svn/gecode/trunk
svn --non-interactive --username anonymous --password robcasloz@gmail.com checkout -r15375 https://svn.gecode.org/svn/gecode/trunk gecode-trunk
cd gecode-trunk
./configure --disable-examples --disable-float --disable-flatzinc
make
cd -
