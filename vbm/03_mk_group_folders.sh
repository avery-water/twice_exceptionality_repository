#!/bin/bash

#this directory format only works if run from the code directory, below establishes different directories used, change these directories as you copy files for different analyses 

t1w_scans=../t1w_scans
derivatives=../../derivatives
rawdata=../../../rawdata
controls=../01_group_folders/02_analysis/01_controls
twoe=../01_group_folders/02_analysis/02_2e


while read participant_id age sex group acq; do #reads the participants.tsv file in $rawdata and all columns/variables (participant_id, age, sex, group) 
	[ "$group" == group ] && continue; #skips the header of the participants.tsv file 
	if [[ $group == 2e ]] # only prints control or 2e subjects depending on if you write "control" or "2e" after $group == 
	then 
		ls $t1w_scans | grep -e "$participant_id" | xargs -I {} sudo cp $t1w_scans/{} $twoe/. #this lists all files in $t1w_scans directory, grep then searches the output for only the files including the participant id of the group specified in the last step, xargs references those files as {} and copies the files from $t1w_scans directory to the respective group folder directory (either $controls or $twoe). 
	fi 

done < $rawdata/participants.tsv #ensures participants.tsv file was found and read 
