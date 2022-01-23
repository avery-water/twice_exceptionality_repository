#!/bin/bash 

rawdata=../../../rawdata
output=../01_bet

while read participant_id age sex group acq; do #reads the participants.tsv file in $rawdata and all columns/variables 
	[ "$group" == group ] && continue; #skips the header of participants.tsv file 
	if [[ $acq == uncorr ]] #only prints participant ids with bcorr t1w acquistion listed in t1w column of participants.tsv , I created this custom column because some subjects we are using their uncorrected t1w and some we use bcorr, so this acq column in participants.tsv specifies which t1w to use for each subject
	then 
		echo "running bet on $participant_id" #this will print out what subject bet is running on
		bet2 $rawdata/"$participant_id"/anat/*acq-"$acq"_run-001_T1w.nii.gz $output/"$participant_id"_acq-"$acq"_T1w_f05 -m #this is the command to run bet on a subject with the acq specified above using default fractional intensity threshold of 0.5 ex. add flag "-f 0.15" to change the threshold to 0.15 (less stringent).
	else 
		echo "error: $participant_id does not have T1w specified in the acq column of the participants.tsv file, change the acq in the code to the acq type specified for $participant_id" #this is an error message for subjects who should be run using the other acquistion (if running on bcorr subjects, uncorr subjects will show this error) 
	fi 
done < $rawdata/participants.tsv
