# Predicting Motor Score Changes Using LFP Signals in Parkinson's Disease
This project aims to predict changes in motor performance (pre- and post-Deep Brain Stimulation [DBS]) using Local Field Potential (LFP) recordings from Parkinson's Disease patients. The dataset consists of LFP signals from 12 patients, each sampled at 250 Hz under two conditions: baseline and post-DBS stimulation.

Key features like beta power difference and stability were extracted to train various regression models, including Random Forest, XGBoost, and Ensemble models. The Random Forest and Ensemble models achieved the best performance with accuracies above 92%. Additionally, data augmentation techniques like SMOTE were used to enhance model generalization.

Machine learning code, feature extraction scripts, and detailed analysis are provided in the repository.
