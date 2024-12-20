Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A8CE77188
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 06:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnU24+Fw7q4mmvk5xn7pDSgqZ562FtCc84GSWGV3ybo=; b=lgjDCbGohoZim1ouQ+OkxhrsQg
	r9lPNRFI/zw7VoYhPHeieWDKHLzvg9rPM69TCBTBBOm1XQEGdjbwcDCgqcp0rDfHYm816lHKwGg7I
	jCyACgyQH3bp1R/w6mzaVpqptD0M7qf0k5aTsH9wC76DUEskSVqd/rwQ/RooJFfaaVA4N/1hi5wue
	8sHZlcW68ga0oZT2MJzdIhdceGF7XNRp5Hr0c3syZO5L/8LLazaCnXsCH8rKLF5p/cXNizEyXX6Qi
	wIHvHJzJcJ8xCLV0fHtSKQBwtwgBjwWexzrIFLRdN2jHAq0xYfYQauQwERb/2lv8I1CuHR6lZB35n
	K2LPuEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWNB-000000044Pa-1O1l
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 06:20:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOWN9-000000044PD-2T8p
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 06:20:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK4Pwhf024806;
	Fri, 20 Dec 2024 06:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnU24+Fw7q4mmvk5xn7pDSgqZ562FtCc84GSWGV3ybo=; b=mgiwfHNzqqJ+Urog
	y4oknaKlvOTmCh2uPhKS/yYu2pmxuNa+as5IMA6lJN4Eafe1n5RW4IAzmEVIwXZN
	R+fF363xKPznQro9/gWvSHk5QnJi0E+YazvLlHN1mvRHnpmzQREwD6eHpPT8apSQ
	cpXfkh3XrmKEqY/em/5MiLllzqwDfGe8JJV9EZkaelOn7cGgmKam41w0pSaxId+8
	Niow50sbm4XtV15uGALeFFznOdFW5LYw2AgWkCt+obvASajY9XhkwC3MLKWlvI99
	Xs7a4AxSRYDbXHvxOA+XwvmouR1z3V79VdhA0wIeKaQLS6+vKQmiKPromSDKUcgg
	2z7yVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n1hx07p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:20:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK6KOtn016580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:20:24 GMT
Received: from [10.110.63.62] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 22:20:24 -0800
Message-ID: <96534be8-053e-42b2-90e9-8df3fd254f97@quicinc.com>
Date: Thu, 19 Dec 2024 22:20:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240918212056.4137076-1-quic_pradeepc@quicinc.com>
 <91b58719-3e8f-4a80-9be1-b998603244b3@quicinc.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <91b58719-3e8f-4a80-9be1-b998603244b3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _eCeiqdp3gTxFlwomZD472SJB1YfEN_9
X-Proofpoint-ORIG-GUID: _eCeiqdp3gTxFlwomZD472SJB1YfEN_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_222027_636966_145D3F8D 
X-CRM114-Status: GOOD (  15.13  )
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



On 9/30/2024 2:21 PM, Jeff Johnson wrote:
> On 9/18/2024 2:20 PM, Pradeep Kumar Chitrapu wrote:
>> Add support for
>> 1. enabling MU-MIMO in HE and EHT modes from hardware
>> 2. setting fixed HE rate/GI/LTF
>> 3. 160 MHz bandwidth in HE mode
>> 4. extended NSS bandwidth support
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> changes in v8:
>>   - rebase and resolve KASAN warnings reported by Jeff in v7, in patch 6/9.
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
>> base-commit: 92de67902177c2ea65000a87a6b24fed17d48a18
> 
> Although this series applies cleanly to ath/main, it does not apply cleanly to
> ath/ath12k-mlo. So dropping this until ath12k-mlo is mainlined so that your
> series can be rebased on that.
> 
Thanks Jeff..with mlo changes merged on ath.git, I will now rebase and 
post next revision.

Thanks
Pradeep

