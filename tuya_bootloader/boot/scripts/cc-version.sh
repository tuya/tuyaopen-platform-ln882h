#!/bin/sh

set -e

tools_version=4.9.2

# Print the compiler name and some version components.
get_compiler_info()
{
	cat <<- EOF | "$@" -E -P -x c - 2>/dev/null
	#if defined(__clang__)
	Clang	__clang_major__  __clang_minor__  __clang_patchlevel__
	#elif defined(__INTEL_COMPILER)
	ICC	__INTEL_COMPILER  __INTEL_COMPILER_UPDATE
	#elif defined(__GNUC__)
	GCC __GNUC__  __GNUC_MINOR__  __GNUC_PATCHLEVEL__
	#else
	unknown
	#endif
	EOF
}

# Convert the version string x.y.z to a canonical 5 or 6-digit form.
get_canonical_version()
{
	IFS=.
	set -- $1
	echo $((10000 * $1 + 100 * $2 + $3))
}

# $@ instead of $1 because multiple words might be given, e.g. CC="ccache gcc".
orig_args="$@"
set -- $(get_compiler_info "$@")

name=$1

case "$name" in
GCC)
	version=$2.$3.$4
	;;
Clang)
	version=$2.$3.$4
	;;
ICC)
	version=$(($2 / 100)).$(($2 % 100)).$3
	;;
*)
	echo "unknown"
	exit 1
	;;
esac

req_version=$(echo $tools_version)
cversion=$(get_canonical_version $version)
req_cversion=$(get_canonical_version $req_version)

if [ "$cversion" -lt "$req_cversion" ]; then
	echo >&2 "***"
	echo >&2 "*** Compiler is not meeting our demand."
	echo >&2 "***   Your $name version:     $version"
	echo >&2 "***   Required $name version: $req_version"
	echo >&2 "***"
	exit 1
fi

echo "pass"
