# Copyright (c) 2023-present, Qihoo, Inc.  All rights reserved.
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.

set -x
go mod tidy

export PATH="$PATH:$GOPATH/bin"
echo $PATH
echo $GOPATH
echo $GOBIN
go env

# install ginkgo
go get github.com/onsi/ginkgo/v2/ginkgo
go install github.com/onsi/ginkgo/v2/ginkgo
go get github.com/onsi/gomega/...

echo "try ginkgo in PATH ----- "
find /home -name ginkgo 2>/dev/null
ginkgo --dry-run -v |grep -E -v "\[[0-9]+\.[0-9]+ seconds]"

ginkgo --focus-file="server_test.go" -vv

ginkgo --focus-file="acl_test.go" -vv

ginkgo --focus-file="txn_test.go" -vv

# go test -run=TestPikaWithCache -timeout 30m
# go test -run=TestPikaWithoutCache -timeout 30m
