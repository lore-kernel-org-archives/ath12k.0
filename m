Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F71BC54E67
	for <ath12k@archiver.kernel.org>; Tue, 26 Mar 2024 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3/3hAL6UlvpFzxo2umnwfzumWgCgBGpQ0ePDGiNPnc=; b=dcONmBg/rW/CLwxkgH7uKdI9Ug
	40jiKuHEw48VXYvcheFjcUqYzV9VgmeV7nGFUUX+uwSHNv6qGtFj6h28WQflx5VummiEsuEXRYykF
	l5l+FdcG1BEIYPjybLlRSGtyqtMD7ekqsvy4T0zPuPwj1RYKrcGwEk3xRkwV9+79zg/TzMWzjl0xc
	bJv92q9sQ1LWbceve1mJ5TFUb7L/tg5R2FUEG1MTdmPDcxOpbLvcdkkJ22R43jkBdVE1TBVYGAlak
	3ukdrX6vxctatozBjwXBLnA06gOI9vBKzKzDmjc8BOdfpbeE2/WkbQLtsaBDg6tUF+qbVRhQvG8ed
	Cp0NfSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBeu-00000005xKQ-09X7
	for ath12k@archiver.kernel.org;
	Tue, 26 Mar 2024 18:36:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBeq-00000005xJz-3V7s
	for ath12k@lists.infradead.org;
	Tue, 26 Mar 2024 18:36:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QG67d8011784;
	Tue, 26 Mar 2024 18:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=s3/3hAL6UlvpFzxo2umnwfzumWgCgBGpQ0ePDGiNPnc=; b=T9
	rarylLQ9nFyMhX3nFmFipqdupN8AMFTFa3gXhD1o/52uE7IbugEY3OnfHrql8hWi
	jiGiIzdfDw75yhPGmsthA01joUQxrWRIlZMMZP3pwJNGqPbKYQxAgN7Ei9oSrJCA
	1NalQyfyxWikKGGmpKH+iYbjl2o8j6NXvK30SgHeQLzkL4dWMrJRv8oHxkOXUpV1
	gpwVmcLRBCJjGf8Gi894hdXoue3NkF5g3fYYXBFYwYnHjI3FfKMceIsmDqLN0DtX
	F4zyGKRbzAlTyebrvybmGkemaaJTm3g54RtRiURbyCsDcc0YGYNYAnsScOQmyGeM
	Pd0E7Ld1uUPAUWmMNyvg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x41k68dfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 18:36:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QIaNtQ007547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 18:36:23 GMT
Received: from [10.110.10.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 11:36:22 -0700
Message-ID: <c6891df6-0b34-43d6-b931-16a3da577407@quicinc.com>
Date: Tue, 26 Mar 2024 11:36:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240325201031.10837-1-quic_pradeepc@quicinc.com>
 <20240325201031.10837-2-quic_pradeepc@quicinc.com>
 <8efc258b698acd504c1fc699d026b906bf383894.camel@sipsolutions.net>
 <b4fb2e9f-b7af-42da-be97-9ae1560ebad2@quicinc.com>
 <a313c313ab41325843092dc8445386dd802ed115.camel@sipsolutions.net>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <a313c313ab41325843092dc8445386dd802ed115.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FYnLHGR7_wwKFh8ECE7_z06JFbowGO8r
X-Proofpoint-GUID: FYnLHGR7_wwKFh8ECE7_z06JFbowGO8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_113624_916285_1BB975DF 
X-CRM114-Status: GOOD (  13.13  )
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



On 3/26/2024 11:32 AM, Johannes Berg wrote:
> On Tue, 2024-03-26 at 11:31 -0700, Pradeep Kumar Chitrapu wrote:
>>
>> On 3/26/2024 6:00 AM, Johannes Berg wrote:
>>> On Mon, 2024-03-25 at 13:10 -0700, Pradeep Kumar Chitrapu wrote:
>>>> Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
>>>> to pass EHT MU-MIMO configurations from user space to driver in
>>>> AP mode.
>>>
>>> This ^^ doesn't match this:
>>>
>>>> + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP) or transmission
>>>> + *	(non-AP STA) of an EHT TB PPDU on an RU that spans the entire PPDU
>>>> + *	bandwidth
>>>>
>>>
>>> which doesn't match the implementation ... Wouldn't be a bad idea to
>>> actually do what it documents though, I guess?
>>>
>> Thanks Johannes for review.
>> can you please help clarify what you meant by "actually do what it
>> documents"? This will help me to amend next revision appropriately.
>>
>> I have tried to describe what this flag is trying to represent.
> 
> Yes but ... you document AP and non-AP STA, but only implemented it for
> AP?
> 
> johannes
Sure. Thanks. will fix this in next revision.

