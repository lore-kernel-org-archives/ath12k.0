Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96180C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuVswXFHXWTi5e8DchogHfQo7934itdB+OvkV2FGV8k=; b=Sko+6egmJ2wUjav4z6Tv1m3RsX
	frTuFl0M1w6lqzN3o/JHR50EPckqgkBHgtIENDCztUi0oyVeN49JjtNhStwExaN8D05U/W7uvOge2
	1/kY9i0c9NJIbUbmpwbDF14sgBHho0T5Bq/ns4TN3SWVSLyB3sws56b9uCWVsU1klJng5/s7S69zh
	0aCRsaVG6UDOZ+NK8oiMlsuGKvyPNAiktGFkKBVULCMtMj9/AMqNrEEEyDQGqPefpDUokWxqvvrS5
	V946wYzAf+j8a0XgwXLu4OkXQSJJVKp0INyS5+k5iDpVwC1pWlPfnEbO0H+OaDJgLjRD1zNfL0kQY
	4UeZnjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJISI-0000000CPgH-1A7U
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 19:55:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJISF-0000000CPeR-1p59
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 19:55:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HHwNsu014973;
	Mon, 17 Jun 2024 19:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuVswXFHXWTi5e8DchogHfQo7934itdB+OvkV2FGV8k=; b=gmzTtyRAlvxIK/iz
	5nqGTNjNWU807m0px7iQsCa32TioSRotgXC0gPGTX8VdD2b52qfIRp28DWHMIM/Q
	P89G/zR3ni3e6epVSRUdy+omU+8JQyLGFLCIM+pRLR4zE4mUsCT76TOJa6SPDCCc
	L3k+FLtu4SOVbTaxHcBA6r7+UTVz3FU6ItPDCyCUXqOSv9CkfE6zAJ5IfhsAb2Xn
	LMmOoGToeKfB20CdIWyH4SwQDvjzQaqLsMuAfwvL2JYoiMHy/hvD940UxrsJaAPd
	W/UCPXGrxcQeuN8aXdipR6Q5Yl83PagGutbSsSSnrjSmHMJ4phqQpO8NEIqf6jzY
	8LRuMw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytt0tr7y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 19:55:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HJtmb6013609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 19:55:48 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 12:55:48 -0700
Message-ID: <bbacb79d-40cb-4ad6-ae4e-b68aa329e15e@quicinc.com>
Date: Mon, 17 Jun 2024 12:55:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240612234209.2324181-1-quic_pradeepc@quicinc.com>
 <0c17fa05-f9c5-4aa1-bede-6dbb17a754e2@quicinc.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <0c17fa05-f9c5-4aa1-bede-6dbb17a754e2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bRZMdpRsFt5aDj8MHk8V3Q-Ij_fh0yfk
X-Proofpoint-GUID: bRZMdpRsFt5aDj8MHk8V3Q-Ij_fh0yfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_125551_721657_529E1460 
X-CRM114-Status: GOOD (  17.63  )
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



On 6/17/2024 11:46 AM, Jeff Johnson wrote:
> On 6/12/2024 4:42 PM, Pradeep Kumar Chitrapu wrote:
>> Add support for
>> 1. enabling MU-MIMO in HE and EHT modes from hardware
>> 2. setting fixed HE rate/GI/LTF
>> 3. 160 MHz bandwidth in HE mode
>> 4. extended NSS bandwidth support
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> changes in v7:
>>   - rebase and remove patch 01/10 which was merged already.
>>
>> changes in v6:
>>   - Change comment in patch 01/10 to represent only AP mode
>>     implementation.
>>
>> changes in v5:
>>   - Fix column length to 80 in patch 01/10
>>   - Fix advertises spelling in patch 09/10
>>   - Fix choosing spelling in patch 10/10
>>
>> changes in v4:
>>   - Fix ath12k-check warnings in patch 2/10 and 7/10
>>   - remove "hostapd" reference in patches 2/10 and 3/10
>>   - remove redundant prerequisite-patch-id's in cover letter
>>
>> changes in v3:
>>   - address review comments for fixing ath12k-check issues.
>>
>> changes in v2:
>>   - Amend mac80211 patch description as the patch is not specific
>>     to AP mode.
>>   - Amend EHT MU-MIMO patch description to specify future support
>>     for STA mode.
>>
>> Pradeep Kumar Chitrapu (9):
>>    wifi: ath12k: push HE MU-MIMO params to hardware
>>    wifi: ath12k: push EHT MU-MIMO params to hardware
>>    wifi: ath12k: move HE MCS mapper to a separate function
>>    wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
>>    wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
>>    wifi: ath12k: add support for setting fixed HE rate/GI/LTF
>>    wifi: ath12k: clean up 80P80 support
>>    wifi: ath12k: add support for 160 MHz bandwidth
>>    wifi: ath12k: add extended NSS bandwidth support for 160 MHz
>>
>>   drivers/net/wireless/ath/ath12k/core.h |    2 +
>>   drivers/net/wireless/ath/ath12k/mac.c  | 1052 ++++++++++++++++++++----
>>   drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>>   drivers/net/wireless/ath/ath12k/wmi.c  |   24 +-
>>   drivers/net/wireless/ath/ath12k/wmi.h  |   98 ++-
>>   5 files changed, 985 insertions(+), 208 deletions(-)
>>
>>
>> base-commit: e72048809ec7355a947415ae6836d2eb7fdcda39
> 
> This series produces the following warnings when applied to ath-202406171110
> 
> In function 'ath12k_peer_assoc_h_he',
>      inlined from 'ath12k_peer_assoc_prepare' at drivers/net/wireless/ath/ath12k/mac.c:2951:2:
> drivers/net/wireless/ath/ath12k/mac.c:2357:21: warning: 'ath12k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Wstringop-overread]
>   2357 |                 v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
>        |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/mac.c:2357:21: note: referencing argument 2 of type 'const u16[8]' {aka 'const short unsigned int[8]'}
> drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath12k/mac.c:2139:12: note: in a call to function 'ath12k_peer_assoc_h_he_limit'
>   2139 | static u16 ath12k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath12k_peer_assoc_h_he',
>      inlined from 'ath12k_peer_assoc_prepare' at drivers/net/wireless/ath/ath12k/mac.c:2951:2:
> drivers/net/wireless/ath/ath12k/mac.c:2370:21: warning: 'ath12k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Wstringop-overread]
>   2370 |                 v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
>        |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/mac.c:2370:21: note: referencing argument 2 of type 'const u16[8]' {aka 'const short unsigned int[8]'}
> drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath12k/mac.c:2139:12: note: in a call to function 'ath12k_peer_assoc_h_he_limit'
>   2139 | static u16 ath12k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath12k_peer_assoc_h_he',
>      inlined from 'ath12k_peer_assoc_prepare' at drivers/net/wireless/ath/ath12k/mac.c:2951:2:
> drivers/net/wireless/ath/ath12k/mac.c:2370:21: warning: 'ath12k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Wstringop-overread]
>   2370 |                 v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
>        |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/mac.c:2370:21: note: referencing argument 2 of type 'const u16[8]' {aka 'const short unsigned int[8]'}
> drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath12k/mac.c:2139:12: note: in a call to function 'ath12k_peer_assoc_h_he_limit'
>   2139 | static u16 ath12k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>        |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
Thanks Jeff, ath12k-check issues must be resolved on V3..
Let me check and confirm and fix any issues and resubmit V8


