Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEEDC02183
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc5c+T67zl6lnn4w/bB0LLqqkmCWOj2HqfxhAJ9/8cQ=; b=KiyaWPAZKqbOqR+FFy6LZ3XMti
	PioMorZldhNOPjsqYC5+RhRcgo8sNQdQlJJq+/kN7kLLIwnpurCCGhfTogGpFrym801YEqPagflMX
	V5TDITEAsOLVnMi9sMGnz2ag0YFSatwSm2wworOHYXXJ80hmDgGfOxaTU/QtGCoalb8cXqT0qFWYi
	wY6ByDSQ+8bY8apITG5rbIKDplyoAHCxAie+Hk1bTjcXLaixIJGmovTkk/Oiw09HpdomuY3JHNTPu
	vC/OL4+vXIi3ROiDePYFUQWx1Ym1MWUuHQUHqKBzrcnA0q5rXzrFKUAyoSOTI2uYPHVStnqY8g4oY
	nYASSKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm3x-00000000Jau-1E1Z
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 13:07:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYm3u-00000000JYl-2qME
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 13:07:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H7Kqe0014963;
	Fri, 17 Jan 2025 13:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yc5c+T67zl6lnn4w/bB0LLqqkmCWOj2HqfxhAJ9/8cQ=; b=F7Ud6o52jO023R4F
	rxMSXIhUuoUjghgRirliPb2TBCgOYefqgVuFVfSkc5oCa4k6q7WnSyfwbSwevXWV
	e4lhFY0bXGhYo7kYTBvvP5/VrHxojMd+8ue8zjn6EiK3zdS5LRj/d15wpF8I2r1t
	PlTZLv0yBUXLvQjj81cZNRSpadteBQWk19jXCkr57JZ+H29Nhz6ARPC64M+aZBzK
	xmgPRw0S1g238U6sHCFEpzYCVsZQ/0pa1vCojASF7O9WN8CWt4bUf1atRyQIbPF7
	mzgsZtYi4OcTO3U7FipDf7qtUQdLgGCIuDTudMB/xkosA2/V1kPGDRu3wnqC5gMy
	J4eRDQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447jr38vce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 13:06:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HD6tTt008459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 13:06:55 GMT
Received: from [10.216.26.179] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 05:06:53 -0800
Message-ID: <e713770a-2032-f007-f828-d24935b042e2@quicinc.com>
Date: Fri, 17 Jan 2025 18:36:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 7/7] wifi: ath12k: add monitor interface support on
 QCN9274
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20250107021017.3857555-1-quic_periyasa@quicinc.com>
 <20250107021017.3857555-8-quic_periyasa@quicinc.com>
 <D74BE3ES4HZC.GJJ2MY3UH462@gmail.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <D74BE3ES4HZC.GJJ2MY3UH462@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EEVM2UrKbLbMDu7yjxdm1Uc2b4cG6tec
X-Proofpoint-GUID: EEVM2UrKbLbMDu7yjxdm1Uc2b4cG6tec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501170105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_050658_849249_A54066C6 
X-CRM114-Status: GOOD (  15.12  )
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



On 1/17/2025 5:03 PM, Nicolas Escande wrote:
> On Tue Jan 7, 2025 at 3:10 AM CET, Karthikeyan Periyasamy wrote:
>> From: P Praneesh <quic_ppranees@quicinc.com>
>>
>> Currently, the monitor interface is not supported. To support the monitor
>> interface, configure the monitor vdev state identifier, configure the HTT
>> filter setup, subscribe the mac80211 WANT_MONITOR_VIF feature and prevent
>> monitor interface to transmit packet. Therefore, add these procedures to
>> add monitor interface support and enable the monitor interface support on
>> the QCN9274 platform through the hardware parameter.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> ---
> [...]
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
>> index b8f0df6f7a05..81d1ff918f48 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>>   /*
>>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include "core.h"
>> @@ -1277,6 +1277,8 @@ int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
>>   					HTT_RX_MON_MO_CTRL_FILTER_FLASG3 |
>>   					HTT_RX_MON_FP_DATA_FILTER_FLASG3 |
>>   					HTT_RX_MON_MO_DATA_FILTER_FLASG3;
>> +	} else {
>> +		tlv_filter.rxmon_disable = true;
> Shouldn't this be
> 	tlv_filter = ath12k_mac_mon_status_filter_default;
> To match de default value ?

In standalone monitor case, this will enable the default filter 
unnecessary, no ?


>>   	}
>>   
>>   	if (ab->hw_params->rxdma1_enable) {
>> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
>> index a106ebed7870..021a4b565e8b 100644
>> --- a/drivers/net/wireless/ath/ath12k/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/hw.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>>   /*
>>    * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <linux/types.h>
>> @@ -1049,7 +1049,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>>   					BIT(NL80211_IFTYPE_AP) |
>>   					BIT(NL80211_IFT

YPE_MESH_POINT) |
>>   					BIT(NL80211_IFTYPE_AP_VLAN),
>> -		.supports_monitor = false,
>> +		.supports_monitor = true,
>>   
>>   		.idle_ps = false,
>>   		.download_calib = true,
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index abf7c7ed8967..27d44b508884 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -1264,6 +1264,12 @@ static int ath12k_mac_monitor_start(struct ath12k *ar)
>>   		return ret;
>>   	}
>>   
>> +	ret = ath12k_dp_tx_htt_monitor_mode_ring_config(ar, false);
> This is already done a few lines after. Shouldn't the one after be removed

yes, will remove in the next version of the patch.
-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

