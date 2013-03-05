/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/BackRow.framework/BackRow
 */

#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
#import <SystemConfiguration/SystemConfiguration.h>

// Not part of the dump! We provide a layer of constants ourselves.
#import "BackRow+Constants.h"

#import "AppleTV-Structs.h"

#import "BRATVDataImageProxy.h"
#import "BRATVMediaItem.h"
#import "BRAccount.h"
#import "BRAccountManager.h"
#import "BRAccountMenuItemPopulator.h"
#import "BRAccountType.h"
#import "BRActionShelfControl.h"
#import "BRAggregateDataStore.h"
#import "BRAirTunesMetadataPopulator.h"
#import "BRAirportManager.h"
#import "BRAirportNetwork.h"
#import "BRAirportNetworksControlFactory.h"
#import "BRAirportNetworksProvider.h"
#import "BRAlertControl.h"
#import "BRAlertController.h"
#import "BRAlignmentAdjustingTextControl.h"
#import "BRAnimation.h"
#import "BRAppliance.h"
#import "BRApplianceBrowserControlFactory.h"
#import "BRApplianceBrowserProtocol.h"
#import "BRApplianceCategory.h"
#import "BRApplianceCategoryListProvider.h"
#import "BRApplianceCategoryProvider.h"
#import "BRApplianceColumnControl.h"
#import "BRApplianceInfo.h"
#import "BRApplianceManager.h"
#import "BRApplianceProvider.h"
#import "BRApplication.h"
#import "BRApplicationStackManager.h"
#import "BRAsyncImageControl.h"
#import "BRAsyncTask.h"
#import "BRAsyncTaskContext.h"
#import "BRAsynchronousControllerViewLoading.h"
#import "BRAudioDeviceManager.h"
#import "BRAudioVisualizerControl.h"
#import "BRAudiobookMetadataPopulator.h"
#import "BRAuthenticationController.h"
#import "BRAuthenticationErrorResolutionController.h"
#import "BRAuthenticationManager.h"
#import "BRAuthenticator.h"
#import "BRAuthenticatorDelegate.h"
#import "BRAutoScrollingTextControl.h"
#import "BRBackgroundTask.h"
#import "BRBackgroundTaskManager.h"
#import "BRBaseAppliance.h"
#import "BRBaseMediaAsset.h"
#import "BRBaseMediaCollection.h"
#import "BRBaseMediaProvider.h"
#import "BRBaseMenuItemLayerPopulator.h"
#import "BRBaseMetadataPopulator.h"
#import "BRBaseParserDelegate.h"
#import "BRBlockBackgroundTask.h"
#import "BRBlueGlowSelectionLozengeLayer.h"
#import "BRBlueGlowSelectionLozengeLayerBacking.h"
#import "BRBoxControl.h"
#import "BRBoxListControl.h"
#import "BRBrickCursorLayer.h"
#import "BRButtonControl.h"
#import "BRCappedFileCache.h"
#import "BRChapter.h"
#import "BRChapterGridItem.h"
#import "BRChapterGroup.h"
#import "BRChapterGroupProvider.h"
#import "BRChapterSubtitleAudioPickerControl.h"
#import "BRChapterUtilities.h"
#import "BRCollectionMenuItemPopulator.h"
#import "BRComboMenuItemLayer.h"
#import "BRContainerViewCell.h"
#import "BRContainerViewDataCache.h"
#import "BRContainerViewSectionInfo.h"
#import "BRContentController.h"
#import "BRContextMenuControl.h"
#import "BRContextMenuUtility.h"
#import "BRControl.h"
#import "BRControlFactory.h"
#import "BRControlHeightFactory.h"
#import "BRControlLayer.h"
#import "BRControlMediator.h"
#import "BRController.h"
#import "BRControllerStack.h"
#import "BRCoverArtImageLayer.h"
#import "BRCoverArtPreviewControl.h"
#import "BRCrossfadeTransitionControl.h"
#import "BRCursorControl.h"
#import "BRCursorLayer.h"
#import "BRCyclerControl.h"
#import "BRCyclerDataSource.h"
#import "BRCyclerDelegate.h"
#import "BRDAAPMediaHost.h"
#import "BRDarwinNotificationTranslator.h"
#import "BRDataQueryController.h"
#import "BRDataStore.h"
#import "BRDataStoreProvider.h"
#import "BRDefaultAuthenticationManager.h"
#import "BRDeletable.h"
#import "BRDependentProvider.h"
#import "BRDescriptionOverlayControl.h"
#import "BRDetailedMediaControl.h"
#import "BRDetailedMetadataControl.h"
#import "BRDetailedMusicMetadataControl.h"
#import "BRDeviceKeyboardMessage.h"
#import "BRDialog.h"
#import "BRDisplayInfoLoader.h"
#import "BRDisplayManager.h"
#import "BRDisplayMode.h"
#import "BRDividerControl.h"
#import "BRDividerProvider.h"
#import "BRDotArrayControl.h"
#import "BRDownload.h"
#import "BRDownloadManager.h"
#import "BRDownloadPlayableAlertControl.h"
#import "BRDropShadowControl.h"
#import "BRErrorControl.h"
#import "BREvent.h"
#import "BREventChapter.h"
#import "BREventDelegate.h"
#import "BRFadeMaskLayer.h"
#import "BRFadeThroughBlackTransitionControl.h"
#import "BRFeatureManager.h"
#import "BRFileManager.h"
#import "BRFocusContainer.h"
#import "BRFocusEngine.h"
#import "BRFocusableImageControl.h"
#import "BRFontCache.h"
#import "BRFrontControl.h"
#import "BRFullScreenPhotoController.h"
#import "BRFullScreenPhotoControllerDelegate.h"
#import "BRGenre.h"
#import "BRGridControl.h"
#import "BRGridView.h"
#import "BRHIDEvent.h"
#import "BRHeaderControl.h"
#import "BRHexInputMethod.h"
#import "BRHiddenSelectionMenuItem.h"
#import "BRHomeShareManager.h"
#import "BRHorizontalSegmentedWidget.h"
#import "BRIPConfiguration.h"
#import "BRITunesLibraryUtilitiesAccess.h"
#import "BRITunesUtilities.h"
#import "BRIconPreviewController.h"
#import "BRImage.h"
#import "BRImageAndSyncingPreviewController.h"
#import "BRImageControl.h"
#import "BRImageLoadDelegate.h"
#import "BRImageLoadJob.h"
#import "BRImageLoader.h"
#import "BRImageManager.h"
#import "BRImageProxy.h"
#import "BRImageProxyProvider.h"
#import "BRImageWithHeaderControl.h"
#import "BRInitialImage.h"
#import "BRInputMethod.h"
#import "BRInternetRadioImageProxy.h"
#import "BRInvalidatable.h"
#import "BRInvocationAnimationDelegate.h"
#import "BRInvocationSelectionHandler.h"
#import "BRJapaneseInputMethod.h"
#import "BRKeyValueObservationEntry.h"
#import "BRKeyValueObservingRegistry.h"
#import "BRKeyboard.h"
#import "BRKeyboardActionControl.h"
#import "BRKeyboardCandidates.h"
#import "BRKeyboardControl.h"
#import "BRKeyboardHex.h"
#import "BRKeyboardHistory.h"
#import "BRKeyboardHistoryControl.h"
#import "BRKeyboardJapaneseRomanSquare.h"
#import "BRKeyboardJapaneseRomanSymbols.h"
#import "BRKeyboardJapaneseSquareHiragana.h"
#import "BRKeyboardNumbers.h"
#import "BRKeyboardRomanLogIn.h"
#import "BRKeyboardRomanLogInSeventhRow.h"
#import "BRKeyboardRomanLogInSymbols.h"
#import "BRKeyboardRomanLogInUpperCase.h"
#import "BRKeyboardRomanSearch.h"
#import "BRKeyboardRomanSearchSymbols.h"
#import "BRKeyboardRomanSearchUpperCase.h"
#import "BRKeyboardRomanSquare.h"
#import "BRKeyboardRomanWeb.h"
#import "BRKeyboardRomanWebKeyContainer.h"
#import "BRLegacyProvider.h"
#import "BRListControl.h"
#import "BRListControlMonitor.h"
#import "BRListView.h"
#import "BRLocalizedStringManager.h"
#import "BRLogManager.h"
#import "BRMainMenuControl.h"
#import "BRMainMenuControlFactory.h"
#import "BRMainMenuController.h"
#import "BRMainMenuImageControl.h"
#import "BRMainMenuSelectionHandler.h"
#import "BRMainMenuShelfErrorControl.h"
#import "BRMappingDictionary.h"
#import "BRMarimbaMenuView.h"
#import "BRMarimbaSlideshowControl.h"
#import "BRMarimbaSlideshowMusicServerSetting.h"
#import "BRMarqueeScrollingDelegate.h"
#import "BRMarqueeStack.h"
#import "BRMarqueeTextControl.h"
#import "BRMediaAccessUtilities.h"
#import "BRMediaAsset.h"
#import "BRMediaAssetDerivesMediaURL.h"
#import "BRMediaAssetDigitalExtraInfo.h"
#import "BRMediaAssetExpiryInfo.h"
#import "BRMediaCollection.h"
#import "BRMediaCollectionEditor.h"
#import "BRMediaCollectionGeniusInfo.h"
#import "BRMediaCollectionGeniusMixInfo.h"
#import "BRMediaCollectionType.h"
#import "BRMediaHost.h"
#import "BRMediaHostConnectionDialog.h"
#import "BRMediaHostDisconnectedDialog.h"
#import "BRMediaHostEvent.h"
#import "BRMediaHostState.h"
#import "BRMediaHostStateAvailable.h"
#import "BRMediaHostStateMountFailed.h"
#import "BRMediaHostStateMounted.h"
#import "BRMediaHostStateMounting.h"
#import "BRMediaHostStateUnavailable.h"
#import "BRMediaHostStateUnmounting.h"
#import "BRMediaHostWaitDialogFactory.h"
#import "BRMediaIdentityProtocol.h"
#import "BRMediaListControl.h"
#import "BRMediaLoading.h"
#import "BRMediaMenuController.h"
#import "BRMediaMenuView.h"
#import "BRMediaObject.h"
#import "BRMediaObjectButtonSelectionHandler.h"
#import "BRMediaObjectControlFactory.h"
#import "BRMediaObjectProvider.h"
#import "BRMediaParadeControl.h"
#import "BRMediaParadeLayer.h"
#import "BRMediaParadeProvider.h"
#import "BRMediaPlayer.h"
#import "BRMediaPlayerController.h"
#import "BRMediaPlayerControllerTransitionDelegate.h"
#import "BRMediaPlayerEventHandler.h"
#import "BRMediaPlayerManager.h"
#import "BRMediaPlayerWaitControl.h"
#import "BRMediaPreviewControlFactory.h"
#import "BRMediaProvider.h"
#import "BRMediaShareListController.h"
#import "BRMediaShelfView.h"
#import "BRMediaShelfViewCell.h"
#import "BRMediaType.h"
#import "BRMediaUtilities.h"
#import "BRMediatorProvider.h"
#import "BRMenuController.h"
#import "BRMenuItem.h"
#import "BRMenuItemLayerFactory.h"
#import "BRMenuItemMediator.h"
#import "BRMenuListItemProvider.h"
#import "BRMenuSavedState.h"
#import "BRMenuView.h"
#import "BRMercantile.h"
#import "BRMerchant.h"
#import "BRMerchantInfo.h"
#import "BRMetadataContainer.h"
#import "BRMetadataControl.h"
#import "BRMetadataDetailChunkControl.h"
#import "BRMetadataDetailControl.h"
#import "BRMetadataLineLayer.h"
#import "BRMetadataLinesLayer.h"
#import "BRMetadataLongDescriptionControl.h"
#import "BRMetadataLongDescriptionPreviewControl.h"
#import "BRMetadataPopulator.h"
#import "BRMetadataPopulatorFactory.h"
#import "BRMetadataPreviewControl.h"
#import "BRMetadataPreviewControlFactory.h"
#import "BRMetadataProvider.h"
#import "BRMetadataTitleControl.h"
#import "BRModalDialog.h"
#import "BRModalOptionDialog.h"
#import "BRMovieMetadataPopulator.h"
#import "BRMovieRatingStringTransformer.h"
#import "BRMovieTrailer.h"
#import "BRMovieTrailerCollection.h"
#import "BRMovieTrailerMetadataPopulator.h"
#import "BRMovieTrailersProvider.h"
#import "BRMultiPartWidgetLayer.h"
#import "BRMusicAlbumMetadataPopulator.h"
#import "BRMusicContextMenuUtility.h"
#import "BRMusicNowPlayingControl.h"
#import "BRMusicNowPlayingLayer.h"
#import "BRMusicNowPlayingTransportLayer.h"
#import "BRMusicStore.h"
#import "BRMusicStoreUtility.h"
#import "BRMusicVideoMetadataPopulator.h"
#import "BRNetworkAlertController.h"
#import "BRNetworkMediaProvider.h"
#import "BRNetworkMonitor.h"
#import "BRNowPlayingControlFactory.h"
#import "BRNowPlayingProvider.h"
#import "BRNumbersKeyboardActionKeysContainer.h"
#import "BROptionAlertControl.h"
#import "BROptionDialog.h"
#import "BRPageStripView.h"
#import "BRPagedView.h"
#import "BRPairingController.h"
#import "BRPairingPinControl.h"
#import "BRPanelControl.h"
#import "BRParentalControlManager.h"
#import "BRParentalControlsPasscodeChangedController.h"
#import "BRParentalControlsPasscodeController.h"
#import "BRPasscodeEntryControl.h"
#import "BRPasscodeSelectionLayer.h"
#import "BRPasscodeSelectionWidget.h"
#import "BRPercentageIndicatorLayer.h"
#import "BRPeriodicMetadataRetrieval.h"
#import "BRPhotoBrowserBannerButton.h"
#import "BRPhotoBrowserControlFactory.h"
#import "BRPhotoBrowserController.h"
#import "BRPhotoBrowserCorkBoardControl.h"
#import "BRPhotoBrowserHeaderControl.h"
#import "BRPhotoCollectionDataSource.h"
#import "BRPhotoCollectionDataStore.h"
#import "BRPhotoControlFactory.h"
#import "BRPhotoDataStoreProvider.h"
#import "BRPhotoDataStoreProviderForCollection.h"
#import "BRPhotoImageProxy.h"
#import "BRPhotoMediaAsset.h"
#import "BRPhotoMediaCollection.h"
#import "BRPhotoProvider.h"
#import "BRPhotoProviderForCollection.h"
#import "BRPhotoSelectionHandler.h"
#import "BRPhotoSubImageProxy.h"
#import "BRPlayButtonEnabledMenuItem.h"
#import "BRPlayButtonEnabledPosterControl.h"
#import "BRPlayerDelegate.h"
#import "BRPlaylistDataStore.h"
#import "BRPlaylistItemsMenuConroller.h"
#import "BRPlaylistsControlFactory.h"
#import "BRPlaylistsMenuController.h"
#import "BRPodcastMetadataPopulator.h"
#import "BRPopPanelControl.h"
#import "BRPopUpManager.h"
#import "BRPopupKeyboardControl.h"
#import "BRPopupKeyboardVariableWidthKeyRowPlane.h"
#import "BRPopupKeyboardWithDeleteButton.h"
#import "BRPosterControl.h"
#import "BRPosterControlFactory.h"
#import "BRPosterImageControl.h"
#import "BRPosterImageDataSource.h"
#import "BRPosterLayer.h"
#import "BRPosterReflectionControl.h"
#import "BRPreferenceManager.h"
#import "BRPreferences.h"
#import "BRPreviewBrowserControl.h"
#import "BRPreviewBrowserSelectionHandler.h"
#import "BRProfileManager.h"
#import "BRProgressBarWidget.h"
#import "BRProvider.h"
#import "BRProviderDataSourceAdapter.h"
#import "BRProviderGroup.h"
#import "BRRSSMediaAsset.h"
#import "BRRSSMetadataPopulator.h"
#import "BRRadioMetadataPopulator.h"
#import "BRReady.h"
#import "BRRecentAlbumsProvider.h"
#import "BRReflectedImageControl.h"
#import "BRReflectionControl.h"
#import "BRRemoteMediaHost.h"
#import "BRResolution.h"
#import "BRResponder.h"
#import "BRResumeMenuControl.h"
#import "BRRetailHiddenMenuItem.h"
#import "BRRetailModeAuthenticationController.h"
#import "BRRomanInputMethod.h"
#import "BRScalingLayoutManager.h"
#import "BRScrollControl.h"
#import "BRScrollingTextBoxControl.h"
#import "BRScrollingTextControl.h"
#import "BRScrollingTextControlFactory.h"
#import "BRScrollingTextControlSelectionHandler.h"
#import "BRScrollingTextPlane.h"
#import "BRScrollingTextTextProvider.h"
#import "BRSecureResource.h"
#import "BRSegmentedSortControl.h"
#import "BRSelectionHandler.h"
#import "BRSelectionLozengeLayer.h"
#import "BRSentinel.h"
#import "BRSeriesControlFactory.h"
#import "BRSeriesDataStore.h"
#import "BRSeriesMainMenuShelfSelectionHandler.h"
#import "BRSeriesMediaMenuController.h"
#import "BRSeriesMostRecentNoStoreProvider.h"
#import "BRSeriesProvider.h"
#import "BRShareManager.h"
#import "BRShimmerControl.h"
#import "BRSimpleMenuItem.h"
#import "BRSimpleMenuItemPopulator.h"
#import "BRSingleton.h"
#import "BRSlideshowSettingsController.h"
#import "BRSongMenuItemPopulator.h"
#import "BRSongMetadataPopulator.h"
#import "BRSoundHandler.h"
#import "BRSpacerControl.h"
#import "BRStandardCursorLayer.h"
#import "BRStateMachine.h"
#import "BRStateMachineEventTuple.h"
#import "BRStatusAlertControl.h"
#import "BRStatusAlertControlDelegate.h"
#import "BRStreamingMediaAsset.h"
#import "BRStreamingMediaHost.h"
#import "BRStreamingPhotoAsset.h"
#import "BRStreamingPhotoCollection.h"
#import "BRStrokeAndFillTextControl.h"
#import "BRSubControllerHosting.h"
#import "BRSubsetProvider.h"
#import "BRSyncProgressControl.h"
#import "BRSyncingMediaHost.h"
#import "BRSystemLanguages.h"
#import "BRTVShowMetadataPopulator.h"
#import "BRTabControl.h"
#import "BRTabControlDelegate.h"
#import "BRTabControlItem.h"
#import "BRTableRow.h"
#import "BRTableView.h"
#import "BRTaskManager.h"
#import "BRTextControl.h"
#import "BRTextControlWithWiderFocusFrame.h"
#import "BRTextEntryControl.h"
#import "BRTextEntryController.h"
#import "BRTextEntryCursorLayer.h"
#import "BRTextEntryDialog.h"
#import "BRTextEntryHistory.h"
#import "BRTextEntryHistoryBehavior.h"
#import "BRTextEntryHistoryClient.h"
#import "BRTextEntryHistoryItem.h"
#import "BRTextEntryPlayPauseMessage.h"
#import "BRTextField.h"
#import "BRTextFieldBackgroundLayer.h"
#import "BRTextFieldCharacterInputDelegate.h"
#import "BRTextFieldControl.h"
#import "BRTextFieldDelegate.h"
#import "BRTextLineControl.h"
#import "BRTextMenuItemControlFactory.h"
#import "BRTextWithSpinnerController.h"
#import "BRThemeInfo.h"
#import "BRThreadCallback.h"
#import "BRThreadNotificationManager.h"
#import "BRThresholdControlMediator.h"
#import "BRTileLayer.h"
#import "BRTiledLayer.h"
#import "BRTimer.h"
#import "BRTitleProvider.h"
#import "BRTopShelfRefreshTask.h"
#import "BRTopShelfView.h"
#import "BRTrackInfoControl.h"
#import "BRTrackInfoLayer.h"
#import "BRTrailerDelegate.h"
#import "BRTransitionControl.h"
#import "BRTransportControl.h"
#import "BRTransportDataProvider.h"
#import "BRTransportLayer.h"
#import "BRTumblerControl.h"
#import "BRTumblerDataSource.h"
#import "BRTumblerDelegate.h"
#import "BRType.h"
#import "BRTypesetLine.h"
#import "BRTypesetter.h"
#import "BRURLDocument.h"
#import "BRURLDocumentLoader.h"
#import "BRURLDocumentManager.h"
#import "BRURLImageProxy.h"
#import "BRURLReloadTask.h"
#import "BRUnboundedSelectionLozengeLayer.h"
#import "BRUsageReporter.h"
#import "BRUsageReporterOptInDialog.h"
#import "BRUserPasswordAccount.h"
#import "BRUserPasswordAuthenticationController.h"
#import "BRUserPasswordAuthenticationResources.h"
#import "BRUserPasswordAuthenticator.h"
#import "BRUserPasswordCollectingAuthenticator.h"
#import "BRVOSpeechAction.h"
#import "BRVerticalScrollBarControl.h"
#import "BRVideoCacheManager.h"
#import "BRVideoCacheManagerDelegate.h"
#import "BRVideoChapterControlFactory.h"
#import "BRVideoChapterProvider.h"
#import "BRViewController.h"
#import "BRVoiceOver.h"
#import "BRVoiceOverSpeechManager.h"
#import "BRVolumeControl.h"
#import "BRWaitPromptControl.h"
#import "BRWaitSpinnerControl.h"
#import "BRWebOverlayControl.h"
#import "BRWindow.h"
#import "BRXMLDocument.h"
#import "BRXMLElement.h"
#import "BRXMLImageProxy.h"
#import "BRXMLMediaAsset.h"
#import "BRXMLNode.h"
#import "BRXMLSchema.h"
#import "BRYTMetadataPopulator.h"
#import "BRZoomTransitionControl.h"
#import "BackRow.h"
#import "CALayer.h"
#import "NSArray.h"
#import "NSAttributedString.h"
#import "NSBoolean.h"
#import "NSBundle.h"
#import "NSCoding.h"
#import "NSCopying.h"
#import "NSData.h"
#import "NSDate.h"
#import "NSDateFormatter.h"
#import "NSDictionary.h"
#import "NSError.h"
#import "NSFileManager.h"
#import "NSHTTPURLResponse.h"
#import "NSIndexPath.h"
#import "NSLocale.h"
#import "NSMutableArray.h"
#import "NSMutableCopying.h"
#import "NSMutableData.h"
#import "NSMutableDictionary.h"
#import "NSNetService.h"
#import "NSNotification.h"
#import "NSNotificationCenter.h"
#import "NSNull.h"
#import "NSObject.h"
#import "NSStreamDelegate.h"
#import "NSString.h"
#import "NSThread.h"
#import "NSTimer.h"
#import "NSURL.h"
#import "NSURLDownloadDelegate.h"
#import "NSURLResponse.h"
#import "NSValue.h"
#import "NSValueTransformer.h"
#import "NSXMLParserDelegate.h"
