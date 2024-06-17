Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6057C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThFyhitQHbil3ukfPb4BTQDlV68mQR+9q/sXZH8kJAQ=; b=aCT7s1uKL2PpH5TuaD2cola1lD
	d4NTFlMY/NZiuOEWPbpz1YAz4wlb0fL0T/4rJRryXqihEcfAw7yjHmeuQ7Vp0046B2Ki0dQj7b2qc
	S8hff/XkIP/4KYYdxOm/ZSDaGwQ4+I071FKcf1oFAi5wbZZMya//XXzQmBBwwp/wVMXWgCEDw7u44
	ktkSRCScmzJPb+ACh07wnf6d9W3OS8FtGD90veGLPs/vT4qF/x7lbdgwM7GvXl1EdGPIIn6nsil+H
	aK7yknFeETjQDLenC7u3Ov/9s+HNR2LWaOJhk62H7DI02BF/Zpdw82PD4mpG7iMWn/EaXcyV4I/37
	32lAR2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHND-0000000CF5X-0uEt
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 18:46:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHN9-0000000CF42-3ifa
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 18:46:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAiFEA009325;
	Mon, 17 Jun 2024 18:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ThFyhitQHbil3ukfPb4BTQDlV68mQR+9q/sXZH8kJAQ=; b=h31PowxH4teN4qq9
	STTRmBtIFmUvGb38TwFlbhflD8bULz0H93slIXFWYtdizm0EK01q4Qgr1CeuN4zl
	sHRp9wc5yKmBHDh3ev99aLLHDjZTq3KoojyUAYvCUM7dOwNB2pr6U7C0IPndVslg
	YQ9YShLn7vEQ7pH4PAEsf0eRr6szPcikl4SIx5OLHnSkFxKQNOUBMjTBPXCX9vjL
	Jl220h8eLeXlQPqcZS9jXaIvcm7bSY6URmoQ6yFRfDGKTxxh4srHD4l1WgvnJx+P
	2N+1fOL4UFYpFAGHHDMVJ8FIAiRk8Y2py++/X+wlCStkwLDuShK9YJ6T8k0XXb8E
	4b/PBA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3b74he7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 18:46:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HIkTpd000315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 18:46:29 GMT
Received: from [10.48.243.231] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 11:46:28 -0700
Message-ID: <0c17fa05-f9c5-4aa1-bede-6dbb17a754e2@quicinc.com>
Date: Mon, 17 Jun 2024 11:46:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240612234209.2324181-1-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240612234209.2324181-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NkyUa0NJia6ScTzURfs2kSMVnr3em0-n
X-Proofpoint-ORIG-GUID: NkyUa0NJia6ScTzURfs2kSMVnr3em0-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_114632_096173_758CF558 
X-CRM114-Status: GOOD (  16.49  )
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

On 6/12/2024 4:42 PM, Pradeep Kumar Chitrapu wrote:
> Add support for
> 1. enabling MU-MIMO in HE and EHT modes from hardware
> 2. setting fixed HE rate/GI/LTF
> 3. 160 MHz bandwidth in HE mode
> 4. extended NSS bandwidth support
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
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
> base-commit: e72048809ec7355a947415ae6836d2eb7fdcda39

This series produces the following warnings when applied to ath-202406171110

In function 'ath12k_peer_assoc_h_he',
    inlined from 'ath12k_peer_assoc_prepare' at drivers/net/wireless/ath/ath12k/mac.c:2951:2:
drivers/net/wireless/ath/ath12k/mac.c:2357:21: warning: 'ath12k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Wstringop-overread]
 2357 |                 v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/mac.c:2357:21: note: referencing argument 2 of type 'const u16[8]' {aka 'const short unsigned int[8]'}
drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_peer_assoc_prepare':
drivers/net/wireless/ath/ath12k/mac.c:2139:12: note: in a call to function 'ath12k_peer_assoc_h_he_limit'
 2139 | static u16 ath12k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath12k_peer_assoc_h_he',
    inlined from 'ath12k_peer_assoc_prepare' at drivers/net/wireless/ath/ath12k/mac.c:2951:2:
drivers/net/wireless/ath/ath12k/mac.c:2370:21: warning: 'ath12k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Wstringop-overread]
 2370 |                 v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/mac.c:2370:21: note: referencing argument 2 of type 'const u16[8]' {aka 'const short unsigned int[8]'}
drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_peer_assoc_prepare':
drivers/net/wireless/ath/ath12k/mac.c:2139:12: note: in a call to function 'ath12k_peer_assoc_h_he_limit'
 2139 | static u16 ath12k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath12k_peer_assoc_h_he',
    inlined from 'ath12k_peer_assoc_prepare' at drivers/net/wireless/ath/ath12k/mac.c:2951:2:
drivers/net/wireless/ath/ath12k/mac.c:2370:21: warning: 'ath12k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Wstringop-overread]
 2370 |                 v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath12k/mac.c:2370:21: note: referencing argument 2 of type 'const u16[8]' {aka 'const short unsigned int[8]'}
drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_peer_assoc_prepare':
drivers/net/wireless/ath/ath12k/mac.c:2139:12: note: in a call to function 'ath12k_peer_assoc_h_he_limit'
 2139 | static u16 ath12k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

