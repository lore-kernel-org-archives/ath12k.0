Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5A7D3C525
	for <ath12k@archiver.kernel.org>; Thu, 17 Oct 2024 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=800lOmiQCPGqV4f8tLRDW5O3pBiFFA5P8PuCp2HARog=; b=p4wmKkhwiwYFHXMptsObXjFkrp
	yGsmml3hZ18St8d8I2Lmb/JT/HjVq+S0V7cPReuT2QNKCU0HiXCbdaLyxjdgocoJeXyhMmiwAprzt
	WH2uMmlXj2hOnBtOczFC667Gbm4klfnQ3485La+sCBeUHUU6wQJsZphQIdrGjvbOpabEoQmX6kasY
	xSO7F+K2Nl9p46NGDP4qjIfd0mfmriP8Z8BWVDoWk4db9MSNO/g6+IGwjdrtmS7Ye2LVYQZ4/h3B2
	+1QgtKYIRxR6a0xY8kKfM7OZZjCxw16J4Wnp1rdLOQao3ASbfQ6WJvkl+b9bfAkxc0zdsz9MXfJ1T
	b5c42MyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1U7x-0000000FgmA-1r5C
	for ath12k@archiver.kernel.org;
	Thu, 17 Oct 2024 17:17:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1U3V-0000000FfuU-30wx
	for ath12k@lists.infradead.org;
	Thu, 17 Oct 2024 17:13:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7DvpH031181;
	Thu, 17 Oct 2024 17:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	800lOmiQCPGqV4f8tLRDW5O3pBiFFA5P8PuCp2HARog=; b=TxnGQBTZdyLqUhPG
	rhlXKATzad9N8qI+vgdcep2XxzPlr2exYLRaIdtqjZY89V7iCsVGbGXIUV0J+AO3
	YpRQBSuDwVvbtLStgYZOyB+WDcFT0kt6SGN/olWq82hD04p2/IEsWali30Hc4sxl
	B9BOua4ceqXxrWu1jeZnf8ORojgm+MB21tV2tJNCQ7tYOzMNA5/eaTjPqKuG6lzh
	PE+0yFQAbI0b5TiB2NZnXe3miQzuT1juS8A50wcae+eJJVhQZWvglY4bbkDJBd2U
	EJ8iNqIGawkv/1Llxq4+Oxn2kyeGoYrjtDBLV+IM+hTBK5hz7V1ABZZN9pF8oZgp
	IWEDpA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8nq5ewg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 17:12:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HHCtXM023853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 17:12:55 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 10:12:55 -0700
Message-ID: <d91e0fad-8ce5-4b2b-8fb3-9c6465a34d2a@quicinc.com>
Date: Thu, 17 Oct 2024 10:12:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Support MBSSID Control Frame Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sidhanta Sahu
	<quic_sidhanta@quicinc.com>
References: <20241005112651.3379404-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241005112651.3379404-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b9udJR6CtWUxIG2cAaCfboytucXd4NKx
X-Proofpoint-GUID: b9udJR6CtWUxIG2cAaCfboytucXd4NKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=867 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_101257_799482_CE2D1E12 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On 10/5/2024 4:26 AM, Roopni Devanathan wrote:
> From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
> 
> Add support to request MBSSID control frame stats from firmware
> through HTT stats type 54. These stats give information such as
> basic trigger, BSR trigger, multi-user RTS and uplink MUMIMO
> trigger within and across various BSS.
> 
> Note: WCN7850 firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> support HTT stats type 54.
> 
> Sample output:
> -------------
> echo 54 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_MBSSID_CTRL_FRAME_STATS_TLV:
> mac_id = 0
> basic_trigger_across_bss = 0
> basic_trigger_within_bss = 0
> bsr_trigger_across_bss = 0
> bsr_trigger_within_bss = 0
> mu_rts_across_bss = 0
> mu_rts_within_bss = 0
> ul_mumimo_trigger_across_bss = 0
> ul_mumimo_trigger_within_bss = 0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
> Depends-on:
> [PATCH v2] wifi: ath12k: Modify print_array_to_buf() to support arrays with 1-based semantics
> Link: https://lore.kernel.org/all/20241004085915.1788951-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2 0/4] wifi: ath12k: Support Ring, SFM, Transmit MU, SelfGen stats, CCA stats
> Link: https://lore.kernel.org/ath12k/20241005101816.3314728-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2] wifi: ath12k: Support Pdev OBSS Stats
> Link: https://lore.kernel.org/ath12k/20241005104206.3327143-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2] wifi: ath12k: Support DMAC Reset Stats
> Link: https://lore.kernel.org/ath12k/20241005105207.3350790-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2 0/2] wifi: ath12k: Support pdev Rate, Scheduled Algorithm Stats
> Link: https://lore.kernel.org/ath12k/20241005111506.3361688-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v2 0/2] wifi: ath12k: Support AST and Puncture Stats
> Link: https://lore.kernel.org/ath12k/20241005112234.3379043-1-quic_rdevanat@quicinc.com/

This last dependency is being deferred since it conflicts with the MLO branch,
and hence this patch is also being deferred.

Since all of the other dependencies are now merged, if you rebase so that you
remove this last dependency (and verify you don't conflict with MLO) then this
patch could be processed.

/jeff


