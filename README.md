# LCEM_HSI
# Local Correntropy Matrix Representation for Hyperspectral Image Classification
This repository is the implementation of our paper: 'Local Correntropy Matrix Representation for Hyperspectral Image Classification', which has been published on IEEE TGRS. It is available at <https://ieeexplore.ieee.org/document/9740677>.

Abstract— The hyperspectral images (HSIs) classification technique has received widespread attention in the field of remote sensing. However, how to achieve satisfactory classification performance in the presence of a large amount of noise is still a problem worthy of consideration. In this article, a local correntropy matrix (LCEM)-based spatial–spectral feature representation method is proposed for HSI classification. Motivated by the successful application of information-theoretic learning (ITL), we propose to adopt correntropy matrix to represent the spatial–spectral features of HSI. Specifically, the dimension reduction is first performed on the original hyperspectral data. Then, for each pixel, we select its local neighbors within a sliding window using cosine distance for the construction of the LCEM. In this way, each pixel can be characterized as an LCEM. Finally, all the correntropy matrices are fed into a support vector machine (SVM) for final classification. In addition, we also propose a novel way to determine the size of the local window based on standard deviation. Because the LCEM as the feature descriptor can characterize discriminative spatial–spectral features, the proposed method has shown great interclass separability and intraclass compactness. Compared with other advanced approaches, the proposed LCEM method has achieved competitive performance in both evaluation indexes and visual effects, especially when the training size is very small.


## Platform

- Windows 10, Matlab 2021b

## Datasets

You can download hyperspectral image datasets at <http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes>

## Usage

Just simply run 'LCEM_demo.m', please note to modify the file path.

We have conducted experiments on three data sets, including Indian Pines, Pavia University, and Salinas datasets.

In addition, if running on other data sets, you can adjust the default parameters 'T_lamdba' and 'K_p' to achieve better performance.

## Acknowledgement

We appreciate Prof. Leyuan Fang for providing the LCMR implementations (https://ieeexplore.ieee.org/document/8323411).

## Citation

If you find this work helpful, please cite our paper:

  @ARTICLE{9740677,   
     author={Zhang, Xinyu and Wei, Yantao and Cao, Weijia and Yao, Huang and Peng, Jiangtao and Zhou, Yicong},   
     journal={IEEE Transactions on Geoscience and Remote Sensing},     
     title={Local Correntropy Matrix Representation for Hyperspectral Image Classification},    
     year={2022},   
     volume={60},   
     number={},   
     pages={1-13},   
     doi={10.1109/TGRS.2022.3162100}}
     
 Thanks for your attention!



