def model_intrv0(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.2, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv1(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=200, learning_rate=0.05, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv2(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=300, learning_rate=0.2, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv3(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=200, learning_rate=0.05, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}


def model_intrv4(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.1, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv5(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=200, learning_rate=0.05, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv6(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=300, learning_rate=0.05, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv7(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.1, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv8(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.05, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}


def model_intrv9(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.05, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv10(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.05, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv11(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.1, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}


def model_intrv12(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.05, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv13(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.05, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv14(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.05, max_depth=4, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv15(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=100, learning_rate=0.05, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

def model_intrv16(Y_train, X_train, Y_test, X_test, Targ):
    global reslts
    global metrs
    import pandas as pd
    import numpy as np
    import datetime as dt
    import sklearn 
    from sklearn.metrics import mean_squared_error
    from xgboost.sklearn import XGBRegressor
    from sklearn.metrics import mean_squared_error
    model=XGBRegressor(n_estimators=300, learning_rate=0.05, max_depth=2, random_state=0,
                 subsample=0.9, colsample_bytree=1.0, loss='ls').fit(X_train, Y_train)
    model.score(X_test,Y_test)

    pred_Yxgb=model.predict(X_test)
    mse=mean_squared_error(Y_test, pred_Yxgb)  
    nRMSE=np.sqrt(mse)/Targ.mean()
    # nRMSE=np.sqrt(mse)/max(Targ)
    Yts_pd = {'Yts':Y_test,'Ypd': pred_Yxgb}
    Yts_pd = pd.DataFrame(Yts_pd)
    print(mse, nRMSE)
    metrs={'mse':mse ,'nRMSE':nRMSE}
    reslts={'Ypred':pred_Yxgb, 'Yts_pd':Yts_pd}
    return {'Yts_pd':Yts_pd, 'mse':mse, 'nRMSE':nRMSE}

