source libexec/options.bash

function __submagic {
  local file

  parse_options "$@"

  if [[ "${file:-}" == *'/'* ]]; then
    echo >&2 'Error: File name must be a pure base name without' \
      'any path component or slash.'
    return 1
  fi

  if [[ -n "${file:-}" ]]; then
    full_path="$(mktemp -d --suffix=.submagic)/${file}"
  else
    full_path="$(mktemp --suffix=.submagic)"
  fi

  cat >> "${full_path}"
  echo "${full_path}"
}

export -f __submagic
