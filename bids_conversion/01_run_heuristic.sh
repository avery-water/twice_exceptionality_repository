#!/bin/sh

for subj in `cat caselist_08-31-2021.txt`

do

#the general command below will run the heudiconv to covert subjects' dicom files to nifti in BIDS formatting, ensure you have created heuristic file before running this command (see WHATIDID.txt for details on how to create a heuristic file). For the twice exceptional studies, dicoms were stored at various directory levels. Rather than reformatting the dicom folders, I ran the heudiconv on various directories. All commands used/ run for twice exceptional study are detailed in notes. When you re-run heudiconv on a subject, you must rename or delete their output in /rawdata/.heudiconv (read more on this issue in WHATIDID.txt).  
sudo docker run --rm -it -v /home/sharky/Documents/2EProject:/base nipy/heudiconv:latest -d /base/0*/*{subject}/dicom_files/*/SCANS/*/DICOM/*.dcm -o /base/rawdata/ -f /base/bids_conversion/heuristic.py -s $subj -c dcm2niix -b --overwrite -g all

###NOTES###

#alternative directory paths to run on depending on dicom structure (replace path in command after the -d flag) 
	#for all controls and some 2E: /base/0*/*{subject}/dicom_files/*/scans/*/resources/DICOM/files/*.dcm 
		#RUN 
		# sudo docker run --rm -it -v /home/sharky/Documents/2EProject:/base nipy/heudiconv:latest -d /base/0*/*{subject}/dicom_files/*/scans/*/resources/DICOM/files/*.dcm -o /base/rawdata/ -f /base/bids_conversion/heuristic.py -s $subj -c dcm2niix -b --overwrite -g all


	#for 2E: /base/0*/*{subject}/dicom_files/*/SCANS/*/DICOM/*.dcm 
		# RUN
		# sudo docker run --rm -it -v /home/sharky/Documents/2EProject:/base nipy/heudiconv:latest -d /base/0*/*{subject}/dicom_files/*/SCANS/*/DICOM/*.dcm -o /base/rawdata/ -f /base/bids_conversion/heuristic.py -s $subj -c dcm2niix -b --overwrite -g all


	#for 2E_006 only: /base/0*/*{subject}/dicom_files/SCANS/*/DICOM/*.dcm
		# RUN 
		# sudo docker run --rm -it -v /home/sharky/Documents/2EProject:/base nipy/heudiconv:latest -d /base/0*/*{subject}/dicom_files/SCANS/*/DICOM/*.dcm -o /base/rawdata/ -f /base/bids_conversion/heuristic.py -s $subj -c dcm2niix -b --overwrite -g all


#sub-020 T1w uncorrected had conversion issues when all three DICOM directories were converted at once, so I individually converted each to resolve the issue using the following
	#for sub-020 BC - RUN (produced bias corrected)
		#sudo docker run --rm -it -v /home/sharky/Documents/2EProject:/base nipy/heudiconv:latest -d /base/0*/*{subject}/dicom_files/unzip/20210714_2_BC/SCANS/*/DICOM/*.dcm -o /base/rawdata/ -f /base/bids_conversion/heuristic.py -s $subj -c dcm2niix -b --overwrite -g all

	#for sub-020 ORIG - RUN (prodcued uncorrected T1) 
		#sudo docker run --rm -it -v /home/sharky/Documents/2EProject:/base nipy/heudiconv:latest -d /base/0*/*{subject}/dicom_files/unzip/20210714_2_ORIG/SCANS/*/DICOM/*.dcm -o /base/rawdata/ -f /base/bids_conversion/heuristic.py -s $subj -c dcm2niix -b --overwrite -g all

	#for sub-020 2 - RUN (produced all other scans) 
		#sudo docker run --rm -it -v /home/sharky/Documents/2EProject:/base nipy/heudiconv:latest -d /base/0*/*{subject}/dicom_files/unzip/20210714_2/SCANS/*/DICOM/*.dcm -o /base/rawdata/ -f /base/bids_conversion/heuristic.py -s $subj -c dcm2niix -b --overwrite -g all

echo 

done



