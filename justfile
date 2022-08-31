package version os="macOS" arch="arm64":
    #!/usr/bin/env bash
    set -euxo pipefail

    DIST=hydra_{{version}}-{{os}}_{{arch}}

    mkdir -p ./dist/$DIST
    
    sed -i '' 's/master/{{version}}/g' ./driver/config/buildinfo.go
 
    go build -o ./dist/$DIST . 
    
    sed -i '' 's/{{version}}/master/g' ./driver/config/buildinfo.go
    
    tar -czf $DIST.tar.gz -C ./dist .

    rm -rf dist

build:
    go build .