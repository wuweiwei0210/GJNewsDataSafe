//
//  GJNewsDataSafe.h
//  GJNewsDataSafe
//
//  Created by 吴伟 on 2020/2/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface GJNewsDataSafe : NSObject

/// 校验服务器返回的数据内容
/// @param json 服务器返回的数据
/// @param jsonValidator 校验用的数据类型
+ (BOOL)validateJSON:(id)json withValidator:(id)jsonValidator;

@end

NS_ASSUME_NONNULL_END
