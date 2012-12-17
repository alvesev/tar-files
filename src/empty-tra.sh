#!/bin/bash

#
#  Copyright 2010-2012 Alex Vesev
#
#  This file is part of TarFiles.
#
#  TarFiles is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  TarFiles is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with TarFiles.  If not, see <http://www.gnu.org/licenses/>.
#
##

#  This script will try to clean some favourite locations.
#
##

# Places to be cleaned.
placesToBeCleaned=(\
    "/home/*/.Trash-*" \
    "/home/*/.local/share/Trash/*" \
    "/home/*/Private/trash/*" \
    "/home/.Trash-*/*"
    "/home/Trash-*/*"
    "/Trash-*/*"
    "/root/.local/share/Trash/*" \
    \
    "/home/*/.mozilla/firefox/*/Cache/*" \
    "/home/*/.thumbnails/*/*" \
    "/home/*/.cache/*" \
    \
    "/home/*/.kde/cache-*/*" \
    "/var/tmp/kdecache-*/*" \
    \
    "/home/.opt/.home/anonymous/.local/share/Trash/*" \
    "/home/.opt/.home/anonymous/Private/trash/*" \
    "/home/.opt/.home/anonymous/.mozilla/firefox/*/Cache/*" \
    "/home/.opt/.home/anonymous/.thumbnails/*/*")

for singlePlaceName in ${placesToBeCleaned[@]} ; do
    #[ -e "${singlePlaceName}" ] && ls -1d "${singlePlaceName}"
    [ -e "${singlePlaceName}" ] \
        && ! rm -rf "${singlePlaceName}" \
        && echo "Error [ $0 ]:$LINENO: Failed with remove of '${singlePlaceName}'."
done
