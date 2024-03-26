Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A22C54E67
	for <ath12k@archiver.kernel.org>; Tue, 26 Mar 2024 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mh9v77OTAT+zRJ8lG1yREsapsoklakuL3iIBWfvkNTU=; b=FiY9fIH+Eo3RrLc7C84pwGeK+I
	Cl+KKnEO8tqtARbKfZ3t16tifWueBuwK6eh/UOpBWNGvArcG+WyZzM3H2JUkIw60aTCnvlmg+1EPx
	hnFcjbgyDmcvBJCKATDVQ6k3h+gpQsB4GKhFt/sATKuhMDrFpJNEYxM+zkjNUoRoPS5FJVXMYZipY
	lU4bWzmJVIe7ZAlm1+Hi4o8suc4DxiY1Pu4Mv1rnIETNYx8y1SDjbcsazQbj8CI40bUMvW/olGA+Y
	SDOVJZumvjD1smDCZBxDJtIZVZct3ydyxKwp6avEXDbAo38d4KMo45WHCpMM86PnBTj36t3Ix1isU
	Jr5NHwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBaM-00000005wfc-0seX
	for ath12k@archiver.kernel.org;
	Tue, 26 Mar 2024 18:31:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBaF-00000005weo-0Mqg
	for ath12k@lists.infradead.org;
	Tue, 26 Mar 2024 18:31:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QI9Xrd001003;
	Tue, 26 Mar 2024 18:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mh9v77OTAT+zRJ8lG1yREsapsoklakuL3iIBWfvkNTU=; b=EZ
	u1VO9fXvWhBjXgdc9VErNDMSz9xGLvsX9PHEcU7L5sOiRZUP5KiLISrd2V6/6IKH
	zKe7FJskVSSUZezrtCm7EhyJrfafru4mLPtwawt7aLnrMPaSIuzjtMPbtoMvZt6g
	Vmq0pZwyDEkk0+IA7UXPTq4zrApi6jSZi9ObNAZ1CyTmDufWWmnVM+k/dv6PEE9N
	3zxB+CqIHJGPcBUdorWvr3qHriPcEfw5iYJBS4dElPA9Tbrlsng6KyxF6IJtEL+r
	TdX871akpgC4Lb6gfML/hw2+iNjeT4ykQyfhB9kcoqYkbrcIgN4wQNj98hU15pSy
	WB5D7Bo57gvWyibQtScw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x43byg1r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 18:31:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QIVaO6020842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 18:31:36 GMT
Received: from [10.110.10.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 11:31:36 -0700
Message-ID: <b4fb2e9f-b7af-42da-be97-9ae1560ebad2@quicinc.com>
Date: Tue, 26 Mar 2024 11:31:35 -0700
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
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <8efc258b698acd504c1fc699d026b906bf383894.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oEywFPi1G61Vp-7O_LFNpqAeEN65EUXk
X-Proofpoint-ORIG-GUID: oEywFPi1G61Vp-7O_LFNpqAeEN65EUXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_113140_954710_286A6FF9 
X-CRM114-Status: GOOD (  12.33  )
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



On 3/26/2024 6:00 AM, Johannes Berg wrote:
> On Mon, 2024-03-25 at 13:10 -0700, Pradeep Kumar Chitrapu wrote:
>> Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
>> to pass EHT MU-MIMO configurations from user space to driver in
>> AP mode.
> 
> This ^^ doesn't match this:
> 
>> + * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP) or transmission
>> + *	(non-AP STA) of an EHT TB PPDU on an RU that spans the entire PPDU
>> + *	bandwidth
>>
> 
> which doesn't match the implementation ... Wouldn't be a bad idea to
> actually do what it documents though, I guess?
> 
> johannes
Thanks Johannes for review.
can you please help clarify what you meant by "actually do what it 
documents"? This will help me to amend next revision appropriately.

I have tried to describe what this flag is trying to represent. This is 
part of EHT MU-MIMO capabilities and driver may want to look at this 
flag for MU-MIMO configurations.

Also this follows other parameters added to struct earlier.
example: 
https://patchwork.kernel.org/project/linux-wireless/patch/1665006886-23874-2-git-send-email-quic_msinada@quicinc.com/


