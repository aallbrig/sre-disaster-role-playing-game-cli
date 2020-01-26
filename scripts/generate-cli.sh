#!/bin/bash
cli_name='disaster-role-playing'
open_api_name='openapi'

scripts_dir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null 2>&1 && pwd  )"
repo_root="${scripts_dir}/.."
cli_dir="${repo_root}/go/cli"
open_api_dir="${repo_root}/openapi"
open_api_generate_file="${open_api_dir}/${open_api_name}.yaml"

echo 'generate-cli::Ensure go/cli directory exists'
mkdir -p "${cli_dir}"

echo 'generate-cli::Intializing main.go'
(cd "${cli_dir}" && rm -f main.go && openapi-cli-generator init "${cli_name}")

echo 'generate-cli::Generate CLI based on Open API v3 spec'
(cd "${cli_dir}" && rm -f "${open_api_name}.go" && openapi-cli-generator generate "${open_api_generate_file}")

echo 'generate-cli::CLI generation complete!'
