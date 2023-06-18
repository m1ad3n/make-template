#################
## DIRECTORIES ##
#################

TARGET_DIR  =   ./target
DEB_DIR     =   $(TARGET_DIR)/debug
REL_DIR     =   $(TARGET_DIR)/release
LIB_DIR     =   $(TARGET_DIR)/lib

SOURCE_DIR  =   ./src
OBJ_DIR     =   $(TARGET_DIR)/obj
INC_DIR     =   $(SOURCE_DIR)


####################
## COMPILER FLAGS ##
####################

CC          =   gcc
CFLAGS      =   -Wall -Wextra -w -g -I$(INC_DIR)
LDFLAGS     =   
CXXFLAGS    =   -MMD
LIBCFLAGS   =   -pedantic -fPIC -shared


###################
## SHELL COMMAND ##
###################

MD          =   mkdir -p
RM          =   rm -rvf


#############
## TARGETS ##
#############

PROJECT     =   $(notdir $(shell pwd))
DEB_TARGET  =   $(DEB_DIR)/$(PROJECT)
VERSION     =   
REL_TARGET  =   $(REL_DIR)/$(PROJECT)$(VERSION)
LIB_TARGET  =    $(LIB_DIR)/lib$(PROJECT).so


###############################
## SOURCES, OBJECTS, HEADERS ##
###############################

SRCS        =   $(shell find . -name "*.c")
OBJS        =   $(subst $(SOURCE_DIR),$(OBJ_DIR), $(subst .c,.o,$(SRCS)))
HEADERS     =   $(shell find . -name "*.h")


##########################
## OBJECT BUILD SECTION ## 
##########################

$(OBJ_DIR)/%.o: $(SOURCE_DIR)/%.c | $(OBJ_DIR)
	@$(MD) $(@D)
	$(CC) $(CFLAGS) $(CXXFLAGS) -c $< -o $@


#################################
## DEBUG(NORMAL BUILD) SECTION ##
#################################

$(DEB_TARGET): $(OBJS) | $(DEB_DIR)
	$(CC) $(CFLAGS) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS)


#####################
## RELEASE SECTION ##
#####################

release: $(REL_TARGET)

$(REL_TARGET): $(OBJS) | $(REL_DIR)
	$(CC) $(CFLAGS) $(CXXFLAGS) -o $@ $(OBJS) $(LDFLAGS)


#####################
## LIBRARY SECTION ##
#####################

library: $(LIB_TARGET)

$(LIB_TARGET): $(OBJS) | $(LIB_DIR)
	$(CC) $(CFLAGS) $(LIBCFLAGS) -o $@ $(OBJS)


#####################
## INSTALL SECTION ##
#####################

install:
ifneq (,$(wildcard $(LIB_TARGET)))
	sudo install $(LIB_TARGET) /usr/lib
endif

ifneq (,$(wildcard $(REL_TARGET)))
	sudo install $(REL_TARGET) /usr/bin
endif

ifneq (,$(wildcard $(HEADERS)))
	sudo install $(HEADERS) /usr/include
endif

#################
## CREATE DIRS ##
#################

$(DEB_DIR):
	@$(MD) $(DEB_DIR)

$(REL_DIR):
	@$(MD) $(REL_DIR)

$(LIB_DIR):
	@$(MD) $(LIB_DIR)

$(OBJ_DIR):
	@$(MD) $(OBJ_DIR)

############################
## CLEAN AND INCLUDE FUNC ##
############################

.PHONY: clean clean-rel clean-lib clean-deb clean-obj
clean:
	@$(RM) $(TARGET_DIR)/**

clean-deb:
	@$(RM) $(DEB_DIR)

clean-rel:
	@$(RM) $(REL_DIR)

clean-lib:
	@$(RM) $(LIB_DIR)

clean-obj:
	@$(RM) $(OBJ_DIR)

-include $(shell find . -name "*.d")