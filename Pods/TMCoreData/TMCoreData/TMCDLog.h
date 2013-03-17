//
//  TMCDLog.h
//  TMCoreData
//
//  Created by Tony Million on 03/12/2012.
//  Copyright (c) 2012 Omnityke. All rights reserved.
//

#ifndef TMCoreData_TMCDLog_h
#define TMCoreData_TMCDLog_h

#ifdef DEBUG
#   define TMCDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define TMCDLog(...)
#endif

#endif
