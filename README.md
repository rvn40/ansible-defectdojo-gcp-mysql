# Defectdojo VM on GCP
This repository used for deploying mysql server using CloudSQL instance on gcp for defectdojo.

# Requirements
Before you use this ansible scripts, make sure you have installed all of these package on your ansible hosts :
- Python3
- Python3-pip
- Git

You need also install all of these packages requirements using pip(pip3 recommended) in sudo mode:
- ansible==2.9.13
- requests >= 2.18.4
- google-auth >= 1.3.0
- docker >= 1.8.0 
- boto
- boto3

Prepare all of neccesary files like serviceaccount, ssh keys, bash, ssl key, etc. Recommended to place those files under directory "files".

