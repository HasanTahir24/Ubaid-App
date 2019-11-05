//
//  Get_News_FeedModel.swift
//  News_Feed
//
//  Created by MBE For You on 2019-10-22.
//  Copyright © 2019 clines329. All rights reserved.
//

import Foundation

class Get_News_FeedModel {

    // MARK: - Welcome
    struct get_News_Feed_SuccessModel: Codable {
        let apiStatus: Int
        let data: [Datum]

        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case data
        }
    }
    
    
    struct get_News_Feed_ErrorModel: Codable {
        let apiStatus: String
        let errors: Errors

        enum CodingKeys: String, CodingKey {
            case apiStatus = "api_status"
            case errors
        }
    }

    // MARK: - Errors
    struct Errors: Codable {
        let errorID, errorText: String

        enum CodingKeys: String, CodingKey {
            case errorID = "error_id"
            case errorText = "error_text"
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////

  // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

  

   // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

  

    // MARK: - Datum
    struct Datum: Codable {
        let id, postID, userID, recipientID: String
        let postText, pageID, groupID, eventID: String
        let pageEventID: String
        let postLink: String
        let postLinkTitle: PostLinkTitle?
        let postLinkImage: String
        let postLinkContent, postVimeo, postDailymotion, postFacebook: String
        let postFile: String
        let postRecord: String
        let postSticker: JSONNull?
        let sharedFrom: Bool
        let postURL: JSONNull?
        let parentID, cache, commentsStatus, blur: String
        let colorID, jobID, fundRaiseID, fundID: String
        let postFileName: PostFileName
        let postFileThumb, postYoutube, postVine, postSoundCloud: String
        let postPlaytube, postDeepsound: String
        let postMap: PostMap
        let postShare, postPrivacy: String
        let postType: PostType
        let postFeeling, postListening, postTraveling: String
        let postWatching: PostWatching
        let postPlaying, postPhoto, time: String
        let registered: Registered
        let albumName: AlbumName
        let multiImage, multiImagePost, boosted, productID: String
        let pollID, blogID, videoViews: String
        let publisher: Publisher
        let limitComments: Int
        let limitedComments, isGroupPost, groupRecipientExists, groupAdmin: Bool
        let postIsPromoted: Int
        let postTextAPI: String
        let orginaltext: String
        let postTime: String
        let page: Int
        let url: String
        let viaType: String
        let recipientExists: Bool
        let recipient: String
        let admin: Bool
        let datumPostShare: String
        let isPostSaved, isPostReported: Bool
        let isPostBoosted: Int
        let isLiked, isWondered: Bool
        let postComments, postShares, postLikes, postWonders: String
        let isPostPinned: Bool
        let getPostComments: [GetPostComment]
        let photoAlbum: [PhotoAlbum]
        let options: [JSONAny]
        let postFileFull: String
        let reaction: Reaction
        let sharedInfo, userData: JSONNull?
        let blog: Blog?

        enum CodingKeys: String, CodingKey {
            case id
            case postID = "post_id"
            case userID = "user_id"
            case recipientID = "recipient_id"
            case postText
            case pageID = "page_id"
            case groupID = "group_id"
            case eventID = "event_id"
            case pageEventID = "page_event_id"
            case postLink, postLinkTitle, postLinkImage, postLinkContent, postVimeo, postDailymotion, postFacebook, postFile, postRecord, postSticker
            case sharedFrom = "shared_from"
            case postURL = "post_url"
            case parentID = "parent_id"
            case cache
            case commentsStatus = "comments_status"
            case blur
            case colorID = "color_id"
            case jobID = "job_id"
            case fundRaiseID = "fund_raise_id"
            case fundID = "fund_id"
            case postFileName, postFileThumb, postYoutube, postVine, postSoundCloud, postPlaytube, postDeepsound, postMap, postShare, postPrivacy, postType, postFeeling, postListening, postTraveling, postWatching, postPlaying, postPhoto, time, registered
            case albumName = "album_name"
            case multiImage = "multi_image"
            case multiImagePost = "multi_image_post"
            case boosted
            case productID = "product_id"
            case pollID = "poll_id"
            case blogID = "blog_id"
            case videoViews, publisher
            case limitComments = "limit_comments"
            case limitedComments = "limited_comments"
            case isGroupPost = "is_group_post"
            case groupRecipientExists = "group_recipient_exists"
            case groupAdmin = "group_admin"
            case postIsPromoted = "post_is_promoted"
            case postTextAPI = "postText_API"
            case orginaltext = "Orginaltext"
            case postTime = "post_time"
            case page, url
            case viaType = "via_type"
            case recipientExists = "recipient_exists"
            case recipient, admin
            case datumPostShare = "post_share"
            case isPostSaved = "is_post_saved"
            case isPostReported = "is_post_reported"
            case isPostBoosted = "is_post_boosted"
            case isLiked = "is_liked"
            case isWondered = "is_wondered"
            case postComments = "post_comments"
            case postShares = "post_shares"
            case postLikes = "post_likes"
            case postWonders = "post_wonders"
            case isPostPinned = "is_post_pinned"
            case getPostComments = "get_post_comments"
            case photoAlbum = "photo_album"
            case options
            case postFileFull = "postFile_full"
            case reaction
            case sharedInfo = "shared_info"
            case userData = "user_data"
            case blog
        }
    }

    enum AlbumName: String, Codable {
        case beautifulGirls = "Beautiful girls"
        case empty = ""
        case hi = "Hi"
    }

    // MARK: - Blog
    struct Blog: Codable {
        let id, user, title, content: String
        let blogDescription, posted, category: String
        let thumbnail: String
        let view, shared, tags: String
        let author: Author
        let tagsArray: [String]
        let url: String
        let categoryLink: String
        let categoryName: String
        let isPostAdmin: Bool

        enum CodingKeys: String, CodingKey {
            case id, user, title, content
            case blogDescription = "description"
            case posted, category, thumbnail, view, shared, tags, author
            case tagsArray = "tags_array"
            case url
            case categoryLink = "category_link"
            case categoryName = "category_name"
            case isPostAdmin = "is_post_admin"
        }
    }

    // MARK: - Author
    struct Author: Codable {
        let userID, username, email, password: String
        let firstName, lastName: String
        let avatar: String
        let cover: String
        let backgroundImage, backgroundImageStatus, relationshipID, address: String
        let working, workingLink, about, school: String
        let gender: Gender
        let birthday, countryID: String
        let website: String
        let facebook, google, twitter, linkedin: String
        let youtube: String
        let vk: Vk
        let instagram: String
        let language: Language
        let emailCode, src, ipAddress, followPrivacy: String
        let friendPrivacy: String
        let postPrivacy: PostPrivacy
        let messagePrivacy, confirmFollowers, showActivitiesPrivacy, birthPrivacy: String
        let visitPrivacy, verified, lastseen, showlastseen: String
        let emailNotification, eLiked, eWondered, eShared: String
        let eFollowed, eCommented, eVisited, eLikedPage: String
        let eMentioned, eJoinedGroup, eAccepted, eProfileWallPost: String
        let eSentmeMsg, eLastNotif, notificationSettings, status: String
        let active, admin, type, registered: String
        let startUp, startUpInfo, startupFollow, startupImage: String
        let lastEmailSent, phoneNumber, smsCode, isPro: String
        let proTime, proType, joined, cssFile: String
        let timezone: Timezone
        let referrer, refUserID, balance, paypalEmail: String
        let notificationsSound, orderPostsBy, socialLogin, androidMDeviceID: String
        let iosMDeviceID, androidNDeviceID, iosNDeviceID, webDeviceID: String
        let wallet, lat, lng, lastLocationUpdate: String
        let shareMyLocation, lastDataUpdate: String
        let details: AuthorDetails
        let sidebarData, lastAvatarMod, lastCoverMod, points: String
        let dailyPoints, pointDayExpire, lastFollowID, shareMyData: String
        let lastLoginData, twoFactor, newEmail, twoFactorVerified: String
        let newPhone, infoFile, city, state: String
        let zip, schoolCompleted: String
        let weatherUnit: WeatherUnit
        let avatarOrg, coverOrg, coverFull: String
        let avatarFull: String?
        let id: String
        let url: String
        let name: String
        let followingData, followersData: [String]
        let mutualFriendsData, likesData, groupsData: SData
        let albumData, lastseenUnixTime: String
        let lastseenStatus: LastseenStatus

        enum CodingKeys: String, CodingKey {
            case userID = "user_id"
            case username, email, password
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar, cover
            case backgroundImage = "background_image"
            case backgroundImageStatus = "background_image_status"
            case relationshipID = "relationship_id"
            case address, working
            case workingLink = "working_link"
            case about, school, gender, birthday
            case countryID = "country_id"
            case website, facebook, google, twitter, linkedin, youtube, vk, instagram, language
            case emailCode = "email_code"
            case src
            case ipAddress = "ip_address"
            case followPrivacy = "follow_privacy"
            case friendPrivacy = "friend_privacy"
            case postPrivacy = "post_privacy"
            case messagePrivacy = "message_privacy"
            case confirmFollowers = "confirm_followers"
            case showActivitiesPrivacy = "show_activities_privacy"
            case birthPrivacy = "birth_privacy"
            case visitPrivacy = "visit_privacy"
            case verified, lastseen, showlastseen, emailNotification
            case eLiked = "e_liked"
            case eWondered = "e_wondered"
            case eShared = "e_shared"
            case eFollowed = "e_followed"
            case eCommented = "e_commented"
            case eVisited = "e_visited"
            case eLikedPage = "e_liked_page"
            case eMentioned = "e_mentioned"
            case eJoinedGroup = "e_joined_group"
            case eAccepted = "e_accepted"
            case eProfileWallPost = "e_profile_wall_post"
            case eSentmeMsg = "e_sentme_msg"
            case eLastNotif = "e_last_notif"
            case notificationSettings = "notification_settings"
            case status, active, admin, type, registered
            case startUp = "start_up"
            case startUpInfo = "start_up_info"
            case startupFollow = "startup_follow"
            case startupImage = "startup_image"
            case lastEmailSent = "last_email_sent"
            case phoneNumber = "phone_number"
            case smsCode = "sms_code"
            case isPro = "is_pro"
            case proTime = "pro_time"
            case proType = "pro_type"
            case joined
            case cssFile = "css_file"
            case timezone, referrer
            case refUserID = "ref_user_id"
            case balance
            case paypalEmail = "paypal_email"
            case notificationsSound = "notifications_sound"
            case orderPostsBy = "order_posts_by"
            case socialLogin = "social_login"
            case androidMDeviceID = "android_m_device_id"
            case iosMDeviceID = "ios_m_device_id"
            case androidNDeviceID = "android_n_device_id"
            case iosNDeviceID = "ios_n_device_id"
            case webDeviceID = "web_device_id"
            case wallet, lat, lng
            case lastLocationUpdate = "last_location_update"
            case shareMyLocation = "share_my_location"
            case lastDataUpdate = "last_data_update"
            case details
            case sidebarData = "sidebar_data"
            case lastAvatarMod = "last_avatar_mod"
            case lastCoverMod = "last_cover_mod"
            case points
            case dailyPoints = "daily_points"
            case pointDayExpire = "point_day_expire"
            case lastFollowID = "last_follow_id"
            case shareMyData = "share_my_data"
            case lastLoginData = "last_login_data"
            case twoFactor = "two_factor"
            case newEmail = "new_email"
            case twoFactorVerified = "two_factor_verified"
            case newPhone = "new_phone"
            case infoFile = "info_file"
            case city, state, zip
            case schoolCompleted = "school_completed"
            case weatherUnit = "weather_unit"
            case avatarOrg = "avatar_org"
            case coverOrg = "cover_org"
            case coverFull = "cover_full"
            case avatarFull = "avatar_full"
            case id, url, name
            case followingData = "following_data"
            case followersData = "followers_data"
            case mutualFriendsData = "mutual_friends_data"
            case likesData = "likes_data"
            case groupsData = "groups_data"
            case albumData = "album_data"
            case lastseenUnixTime = "lastseen_unix_time"
            case lastseenStatus = "lastseen_status"
        }
    }

    // MARK: - AuthorDetails
    struct AuthorDetails: Codable {
        let postCount, albumCount, followingCount, followersCount: String
        let groupsCount, likesCount: String
        let mutualFriendsCount: MutualFriendsCount

        enum CodingKeys: String, CodingKey {
            case postCount = "post_count"
            case albumCount = "album_count"
            case followingCount = "following_count"
            case followersCount = "followers_count"
            case groupsCount = "groups_count"
            case likesCount = "likes_count"
            case mutualFriendsCount = "mutual_friends_count"
        }
    }

    enum MutualFriendsCount: Codable {
        case bool(Bool)
        case integer(Int)

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Bool.self) {
                self = .bool(x)
                return
            }
            if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
            }
            throw DecodingError.typeMismatch(MutualFriendsCount.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MutualFriendsCount"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .bool(let x):
                try container.encode(x)
            case .integer(let x):
                try container.encode(x)
            }
        }
    }

    enum Gender: String, Codable {
        case female = "female"
        case male = "male"
    }

    enum SData: Codable {
        case string(String)
        case stringArray([String])

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([String].self) {
                self = .stringArray(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            throw DecodingError.typeMismatch(SData.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SData"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let x):
                try container.encode(x)
            case .stringArray(let x):
                try container.encode(x)
            }
        }
    }

    enum Language: String, Codable {
        case arabic = "arabic"
        case english = "english"
        case german = "german"
        case italian = "italian"
        case portuguese = "portuguese"
        case russian = "russian"
        case turkish = "turkish"
    }

    enum LastseenStatus: String, Codable {
        case off = "off"
        case on = "on"
    }

    enum PostPrivacy: String, Codable {
        case ifollow = "ifollow"
    }

    enum Timezone: String, Codable {
        case utc = "UTC"
    }

    enum Vk: String, Codable {
        case cashloveyou = "cashloveyou"
        case empty = ""
    }

    enum WeatherUnit: String, Codable {
        case uk = "uk"
        case us = "us"
    }

    // MARK: - GetPostComment
    struct GetPostComment: Codable {
        let id, userID, pageID, postID: String
        let text, cFile, record, time: String
        let publisher: Publisher
        let url, fullurl: String
        let orginaltext: String
        let onwer, postOnwer: Bool
        let commentLikes, commentWonders: String
        let isCommentWondered, isCommentLiked: Bool
        let reaction: Reaction

        enum CodingKeys: String, CodingKey {
            case id
            case userID = "user_id"
            case pageID = "page_id"
            case postID = "post_id"
            case text
            case cFile = "c_file"
            case record, time, publisher, url, fullurl
            case orginaltext = "Orginaltext"
            case onwer
            case postOnwer = "post_onwer"
            case commentLikes = "comment_likes"
            case commentWonders = "comment_wonders"
            case isCommentWondered = "is_comment_wondered"
            case isCommentLiked = "is_comment_liked"
            case reaction
        }
    }

    // MARK: - Publisher
    struct Publisher: Codable {
        let userID, username, email, firstName: String
        let lastName: String
        let avatar: String
        let cover: String
        let backgroundImage, relationshipID: String
        let address: Address
        let working: Working
        let workingLink: String
        let about: String
        let school: School
        let gender: Gender
        let birthday, countryID: String
        let website: String
        let facebook: Facebook
        let google, twitter, linkedin, youtube: String
        let vk: Vk
        let instagram: Instagram
        let language: Language
        let ipAddress, followPrivacy, friendPrivacy: String
        let postPrivacy: PostPrivacy
        let messagePrivacy, confirmFollowers, showActivitiesPrivacy, birthPrivacy: String
        let visitPrivacy, verified, lastseen, emailNotification: String
        let eLiked, eWondered, eShared, eFollowed: String
        let eCommented, eVisited, eLikedPage, eMentioned: String
        let eJoinedGroup, eAccepted, eProfileWallPost, eSentmeMsg: String
        let eLastNotif, notificationSettings, status, active: String
        let admin, registered: String
        let phoneNumber: PhoneNumber
        let isPro, proType: String
        let timezone: Timezone
        let referrer, refUserID, balance, paypalEmail: String
        let notificationsSound, orderPostsBy, androidMDeviceID, iosMDeviceID: String
        let androidNDeviceID, iosNDeviceID, webDeviceID, wallet: String
        let lat, lng, lastLocationUpdate, shareMyLocation: String
        let lastDataUpdate: String
        let details: PublisherDetails
        let lastAvatarMod, lastCoverMod, points, dailyPoints: String
        let pointDayExpire, lastFollowID, shareMyData: String
        let lastLoginData: String?
        let twoFactor, newEmail, twoFactorVerified, newPhone: String
        let infoFile, city, state, zip: String
        let schoolCompleted: String
        let weatherUnit: WeatherUnit
        let url: String
        let name: String
        let mutualFriendsData: SData
        let lastseenUnixTime: String
        let lastseenStatus: LastseenStatus
        let avatarFull: String?

        enum CodingKeys: String, CodingKey {
            case userID = "user_id"
            case username, email
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar, cover
            case backgroundImage = "background_image"
            case relationshipID = "relationship_id"
            case address, working
            case workingLink = "working_link"
            case about, school, gender, birthday
            case countryID = "country_id"
            case website, facebook, google, twitter, linkedin, youtube, vk, instagram, language
            case ipAddress = "ip_address"
            case followPrivacy = "follow_privacy"
            case friendPrivacy = "friend_privacy"
            case postPrivacy = "post_privacy"
            case messagePrivacy = "message_privacy"
            case confirmFollowers = "confirm_followers"
            case showActivitiesPrivacy = "show_activities_privacy"
            case birthPrivacy = "birth_privacy"
            case visitPrivacy = "visit_privacy"
            case verified, lastseen, emailNotification
            case eLiked = "e_liked"
            case eWondered = "e_wondered"
            case eShared = "e_shared"
            case eFollowed = "e_followed"
            case eCommented = "e_commented"
            case eVisited = "e_visited"
            case eLikedPage = "e_liked_page"
            case eMentioned = "e_mentioned"
            case eJoinedGroup = "e_joined_group"
            case eAccepted = "e_accepted"
            case eProfileWallPost = "e_profile_wall_post"
            case eSentmeMsg = "e_sentme_msg"
            case eLastNotif = "e_last_notif"
            case notificationSettings = "notification_settings"
            case status, active, admin, registered
            case phoneNumber = "phone_number"
            case isPro = "is_pro"
            case proType = "pro_type"
            case timezone, referrer
            case refUserID = "ref_user_id"
            case balance
            case paypalEmail = "paypal_email"
            case notificationsSound = "notifications_sound"
            case orderPostsBy = "order_posts_by"
            case androidMDeviceID = "android_m_device_id"
            case iosMDeviceID = "ios_m_device_id"
            case androidNDeviceID = "android_n_device_id"
            case iosNDeviceID = "ios_n_device_id"
            case webDeviceID = "web_device_id"
            case wallet, lat, lng
            case lastLocationUpdate = "last_location_update"
            case shareMyLocation = "share_my_location"
            case lastDataUpdate = "last_data_update"
            case details
            case lastAvatarMod = "last_avatar_mod"
            case lastCoverMod = "last_cover_mod"
            case points
            case dailyPoints = "daily_points"
            case pointDayExpire = "point_day_expire"
            case lastFollowID = "last_follow_id"
            case shareMyData = "share_my_data"
            case lastLoginData = "last_login_data"
            case twoFactor = "two_factor"
            case newEmail = "new_email"
            case twoFactorVerified = "two_factor_verified"
            case newPhone = "new_phone"
            case infoFile = "info_file"
            case city, state, zip
            case schoolCompleted = "school_completed"
            case weatherUnit = "weather_unit"
            case url, name
            case mutualFriendsData = "mutual_friends_data"
            case lastseenUnixTime = "lastseen_unix_time"
            case lastseenStatus = "lastseen_status"
            case avatarFull = "avatar_full"
        }
    }

    enum Address: String, Codable {
        case empty = ""
        case madridSpain = "Madrid, Spain"
        case pakistan = "Pakistan"
        case samsunBafra = "samsun/bafra"
    }

    // MARK: - PublisherDetails
    struct PublisherDetails: Codable {
        let postCount, albumCount, followingCount, followersCount: Count
        let groupsCount, likesCount: Count
        let mutualFriendsCount: MutualFriendsCount?

        enum CodingKeys: String, CodingKey {
            case postCount = "post_count"
            case albumCount = "album_count"
            case followingCount = "following_count"
            case followersCount = "followers_count"
            case groupsCount = "groups_count"
            case likesCount = "likes_count"
            case mutualFriendsCount = "mutual_friends_count"
        }
    }

    enum Count: Codable {
        case integer(Int)
        case string(String)

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            throw DecodingError.typeMismatch(Count.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Count"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            }
        }
    }

    enum Facebook: String, Codable {
        case empty = ""
        case the1366128763440325 = "1366128763440325"
    }

    enum Instagram: String, Codable {
        case empty = ""
        case robincoelho = "robincoelho"
    }

    enum PhoneNumber: String, Codable {
        case empty = ""
        case the05443570676 = "05443570676"
        case the12121212112 = "12121212112"
        case the2233445566 = "2233445566"
    }

    enum School: String, Codable {
        case empty = ""
        case teknikAnadoluVeMeslekLisesi = "teknik anadolu ve meslek lisesi"
        case yes = "Yes"
    }

    enum Working: String, Codable {
        case empty = ""
        case me = "Me"
        case tronSocial = "TRON ♔ SOCIAL"
        case wowonder = "wowonder"
        case yok = "yok"
    }

    // MARK: - Reaction
    struct Reaction: Codable {
        let like, love, haHa, wow: Int
        let sad, angry: Int
        let isReacted: Bool
        let type: String
        let count: Int

        enum CodingKeys: String, CodingKey {
            case like = "Like"
            case love = "Love"
            case haHa = "HaHa"
            case wow = "Wow"
            case sad = "Sad"
            case angry = "Angry"
            case isReacted = "is_reacted"
            case type, count
        }
    }

    // MARK: - PhotoAlbum
    struct PhotoAlbum: Codable {
        let id: String
        let image: String
        let postID, parentID, imageOrg: String

        enum CodingKeys: String, CodingKey {
            case id, image
            case postID = "post_id"
            case parentID = "parent_id"
            case imageOrg = "image_org"
        }
    }

    enum PostFileName: String, Codable {
        case empty = ""
        case img20190929_194117_270Jpg = "IMG_20190929_194117_270.jpg"
        case ouR24Zl1O3Mp4 = "ouR24zl1O3.mp4"
        case ytaNM2M1LEQMQJpg = "ytaNM2M1LeQ_MQ.jpg"
    }

    enum PostLinkTitle: String, Codable {
        case affiliateMarketingTheUltimateGuideAKindle = "Affiliate Marketing: The Ultimate Guide. A ... - Kindle"
        case empty = ""
        case theCompleteIdiot039SGuideToFacebookMarkKindle = "The Complete Idiot&#039;s Guide to Facebook Mark... - Kindle"
        case tronSocial = "TRON ♔ SOCIAL"
    }

    enum PostMap: String, Codable {
        case batumi = "batumi"
        case empty = ""
    }

    enum PostType: String, Codable {
        case post = "post"
        case profileCoverPicture = "profile_cover_picture"
        case profilePicture = "profile_picture"
    }

    enum PostWatching: String, Codable {
        case empty = ""
        case movies = "Movies"
    }

    enum Registered: String, Codable {
        case the112019 = "11/2019"
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }

    class JSONCodingKey: CodingKey {
        let key: String

        required init?(intValue: Int) {
            return nil
        }

        required init?(stringValue: String) {
            key = stringValue
        }

        var intValue: Int? {
            return nil
        }

        var stringValue: String {
            return key
        }
    }

    class JSONAny: Codable {

        let value: Any

        static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
        }

        static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
        }

        static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if container.decodeNil() {
                return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if let value = try? container.decodeNil() {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                let value = try decode(from: &container)
                arr.append(value)
            }
            return arr
        }

        static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                let value = try decode(from: &container, forKey: key)
                dict[key.stringValue] = value
            }
            return dict
        }

        static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                if let value = value as? Bool {
                    try container.encode(value)
                } else if let value = value as? Int64 {
                    try container.encode(value)
                } else if let value = value as? Double {
                    try container.encode(value)
                } else if let value = value as? String {
                    try container.encode(value)
                } else if value is JSONNull {
                    try container.encodeNil()
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer()
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                let key = JSONCodingKey(stringValue: key)!
                if let value = value as? Bool {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Int64 {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Double {
                    try container.encode(value, forKey: key)
                } else if let value = value as? String {
                    try container.encode(value, forKey: key)
                } else if value is JSONNull {
                    try container.encodeNil(forKey: key)
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer(forKey: key)
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }

        public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                let container = try decoder.singleValueContainer()
                self.value = try JSONAny.decode(from: container)
            }
        }

        public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                var container = encoder.unkeyedContainer()
                try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                var container = encoder.container(keyedBy: JSONCodingKey.self)
                try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                var container = encoder.singleValueContainer()
                try JSONAny.encode(to: &container, value: self.value)
            }
        }
    }
}
