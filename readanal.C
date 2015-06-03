//do: root -l <<<".x readanal.C(\"${FILE}\")" without .dat extension

//#mhp  tb deltab  brt-bHp  brHp-taunu  brHp-tb  brHp-cs  brHp-hW  brHp-HW  brHp-AW  brHp-nc  brHp-n1c1  brHp-n2c1  brHp-n3c1  brHp-n4c1  brHp-n1c2  brHp-n2c2  brHp-n3c2  brHp-n4c2  scen
void readanal(TString& file)
{
  TFile *f = new TFile(file+".root","RECREATE");
  TTree *matchig = new TTree("hp","hp");
  Long64_t nlines1 = matchig->ReadFile(file+".dat","mhp:tb:deltab:brt_bHp:brHp_taunu:brHp_tb:brHp_cs:brHp_hW:brHp_HW:brHp_AW:brHp_nc:brHp_n1c1:brHp_n2c1:brHp_n3c1:brHp_n4c1:brHp_n1c2:brHp_n2c2:brHp_n3c2:brHp_n4c2:scen/C");
  cout << "Found " << nlines1 << " lines in "<< file+".dat" <<endl;
  f->Write();
  cout << "Saved to " << file+".root" <<endl;
}
