

# ////////////////////////////////////////////////////////////////// Boilerplate
let isLinux = sys | get host.long_os_version | "Linux" in $in

# const venv = ".env"

if  $isLinux {
  print "Linux filesystem detected."
} else {
  print "Non-Linux filesystem detected."
}

const WORKSPACE = pwd
 
# python3.10 -m pip install -U pip setuptools virtualenv
# python3.10 -m virtualenv .env
# let use_bin = glob **/($venv)/*/activate.nu | "bin" in $in

# if $use_bin {
#   overlay use ".env/bin/activate.nu"
# } else {
#   overlay use ".env/Scripts/activate.nu"
# }


# //////////////////////////////////////////////////////////////////

def "main build" [] {
  overlay use ".env/bin/activate.nu"
  which pip | print
  if ("sampleproject" | path exists) {
    print "Repo already cloned."
    do {
      cd sampleproject
      git pull origin main
    }
  } else {
    git clone https://github.com/pypa/sampleproject.git
  }
  cd sampleproject
  pip install prospector bandit pytest
  pip install ./
  python -m prospector ./
  python -m bandit --recursive .
}

def main [] {}
