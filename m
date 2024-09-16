Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B97C3ABCB
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 22:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hyF5ZH9kfjfBspBx/V53zwZGHndwZaV9k2S0yUaoOIY=; b=tBrjrcX9P4WYghIX31BBqLP3cM
	b/FDCGDLbxDOa7VQnNq6FF/cmo3zUZutHXA86X67lfNwbQSIVIQ2nsKJhiBY0MxfQKB63H9Ira3kM
	MUeu/fjTuzym2khhw01VpTWpaqYt4G7+iJEVUiXrooHA7L2OVaJI7S9mgT1/R8lOl/Wi8vwHXpaLH
	ZRYAt3PwaUZaa+z16m7QfPrHFZNMdl/l1PbqwfThHgYsLo4cQxPl2xy2Ej6TSWPwQ3iN8++VlxCZy
	w5ZyNVxGObA8BQoPf6HMy6jtuhyEtHoAnXPPgQwW87XWk7xNkESLSyrFrQhY9YHZTdBKJgGVGhp+B
	lQgWMiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqJyb-00000004yhW-1jtO
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 22:13:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqJyZ-00000004ygx-26v5
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 22:13:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GEHc34019966;
	Mon, 16 Sep 2024 22:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyF5ZH9kfjfBspBx/V53zwZGHndwZaV9k2S0yUaoOIY=; b=YM94aN4rlu/nkEPY
	xqAh6pIc6qp1KhB9fy/D10YwEDjrYinX/VLapTuZrcMr6VKjx66VlOdLYvH45AWl
	E0jUjAwGUemeI8O9JIue0d5N5Wm1E82yZPa+kRXbrROaOcywgbzClkKq2YgMA2jg
	XYtzhf9uw4wdcCqpQsku8OY0ht3cNn73MumWVOiG3tbwiyCXXkRPjzLJEuPONBKb
	sXC7iCshJyr1C82ar5drcWnPcb6b+YaCuBnRWBVskDJqWCDwNKxjKxC7J5eB2OwX
	n5lwxHN+rUXUbYda7G9xHVCfFccL7fVRN9+WY1qe2WajJIUQNU9EzKkxidYK2yKk
	Vz/elQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jenas1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 22:13:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GMDfZT004379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 22:13:41 GMT
Received: from [10.111.182.118] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 15:13:40 -0700
Message-ID: <8e60bb02-11fe-4f8a-aad6-3e63af412aad@quicinc.com>
Date: Mon, 16 Sep 2024 15:13:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] wifi: ath12k: Support pdev Transmit Multi-user stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240913082949.573482-1-quic_rdevanat@quicinc.com>
 <20240913082949.573482-4-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240913082949.573482-4-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tEUaK_MsZ3Q02r4XdetM4OzQ4lDAqOwU
X-Proofpoint-GUID: tEUaK_MsZ3Q02r4XdetM4OzQ4lDAqOwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409160151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_151343_693457_9EA96DA8 
X-CRM114-Status: GOOD (  10.40  )
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

On 9/13/2024 1:29 AM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request multi-user stats from firmware for transmitter
> through HTT stats type 17. These stats give information about multi-
> user MIMO, OFDMA and MPDU for different Wi-Fi standards.
> 
> Sample output:
> -------------
> echo 17 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_PDEV_MU_MIMO_SCH_STATS_TLV:
> mu_mimo_sch_posted = 0
> mu_mimo_sch_failed = 0
> mu_mimo_ppdu_posted = 0
> 
> ac_mu_mimo_sch_posted_per_group_index 0 (SU) = 0
> ac_mu_mimo_sch_posted_per_group_index 1 (TOTAL STREAMS = 2) = 0
> .....
> 
> ax_mu_mimo_sch_posted_per_group_index 0 (SU) = 0
> ax_mu_mimo_sch_posted_per_group_index 1 (TOTAL STREAMS = 2) = 0
> .....
> 
> be_mu_mimo_sch_posted_per_group_index 0 (SU) = 0
> be_mu_mimo_sch_posted_per_group_index 1 (TOTAL STREAMS = 2) = 0
> .....
> 
> 11ac MU_MIMO SCH STATS:
> ac_mu_mimo_sch_nusers_0 = 0
> ac_mu_mimo_sch_nusers_1 = 0
> ac_mu_mimo_sch_nusers_2 = 0
> ac_mu_mimo_sch_nusers_3 = 0
> 
> 11ax MU_MIMO SCH STATS:
> ax_mu_mimo_sch_nusers_0 = 0
> ax_mu_mimo_sch_nusers_1 = 0
> ax_mu_mimo_sch_nusers_2 = 0
> .....
> 
> 11be MU_MIMO SCH STATS:
> be_mu_mimo_sch_nusers_0 = 0
> be_mu_mimo_sch_nusers_1 = 0
> be_mu_mimo_sch_nusers_2 = 0
> .....
> 
> 11ax OFDMA SCH STATS:
> ax_ofdma_sch_nusers_0 = 0
> ax_ul_ofdma_basic_sch_nusers_0 = 0
> ax_ul_ofdma_bsr_sch_nusers_0 = 0
> ax_ul_ofdma_bar_sch_nusers_0 = 0
> ax_ul_ofdma_brp_sch_nusers_0 = 0
> .....
> 
> 11ax UL MUMIMO SCH STATS:
> ax_ul_mumimo_basic_sch_nusers_0 = 0
> ax_ul_mumimo_brp_sch_nusers_0 = 0
> 
> ax_ul_mumimo_basic_sch_nusers_1 = 0
> ax_ul_mumimo_brp_sch_nusers_1 = 0
> .....
> 
> HTT_TX_PDEV_MUMIMO_GRP_STATS:
> dl_mumimo_grp_tputs_observed (per bin = 300 mbps) =  0:0, 1:0, 2:0, 3:0,
> 4:0, 5:0, 6:0, 7:0, 8:0, 9:0
> dl_mumimo_grp eligible =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> dl_mumimo_grp_ineligible =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> .....
> 
> HTT_TX_PDEV_MU_MIMO_AC_MPDU_STATS:
> ac_mu_mimo_mpdus_queued_usr_0 = 0
> ac_mu_mimo_mpdus_tried_usr_0 = 0
> ac_mu_mimo_mpdus_failed_usr_0 = 0
> .....
> 
> HTT_TX_PDEV_MU_MIMO_AX_MPDU_STATS:
> ax_mu_mimo_mpdus_queued_usr_0 = 0
> ax_mu_mimo_mpdus_tried_usr_0 = 0
> ax_mu_mimo_mpdus_failed_usr_0 = 0
> .....
> 
> HTT_TX_PDEV_AX_MU_OFDMA_MPDU_STATS:
> ax_mu_ofdma_mpdus_queued_usr_0 = 0
> ax_mu_ofdma_mpdus_tried_usr_0 = 0
> ax_mu_ofdma_mpdus_failed_usr_0 = 0
> .....
> 
> 11ac MU_MIMO SCH STATS:
> ac_mu_mimo_sch_nusers_0 = 0
> ac_mu_mimo_sch_nusers_1 = 0
> ac_mu_mimo_sch_nusers_2 = 0
> ac_mu_mimo_sch_nusers_3 = 0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
> Note: MCC firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> print stats because MCC firmware reports an event, but there are
> no tags or data. The length of the received TLV is 0.

IMO this note should be before the Tested-on tag so that it is part of the
commit text in git

no need to re-submit, Kalle can fixup in the pending branch


