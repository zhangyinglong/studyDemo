//
//  main.m
//  macDemo
//
//  Created by zhangyinglong on 2018/3/31.
//  Copyright © 2018年 zyl04401. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTraceDemo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger count = 0;
        BOOL stop = NO;
        while ( !stop ) {
            // 分配10次，每次10M内存
            size_t len = 10*1024*1024;
            void *ptr = (void *)malloc(len);
            memset(ptr, '\0', len);
            
            // 插入探针
            DTRACEDEMO_MALLOC_LOG(ptr, len);
            if (count > 10) { stop = YES; }
            
            count += 1;
            sleep(2);
        }   
    }
    return 0;
}


