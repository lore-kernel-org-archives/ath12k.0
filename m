Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D06C6FD1F
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0KyaX/uuY3bOWtXzKTd5nI9t/yStuwOLfaKaupdXkI=; b=X0MBVMyEyNOg7XH3hUtTtrtzE4
	2gj/3XJiqUyJNlCREzo6oSS6qoe5JUic/PNOIOS6qzN+4PfNv+EmZ0FKZ1t3DlBgU4TO0Pz2Rm94Z
	xcCEUGpPwnyXBkfG7SAbA44yfpp4+z+mDz/z3xVeDJOOBAgjQ+kHNg8Lou9b6M+k/p0K9xyb9Z95t
	ySvpVvdMMTsYBHXRnpjjJKmn/dGds4/9Y6nk3MW1sWEWfTa2lD+cOLgRRl+QYCHjpXMM3pWl6Hm4o
	sdcf7wA7jkn0+QtVZQnS4Wy3w0c2nw1WaWVNTrTjQiEWAif98V9qLVEVtdgFjtdTPDwxxKq6Ra9j3
	qTNlra4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGIc-00000001WkW-1e06
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 17:45:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGIZ-00000001Wjx-0WsN
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 17:45:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42THfbLK013432;
	Fri, 29 Mar 2024 17:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+0KyaX/uuY3bOWtXzKTd5nI9t/yStuwOLfaKaupdXkI=; b=kx
	kS/ndhEaiSFW3Iepp2of82rgZ4ugAJ0lDra1IcEkD4Cw9a4g/2aStx1y9EHLWiQT
	4Uy4kRwVcRW0UhxtJFqXQHiONZYFC2c32n2EyXvM+NLLSbrGT4kwFu8eNl+5Ob+/
	DM6c++F2v1bCUW1FuvnXf9HsgmLDldQyE23SYyAT6HLcnRXJS1V+29cVWDmtFoPw
	Foo7ov0vrYWjJb9fQyZcJ+SdPdeL+i+3jPlGe0JVfoebH5faDrGRVTh8y8/C1UB7
	jXiboutdwdJPmEEJ13o0FIyaFKymoUsxRteTXpSJ2twJjvwuhy0kbVTrQk4fn4oM
	AlJ81fdk2o6k1UEpkwhQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5sm6he37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:45:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42THjnBU018099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:45:49 GMT
Received: from [10.227.91.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 10:45:48 -0700
Message-ID: <e826a505-05e0-4761-ac22-97d6bfe175b6@quicinc.com>
Date: Fri, 29 Mar 2024 10:45:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
Content-Language: en-US
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240327170910.23975-1-quic_pradeepc@quicinc.com>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <20240327170910.23975-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ViwDPFeFoFziWgpLkq4PFdbxtzDyGu6_
X-Proofpoint-GUID: ViwDPFeFoFziWgpLkq4PFdbxtzDyGu6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_104551_450411_91855398 
X-CRM114-Status: GOOD (  12.60  )
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



On 3/27/2024 10:09 AM, Pradeep Kumar Chitrapu wrote:
> Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v2:
>   - Amend mac80211 patch description as the patch is not specific
>     to AP mode.
>   - Amend EHT MU-MIMO patch description to specify future support
>     for STA mode.
> 
> Pradeep Kumar Chitrapu (10):
>    wifi: mac80211: Add EHT UL MU-MIMO flag in ieee80211_bss_conf
>    wifi: ath12k: push HE MU-MIMO params from hostapd to hardware
>    wifi: ath12k: push EHT MU-MIMO params from hostapd to hardware
>    wifi: ath12k: move HE MCS mapper to a separate function
>    wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
>    wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
>    wifi: ath12k: add support for setting fixed HE rate/GI/LTF
>    wifi: ath12k: clean up 80P80 support
>    wifi: ath12k: add support for 160 MHz bandwidth
>    wifi: ath12k: add extended NSS bandwidth support for 160 MHz
> 
>   drivers/net/wireless/ath/ath12k/core.h |    2 +
>   drivers/net/wireless/ath/ath12k/mac.c  | 1035 ++++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>   drivers/net/wireless/ath/ath12k/wmi.c  |   24 +-
>   drivers/net/wireless/ath/ath12k/wmi.h  |   98 ++-
>   include/net/mac80211.h                 |    4 +
>   net/mac80211/cfg.c                     |    5 +
>   7 files changed, 981 insertions(+), 204 deletions(-)
> 
> 
> base-commit: fe7e1b830cf3c0272aa4eaf367c4c7b29c169c3d
Hi Kalle/Johannes

I noticed patch status as 'Changes requested', but there were no 
accompanying comments specifying the exact modifications needed.
I kindly request additional information or guidance on the specific 
areas that require correction. Once I have a clearer understanding, I 
will promptly address the necessary fixes.

Thanks
Pradeep

