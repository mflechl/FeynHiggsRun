#!/bin/bash

for i in res/*root; do
  echo $i;
  FILEBASE=`echo $i | sed s#.root##`
  root -b <<<"TFile *_file0 = TFile::Open(\"$i\"); hp->SetScanField(0); hp->Scan(\"tb:deltab\",\"mhp==90\");" >/tmp/tmp.out
  tail -75 /tmp/tmp.out | head -74 >${FILEBASE}-deltab.txt
done


