Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BACC25B75
	for <ath12k@archiver.kernel.org>; Mon,  3 Jun 2024 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AYMo/0ssnI53zvhjZVHNMjZdNYCeAJnUl8ZkuZLZ2g=; b=H+Q+207zO3l57sOKFrV3IYK/m5
	qti3GRC+y9Smwc3DCpZyhub8apH0L3AGNznzIeTDaf4u1JG8A1PVtGAe6Ux9bABBdtfTS8K3gjpzY
	N7quS1YFRQ28zWJkUSczKfOSCgVfu3KKhj459L4Vj54osc5Zk99WqwkWNE7q7qEjTMzwGbrcTRWxT
	Ns/RSDujX2C40oRX/AX5leJDHusgCb35nR9Tak9THN5uNwzdDSC6ORXcWjxcLvMA4kSHUtAeLPjWT
	I0MeqZDv19IfL6t7eERkWNtpKsrGdh3o6H5FevrePS9F7CS90wTrSLTKVJlGqBmKhX4HKgMksJvMq
	/8DDk2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEG8T-00000000UA8-16T3
	for ath12k@archiver.kernel.org;
	Mon, 03 Jun 2024 22:26:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEG8Q-00000000U9j-2I6U
	for ath12k@lists.infradead.org;
	Mon, 03 Jun 2024 22:26:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453Bb2c8019159;
	Mon, 3 Jun 2024 22:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AYMo/0ssnI53zvhjZVHNMjZdNYCeAJnUl8ZkuZLZ2g=; b=IKus2knVj/MmMvPe
	ZMAQZkGfnmKD7rTxYUe7iQjOz6xPHAlXVZ4qleK+EGqzp+jb4wdMWZXaDfElhgs1
	r9LP+Y9ImUYIHqlIEfldRAZmWQd7MSKcR/VrShIRqaPTvtwzVYY0olTI8lGpUD0X
	DmN0v7kSSBgPZHDg/ek4ABz1CekTWvQP+On8MP17xoFSjay/RkMQSeBjOceGEEmJ
	/lM3Msv3rJaSvGkrqFiI34yFCU1nxLZfiih67FXzeQgrn1PS5HUqpAY+lpVyj2Hh
	0DF4XApY77YnD7XXikMAPk6BddYi7+XdcERjcLmQDZZc/4VYrynPQL9yrLdjePNu
	as0M0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5t4w86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 22:26:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453MQXLv008583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 22:26:33 GMT
Received: from [10.48.241.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 15:26:32 -0700
Message-ID: <509709a7-fddf-474c-949d-add98178297f@quicinc.com>
Date: Mon, 3 Jun 2024 15:26:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] wifi: ath12k: Add support to parse requested
 stats_type
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240603044214.960261-1-quic_rgnanase@quicinc.com>
 <20240603044214.960261-5-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240603044214.960261-5-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gltmTRGsSmo6nS46dcpHe7qz8rfhg1IU
X-Proofpoint-GUID: gltmTRGsSmo6nS46dcpHe7qz8rfhg1IU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_152634_633704_D30D8BC8 
X-CRM114-Status: UNSURE (   7.62  )
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

On 6/2/2024 9:42 PM, Ramya Gnanasekar wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add extended htt stats parser and print the corresponding TLVs associated
> with the requested htt_stats_type.
> Add support for TX PDEV related htt stats.
> 
> Sample output:
> --------------
> echo 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_PDEV_STATS_CMN_TLV:
> mac_id = 0
> comp_delivered = 0
> self_triggers = 256
> hw_queued = 275
> hw_reaped = 275
> underrun = 241
> hw_paused = 0
> hw_flush = 0
> hw_filt = 1
> tx_abort = 0
> ppdu_ok = 246
> mpdu_requeued = 0
> tx_xretry = 0
> data_rc = 3
> mpdu_dropped_xretry = 0
> illegal_rate_phy_err = 0
> cont_xretry = 0
> tx_timeout = 0
> tx_time_dur_data = 0
> pdev_resets = 0
> phy_underrun = 0
> txop_ovf = 0
> seq_posted = 247
> seq_failed_queueing = 0
> seq_completed = 247
> seq_restarted = 0
> seq_txop_repost_stop = 0
> next_seq_cancel = 0
> dl_mu_mimo_seq_posted = 0
> dl_mu_ofdma_seq_posted = 0
> ul_mu_mimo_seq_posted = 0
> ul_mu_ofdma_seq_posted = 0
> mu_mimo_peer_blacklisted = 0
> seq_qdepth_repost_stop = 0
> seq_min_msdu_repost_stop = 0
> mu_seq_min_msdu_repost_stop = 0
> seq_switch_hw_paused = 0
> next_seq_posted_dsr = 0
> seq_posted_isr = 0
> seq_ctrl_cached = 0
> mpdu_count_tqm = 0
> msdu_count_tqm = 0
> mpdu_removed_tqm = 0
> msdu_removed_tqm = 0
> remove_mpdus_max_retries = 0
> mpdus_sw_flush = 0
> mpdus_hw_filter = 0
> mpdus_truncated = 0
> mpdus_ack_failed = 0
> mpdus_expired = 0
> mpdus_seq_hw_retry = 0
> ack_tlv_proc = 0
> coex_abort_mpdu_cnt_valid = 0
> coex_abort_mpdu_cnt = 5
> num_total_ppdus_tried_ota = 5
> num_data_ppdus_tried_ota = 0
> local_ctrl_mgmt_enqued = 247
> local_ctrl_mgmt_freed = 247
> local_data_enqued = 0
> local_data_freed = 0
> mpdu_tried = 0
> isr_wait_seq_posted = 0
> tx_active_dur_us_low = 0
> tx_active_dur_us_high = 0
> fes_offsets_err_cnt = 0
> 
> HTT_TX_PDEV_STATS_URRN_TLV:
> urrn_stats =  0:0, 1:241, 2:0,
> 
> HTT_TX_PDEV_STATS_SIFS_TLV:
> sifs_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0,
> 
> HTT_TX_PDEV_STATS_FLUSH_TLV:
> flush_errs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0,
> 11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0, 21:0, 22:0,
> 23:0, 24:0, 25:0, 26:0, 27:0, 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0,
> 35:0, 36:0, 37:0, 38:0, 39:0, 40:0, 41:0, 42:0, 43:0, 44:0, 45:0, 46:0,
> 47:0, 48:0, 49:0, 50:0, 51:0, 52:0, 53:0, 54:0, 55:0, 56:0, 57:0, 58:0,
> 59:0, 60:0, 61:0, 62:0, 63:0, 64:0, 65:0, 66:0, 67:0, 68:0, 69:0, 70:0,
> 71:0, 72:0, 73:0, 74:0, 75:0, 76:0, 77:0, 78:0, 79:0, 80:0, 81:0, 82:0,
> 83:0, 84:0, 85:0, 86:0, 87:0, 88:0, 89:0, 90:0, 91:0, 92:0, 93:0, 94:0,
> 95:0, 96:0, 97:0, 98:0, 99:0, 100:0, 101:0, 102:0, 103:0, 104:0, 105:0,
> 106:0, 107:0, 108:0, 109:0, 110:0, 111:0, 112:0, 113:0, 114:0, 115:0,
> 116:0, 117:0, 118:0, 119:0, 120:0, 121:0, 122:0, 123:0, 124:0, 125:0,
> 126:0, 127:0,
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



