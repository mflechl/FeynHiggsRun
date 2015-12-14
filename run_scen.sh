#!/bin/bash
#iscen=0;
#scen=( mhmaxup mhmodm mhmodp lightstau lightstop lowMH tauphobic lightstop-new );
scen=( lightstop-new );
#fhexec="../FeynHiggs-2.9.5/i686-Linux/bin/FeynHiggs" #not tested yet, before github submission
#fhexec="${HOME}/analysis/FeynHiggs/FeynHiggs-2.9.5/i686-Linux/bin/FeynHiggs" #not tested yet, before github submission
fhexec="FeynHiggs2.9.5_Linux"

for iscen in ${scen[@]}; do
  echo "${fhexec} scenarios/${iscen}-LHCHXSWG.in | table MHp TB Deltab t-Hp-b Hp-nu_tau-tau Hp-t-b Hp-c-s Hp-h0-W Hp-HH-W Hp-A0-W Hp-Neu1-Cha1 Hp-Neu2-Cha1 Hp-Neu3-Cha1 Hp-Neu4-Cha1 Hp-Neu1-Cha2 Hp-Neu2-Cha2 Hp-Neu3-Cha2 Hp-Neu4-Cha2 >res/${iscen}.out";
  ${fhexec} scenarios/${iscen}-LHCHXSWG.in | table MHp TB Deltab t-Hp-b Hp-nu_tau-tau Hp-t-b Hp-c-s Hp-h0-W Hp-HH-W Hp-A0-W Hp-Neu1-Cha1 Hp-Neu2-Cha1 Hp-Neu3-Cha1 Hp-Neu4-Cha1 Hp-Neu1-Cha2 Hp-Neu2-Cha2 Hp-Neu3-Cha2 Hp-Neu4-Cha2 >res/${iscen}.out;
done
