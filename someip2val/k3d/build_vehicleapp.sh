# Copyright (c) 2022 Robert Bosch GmbH and Microsoft Corporation
#
# This program and the accompanying materials are made available under the
# terms of the Apache License, Version 2.0 which is available at
# https://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# SPDX-License-Identifier: Apache-2.0

ROOT_DIRECTORY=$( realpath "$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/../../" )

APP_NAME="someip-feeder"

BUILD_TARGET="x86_64"

if [ $# -gt 0 ]; then
    BUILD_TARGET="$1"
fi

cd $ROOT_DIRECTORY/someip2val
DOCKER_BUILDKIT=1 docker build --progress=plain -t localhost:12345/$APP_NAME:local . --no-cache --build-arg "ARCH=$BUILD_TARGET"
#docker push localhost:12345/$APP_NAME:local