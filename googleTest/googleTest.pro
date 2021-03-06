#*************************************************************************
#
# Copyright 2011-2013 Ibrahim Sha'ath
#
# This file is part of LibKeyFinder.
#
# LibKeyFinder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# LibKeyFinder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with LibKeyFinder.  If not, see <http://www.gnu.org/licenses/>.
#
#*************************************************************************

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

CONFIG -= ppc ppc64
CONFIG += x86 x86_64

HEADERS += \
    audiodatatest.h \
    binodetest.h \
    chromagramtest.h \
    downsamplertest.h \
    fftadaptertest.h \
    lowpassfiltertest.h \
    _testhelpers.h

SOURCES += main.cpp \
    audiodatatest.cpp \
    binodetest.cpp \
    chromagramtest.cpp \
    downsamplertest.cpp \
    fftadaptertest.cpp \
    lowpassfiltertest.cpp \
    _testhelpers.cpp

DEPENDPATH  += /usr/local/lib
INCLUDEPATH += /usr/local/include

LIBS += -lkeyfinder
LIBS += -lgtest
