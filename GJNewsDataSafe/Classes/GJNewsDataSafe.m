//
//  GJNewsDataSafe.m
//  GJNewsDataSafe
//
//  Created by 吴伟 on 2020/2/11.
//

#import "GJNewsDataSafe.h"

@implementation GJNewsDataSafe

+ (BOOL)validateJSON:(id)json withValidator:(id)jsonValidator {
    if ([json isKindOfClass:[NSDictionary class]] &&
        [jsonValidator isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = json;
        NSDictionary *validator = jsonValidator;
        BOOL result = YES;
        NSEnumerator *enumerator = [validator keyEnumerator];
        NSString *key;
        while ((key = [enumerator nextObject]) != nil) {
            id value = dict[key];
            id format = validator[key];
            if ([value isKindOfClass:[NSDictionary class]]
                || [value isKindOfClass:[NSArray class]]) {
                result = [self validateJSON:value withValidator:format];
                if (!result) {
                    break;
                }
            } else {
                if ([value isKindOfClass:format] == NO &&
                    [value isKindOfClass:[NSNull class]] == NO) {
                    result = NO;
                    break;
                }
            }
        }
        return result;
    } else if ([json isKindOfClass:[NSArray class]] &&
               [jsonValidator isKindOfClass:[NSArray class]]) {
        NSArray *validatorArray = (NSArray *)jsonValidator;
        if (validatorArray.count > 0) {
            NSArray *array = json;
            NSDictionary *validator = jsonValidator[0];
            for (id item in array) {
                BOOL result = [self validateJSON:item withValidator:validator];
                if (!result) {
                    return NO;
                }
            }
        }
        return YES;
    } else if ([json isKindOfClass:jsonValidator]) {
        return YES;
    } else {
        return NO;
    }
}

+ (id)objectAtIndexSafe:(NSInteger)index array:(NSArray *)array {
    if (!array) {
        return nil;
    }
    
    if (array.count == 0) {
        return nil;
    }
    
    if (index < array.count) {
        return [array objectAtIndex:index];
    }
    return nil;
}

+ (void)addObjectSafe:(id)anObject array:(NSMutableArray *)array {
    if (!array) {
        return;
    }

    if  (anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        [array addObject:anObject];
    } else {
        return;
    }
}

+ (void)insertObjectSafe:(id)anObject atIndex:(NSUInteger)index array:(NSMutableArray *)array {
    if (!array) {
        return;
    }
    
    if  (index <= array.count && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO)  {
        [array insertObject:anObject atIndex:index];
    } else {
        return;
    }
}

+ (void)removeObjectAtIndexSafe:(NSUInteger)index array:(NSMutableArray *)array {
    if (!array) {
        return;
    }
    
    if  (index < array.count)  {
        [array removeObjectAtIndex:index];
    } else {
        return;
    }
}

+ (void)replaceObjectAtIndexSafe:(NSUInteger)index withObject:(id)anObject array:(NSMutableArray *)array {
    if  (index < array.count && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO)  {
        [array replaceObjectAtIndex:index withObject:anObject];
    } else {
        return;
    }
}

+ (void)setValueSafe:(id)object forKey:(NSString *)key dict:(NSMutableDictionary *)dict {
    if (key && [key isKindOfClass:[NSString class]]) {
        [dict setValue:object forKey:key];
    } else {
        return;
    }
}

+ (id)valueForKeySafe:(NSString*)Key dict:(NSDictionary *)dict {
    id object = nil;
    
    // 检查是否字典对象
    if (![dict isMemberOfClass:[NSDictionary class]]) {
        return object;
    }
    
    // 保证key必须为字符串
    if (Key && [Key isKindOfClass:[NSString class]]) {
        object = [dict valueForKey:Key];
    }
    
    return object;
}


@end
