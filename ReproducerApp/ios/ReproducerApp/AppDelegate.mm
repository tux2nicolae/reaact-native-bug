#import "AppDelegate.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTLinkingManager.h>
#import <React/RCTConvert.h>
#import <ReactAppDependencyProvider/RCTAppDependencyProvider.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{  
  NSDictionary *appProperties = [self prepareInitialProps];
  
  self.reactNativeFactory = [[RCTReactNativeFactory alloc] initWithDelegate:self];
  self.dependencyProvider = [RCTAppDependencyProvider new];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

  [self.reactNativeFactory startReactNativeWithModuleName:@"ReproducerApp"
                                                 inWindow:self.window
                                                 initialProperties:appProperties
                                                 launchOptions:launchOptions];

  return YES;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];
  return initProps;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

#pragma mark - BUG HERE

- (void)loadBundleAtURL:(NSURL *)sourceURL
             onProgress:(RCTSourceLoadProgressBlock)onProgress
             onComplete:(RCTSourceLoadBlock)loadCallback
{
  NSLog(@"This should be called!!!");

  [RCTJavaScriptLoader loadBundleAtURL:sourceURL onProgress:onProgress onComplete:loadCallback];
}

@end
