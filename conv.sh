#!/bin/bash
#conv.sh 1 br3l.dat 3l.out

scen=( lightstau lightstop lowMH mhmaxup mhmodm mhmodp tauphobic lightstop-new );
iscen=0;

if [ $# -ge 1 ]; then iscen=$1; fi

FILE="${scen[$iscen]}.dat";
INFILE="${scen[$iscen]}.out";
FILE="res/${FILE}";
INFILE="res/${INFILE}";

if [ $# -ge 2 ]; then INFILE=$2; fi
if [ $# -ge 3 ]; then FILE=$3; fi

FILEBASE=`echo $FILE | sed s#.dat##`
#head -70 mhmax.out | awk {'print "mhp "$1" tb "$2" BRtHp "$6" hp2tau "$9" hp2tb "$12" hp2cs "$15" hp2hW "$18" hp2HW "$21" hp2AW "$24" hp2n1c1 "$27 '} | tail -3

echo "#mhp  tb  deltab brt-bHp  brHp-taunu  brHp-tb  brHp-cs  brHp-hW  brHp-HW  brHp-AW  brHp-nc  brHp-n1c1  brHp-n2c1  brHp-n3c1  brHp-n4c1  brHp-n1c2  brHp-n2c2  brHp-n3c2  brHp-n4c2  scen" >${FILE}


while read line; do
  mhp=`echo $line | awk {'print $1'}`
  tb=`echo $line | awk {'print $2'}`
  deltab=`echo $line | awk {'print $3'}`
  
  brtbHp=`echo $line | awk {'print $6'}`
  brHptaunu=`echo $line | awk {'print $9'}`
  brHptb=`echo $line | awk {'print $12'}`
  brHpcs=`echo $line | awk {'print $15'}`
  brHphW=`echo $line | awk {'print $18'}`
  brHpHW=`echo $line | awk {'print $21'}`
  brHpAW=`echo $line | awk {'print $24'}`

  brHpn1c1=`echo $line | awk {'print $27'}`
  brHpn2c1=`echo $line | awk {'print $30'}`
  brHpn3c1=`echo $line | awk {'print $33'}`
  brHpn4c1=`echo $line | awk {'print $36'}`
  brHpn1c2=`echo $line | awk {'print $39'}`
  brHpn2c2=`echo $line | awk {'print $42'}`
  brHpn3c2=`echo $line | awk {'print $45'}`
  brHpn4c2=`echo $line | awk {'print $48'}`

  brHpnc=`echo "scale=3; ${brHpn1c1}+${brHpn2c1}+${brHpn3c1}+${brHpn4c1}+${brHpn1c2}+${brHpn2c2}+${brHpn3c2}+${brHpn4c2}" | sed s#E#*10^#g | bc`

  echo "$mhp  $tb $deltab  $brtbHp  $brHptaunu  $brHptb  $brHpcs  $brHphW  $brHpHW  $brHpAW  $brHpnc  $brHpn1c1  $brHpn2c1  $brHpn3c1  $brHpn4c1  $brHpn1c2  $brHpn2c2  $brHpn3c2  $brHpn4c2  ${scen[$iscen]}" >>${FILE}
done < $INFILE

root -l <<<".x readanal.C(\"${FILEBASE}\")"

#root -l $FILE <<<"hp->SetScanField\(1e5\); hp->Scan\(\"tb:deltab\"\)" >${FILE}2

echo "#delta b values as f(tan beta) using FeynHiggs 2.9.5, contact: Martin Flechl"  >${FILE}2
echo "https://twiki.cern.ch/twiki/bin/view/LHCPhysics/LHCHXSWGMSSMCharged"          >>${FILE}2
cat $FILE | awk '{print $2" "$3}'                                              >>${FILE}2
