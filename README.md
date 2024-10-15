# Predicting Motor Score Changes Using LFP Signals in Parkinson's Disease

This project aims to predict changes in motor performance (pre- and post-Deep Brain Stimulation [DBS]) using Local Field Potential (LFP) recordings from Parkinson's Disease patients. The dataset consists of LFP signals from 12 patients, each sampled at 250 Hz under two conditions: baseline and post-DBS stimulation.

Key features like beta power difference and stability were extracted to train various regression models, including Random Forest, XGBoost, and Ensemble models. The Random Forest and Ensemble models achieved the best performance with accuracies above 92%. Additionally, data augmentation techniques like SMOTE were used to enhance model generalization.

Machine learning code, feature extraction scripts, and detailed analysis are provided in the repository.

---

## Parkinson's Disease Motor Score Prediction Using LFP Signals

This project focuses on predicting motor score changes in Parkinson's Disease patients using Local Field Potential (LFP) EEG recordings. The dataset consists of recordings collected before and after Deep Brain Stimulation (DBS) and includes relevant features for prediction.

### Dataset

- **`patient_data.mat`**: Contains raw LFP recordings from 12 Parkinson's Disease patients, sampled at 250 Hz. Each patient has multiple trials recorded under two conditions:
  - **lfp0**: Baseline recordings (before DBS stimulation).
  - **lfp2**: Post-DBS stimulation recordings.
  - **motor_performance_change**: Percentage change in motor score, the target variable for prediction.

### Data Preprocessing

- **Filtering**: LFP signals were bandpass filtered between 13-30 Hz to isolate the beta frequency band, a known biomarker in Parkinson’s Disease.

### Feature Extraction

- **Beta Power Difference (power_diff)**: Difference in beta power between lfp0 and lfp2.
- **Beta Power Stability (beta_power_stab_lfp0)**: Stability of beta power during baseline (lfp0).
- **Data Splitting**: The preprocessed data was stored in `data_df`, ready for training machine learning models.

### Model Training

The preprocessed features were used to train various machine learning models to predict motor score changes:

- **Random Forest Regressor**: Achieved an accuracy of 92.7%.
- **XGBoost Regressor**: Achieved an accuracy of 91.8%.
- **Ensemble Learning**: Achieved the best performance with an accuracy of 92.9%.
- Other models include Decision Tree, Gradient Boosting, Support Vector Regression (SVR), and Linear Regression.

### Results

The models were evaluated using metrics such as:

- **Accuracy**: Overall prediction performance.
- **Mean Squared Error (MSE)**: Measures the average squared difference between actual and predicted values.
- **R² Score**: Coefficient of determination, representing the goodness of fit for the model.

The **Random Forest** and **Ensemble models** yielded the highest accuracy, with a significant reduction in error compared to other models.

---

## How to Run

1. Clone the repository and load the `patient_data.mat` file for raw EEG recordings.
2. Run the `parkinson.ipynb` notebook to preprocess the data and train machine learning models.
3. **Filtering and Feature Extraction**: These steps were performed in MATLAB. The code for filtering and feature extraction can be found in the MATLAB folder.
4. The notebook includes steps for data splitting, model training, and evaluation.
