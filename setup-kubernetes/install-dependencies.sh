VENVDIR=kubespray-venv
KUBESPRAYDIR=kubespray
ANSIBLE_VERSION=2.12
python3 -m virtualenv  --python=$(which python3) $VENVDIR
source $VENVDIR/bin/activate
cd $KUBESPRAYDIR
python3 -m pip install -U -r requirements-$ANSIBLE_VERSION.txt