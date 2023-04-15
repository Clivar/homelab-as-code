VENVDIR=kubespray-venv
KUBESPRAYDIR=kubespray
ANSIBLE_VERSION=2.12
source $VENVDIR/bin/activate
cd $KUBESPRAYDIR
python -m pip install -U -r requirements-$ANSIBLE_VERSION.txt