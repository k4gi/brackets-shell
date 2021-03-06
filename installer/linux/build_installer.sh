#!/bin/bash

# grunt-contrib-copy doesn't preserve permissions
# https://github.com/gruntjs/grunt/issues/615
chmod 755 debian/package-root/opt/brackets/brackets
chmod 755 debian/package-root/opt/brackets/Brackets
chmod 755 debian/package-root/opt/brackets/Brackets-node
chmod 755 debian/package-root/opt/brackets/www/node_modules/opn/xdg-open
chmod 755 debian/package-root/DEBIAN/prerm
chmod 755 debian/package-root/DEBIAN/postrm
chmod 755 debian/package-root/DEBIAN/postinst
chown root debian/package-root/opt/brackets/chrome-sandbox
chmod 4755 debian/package-root/opt/brackets/chrome-sandbox


# set permissions on subdirectories
find debian -type d -exec chmod 755 {} \;

# delete old package
rm -f brackets.deb

fakeroot dpkg-deb --build debian/package-root
mv debian/package-root.deb brackets.deb
