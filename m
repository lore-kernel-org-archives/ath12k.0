Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF9DC25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 04:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98ux4RVTEfycMVrxdE1Rn98Q3SJei8uNS0QArHTHpYE=; b=Ucvr8bkUmV7IW3ClIX9TC+rFb8
	NIQcgcvPSIx448XgIDnDqPPeC7mNxI3zK34CK/pTUIDDU22dmkM3plfs/vC800bx7xg48Xu91j47H
	U92bW/pDc5wdECW1YB0JjkbcKguMf9dzJ3Thmdf5w01BXY12Y/fL78RV72GPmbFq/AE2b9OdVXzXW
	Te6iiJqSI3yp4EC4cgCA+8/IfVKuLwS18Y++z+aC3c5XfNZdybRPA9XxJAg1TpuAwLEktk/sIwUjR
	nWY3blINAHNnPPg7pNgJ727b3S9WT6j06ujWw+FbpRvXebwl69Gyf/WIBwzz7z33tPIr55vGg3qKE
	tRlTSUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5HsC-00000003zjW-00C9
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 04:28:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Hs2-00000003zi4-2vO0
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 04:28:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A2tgMh029548;
	Fri, 10 May 2024 04:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=98ux4RVTEfycMVrxdE1Rn98Q3SJei8uNS0QArHTHpYE=; b=MA
	jYCPDKQVI8w7DydiMY78KPUpjmE+bKy78feMIjrm71gdpCmCJ4iAUes0gSx850RB
	4YzOqfFUiWGdXBxIYdk6olIA1QqaKvNSFc6YLB3mG3FvOwYA8sqSWAzqYiPi0Q9o
	f71eodf/pBAOQUYj7DUWIS54kSqOewH1j1566KWMTDDyyQ5k+mzdmMjRDxQe3eg5
	A0YUMis7OE2odjc0qZc7RRzJsqiQoEMggRwDSOy9t3l4iQICcgaMWDugnp7AzEUk
	FHBs/SDSP5nhVTI4P/73b4N9OMLKX705OSxSWo9MXcIdqOpxCIhQC52eaAa4Fh3y
	vAF/4DM6GFrA0kb+FHcA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w18htk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 04:28:30 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A4STFp023581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 04:28:30 GMT
Received: from [10.152.206.169] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 21:28:28 -0700
Message-ID: <f5e7a546-46d0-8f87-7469-1152db27e4f7@quicinc.com>
Date: Fri, 10 May 2024 09:58:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v4 0/8] wifi: ath12k: Introduce device group abstraction
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240507045702.2858954-1-quic_hprem@quicinc.com>
 <32270967-c1c8-4681-a282-f33defede3fb@quicinc.com>
Content-Language: en-US
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <32270967-c1c8-4681-a282-f33defede3fb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hkxTWIxqF9u3g1hYB6hDASJxdUdOMY83
X-Proofpoint-ORIG-GUID: hkxTWIxqF9u3g1hYB6hDASJxdUdOMY83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_02,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_212834_895433_A881D525 
X-CRM114-Status: GOOD (  17.39  )
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



On 5/10/2024 7:56 AM, Jeff Johnson wrote:
> On 5/6/2024 9:56 PM, Harshitha Prem wrote:
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
>>                   Grouping of multiple devices (in future)
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
>>          device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
>>          (5 GHz) will be registered separately to mac80211 as phy0 and phy1
>>          respectively. Similarly, device 2 will register its hw (6GHz) as
>>          phy2 to mac80211.
>>
>> In future, with multi-link abstraction
>>
>>          combination 1 - Different group id for device1 and device 2
>>                  Device 1 will create a single hardware abstraction hw1
>>                  (2 GHz and  5 GHz) and will be registered to mac80211 as
>>                  phy0. similarly, device 2 will register its hardware
>>                  (6 GHz) to mac80211 as phy1.
>>
>>          combination 2 - Same group id for device1 and device 2
>>                  Both device details are combined together as a group, say
>>                  group1, with single hardware abstraction of radios 2 GHz,
>>                  5 GHz and 6 GHz band details and will be registered to
>>                  mac80211 as phy0.
>>
>> Add base infrastructure changes to add device grouping abstraction with
>> a single device.
>>
>> This patch series brings the base code changes with following order:
>>          1. Refactor existing code which would facilitate in introducing
>>             device group abstraction.
>>          2. Create a device group abstraction during device probe.
>>          3. Start the device group only after QMI firmware ready event is
>>             received for all the devices that are combined in the group.
>>          4. Move the hardware abstractions (ath12k_hw - ah) from device
>>             (ath12k_base - ab) to device group abstraction (ag) as it would
>>             ease in having different combinations of group abstraction that
>>             can be registered to mac80211.
>>
>> v4:
>>    - Modified the cover letter
>> v3:
>>    - Removed depends-on tag of "wifi: ath12k: Refactor the hardware recovery
>>      procedures" as it is merged to ToT
>>    - Addressed the deadlock warning seen during rmmod.
>>
>> v2:
>>   - Rebased to ToT
>>
>> Karthikeyan Periyasamy (8):
>>    wifi: ath12k: Refactor core start api
>>    wifi: ath12k: Add helpers to get or set ath12k_hw
>>    wifi: ath12k: Add ath12k_get_num_hw api
>>    wifi: ath12k: Introduce QMI firmware ready flag
>>    wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set to mac_register api
>>    wifi: ath12k: Introduce device group abstraction
>>    wifi: ath12k: refactor core start based on hardware group
>>    wifi: ath12k: move ath12k_hw from per soc to group
>>
>>   drivers/net/wireless/ath/ath12k/core.c | 433 +++++++++++++++++++++----
>>   drivers/net/wireless/ath/ath12k/core.h |  87 ++++-
>>   drivers/net/wireless/ath/ath12k/mac.c  | 108 ++++--
>>   drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
>>   drivers/net/wireless/ath/ath12k/pci.c  |   2 +
>>   drivers/net/wireless/ath/ath12k/qmi.c  |  10 +-
>>   6 files changed, 534 insertions(+), 115 deletions(-)
>>
>>
>> base-commit: 2c4d8e19cf060744a9db466ffbaea13ab37f25ca
> 
> Gentle reminder that when you post a new version of a previous patchset you
> should propagate any Acked-by/Reviewed-by/Tested-by/etc tags given to the
> previous patches unless the patches were modified significantly enough to
> render those tags invalid (in which case document that in the cover letter).
> 
> /jeff

Sure, Thank you Jeff. I will take care of these going forward.

Thanks,
Harshitha

