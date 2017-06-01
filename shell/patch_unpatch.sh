#!/bin/bash
CWD=`pwd`
PATCH_PATH_LIB_64="/opt/SMAW/INTP/lib64"
PATCH_PATH_BIN_64="/opt/SMAW/INTP/bin64"
patch ()
{
for lib64 in $(ls *.so)
do
 cd $PATCH_PATH_LIB_64
 mv $lib64 $lib64.orig
 ln -s $CWD/$lib64
 echo "Patched $CWD/$lib64"
done
cd $PATCH_PATH_BIN_64
mv UMStppd UMStppd.orig
#mv UMSlid UMSlid.orig
mv UMSNSR UMSNSR.orig
ln -s $CWD/UMStppd
ln -s $CWD/UMSNSR
#ln -s $CWD/UMSlid

echo "Patched bins in $CWD"
}

unpatch ()
{
for lib64 in $(ls *.so)
do
 cd $PATCH_PATH_LIB_64
 mv $lib64.orig $lib64
 echo "Un Patched $CWD/$lib64"
done
cd $PATCH_PATH_BIN_64
mv UMStppd.orig UMStppd
#mv UMSlid.orig UMSlid
mv UMSNSR.orig UMSNSR
echo "Un Patched Bins"

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
-bash-4.1$ cat patch_unpatch.sh
#!/bin/bash
CWD=`pwd`
PATCH_PATH_LIB_64="/opt/SMAW/INTP/lib64"
PATCH_PATH_BIN_64="/opt/SMAW/INTP/bin64"
patch ()
{
for lib64 in $(ls *.so)
do
 cd $PATCH_PATH_LIB_64
 mv $lib64 $lib64.orig
 ln -s $CWD/$lib64
 echo "Patched $CWD/$lib64"
done
cd $PATCH_PATH_BIN_64
mv UMStppd UMStppd.orig
#mv UMSlid UMSlid.orig
mv UMSNSR UMSNSR.orig
ln -s $CWD/UMStppd
ln -s $CWD/UMSNSR
#ln -s $CWD/UMSlid

echo "Patched bins in $CWD"
}

unpatch ()
{
for lib64 in $(ls *.so)
do
 cd $PATCH_PATH_LIB_64
 mv $lib64.orig $lib64
 echo "Un Patched $CWD/$lib64"
done
cd $PATCH_PATH_BIN_64
mv UMStppd.orig UMStppd
#mv UMSlid.orig UMSlid
mv UMSNSR.orig UMSNSR
echo "Un Patched Bins"

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
