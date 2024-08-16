# SIH Hackathon

## Topic2 :- Design and Development of novel application of cloud optimized GeoTiffs for efficient Streaming and On-the-Fly processing of INSAT Satellite data
### Steps to be followed:
#### Step -1 : Data Acquisation and Preprocessing
#### Step -2 : COG Generation
#### Step -3 : On-the-Fly Manipulation
#### Step -4 : System-Integration-and-Testing

### Desired outcomes:
#### a. A fully functional system capable of generating and serving Cloud Optimized GeoTIFFs from INSAT data.
#### b. Tools for real-time manipulation of multiple spectral bands. Enhanced accessibility and usability of INSAT satellite data for various applications

### framework used :
#### Pytorch
#### Tensorflow framewrok

## Warning these can only be done if you want to/have a gpu in your system

### use docker to create a virtual env to run the file:
#### linux/ubuntu/debain
```bash
sudo docker run --gpus all -it --user root -v /home/SHI:~/path/to/your/directory/SHI tensorflow/tensorflow:latest-gpu bash
```
#### win
```bash
docker run --gpus all -it --user root -v /home/SHI:~/path/to/your/directory/SHI tensorflow/tensorflow:latest-gpu bash
```

[for more info click to visit:](https://www.sih.gov.in/sih2024PS?technology_bucket=QWxs&category=U29mdHdhcmU=&organization=SW5kaWFuIFNwYWNlIFJlc2VhcmNoIE9yZ2FuaXphdGlvbiAoSVNSTyk=&organization_type=QWxs)
