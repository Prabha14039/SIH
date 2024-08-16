# SIH Hackathon

## Topic1 :- Enhancment of Permanenetly Shadowed Region (PSR) of Lunar Craters Captured by OHRC of Chandrayan -2
### Desired Outcomes
#### Desired Outcome: Software for generating low light image enhancement.


## Topic2 :- Design and Development of novel application of cloud optimized GeoTiffs for efficient Streaming and On-the-Fly processing of INSAT Satellite data
### Steps to be followed:
#### Step -1 : Data Acquisation and Preprocessing
#### Step -2 : COG Generation
#### Step -3 : On-the-Fly Manipulation
#### Step -4 : System-Integration-and-Testing

### Desired outcomes:
#### a. A fully functional system capable of generating and serving Cloud Optimized GeoTIFFs from INSAT data.
#### b. Tools for real-time manipulation of multiple spectral bands. Enhanced accessibility and usability of INSAT satellite data for various applications

[click here for more info:](https://www.sih.gov.in/sih2024PS?technology_bucket=QWxs&category=U29mdHdhcmU=&organization=SW5kaWFuIFNwYWNlIFJlc2VhcmNoIE9yZ2FuaXphdGlvbiAoSVNSTyk=&organization_type=QWxs)

```bash
git clone https://github.com/Prabha14039/SIH.git
cd SIH
```

### Topic1

```bash
git checkout Topic1
```

### Topic2

```bash
git checkout Topic2
```

### main

```bash
git checkout main
```

### framework used :
#### Pytorch
#### Tensorflow framewrok

## GPU Setup for docker

### *Note the following commands below are only for those who wish to use GPU on docker the step by step apporach is given below if you are intersted in doing another way you can do it*
### *You can use this to run you program*
### *GPUS are used mostly in training and inference for dealing with any DL model hence GPU is prefered*

## !!!Warning these can only be done if you want to/have a gpu in your system

### use docker to create a virtual env to run the file:

#### linux/ubuntu/debain
```bash
sudo docker run --gpus all -it --user root -v ~/path/to/your/directory/SIH:/home/SIH tensorflow/tensorflow:latest-gpu bash
```

#### Add the path of the SIH directory

#### windows
```bash
docker run --gpus all -it --user root -v ~/path/to/your/directory/SIH:/home/SIH tensorflow/tensorflow:latest-gpu bash
```

#### To install some packages when in tensordlow
```bash
apt-get update
apt-get install git nano
cd /path/to/your/direc/SIH
```

#### if this error occur

```bash
fatal: detected dubious ownership in repository at '/path/to/your/direc/SIH'
To add an exception for this directory, call:

        git config --global --add safe.directory /path/to/your/direc/SIH
```

#### do this

```bash
git config --global --add safe.directory /path/to/your/directory/SIH
```
#### after this you will be able to checkout easily into other branches

#### if you exit the existing environment then you would have to do all the proccess again



