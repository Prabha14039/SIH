@echo off

REM Paths
set INPUT_IMAGE=ch2_ohr_ncp_20211222T2023166276_d_img_d32.tif
set TEMP_IMAGE=ch2_ohr_ncp_20211222T2023166276_d_img_d32_temp.tif
set MODIFIED_IMAGE=ch2_ohr_ncp_20211222T2023166276_d_img_d32_modified.tif
set FINAL_IMAGE=ch2_ohr_ncp_20211222T2023166276_d_img_d32_final.tif
set PYTHON_SCRIPT=extract.py

REM Run the Python script to extract values
for /f "tokens=*" %%i in ('python "%PYTHON_SCRIPT%"') do (
    set "output=%%i"
)

REM Extract values from Python script output
for /f "tokens=2 delims=:" %%a in ('echo %output% ^| findstr "Width:"') do set "IMAGE_WIDTH=%%a"
for /f "tokens=2 delims=:" %%a in ('echo %output% ^| findstr "Height:"') do set "IMAGE_HEIGHT=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Upper Left Latitude:"') do set "UPPER_LEFT_LAT=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Upper Left Longitude:"') do set "UPPER_LEFT_LON=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Upper Right Latitude:"') do set "UPPER_RIGHT_LAT=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Upper Right Longitude:"') do set "UPPER_RIGHT_LON=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Lower Left Latitude:"') do set "LOWER_LEFT_LAT=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Lower Left Longitude:"') do set "LOWER_LEFT_LON=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Lower Right Latitude:"') do set "LOWER_RIGHT_LAT=%%a"
for /f "tokens=3 delims=: " %%a in ('echo %output% ^| findstr "Lower Right Longitude:"') do set "LOWER_RIGHT_LON=%%a"

REM Convert the latitude and longitude to GCP format
set "GCP1=0 0 %UPPER_LEFT_LON% %UPPER_LEFT_LAT%"  REM Upper-left corner
set "GCP2=%IMAGE_WIDTH% 0 %UPPER_RIGHT_LON% %UPPER_RIGHT_LAT%"  REM Upper-right corner
set "GCP3=0 %IMAGE_HEIGHT% %LOWER_LEFT_LON% %LOWER_LEFT_LAT%"  REM Lower-left corner
set "GCP4=%IMAGE_WIDTH% %IMAGE_HEIGHT% %LOWER_RIGHT_LON% %LOWER_RIGHT_LAT%"  REM Lower-right corner

REM Step 1: Use gdal_translate to apply the GCPs to the image
gdal_translate -of GTiff -gcp %GCP1% -gcp %GCP2% -gcp %GCP3% -gcp %GCP4% "%INPUT_IMAGE%" "%TEMP_IMAGE%"

REM Step 2: Use gdalwarp to transform the image with cubic resampling and TPS (Thin Plate Spline)
gdalwarp -r cubic -tps -co COMPRESS=NONE "%TEMP_IMAGE%" "%MODIFIED_IMAGE%"

REM Step 3: Reproject the image using gdalwarp to a stereographic projection
gdalwarp -overwrite -s_srs "+proj=longlat +a=1737400 +b=1737400 +no_defs" -t_srs "+proj=stere +lat_0=-90 +lon_0=0 +k=1 +x_0=0 +y_0=0 +a=1737400 +b=1737400 +units=m +no_defs" -dstnodata 0 -of GTiff "%MODIFIED_IMAGE%" "%FINAL_IMAGE%"

echo Processing complete. Final image saved as %FINAL_IMAGE%.

