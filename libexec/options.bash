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
        _set_file "${1}"
        shift
        ;;
    esac
  done

  # Hint for shellcheck
  export file
}

export -f parse_options


_assert_unset() {
  local param description
  param="${1?}"
  description="${2?}"

  if [[ -n "${param}" ]]; then
    printf >&2 'Error: More than one %s provided.\n' "${description}"
    return 1
  fi
}


function _set_file {
  local value
  value="${1?}"

  _assert_unset "${file:-}" 'file parameter'
  file="${value}"
}

export -f _set_file
