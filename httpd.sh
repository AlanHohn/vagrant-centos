KS=$1
[[ -n "${KS}" ]] || KS=ks.cfg
if [ ! -f "${KS}" ]
then
  echo "Kickstarter file ${KS} not found, aborting"
  exit 1
fi

date=`date`
size=`ls -l ${KS} | awk '{ print $5 }'`

cat <<EOF
HTTP/1.0 200 OK
Date: $date
Content-Type: text/plain
Content-Length: $size

EOF

cat ks.cfg
