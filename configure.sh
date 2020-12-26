#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
BUILD_PATH=$2
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
OPENSUBDIV_VERSION=${REZ_BUILD_PROJECT_VERSION}

# We print the arguments passed to the Bash script.
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[CONFIGURE][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[CONFIGURE][ARGS] OPENSUBDIV VERSION: ${OPENSUBDIV_VERSION}"

# We check if the arguments variables we need are correctly set.
# If not, we abort the process.
if [[ -z ${EXTRACT_PATH} || -z ${BUILD_PATH} || -z ${INSTALL_PATH} || -z ${OPENSUBDIV_VERSION} ]]; then
    echo -e "\n"
    echo -e "[CONFIGURE][ARGS] One or more of the argument variables are empty. Aborting..."
    echo -e "\n"

    exit 1
fi

# We run the configuration script of OpenSubdiv.
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from OpenSubdiv-${OPENSUBDIV_VERSION}..."
echo -e "\n"

mkdir -p ${BUILD_PATH}
cd ${BUILD_PATH}

cmake \
    ${BUILD_PATH}/.. \
    -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} \
    -DCMAKE_C_FLAGS="-fPIC" \
    -DCMAKE_CXX_FLAGS="-fPIC" \
    -DNO_CUDA=1 \
    -DNO_OPENCL=1 \
    -DGLFW_LOCATION=${REZ_GLFW_ROOT} \
    -DPTEX_LOCATION=${REZ_PTEX_ROOT} \
    -DTBB_LOCATION=${REZ_TBB_ROOT} \
    -DZLIB_ROOT=${REZ_ZLIB_ROOT}
echo -e "\n"
echo -e "[CONFIGURE] Finished configuring OpenSubdiv-${OPENSUBDIV_VERSION}!"
echo -e "\n"
