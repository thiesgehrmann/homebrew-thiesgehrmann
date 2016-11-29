#!/usr/bin/sh

brew_loc="${HOME}/brews";

###############################################################################

function error() {
  local msg="$1"
  echo "ERROR: $msg"
}

###############################################################################

function warning() {
  local msg="$1"
  echo "WARNING $msg"
}

###############################################################################

function get_pdir() {
  local name="$1";
  local pdir="$brew_loc/$name/"
  echo "$pdir"
}

###############################################################################

function new_env() {
  if [ "${INSIDEBREWENV}" == "YES" ]; then
    warning "Already inside env ${CURRENTBREWENV}"
  fi
  
  name="$1";
  pdir=`get_pdir $name`

  if [ -e "$pdir" ]; then
    error "This environment already exists"
    exit 1;
  fi

  git clone https://github.com/Linuxbrew/brew.git $pdir;
  gen_env_vars "$name" > $pdir/env
}

###############################################################################

function gen_env_vars() {
  name="$1"
  pdir=`get_pdir $name`
  LINUXBREWHOME="$pdir"
  echo "export INSIDEBREWENV=YES"
  echo "export CURRENTBREWENV=$name"
  echo "export LINUXBREWHOME=$pdir"
  echo "export PATH=$LINUXBREWHOME/bin:$PATH"
  echo "export MANPATH=$LINUXBREWHOME/man:$MANPATH"
  echo "export PKG_CONFIG_PATH=$LINUXBREWHOME/lib64/pkgconfig:$LINUXBREWHOME/lib/pkgconfig:$PKG_CONFIG_PATH"
  echo "export LD_LIBRARY_PATH=$LINUXBREWHOME/lib64:$LINUXBREWHOME/lib:$LD_LIBRARY_PATH[2~"
}

###############################################################################

function cat_env_vars() {
  name="$1"
  pdir=`get_pdir $name`
  cat $pdir/env
}

###############################################################################

function del_env(){

  name="$1";
  pdir=`get_pdir $name`
  rm -rf $pdir

}

###############################################################################

function list_envs() {
  ls $brew_loc
}

###############################################################################

function enter_env() {
  if [ "${INSIDEBREWENV}" == "YES" ]; then
    error "Already inside env ${CURRENTBREWENV}"
    exit 1
  fi

  name="$1";
  pdir=`get_pdir $name`

  if [ ! -e "$pdir" ]; then
    error "Env $name does not exist";
    exit 1
  fi

  source "${pdir}/env"
  echo "Entering Brew $name"
  exec $SHELL
  echo "Exiting Brew $name"
}

###############################################################################

action="$1";
name="$2";

case $action in
  n)
   new_env $name
   ;;
  e)
   enter_env $name
   ;;
  l)
   list_envs
   ;;
  DEL)
   del_env $name
   ;;
  *)
    error "Unknown action $action"
   exit 3
   ;;
esac
  
