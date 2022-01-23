#!/bin/sh

for bcorr in `cat bcorr_caselist_10-04-2021.txt`

do 

for uncorr in `cat uncorr_caselist_10-04-2021.txt`

do 

sudo cp ~/Documents/2EProject/rawdata/sub-"$bcorr"/anat/sub-"$bcorr"_acq-bcorr_run-001_T1w.nii.gz ~/Documents/2EProject/derivatives/vbm/t1w_scans/.

sudo cp ~/Documents/2EProject/rawdata/sub-"$uncorr"/anat/sub-"$uncorr"_acq-uncorr_run-001_T1w.nii.gz ~/Documents/2EProject/derivatives/vbm/t1w_scans/.

echo; done

done
