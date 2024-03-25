Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA78C54E58
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0B1ftZ1V1VSvyqbImclwkZ0YLs+5N7W2rQd28D6C91Y=; b=rj+/SWpevX3q7rNi7tbsMZ8nFv
	6CyF25yi4b4sJS23fVuDBatEPjRB/T4Tlv2jfvUOwLDOL7q+DZ+gmujAZcB6pywEJTWeeOY+6EHrp
	06LDNCsTMMEaxNl2uWBd/+3Dng0CwQfdn2CB9Xm7/2GVPRWfvVjzZFBLoOG26TyZrDYGSMlOjHcQT
	pt6U5En3hELvLq5TdWRgg0ZO5ESOKb6toVNpw8W4MpA6Hy+KaQYrVsI5n2k4p1BYssP32MHsjfkQP
	Xf+Mbz0LIQztdSQ9LHSJ8HmILemwU8G2vt8qQAFcB5jjqWKnZFqKLnD7PbKpcPkp5vqbtaQxgdLno
	KFXajI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooZE-00000001CWc-2YWL
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 17:57:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooYe-00000001C5s-0Eac
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 17:56:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42PCQP52029057;
	Mon, 25 Mar 2024 17:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0B1ftZ1V1VSvyqbImclwkZ0YLs+5N7W2rQd28D6C91Y=; b=Hn
	xI2a492M1Uk8lP1yNoWricbG7oekC8w6R8o+0vWG+Ey1ZM3+6W84RWiizy1lW81U
	KPMuzhHYckNT/azDaylIB/dMuup8neYmHksLWsefKw7gzny5ASz+Ly13OXiqHjaY
	dCRAveictb6fEQcQfZOvGH9QD9EOTQ+U0XdqNjNdiJjUoavv6tmYvo1UKzZAn53/
	emgdFDMfE1la2CReyhpyz+QLprnxhLUOnydfiCzwSL24CvNr35VQdUAeLixaDG4J
	9RwWMPjImyBa5rFkDsnCmunTwMkzQ1ozTPdWqQ4I4NhVv7NtXucvizNqTF5EBSWJ
	ysrNViO949Jxl9UG1tbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3626hana-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 17:56:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PHuNZC011908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 17:56:23 GMT
Received: from [10.216.55.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Mar
 2024 10:56:21 -0700
Message-ID: <d06a3aea-e515-4499-b56d-1fb5979152ee@quicinc.com>
Date: Mon, 25 Mar 2024 23:26:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] wifi: ath12k: Add single wiphy support
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240320190943.3850106-1-quic_ramess@quicinc.com>
 <ff7db654-fa0a-479a-8497-9d61065bc60e@quicinc.com>
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <ff7db654-fa0a-479a-8497-9d61065bc60e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 332I5z7NAGGWfxj9tlhqMBIg-jecwlMV
X-Proofpoint-GUID: 332I5z7NAGGWfxj9tlhqMBIg-jecwlMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_15,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=967 mlxscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105628_435887_213C14FC 
X-CRM114-Status: GOOD (  13.68  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 3/21/2024 2:30 AM, Jeff Johnson wrote:
> On 3/20/2024 12:09 PM, Rameshkumar Sundaram wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>>
>> With the introduction of Multi Link Operation (MLO) support in
>> IEEE802.11be, each EHT AP/non AP interface is capable of
>> operating with multiple radio links.
>>
>> cfg80211/mac80211 expects drivers to abstract the communication
>> between such Multi Link HW and mac80211/cfg80211 since it depends
>> on different driver/HW implementation. Hence the single wiphy
>> abstraction with changes in datastructures were introduced in
>> "wifi: ath12k: Introduce hw abstraction"
>>
>> This patchset extends the implementation to allow combination
>> of multiple underlying radios into a single composite hw/wiphy
>> for registration. Since now multiple radios are represented by
>> a single wiphy, changes are required in various mac ops that the
>> driver supports since the driver now needs to learn on how to tunnel
>> various mac ops properly to a specific radio.
>>
>> This patchset covers the basic mac80211 ops for an interface bring up
>> and operation.
>>
>> Note:
>> Monitor and hw reconfig support for Single Wiphy will be done in future
>> patchsets.
>>
>> ---
>>   v5:
>>   - Addressed Jeff's comments
>>   - Made arvif config cache to be dynamic in PATCH 07/12
> 
> In the future please be specific about what patches in the series were
> modified so that reviewers don't have to spend time reviewing the parts that
> didn't change.
> 
Sure will follow this for future patches.

