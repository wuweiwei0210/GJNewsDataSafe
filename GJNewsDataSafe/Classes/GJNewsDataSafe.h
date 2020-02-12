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

/// 校验数组中取出的元素是否符合制定的数据类型
/// @param index 位置
/// @param array 数组
/// @param valueClass 指定的类型
+ (id)checkObjectAtIndex:(NSInteger)index array:(NSArray *)array valueClass:(Class)valueClass;

/// 获取数组元素的安全方法
/// @param index 数组中的位置
/// @param array 数组
+ (id)objectAtIndexSafe:(NSInteger)index array:(NSArray *)array;

/// 可变数组添加数组元素的安全方法
/// @param anObject 添加的元素
/// @param array 可变数组
+ (void)addObjectSafe:(id)anObject array:(NSMutableArray *)array;

/// 可变数组插入元素的安全方法
/// @param anObject 插入的元素
/// @param index 插入的位置
/// @param array 可变数组
+ (void)insertObjectSafe:(id)anObject atIndex:(NSUInteger)index array:(NSMutableArray *)array;

/// 可变数组移除元素的安全方法
/// @param index 移除元素的位置
/// @param array 可变数组
+ (void)removeObjectAtIndexSafe:(NSUInteger)index array:(NSMutableArray *)array;

/// 可变数组替换数组中的元素
/// @param index 替换元素的位置
/// @param anObject 替换进数组的元素
/// @param array 可变数组
+ (void)replaceObjectAtIndexSafe:(NSUInteger)index withObject:(id)anObject array:(NSMutableArray *)array;

/// 获取字典value的安全方法
/// @param key 键,这是个变量，有可能为nil，null等其他类型
/// @param dict 不可变字典，可变字典
+ (id)valueForKeySafe:(NSString *)key dict:(NSDictionary *)dict;

/// 可变字典添加元素的安全方法
/// @param object 值
/// @param key 键,只可以为NSString类型
+ (void)setValueSafe:(id)object forKey:(NSString *)key dict:(NSMutableDictionary *)dict;

/// 校验字典中取出的值是否符合指定的类型
/// @param key 键
/// @param dict 字典
/// @param valueClass 指定的类型
+ (id)valueForKeySafe:(NSString *)key dict:(NSDictionary *)dict valueClass:(Class)valueClass;

/// 从字典中获取字符串类型的值
/// @param dict 字典
/// @param key 键
+ (NSString *)getStringValueFromDictSafe:(NSDictionary *)dict key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
