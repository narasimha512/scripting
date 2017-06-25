#!/bin/bash
CWD=`pwd`
PATCH_PATH_LIB="/opt/SMAW/INTP/lib"
PATCH_PATH_BIN="/opt/SMAW/INTP/bin"
patch ()
{
for lib in $(ls *.so)
do
#echo $lib $CWD
cd $PATCH_PATH_LIB
mv $lib $lib.orig
ln -s $CWD/$lib
echo "Patched $CWD/$lib"
done
cd $PATCH_PATH_BIN
mv UMStppd UMStppd.orig
ln -s $CWD/UMStppd
}
unpatch ()
{
for lib in $(ls *.so)
do
#echo $lib $CWD
cd $PATCH_PATH_LIB
mv $lib.orig $lib
echo "Un Patched $CWD/$lib"
done
cd $PATCH_PATH_BIN
mv UMStppd.orig UMStppd

}

usage ()
{
echo "For right usage execute:./patch_unpatch.sh patch|unpatch"
}

if [ $# -eq 0 ]
then

echo "Error in  Usage"
usage
exit 1
fi

if [ $1 = "patch" ]
then
    patch
elif [ $1 = "unpatch" ]
then
    unpatch
else
    usage
fi


