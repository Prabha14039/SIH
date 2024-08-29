import numpy as np
from osgeo import gdal

def calculate_snr(image_array):
    # Calculate the mean signal
    signal_mean = np.mean(image_array)

    # Calculate the standard deviation (noise)
    noise_std = np.std(image_array)

    # Calculate the SNR
    snr = 20 * np.log10(signal_mean / noise_std)

    return snr

def load_image_as_array(image_path):
    dataset = gdal.Open(image_path, gdal.GA_ReadOnly)
    if dataset is None:
        raise Exception(f"Could not open {image_path}")

    band = dataset.GetRasterBand(1)  # Assuming a single-band (grayscale) image
    image_array = band.ReadAsArray()

    return image_array

# Load the original image as a NumPy array using GDAL
original_image_path = '../dataset/ch2_ohr_ncp_20211228T2209123959_d_img_d18.tif'
original_image_array = load_image_as_array(original_image_path)

# Load the denoised image as a NumPy array using GDAL
denoised_image_path1 = '../clahe_enhanced_image1.tif'
denoised_image_array1 = load_image_as_array(denoised_image_path1)

denoised_image_path2 = '../clahe_enhanced_image2.tif'
denoised_image_array2 = load_image_as_array(denoised_image_path2)

original_image_path3 = '../clahe_enhanced_image_wavelet_2.tif'
original_image_array3 = load_image_as_array(original_image_path3)

# Load the denoised image as a NumPy array using GDAL
original_image_path4 = '../clahe_enhanced_image_wavelet_3.tif'
denoised_image_array4 = load_image_as_array(original_image_path4)

snr_original = calculate_snr(original_image_array)
print(f"SNR of the original image: {snr_original:.2f} dB")

# Calculate SNR for the original image
snr_original1 = calculate_snr(denoised_image_array1)
print(f"SNR of the clahe_enhanced_image1.tif: {snr_original1:.2f} dB")

# Calculate SNR for the denoised image
snr_denoised2= calculate_snr(denoised_image_array2)
print(f"SNR of the clahe_enhanced_image2.tif: {snr_denoised2:.2f} dB")

snr_denoised3 = calculate_snr(original_image_array3)
print(f"SNR of the clahe_enhanced_image_wavelet_2.tif: {snr_denoised3:.2f} dB")

snr_denoised4 = calculate_snr(original_image_array3)
print(f"SNR of the clahe_enhanced_image_wavelet_3.tif: {snr_denoised4:.2f} dB")
