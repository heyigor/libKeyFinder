OS_PLATFORM := $(shell uname)

TARGET = libKeyFinder.a

MAC_LIB_ROOT := /opt/local/lib
LINUX_LIB_ROOT := /usr/lib

ifeq ($(OS_PLATFORM), Linux)
INC_PATH += -I/usr/include
endif
ifeq ($(OS_PLATFORM), Darwin)
INC_PATH += -I/opt/local/include
endif

SRC		=	audiodata.cpp \
			chromagram.cpp \
			chromatransform.cpp \
			chromatransformfactory.cpp \
			downsampler.cpp \
			fftadapter.cpp \
			keyclassifier.cpp \
			keyfinder.cpp \
			lowpassfilter.cpp \
			lowpassfilterfactory.cpp \
			parameters.cpp \
			seg.cpp \
			segarbitrary.cpp \
			segcosine.cpp \
			segnone.cpp \
			spectrumanalyser.cpp \
			toneprofiles.cpp \
			windowfunctions.cpp

OBJ_DIR := obj/
OBJ := $(addprefix $(OBJ_DIR),$(addsuffix .o,$(basename ${SRC})))

ifeq ($(OS_PLATFORM), Linux)
CC     := gcc
CXX    := g++
LD     := g++
AR     := ar
endif
ifeq ($(OS_PLATFORM), Darwin)
CC     := clang
CXX    := clang++
LD     := clang++
AR     := ar
endif

CFLAGS  = -O3 $(INC_PATH)

ifeq ($(OS_PLATFORM), Linux)
CFLAGS += -std=c++11
endif
ifeq ($(OS_PLATFORM), Darwin)
CFLAGS += -mmacosx-version-min=10.7 -std=c++11
CFLAGS +=  -stdlib=libc++
endif

CXXFLAGS  = $(CFLAGS)

all:
	@echo Targets:
	@echo "  build"

build: $(TARGET)
	@echo done!

$(TARGET): $(OBJ)
	${AR} rcs ${TARGET} ${OBJ}

# Rules for compiling source files to object files
$(OBJ_DIR)%.o : %.cpp
	@mkdir -p $(OBJ_DIR)
	${CXX} -c ${CXXFLAGS} $< -o $@

$(OBJ_DIR)%.o : %.c
	@mkdir -p $(OBJ_DIR)
	${CC} -c ${CFLAGS} $< -o $@

clean:
	@rm -f $(TARGET)
	@rm -Rf $(OBJ_DIR)
	@echo Cleaned!


