def XGB_model_intrv_CV(df_feats, Targ):
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from sklearn import metrics   ##Additional scklearn functions
    from sklearn.model_selection import cross_validate
    from sklearn.model_selection import GridSearchCV   #Perforing grid search
    from xgboost.sklearn import XGBRegressor
    xgb_model = XGBRegressor()
    
    Xgrid_train=df_feats.loc['1/1/2016':'12/31/2017']
    Ygrid_train=Targ.loc['1/1/2016':'12/31/2017']
    
    # test_params = {'n_estimators':[100, 200, 300, 400, 500], 'learning_rate':[0.05,0.1, 0.2, 0.3, 0.5], 
    #                'max_depth':[2,4,8,12],'subsample': [0.9, 1.0], 'colsample_bytree': [0.9, 1.0]}
    
    test_params = {'n_estimators':[100, 200, 300, 500], 'learning_rate':[0.05, 0.1, 0.2], 
                   'max_depth':[2,4,8,10]}
    
    grid = GridSearchCV(estimator = xgb_model, param_grid = test_params, n_jobs=4, 
                        scoring='neg_mean_squared_error',cv=2, verbose=3)
    
    grid.fit(Xgrid_train,Ygrid_train)
    print(grid.best_params_)
    df_best_parms=grid.best_params_
    return df_best_parms


