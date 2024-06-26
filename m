Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD872C27C4F
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2sjp0F5mcFlIt3DJ0mprYOW2LfLDouHss96vY/TMsA=; b=ueQHwZP6eSfleZy5s96ZvGo6Go
	iyT6YKo/6GzCbrrn2E3DYLSMpK7zVpHkOW0cabiks/x2oCwe5/1a+25U/zp0gku7unSxIF0lFLI2Q
	v7dOQ+xGQaUB4mYKtNF2Wt8uPKlr/Es45qPKdFjmlIL/7gPsWEN1on4OZIuLrxBIMlnDRRuYpcIKx
	lujazsAgryMiMfUqUFtDIwYUojrh3pxD45DXBqjLSyjvInzkMTDTs/e2eM1+k9fotK0XV23/1UmaJ
	XtyVWhTu18o4ApRkpnDac5Dt8tVJITzFWqFy1I7u/3WANiPoW+iT3eBx5XIFCH6/iPoaxHbWMTDNS
	XWko7D+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMYDh-000000082kI-0eyz
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 19:22:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMYDf-000000082jP-0Q8t
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 19:22:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfNXB015295;
	Wed, 26 Jun 2024 19:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2sjp0F5mcFlIt3DJ0mprYOW2LfLDouHss96vY/TMsA=; b=K49AOkXJoNyjbLGv
	snjD86IrkT9SQwtth13W4sqcwPfHFpYBKxQEbClo6CVmXuOygmo/9AB+4Igte/MX
	NCRsUjCmOzPJOdGwqrlMbMA6DR/Fj6eGSHQzlnTT3yyOQ1fdWMLACgD1y9T/arzr
	ZYkKkDb1Nnhzv1Q1Ptlo/7rgUqZyQt85q7h1ZugCqG9UgMjPViF5KeAhGCNu1iei
	rM+h8V913XmDsJt4TafkbXPWzSE+v0qLStTYS9uPYlL5S+gNVaphPhDx/uThRtxC
	a6IrEtGcc/F6tX4e3sizpTx89zBZGBgUj0rYWtOriVsqGN4PiDb3fm7gbBypXpTn
	zD2L4A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400gcm9e6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 19:22:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QJMCEc000884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 19:22:12 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 12:22:12 -0700
Message-ID: <a4cabf3a-0234-407f-9b6b-bac0e705ea20@quicinc.com>
Date: Wed, 26 Jun 2024 12:22:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Support Transmit DE stats
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240626042221.3090812-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240626042221.3090812-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h9yfv2yJ3IFbZxcRi5DupzyUboiU_lAX
X-Proofpoint-ORIG-GUID: h9yfv2yJ3IFbZxcRi5DupzyUboiU_lAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_122215_309500_C0D1E797 
X-CRM114-Status: UNSURE (   8.60  )
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

On 6/25/2024 9:22 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request transmit DE stats from firmware through HTT stats
> type 8. These stats give information about enqueued packets, discarded
> packets, failed packets and other information such as power, bandwidth
> information, number of retries, etc.
> 
> Sample output:
> -------------
> echo 8 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_DE_CMN_STATS_TLV:
> mac_id = 0
> tcl2fw_entry_count = 0
> not_to_fw = 0
> .....
> 
> HTT_TX_DE_EAPOL_PACKETS_STATS_TLV:
> m1_packets = 0
> m2_packets = 0
> m3_packets = 0
> .....
> 
> HTT_TX_DE_CLASSIFY_STATS_TLV:
> arp_packets = 0
> igmp_packets = 0
> dhcp_packets = 0
> .....
> 
> HTT_TX_DE_CLASSIFY_FAILED_STATS_TLV:
> ap_bss_peer_not_found = 0
> ap_bcast_mcast_no_peer = 0
> sta_delete_in_progress = 0
> .....
> 
> HTT_TX_DE_CLASSIFY_STATUS_STATS_TLV:
> eok = 0
> classify_done = 0
> lookup_failed = 0
> .....
> 
> HTT_TX_DE_ENQUEUE_PACKETS_STATS_TLV:
> enqueued_pkts = 0
> to_tqm = 0
> to_tqm_bypass = 0
> 
> HTT_TX_DE_ENQUEUE_DISCARD_STATS_TLV:
> discarded_pkts = 0
> local_frames = 0
> is_ext_msdu = 0
> 
> HTT_TX_DE_COMPL_STATS_TLV:
> tcl_dummy_frame = 0
> tqm_dummy_frame = 0
> tqm_notify_frame = 0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


