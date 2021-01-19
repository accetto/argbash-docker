#!/bin/bash
### @accetto (https://github.com/accetto) (https://hub.docker.com/u/accetto/)

# ARG_VERSION([echo v21.01.19])
# ARG_HELP([Generates 'argbash' compatible script from provided 'argbash' compatible template using dockerized 'argbash'.],[
<< ---
Attention! The input template file name must come before the other 'argbash' options!

The input template can be one of the following:
  - an '*.m4' template compatible with 'argbash'
  - a script previously generated by 'argbash'

The input template file is overwritten by default, except when:
  - it is a '*.m4' file
  - an another output file is explicitelly defined ('-o/--output')

The essential local variables ('image', 'workdir') are initialized in the following order:
  - from the command line arguments ('-m/--image', '-w/--workdir')
  - from the environment variables (ARGBASH_IMAGE, ARGBASH_WORKDIR)
  - from the local variables ('essential_default_image', 'essential_default_workdir')

The created container will be automatically removed after generating the output file.
Note that the container must have writing permissions for the working directory.
---
#])
#
# ARG_OPTIONAL_SINGLE([image],[m],[Docker image to use])
# ARG_OPTIONAL_SINGLE([workdir],[w],[Working directory to use])
# ARG_OPTIONAL_SINGLE([output],[o],[Output file to generate])
#
# ARG_OPTIONAL_BOOLEAN([echo],[],[Just print the command line to be executed])
# ARG_OPTIONAL_ACTION([info],[],[Just print the current essentials (env/local variables)],[env | grep -E '^ARGBASH_' ; grep -E '^\s?_essential_default_[a-z]+=' $0])
#
# ARG_POSITIONAL_SINGLE([template],[Input template file to process])
# ARG_POSITIONAL_INF([parameters],[Other options for 'argbash' (see 'https://argbash.readthedocs.io')])
#
# ARG_POSITIONAL_DOUBLEDASH([])
# ARGBASH_SET_INDENT([  ])
#
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
  local _ret="${2:-1}"
  test "${_PRINT_HELP:-no}" = yes && print_help >&2
  echo "$1" >&2
  exit "${_ret}"
}


begins_with_short_option()
{
  local first_option all_short_options='vhmwo'
  first_option="${1:0:1}"
  test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_parameters=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_image=
_arg_workdir=
_arg_output=
_arg_echo="off"


print_help()
{
  printf '%s\n' "Generates 'argbash' compatible script from provided 'argbash' compatible template using dockerized 'argbash'."
  printf 'Usage: %s [-v|--version] [-h|--help] [-m|--image <arg>] [-w|--workdir <arg>] [-o|--output <arg>] [--(no-)echo] [--info] [--] <template> [<parameters-1>] ... [<parameters-n>] ...\n' "$0"
  printf '\t%s\n' "<template>: Input template file to process"
  printf '\t%s\n' "<parameters>: Other options for 'argbash' (see 'https://argbash.readthedocs.io')"
  printf '\t%s\n' "-v, --version: Prints version"
  printf '\t%s\n' "-h, --help: Prints help"
  printf '\t%s\n' "-m, --image: Docker image to use (no default)"
  printf '\t%s\n' "-w, --workdir: Working directory to use (no default)"
  printf '\t%s\n' "-o, --output: Output file to generate (no default)"
  printf '\t%s\n' "--echo, --no-echo: Just print the command line to be executed (off by default)"
  printf '\t%s\n' "--info: Just print the current essentials (env/local variables)"
  printf '\n%s\n' "
<< ---
Attention! The input template file name must come before the other 'argbash' options!

The input template can be one of the following:
  - an '*.m4' template compatible with 'argbash'
  - a script previously generated by 'argbash'

The input template file is overwritten by default, except when:
  - it is a '*.m4' file
  - an another output file is explicitelly defined ('-o/--output')

The essential local variables ('image', 'workdir') are initialized in the following order:
  - from the command line arguments ('-m/--image', '-w/--workdir')
  - from the environment variables (ARGBASH_IMAGE, ARGBASH_WORKDIR)
  - from the local variables ('essential_default_image', 'essential_default_workdir')

The created container will be automatically removed after generating the output file.
Note that the container must have writing permissions for the working directory.
---
#"
}


parse_commandline()
{
  _positionals_count=0
  while test $# -gt 0
  do
    _key="$1"
    if test "$_key" = '--'
    then
      shift
      test $# -gt 0 || break
      _positionals+=("$@")
      _positionals_count=$((_positionals_count + $#))
      shift $(($# - 1))
      _last_positional="$1"
      break
    fi
    case "$_key" in
      -v|--version)
        echo v21.01.19
        exit 0
        ;;
      -v*)
        echo v21.01.19
        exit 0
        ;;
      -h|--help)
        print_help
        exit 0
        ;;
      -h*)
        print_help
        exit 0
        ;;
      -m|--image)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_image="$2"
        shift
        ;;
      --image=*)
        _arg_image="${_key##--image=}"
        ;;
      -m*)
        _arg_image="${_key##-m}"
        ;;
      -w|--workdir)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_workdir="$2"
        shift
        ;;
      --workdir=*)
        _arg_workdir="${_key##--workdir=}"
        ;;
      -w*)
        _arg_workdir="${_key##-w}"
        ;;
      -o|--output)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_output="$2"
        shift
        ;;
      --output=*)
        _arg_output="${_key##--output=}"
        ;;
      -o*)
        _arg_output="${_key##-o}"
        ;;
      --no-echo|--echo)
        _arg_echo="on"
        test "${1:0:5}" = "--no-" && _arg_echo="off"
        ;;
      --info)
        env | grep -E '^ARGBASH_' ; grep -E '^\s?_essential_default_[a-z]+=' $0
        exit 0
        ;;
      *)
        _last_positional="$1"
        _positionals+=("$_last_positional")
        _positionals_count=$((_positionals_count + 1))
        ;;
    esac
    shift
  done
}


handle_passed_args_count()
{
  local _required_args_string="'template'"
  test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require at least 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
}


assign_positional_args()
{
  local _positional_name _shift_for=$1
  _positional_names="_arg_template "
  _our_args=$((${#_positionals[@]} - 1))
  for ((ii = 0; ii < _our_args; ii++))
  do
    _positional_names="$_positional_names _arg_parameters[$((ii + 0))]"
  done

  shift "$_shift_for"
  for _positional_name in ${_positional_names}
  do
    test $# -gt 0 || break
    eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
    shift
  done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash


# vvv  PLACE YOUR CODE HERE  vvv

debash_path() {
  ### This helper function converts bash-like path to windows-like one ('/c/...' -> 'c:/...').
  ### It's required if 'Docker Desktop' on Windows is using 'Git Bash' terminal.

  echo $( echo "$1" | sed -r -e 's/^\/([a-z])\//\1:\//I' )
}

# enbash_path() {
#   ### This helper function converts windows-like path to bash-like one ('c:/...' -> '/c/...').
#   ### Currently unused, but may be needed in the future.
#   echo $( echo "$1" | sed -r -e 's/^([a-z])\:\//\/\1\//I' )
# }

main() {

  local output_file

  ### these local variables are essential and they are initialized by this script itself
  local image
  local workdir

  ### try to set the local variable 'image' in the following order
  ### (1) from the input argument '-m/--image', or
  ### (2) from the environment variable 'ARGBASH_IMAGE', or
  ### (3) from the local variable '_essential_default_image'
  image="${_arg_image:-${ARGBASH_IMAGE:-${_essential_default_image}}}"
  if [ -z "${image}" ] ; then
    die "FAILED: Unable to set the essential variable 'image'! Please check the help."
  fi

  ### try to set the local variable 'workdir' in the following order
  ### (1) from the argument '-w/--workdir', or
  ### (2) from the environment variable 'ARGBASH_WORKDIR', or
  ### (3) from the local variable '_essential_default_workdir'
  workdir="${_arg_workdir:-${ARGBASH_WORKDIR:-${_essential_default_workdir}}}"
  if [ -z "${workdir}" ] ; then
    die "FAILED: Unable to set the essential variable 'workdir'! Please check the help."
  fi

  ### if the current directory should be used
  ### note that the container must have writing permissions for it
  if [ "${workdir}" == "." ] ; then

    workdir="${PWD}"

    ### 'Docker Desktop' on Windows requires a Windows-like path.
    ### Remark: It would be done also automatically, if provided in double quotes.
    if [ "${OS}" == "Windows_NT" ] ; then
      workdir="$( debash_path ${workdir} )"
    fi
  fi

  echo "IMAGE:       ${image}"
  echo "WORKDIR:     ${workdir}"

  if [ "${_arg_template[@]:0:1}" == "-" ] ; then
    die "FAILED: The input template file name must come before the other 'argbash' options!"
  fi

  ### template file must already exist
  if [ ! -f "${workdir}/${_arg_template}" ] ; then
    die "FAILED: Template file '${workdir}/${_arg_template}' not found!"
  fi

  ### refuse to overwrite '*.m4' files
  if [ "${_arg_template[@]:(-3)}" == ".m4" ] && [ -z "${_arg_output}" ] ; then
    die "FAILED: M4-template requires an explicit output file. Use option [-o|--output <arg>]."
  fi

  ### non-M4 files are allowed to be overwritten
  output_file="${_arg_output:-${_arg_template}}"

  if [ "${_arg_echo}" == "off" ] ; then

    ### let the container to process the template
    docker run -it --rm -e PROGRAM=argbash -u $(id -u):$(id -g) -v "${workdir}":/work "${image}" "${_arg_template}" -o "${output_file}" "${_arg_parameters[@]}"

    if [ "$?" == "0" ] ; then
      echo "SUCCESS: Template file '${_arg_template}' has been sucessfully processed into the working directory."
    else
      echo "FAILED: Please check the command line, the configuration and the 'argbash' documentation."
    fi

  else
    echo "docker run -it --rm -e PROGRAM=argbash -u $(id -u):$(id -g) -v" "${workdir}":/work "${image}" "${_arg_template}" -o "${output_file}" "${_arg_parameters[@]}"
  fi
}

### The '_essential_default_image' value will be used to initialize the 'image' variable
### if the '-m/--image' input argument has not been provided and also the environment variable
### 'ARGBASH_IMAGE' is not set.
# declare _essential_default_image
declare _essential_default_image="accetto/argbash-docker"

### The '_essential_default_workdir' value will be used to initialize the 'workdir' variable
### if the '-w/--workdir' argument has not been used and also the environment variable
### 'ARGBASH_WORKDIR' is not set.
### The special dot-value (.) will be replaced by the current directory.
### Also the adjustements needed for 'Docker for Windows' will be made automatically.
# declare _essential_default_workdir
declare _essential_default_workdir="."

main $@

# ^^^  TERMINATE YOUR CODE BEFORE THE BOTTOM ARGBASH MARKER  ^^^

# ] <-- needed because of Argbash
