Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C396C02180
	for <ath12k@archiver.kernel.org>; Wed, 15 Jan 2025 05:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdP4LRRdaYhIOveUBD3nBKWXxPNVOc73vvWomLz4QpU=; b=FuPDuenBuxOANCG5qOiILgxK4w
	88eFQODOwZIajjUyqcStKoHI0fu7A1aDTKftYoBtZDBvDvpTIEWTLkPFEUZ+FmCblG9eWUW4MQkAy
	TH8wljorW0k6LcIkp/gYqbzHp3k7JphaHjOvBJtIYPkq+8AK+7yjFOAeefzzGddO+JQpWxRiVmD71
	uBydg7hWQ3LcXktkOYl3/DzWKNFRc2jHijg5DiITPaJVtJ01dx4BaFbiAbNjBq51DvFmoEyAp6Pr2
	W2fzXLbTM7G5u/8dI+V9An3XdndNyxAitKUzcDHtiHOkA8V1NTsOX1d36nUV+DkgQvljn0KSoUmIk
	xuC3asEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXw3U-0000000AhKO-3Pec
	for ath12k@archiver.kernel.org;
	Wed, 15 Jan 2025 05:35:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXw3R-0000000AhJs-2i6a
	for ath12k@lists.infradead.org;
	Wed, 15 Jan 2025 05:35:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EGjcvg024614;
	Wed, 15 Jan 2025 05:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UdP4LRRdaYhIOveUBD3nBKWXxPNVOc73vvWomLz4QpU=; b=QITAe0SD+DpvL3Os
	51OE3Sbgw4vEBeTVHqjeeQiE/OqXBEJ7TOawT+JzCvXJF910zngCKh1a/xACt9J8
	9Ow3DNJULNFUXGrySG2Z+noyA7czZcAvCxrmbVTPyTnBKSjap5uK4ra1w0dUhJM2
	OD1GhPV59IQ2PN7Am5e5nQABmpeHZJ0+s3SL3GpzC1+sUyyqNj2o0q06H111EvY0
	AX/tzltDt3K3EvkYIxTMzAUebNBPQp28ec8QoVN4I3DHTOQ/vKTIv3z5OjVIx1pn
	8rleLpvIZAPRC09BEHXVGYa9+9mb+igSSPZnwT8tdiEbiXSRpoxblUczC5f1omDj
	4qNzdg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445uqs1h3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 05:35:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F5Z0QX009933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 05:35:00 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 21:34:58 -0800
Message-ID: <34a902fb-d5a2-4fba-95b4-e820bc6e6d59@quicinc.com>
Date: Wed, 15 Jan 2025 11:04:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] wifi: ath12k: Support Transmit Power Control Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250114135708.966170-1-quic_rdevanat@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250114135708.966170-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: irqOF_7ol48d8f9yFd1YmmxiO-NlYhjj
X-Proofpoint-ORIG-GUID: irqOF_7ol48d8f9yFd1YmmxiO-NlYhjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_213501_695933_F05BC823 
X-CRM114-Status: GOOD (  12.65  )
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

On 1/14/25 19:27, Roopni Devanathan wrote:
> Add support to print Transmit Power Control Stats. Add support for basic
> infrastructure necessary for enabling TPC stats via debugfs. This patch
> series brings support to request stats type from firmware and dump the
> corresponding stats.
> 
> Schema for an ath12k device:
> ath12k
> -- pci-0000:06:00.0
>      -- mac0
>          -- tpc_stats
>          -- tpc_stats_type
> 
> Sample TPC logs:
> *************** TPC config **************
> * powers are in 0.25 dBm steps
> reg domain-22           chan freq-5955
> power limit-126         max reg-domain Power-252
> No.of tx chain-4        No.of rates-1164
> **************** SU WITH TXBF ****************
>                                  TPC values for Active chains
> Rate idx Preamble Rate code     1-Chain 2-Chain 3-Chain 4-Chain
> 4        OFDM    0x000          39      15      1       -9
> 5        OFDM    0x001          39      15      1       -9
> .....
> 12       HT20    0x200          40      16      2       -8
> 13       HT20    0x201          40      16      2       -8
> .....
> 44       HT40    0x200          88      88      88      88
> 45       HT40    0x201          88      88      88      88
> .....
> 76       VHT20   0x300          40      16      2       -8
> 77       VHT20   0x301          40      16      2       -8
> .....
> 172      VHT40   0x300          88      88      88      88
> 173      VHT40   0x301          88      88      88      88
> .....
> 
> Note:
> MCC firmware version -
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not print stats
> because MCC firmware will not respond to the event passed from host,
> resulting in timeout.
> 
> v3:
>   - Fixed datatype conversion warnings in v2.
> v2:
>   - Fixed compilation issues in v1.
> 
> Sowmiya Sree Elavalagan (2):
>    wifi: ath12k: Add Support to Parse TPC Event from Firmware
>    wifi: ath12k: Add Support to Calculate and Display TPC Values
> 
>   drivers/net/wireless/ath/ath12k/core.h    |   5 +
>   drivers/net/wireless/ath/ath12k/debugfs.c | 716 ++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/debugfs.h |  85 +++
>   drivers/net/wireless/ath/ath12k/wmi.c     | 458 ++++++++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h     | 139 +++++
>   5 files changed, 1403 insertions(+)
> 

* drivers/net/wireless/ath/ath12k/core.h: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/debugfs.c: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/debugfs.h: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/wmi.c: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/wmi.h: 2025 copyright missing

No need to re-spin just because of this.

> 
> base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256


-- 
Aditya

