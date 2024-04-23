Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E13C4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 21:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPfM51Upgx96/oBlnqUPCSmDp0NKk15xLUiXmxIflzI=; b=V57p8xotZy8iyQbk1QtKfIFFQK
	9/PD+CQTZd22aJsrVoy6u8vfsOMn5sYnDAlQeQKQHYvu2w6hsHYkknIxK4usU38ncrhYHw1JQbae7
	X4v1GZ8uIiDo3x1JG/IWt8m5E3hEVpuxtg93oztXyHAO1H6AhYfO4I6EaxXXNcQlFW5ROJxiPIQrb
	xV7AaHUGIjls641XykPBcWPnbhetvQWjkIqWil2HHkOyQ3sHuP8MkrGMCXWiGMRhuo0aj4F5n0agm
	ilKQMxdaEOxIW0sP7M64p9WDmQsiqcxRYT5Rl4Iz26/pfWbDWUtd7VHM578eDw/+xe9/bQ+2+e4RY
	I19IcMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzNcp-00000001ZRc-1Qu7
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 21:24:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzNch-00000001ZQM-0ixq
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 21:24:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43NKZ1I2006144;
	Tue, 23 Apr 2024 21:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wPfM51Upgx96/oBlnqUPCSmDp0NKk15xLUiXmxIflzI=; b=Om
	PRVBXmhj+K9ygh8jpvydMNCebfUVkYxL0K+k+isPwmGwUhR+lsgppFKEIiHAIDDc
	LqRvL7rm28FJuQHR2zgl0x1fQWlhbCVyJQPWQcGy25UCOGuVoIBd52jOB8/Ni6AP
	1YgzvIPx4WmMmb9B7ZxwEMWmeGW8ZBCLUIakyBzIFtbrXW4Ebofr3vunyM6aTHLz
	OPOZT3tIV9GKwFb3kxex7LY9CGF8UtT3BinoH99/L0R1Y/XQcBv2d4Dh4yDpJlve
	yjrFNaUhEEb1a+LjuyqB0jAQaBy+W0DhB5h0PPEeNKbPfATjfhPcTAAOQnUSctrd
	PxPnzYYk714gWHXddjHA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xp9buabx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 21:24:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43NLOEbB000338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 21:24:14 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 23 Apr
 2024 14:24:13 -0700
Message-ID: <57002bbf-2c85-4fa7-b249-4bd3f2ba1bcf@quicinc.com>
Date: Tue, 23 Apr 2024 14:24:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] wifi: ath12k: Introduce device group abstraction
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240420083750.1545670-1-quic_hprem@quicinc.com>
 <878r14v2o4.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <878r14v2o4.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ij0mSr74GSgx3iFMZMf7_NMZ7pLGWSps
X-Proofpoint-ORIG-GUID: Ij0mSr74GSgx3iFMZMf7_NMZ7pLGWSps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_16,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_142419_560475_70EC7FAA 
X-CRM114-Status: GOOD (  17.41  )
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

On 4/23/2024 2:39 AM, Kalle Valo wrote:
> Harshitha Prem <quic_hprem@quicinc.com> writes:
> 
>> To support multi-link operation, multiple devices with different bands say
>> 2 GHz or 5 GHz or 6 GHz can be combined together as a group and provide
>> an abstraction to mac80211.
>>
>> Device group abstraction - when there are multiple devices that are
>> connected by any means of communication interface between them, then these
>> devices can be combined together as a single group using a group id to form
>> a group abstraction. In ath12k driver, this abstraction would be named as
>> ath12k_hw_group (ag).
>>
>> Please find below illustration of device group abstraction with two
>> devices.
>>
>>                  Grouping of multiple devices (in future)
>> +------------------------------------------------------------------------+
>> |  +-------------------------------------+       +-------------------+   |
>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>> |  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>> |  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
>> |  |         (Dual band device)          |       |                   |   |
>> |  +-------------------------------------+       +-------------------+   |
>> |                 ath12k_hw_group (ag) based on group id                 |
>> +------------------------------------------------------------------------+
>>
>> Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
>> device 2 has one radio (6 GHz).
>>
>> In existing code -
>>         device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
>>         (5 GHz) will be registered separately to mac80211 as phy0 and phy1
>>         respectively. Similarly, device 2 will register its hw (6GHz) as
>>         phy2 to mac80211.
>>
>> In future, with multi-link abstraction
>>
>>         combination 1 - Different group id for device1 and device 2
>>                 Device 1 will create a single hardware abstraction hw1
>>                 (2 GHz and  5 GHz) and will be registered to mac80211 as
>>                 phy0. similarly, device 2 will register its hardware
>>                 (6 GHz) to mac80211 as phy1.
>>
>>         combination 2 - Same group id for device1 and device 2
>>                 Both device details are combined together as a group, say
>>                 group1, with single hardware abstraction of radios 2 GHz,
>>                 5 GHz and 6 GHz band details and will be registered to
>>                 mac80211 as phy0.
>>
>> Add base infrastructure changes to add device grouping abstraction with
>> a single device.
>>
>> This patch series brings the base code changes with following order:
>>         1. Refactor existing code which would facilitate in introducing
>>            device group abstraction.
>>         2. Create a device group abstraction during device probe.
>>         3. Start the device group only after QMI firmware ready event is
>>            received for all the devices that are combined in the group.
>>         4. Move the hardware abstractions (ath12k_hw - ah) from device
>>            (ath12k_base - ab) to device group abstraction (ag) as it would
>>            ease in having different combinations of group abstraction that
>>            can be registered to mac80211.
>>
>>
>> Depends-on:
>>         [PATCH 0/3] wifi: ath12k: Refactor the hardware recovery
>> procedures
> 
> Are you referring to this patchset:
> 
> https://patchwork.kernel.org/project/linux-wireless/list/?series=821155&state=*&order=date
> 
> That was sent three months ago and at least I couldn't find a newer
> version. So I'll just drop this patchset for now without even looking at
> it.
> 

Yes, I'm stumped as well. the patch specifies:
>base-commit: c416602943dd36fbd13af7496430723935c867a3
>prerequisite-patch-id: a4d62344b11368fb7e549c03b6a31f7ba4c9e2bb
>prerequisite-patch-id: b4a1e18a85d8c1e337fa133c2bd2956c33b11046
>prerequisite-patch-id: b16edd310baa35e2500267e338f60c9a2e6594e1

but lore is unable to find those prerequisite patch-ids, which leads me to
believe that they were rebased internally but never posted.

I tried to apply the January series on top of the base-commit:
c416602943dd36fbd13af7496430723935c867a3 but it doesn't apply cleanly.

So I think we need to have a rebased and updated "Refactor the hardware
recovery procedures" first.

/jeff

