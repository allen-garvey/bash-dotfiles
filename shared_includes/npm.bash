#add non-root npm global installs to PATH

export PATH="~/.npm-global/bin:$PATH"

# alias to update all dependencies in package.json
function ncuu() {
    ncu -u
    npm install
    npm audit fix
}

alias npm_install="npm install && npm audit fix"

alias npm_reset="npm prune && npm install"