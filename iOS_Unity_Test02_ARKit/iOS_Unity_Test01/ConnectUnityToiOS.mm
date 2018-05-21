//
//  ConnectUnityToiOS.m
//  iOS_Unity_Test01
//
//  Created by 魏雷鸣 on 2018/3/15.
//  Copyright © 2018年 ycvr. All rights reserved.
//

#import "ConnectUnityToiOS.h"
#import "YCWebView.h"

@implementation ConnectUnityToiOS

static ConnectUnityToiOS *_instance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[ConnectUnityToiOS alloc] init];
    });
    return _instance;
}

- (void)showWebView {
    YCWebView *webview = [[YCWebView alloc] init];
    [webview show];
}

@end

extern "C" {
    
    void showWebView() {
        [[ConnectUnityToiOS sharedInstance] showWebView];
    }
    
/**
 显示原生视图
 */
void yc_showOriginalView() {
    
}

/**
 添加购物车

 @param productID 商品ID
 */
void yc_addShoppingCart(char *productID) {
    
}

/**
 保存图片到相册

 @param imageData 图片数据
 */
void yc_saveImageToPhotosAlbum(void *imageData) {
    
}

/**
 分享图片到微信会话

 @param imageData 图片数据
 */
void yc_shareImageByWeChatSession(void *imageData) {
    
}

/**
 分享图片到微信朋友圈

 @param imageData 图片数据
 */
void yc_shareImageByWeChatTimeLine(void *imageData) {
    
}

/**
 分享图片到QQ会话

 @param imageData 图片数据
 */
void yc_shareImageByQQSession(void *imageData) {
    
}

/**
 分享图片到新浪微博

 @param imageData 图片数据
 */
void yc_shareImageBySinaWeibo(void *imageData) {
    
}
    
} // extern "C"
