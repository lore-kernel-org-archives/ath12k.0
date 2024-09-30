Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA38CEB2C9
	for <ath12k@archiver.kernel.org>; Mon, 30 Sep 2024 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFxlcXRgHKQwl6FNEnXx9vGS3+IHH80cugczq/NoXIA=; b=giLWAwRIHGwSVdHiQtwbfKz6St
	Jbgh0DKxg+DvI00RHo0PUL5D+xnxpbdzjB2TCq1SmAq44NZa/pEAVdOnCkNpUiaDMOCqxe6KNAyPI
	qluGG/8SM3qPKNoCpswkgsWa4BVvPbXd9eEKd9XUbyqOFxpWnfzxhqTfAHTnD3L6zwKfO9ZXSz+SH
	WcUu8xXXg86VyJ45J+CDDwhVo2pSsPL6WlEeaURhT+sPyTf2AOBZ1DDqEDB4LhBEEyvkEOlkX7c9x
	Le0KPtCzXFlXUq4+tV+demC93YtgaYq7cf9Gq8GDTEbG9SN/WcWWfbMzu++zXzfrcsVvWPUs1KLMA
	+4HxDfiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNq6-00000000si3-0PG8
	for ath12k@archiver.kernel.org;
	Mon, 30 Sep 2024 21:21:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svNpd-00000000sgK-2WMp
	for ath12k@lists.infradead.org;
	Mon, 30 Sep 2024 21:21:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UB5fjG008325;
	Mon, 30 Sep 2024 21:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFxlcXRgHKQwl6FNEnXx9vGS3+IHH80cugczq/NoXIA=; b=OWoXBfP5Rqbugdcw
	yvgVtbnsqlWILSdgz6q6X0QxmqH6uAzUYkTZITNCYVjhb8BkehDRXmEU0FDyHHiq
	UJDTci+28cGztWHjiSvVfpDBSRBV2afi7AOMaQcbQi4MxsxWRfmgO8CKLylJBJZh
	Th0lMo3L0397miO15U4I5NvnspTicIrmFm5I/jn7zmoJODkkMBnqS19KSqoKINjp
	qW4Anbwgj89fiq36wWKCr7b+IAK4kIkTqKOQACm0EGzdAPVOCSIXaD2FDESZw9G1
	nf/TX+9GT8BQm9wVjEFl6fhsTKSO7Vf+JCKASFDoe9JP8BUphAG9en6DIUuOnUBW
	J1Zqcw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vu61p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 21:21:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48ULLMno017683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 21:21:22 GMT
Received: from [10.111.183.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 14:21:22 -0700
Message-ID: <91b58719-3e8f-4a80-9be1-b998603244b3@quicinc.com>
Date: Mon, 30 Sep 2024 14:21:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240918212056.4137076-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240918212056.4137076-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IZILpXcBLoDjKOOvMBkxhNxidkg5gc8m
X-Proofpoint-ORIG-GUID: IZILpXcBLoDjKOOvMBkxhNxidkg5gc8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409300152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_142125_793357_833B2938 
X-CRM114-Status: GOOD (  15.00  )
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

On 9/18/2024 2:20 PM, Pradeep Kumar Chitrapu wrote:
> Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> changes in v8:
>  - rebase and resolve KASAN warnings reported by Jeff in v7, in patch 6/9.
> 
> changes in v7:
>  - rebase and remove patch 01/10 which was merged already.
> 
> changes in v6:
>  - Change comment in patch 01/10 to represent only AP mode
>    implementation.
> 
> changes in v5:
>  - Fix column length to 80 in patch 01/10
>  - Fix advertises spelling in patch 09/10
>  - Fix choosing spelling in patch 10/10
> 
> changes in v4:
>  - Fix ath12k-check warnings in patch 2/10 and 7/10
>  - remove "hostapd" reference in patches 2/10 and 3/10
>  - remove redundant prerequisite-patch-id's in cover letter
> 
> changes in v3:
>  - address review comments for fixing ath12k-check issues.
> 
> changes in v2:
>  - Amend mac80211 patch description as the patch is not specific
>    to AP mode.
>  - Amend EHT MU-MIMO patch description to specify future support
>    for STA mode.
> 
> Pradeep Kumar Chitrapu (9):
>   wifi: ath12k: push HE MU-MIMO params to hardware
>   wifi: ath12k: push EHT MU-MIMO params to hardware
>   wifi: ath12k: move HE MCS mapper to a separate function
>   wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
>   wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
>   wifi: ath12k: add support for setting fixed HE rate/GI/LTF
>   wifi: ath12k: clean up 80P80 support
>   wifi: ath12k: add support for 160 MHz bandwidth
>   wifi: ath12k: add extended NSS bandwidth support for 160 MHz
> 
>  drivers/net/wireless/ath/ath12k/core.h |    2 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 1052 ++++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/mac.h  |   17 +
>  drivers/net/wireless/ath/ath12k/wmi.c  |   24 +-
>  drivers/net/wireless/ath/ath12k/wmi.h  |   98 ++-
>  5 files changed, 985 insertions(+), 208 deletions(-)
> 
> 
> base-commit: 92de67902177c2ea65000a87a6b24fed17d48a18

Although this series applies cleanly to ath/main, it does not apply cleanly to
ath/ath12k-mlo. So dropping this until ath12k-mlo is mainlined so that your
series can be rebased on that.


