import os


def create_key(template, outtype=('nii.gz',), annotation_classes=None):
    if template is None or not template:
        raise ValueError('Template must be a valid format string')
    return template, outtype, annotation_classes


def infotodict(seqinfo):
    """Heuristic evaluator for determining which runs belong where

    allowed template fields - follow python string module:

    item: index within category
    subject: participant id
    seqitem: run number during scanning
    subindex: sub index within group
    """

    dti_ap = create_key('sub-{subject}/dwi/sub-{subject}_dir-ap_run-{item:03d}_dwi')
    dti_pa = create_key('sub-{subject}/dwi/sub-{subject}_dir-pa_run-{item:03d}_dwi')
    rest = create_key('sub-{subject}/func/sub-{subject}_task-rest_run-{item:03d}_bold')
    t1 = create_key('sub-{subject}/anat/sub-{subject}_acq-uncorr_run-{item:03d}_T1w')
    t1b = create_key('sub-{subject}/anat/sub-{subject}_acq-bcorr_run-{item:03d}_T1w')
    t2 = create_key('sub-{subject}/anat/sub-{subject}_run-{item:03d}_T2w')

    info = {dti_ap: [], dti_pa: [], rest: [], t1: [], t1b: [], t2: []}
 

    for idx, s in enumerate (seqinfo):
        if (s.dim1 == 256) and (s.dim3 == 2838) and ('DTI' in s.series_description):
            info[dti_ap].append(s.series_id)
        if (s.dim1 == 256) and (s.dim3 == 2752) and ('DTI' in s.series_description):
            info[dti_ap].append(s.series_id)
        if (s.dim1 == 256) and (s.dim3 == 602) and ('DTI' in s.series_description):
            info[dti_pa].append(s.series_id)
        if (s.dim1 == 256) and (s.dim3 == 2475) and ('DTI' in s.series_description):
            info[dti_ap].append(s.series_id)
        if (s.dim1 == 256) and (s.dim3 == 525) and ('DTI' in s.series_description):
            info[dti_pa].append(s.series_id)
        if (s.dim1 == 128) and (s.dim3 == 2040) and ('fMRI' in s.series_description):
            info[rest].append(s.series_id)
        if (s.dim1 == 128) and (s.dim3 == 12342) and ('fMRI' in s.series_description):
            info[rest].append(s.series_id)
        if (s.dim1 == 128) and (s.dim3 == 10692) and ('fMRI' in s.series_description):
            info[rest].append(s.series_id)
        if (s.dim1 == 64) and (s.dim3 == 11137) and ('fMRI' in s.series_description):
            info[rest].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 288) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 260) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 204) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 352) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 336) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 286) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 326) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 236) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 296) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 396) and ('mprage' in s.sequence_name):
            info[t1].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 288) and ('300-JM' in s.series_id):
            info[t1b].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 288) and ('500-JM' in s.series_id):
            info[t1b].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 522) and ('300-JM' in s.series_id):
            info[t1b].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 202) and ('300-JM' in s.series_id):
            info[t1b].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 260) and ('300-JM' in s.series_id):
            info[t1b].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 288) and ('400-JM' in s.series_id):
            info[t1b].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 204) and ('40003-JM' in s.series_id):
            info[t1b].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 286) and ('T2' in s.series_description):
            info[t2].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 264) and ('T2' in s.series_description):
            info[t2].append(s.series_id)
        if (s.dim1 == 256) and (s.dim3 == 154) and ('T2' in s.series_description):
            info[t2].append(s.series_id)
        if (s.dim1 == 512) and (s.dim3 == 316) and ('T2' in s.series_description):
            info[t2].append(s.series_id)


    return info
