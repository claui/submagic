source libexec/version.bash

function parse_options {
  while [[ $# -gt 0 ]]; do
    case "${1}" in
      -V|--version)
        echo >&2 "${BASENAME} v${__VERSION}"
        exit 0
        ;;
      -*)
        echo >&2 "Error: Unknown option ${1}"
        return 1
        ;;
      *)
        shift
        ;;
    esac
  done
}

export -f parse_options
