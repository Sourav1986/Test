//
//  Provider.swift
//  Kompetes
//
//  Created by Sourav Basu Roy on 08/09/18.
//  Copyright © 2018 Sourav Basu Roy. All rights reserved.
//

import UIKit
import Alamofire



class Provider: NSObject {
    static let currentProvider = Provider()
    override init() {
        super.init()
    }
    
    func getUserfollowing(userid:String,username:String,completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = userfollowingInput(userid: userid, username: username)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: following)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
            switch response.result {
            case .success:
                print("Validation Successful")
                guard let data = response.data else{
                    print("Data is empty")
                    return
                }
                print(String(data: data, encoding: .utf8)!)
               
                guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dataArr = json?["data"] as? [[String:Any]] else {
                    print("Json parsing error")
                    return
                }
                completionHandler(true,dataArr)
                
            case .failure(let error):
                print(error)
                completionHandler(true,[])
            }
        }
        
    }
    func getRecommendation(userid:String,username:String,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = userfollowingInput(userid: userid, username: username)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: recommendation)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json?["data"] as? [String:Any] else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    func getUserImageDetails(userid:String,username:String,photouserid:String,photousername:String,completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = userimagesdetailsInput(loggeduserid: userid, loggedusername: username, photouserid: photouserid, photousername: photousername)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: userimagesdetails)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[[String:Any]]())
            }
        }
    }
    func getUserVideoDetails(userid:String,username:String,photouserid:String,photousername:String,completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = uservideosdetailsInput(loggeduserid: userid, loggedusername: username, videouserid: photouserid, videousername: photousername)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: uservideosdetails)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[[String:Any]]())
                }
        }
    }
    func UserOperations(userid:String,username:String,photoId:String,operation:Operations,comment:String?,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = userimagesactionsInput(loggeduserid: userid, loggedusername: username, photoId: photoId, operation: operation, comment: comment)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: userimagesactions)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    func UserReport(userid:String,username:String,photoId:String,photoUserId:String,operation:Operations,report:String,email:String,name:String,photo_name:String,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = userreportInput(loggeduserid: userid, loggedusername: username, photoId: photoId, photo_user_id: photoUserId, operation: operation, fullname: name, email: email, report: report , photo_name:photo_name)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: userimagesactions)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    func followUsers(loggeduserid:String,loggedusername:String,followinguserid:String,followingusername:String,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = userfollowInput(loggeduserid: loggeduserid, loggedusername: loggedusername, followinguserid: followinguserid, followingusername: followingusername)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: userfollow)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    func uploadImage(imageData:Data,fileName:String,userId:String,userName:String,groupId:String,Progress:@escaping (Float)->Void,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        Alamofire.upload(multipartFormData: { (multipartFormData) in

            multipartFormData.append(imageData, withName: "fileToUpload", fileName: fileName, mimeType: "png")
            multipartFormData.append(userId.data(using: .utf8) ?? Data(), withName: "userid")
            multipartFormData.append(userName.data(using: .utf8) ?? Data(), withName: "username")
            multipartFormData.append(groupId.data(using: .utf8) ?? Data(), withName: "groupid")
            
        }, to: uploadPhoto) { (encodingResult) in
            switch encodingResult {
            case .success(request: let uploadRequest, streamingFromDisk: _, streamFileURL: _):
                uploadRequest
                .uploadProgress(closure: { (progress) in
                    Progress(Float(progress.fractionCompleted))
                })
                .responseJSON(completionHandler: { (response) in
//                    debugPrint(response)
                    guard let data = response.data,let json = try? JSONSerialization.jsonObject(with:data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                })
                
            case .failure(let encodingError):
                print(encodingError)
                completionHandler(true,[String:Any]())
            }
        
        }
    }
    
    func uploadVideo(imageData:Data,fileName:String,userId:String,userName:String,groupId:String,Progress:@escaping (Float)->Void,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            multipartFormData.append(imageData, withName: "videoToUpload[]", fileName: fileName, mimeType: "png")
            multipartFormData.append(userId.data(using: .utf8) ?? Data(), withName: "loggeduserid")
            multipartFormData.append(userName.data(using: .utf8) ?? Data(), withName: "loggedusername")
            multipartFormData.append(groupId.data(using: .utf8) ?? Data(), withName: "groupid")
            
        }, to: uploadVideos) { (encodingResult) in
            switch encodingResult {
            case .success(request: let uploadRequest, streamingFromDisk: _, streamFileURL: _):
                uploadRequest
                    .uploadProgress(closure: { (progress) in
                        Progress(Float(progress.fractionCompleted))
                    })
                    .responseJSON(completionHandler: { (response) in
                        //                    debugPrint(response)
                        guard let data = response.data,let json = try? JSONSerialization.jsonObject(with:data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                            print("Json parsing error")
                            completionHandler(true,[String:Any]())
                            return
                        }
                        completionHandler(true,dictionary)
                        
                    })
                
            case .failure(let encodingError):
                print(encodingError)
                completionHandler(true,[String:Any]())
            }
            
        }
    }
    
    func updateMetaData(title:String,adult:String,tags:String,category:String,description:String,groupid:String,operation:String,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = MetaDataModel(title: title, adult: adult, tags: tags, category: category, description: description, groupid: groupid, operation: operation)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: updateMediaInfo)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    
    
    func getUsercontest(category:String,completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        var request = URLRequest(url: URL(string: "\(getcontest)?category=\(category)")!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dataArr = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dataArr)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[])
                }
        }
    }
    func getAllCategory(completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        var request = URLRequest(url: URL(string: category)!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[])
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dataArr = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        completionHandler(true,[])
                        return
                        
                    }
                    completionHandler(true,dataArr)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[])
                }
        }
    }
       
    
    func getUservotes(completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        var request = URLRequest(url: URL(string: getvotes)!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dataArr = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dataArr)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[])
                }
        }
        
    }
    
    func getusernotification(userId:String,completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        var request = URLRequest(url: URL(string: "\(getnotificationDetails)?loggeduserid=\(userId)")!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dataArr = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dataArr)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[])
                }
        }
        
    }
    func getUserImage(userId:String,userName:String,completionHandler: @escaping (Bool,[[String:Any]]) -> Void)  throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = userImageModel(loggeduserid: userId, loggedusername: userName)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: userImage)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[])
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dataArr = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dataArr)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[])
                }
        }
        
    }
    
    func getContestDetails(contestid:String,isContest:Bool,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        var url = String()
        if isContest == true {
          url = "\(getcontestDetails)?contestid=\(contestid)"
        }
        else{
         url = "\(getchallengeDetails)?challengeid=\(contestid)"
        }
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = HTTPMethod.get.rawValue
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
          }
    }
    func VoteImages(userId:String,userName:String,contestId:String,entryType:String,photos:String,isContest:Bool,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = VotingModel(loggeduserid: userId, loggedusername: userName, id: contestId, entry_type: entryType, photos: photos)
        let jsonData = try jsonEncoder.encode(user)
        var url = String()
        if isContest == true {
            url = contestSubmission
        }
        else{
            url = challengeSubmission
        }
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    func SubmitImages(userId:String,userName:String,contestId:String,entryType:String,media_id:String,isContest:Bool,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = ChallengeSubmitEntry(loggeduserid: userId, loggedusername: userName, id: contestId, entry_type: entryType, media_id: media_id)
        let jsonData = try jsonEncoder.encode(user)
        var url = String()
        if isContest == true {
            url = contestSubmit
        }
        else{
            url = challengeSubmit
        }
        var request = URLRequest(url:URL(string: url)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    
    func UserContestReport(contest_id:String,contest_name:String,fullname:String,report:String,email:String,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = ContestReportModel(contest_id: contest_id, contest_name: contest_name, fullname: fullname, email: email, report: report)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: contestReport)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    func getusercredit(userId:String,completionHandler: @escaping (Bool,String) -> Void) throws {
        var request = URLRequest(url: URL(string: "\(userCredit)?loggeduserid=\(userId)")!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(false,"0")
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let credit = json?["data"] as? String else {
                        print("Json parsing error")
                        completionHandler(false,"0")
                        return
                    }
                    completionHandler(true,credit)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(false,"0")
                }
        }
        
    }
    func createContest(loggeduserid:String,loggedusername:String,challenge_name:String,category:String,allow_no:String,voting_start:String,voting_ends:String,challenge_type:String,description:String,winner_point:String,people_choice:String,biography:String,file_name:String,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        let user = ChallengeJson(loggeduserid:loggeduserid,loggedusername:loggedusername,challenge_name:challenge_name,category:category,allow_no:allow_no,voting_start:voting_start,voting_ends:voting_ends,challenge_type:challenge_type,description:description,winner_point:winner_point,people_choice:people_choice,biography:biography,file_name:file_name)
        let jsonData = try jsonEncoder.encode(user)
        var request = URLRequest(url:URL(string: createchallenge)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        print(String(data: jsonData, encoding: .utf8)!)
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                        print("Json parsing error")
                        completionHandler(true,[String:Any]())
                        return
                    }
                    completionHandler(true,dictionary)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(true,[String:Any]())
                }
        }
    }
    func uploadChallengeBanner(imageData:Data,fileName:String,completionHandler: @escaping (Bool,[String:Any]) -> Void) throws {
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "fileToUpload", fileName: fileName, mimeType: "jpg")
        }, to: challengeBannerUpload) { (encodingResult) in
            switch encodingResult {
            case .success(request: let uploadRequest, streamingFromDisk: _, streamFileURL: _):
                uploadRequest
                    .responseJSON(completionHandler: { (response) in
                        //                    debugPrint(response)
                        guard let data = response.data,let json = try? JSONSerialization.jsonObject(with:data, options: .allowFragments) as? [String:Any],let dictionary = json else {
                            print("Json parsing error")
                            completionHandler(true,[String:Any]())
                            return
                        }
                        completionHandler(true,dictionary)
                        
                    })
                
            case .failure(let encodingError):
                print(encodingError)
                completionHandler(true,[String:Any]())
            }
        }
    }
    func getuserbanner(completionHandler: @escaping (Bool,[[String:Any]]) -> Void) throws {
        var request = URLRequest(url: URL(string: banner)!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        Alamofire.request(request)
            .responseData {  response in
                switch response.result {
                case .success:
                    print("Validation Successful")
                    guard let data = response.data else{
                        print("Data is empty")
                        completionHandler(false,[[String:Any]]())
                        return
                    }
                    print(String(data: data, encoding: .utf8)!)
                    
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any],let res = json?["data"] as? [[String:Any]] else {
                        print("Json parsing error")
                        completionHandler(false,[[String:Any]]())
                        return
                    }
                    completionHandler(true,res)
                    
                case .failure(let error):
                    print(error)
                    completionHandler(false,[[String:Any]]())
                }
        }
        
    }
}
