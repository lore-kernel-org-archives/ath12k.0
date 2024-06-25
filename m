Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95467C2BBCA
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kkdRj2aX82fu/E1XTgr7rghn9RG8J/uHd+Ooj82Azc=; b=ZJ9X3BXlnbKdtGbr26DmBrWKY6
	uc+z+qSq6lLKIw/sYLay7APnd4Y4e0yBxUSiqRytgULXi8NInW6Vk0nOpbK8HsJAaRx7UM5zOSMDG
	F47lZEfKM52nMVd1cF044lbjw4+H3ZMuanHtp5Qz26esHjlqIg2hDYhKWp6Tg8c2xlvilnSNmr+GG
	o1BHEpcqJRhGXLybSPEKWQnW3lN2vyVDSSEx7MbbM8k9tT4x6AHdaGHya408H9ivdAZwFehMW3aWA
	zVrZJpaTq2t6lKMqBVs23FhJbd/OPPBiONa4/ljolI1yPCrsmkEOu0kwYpDUIngZtTICki1MQvtu1
	OjdFxEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMCEI-00000004IyF-1LbJ
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 19:53:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMCEF-00000004Ixi-2MgY
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 19:53:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PGt2er023785;
	Tue, 25 Jun 2024 19:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kkdRj2aX82fu/E1XTgr7rghn9RG8J/uHd+Ooj82Azc=; b=M+J6k5mmopgeTGjv
	KZr+pB12LEWb8LfJ01Yh0hIg3ZBgaMn5GBhVymsGDNXLztU83Mt2QTDBrcg+sy5Q
	mpl9ZKWBFCFR2hNJhB1ivVWand5ceGzunrGy3xbPSDnAR1tlPvupmU7zCycyYK3f
	2MY33kuY5KAdJ6QKN/oJ8Zh9TTHMZGwahkI6rsGvy1jueT5n0M/NNo8mR0lgMSOA
	EIehrwVg+1yA82EoHnSycbOQcfpJMAXdDqUi/KYIJJuNBtLsj8WRzqY2URioNgO+
	QDyiwPDJLo9LXTNOKlVxyPYwu6AWDqaqhZdEaycib9pG3HhuO71E1ioJhbKBsK5K
	IYHdBg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshqn4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 19:53:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PJrLYL027778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 19:53:21 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 12:53:21 -0700
Message-ID: <3d45dfa5-1372-49ae-b8a2-a31709c368a4@quicinc.com>
Date: Tue, 25 Jun 2024 12:53:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Support pdev error stats
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240625042217.1303332-1-quic_rdevanat@quicinc.com>
 <20240625042217.1303332-3-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240625042217.1303332-3-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xPrZY6WNe5MUuBirKxk9a32MIAmIYu9b
X-Proofpoint-GUID: xPrZY6WNe5MUuBirKxk9a32MIAmIYu9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_125323_662772_B39966FD 
X-CRM114-Status: UNSURE (   8.70  )
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

On 6/24/2024 9:22 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request pdev error stats from firmware through HTT stats
> type 5. This stats type gives information such as list of pdev errors,
> reasons for reset, logging information about recovery, drain and war
> stats. etc.
> 
> Sample output:
> -------------
> echo 5 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> 
> HTT_HW_STATS_PDEV_ERRS_TLV:
> mac_id = 0
> tx_abort = 0
> tx_abort_fail_count = 0
> rx_abort = 53
> .....
> 
> PDEV_PHY_WARM_RESET_REASONS:
> phy_warm_reset_reason_phy_m3 = 0
> phy_warm_reset_reason_tx_hw_stuck = 0
> phy_warm_reset_reason_num_cca_rx_frame_stuck = 0
> .....
> 
> WAL_RX_RECOVERY_STATS:
> wal_rx_recovery_rst_mac_hang_count = 0
> wal_rx_recovery_rst_known_sig_count = 0
> wal_rx_recovery_rst_no_rx_count = 0
> .....
> 
> HTT_RX_DEST_DRAIN_STATS:
> rx_dest_drain_rx_descs_leak_prevention_done = 0
> rx_dest_drain_rx_descs_saved_cnt = 0
> rx_dest_drain_rxdma2reo_leak_detected = 0
> .....
> 
> HTT_HW_STATS_INTR_MISC_TLV:
> hw_intr_name = AMPI
> mask = 0
> count = 2
> 
> HTT_HW_STATS_WHAL_TX_TLV:
> mac_id = 0
> last_unpause_ppdu_id = 0
> hwsch_unpause_wait_tqm_write = 0
> .....
> 
> HTT_HW_WAR_STATS_TLV:
> mac_id = 0
> hw_war 0 = 0
> hw_war 1 = 0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


