Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83913CEB2CD
	for <ath12k@archiver.kernel.org>; Mon, 30 Sep 2024 23:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/cDQjzh4qGDzjLmltCTd474s3Nxs2cjVK4dri4VguQ=; b=OfugBwpAus8Pdwr50GATMfOeVf
	a8HjuvgoAwnkTTd/OwwEA8aW1w7qGK6TZyPZCjlpM1ue1Jxnk3j9qchbJO/Nt0BL6Q0Sp+g6D/nBc
	nNMRHHfRDQicbJk8Wj2bgmNSKqn8GGzhlK+iXlqqZKuKggFh+C1mf1STpjgp4i/D/D2N3kzGUmiDX
	5Z3POfZnlIfVcmpAcag1hzb2FSqWSc8+H64VvGVpSPS3cLOi5ECAI4kAoTR47RaI7JAU2/pM7O3ZR
	v1172xJYgYXIeysS5sBszRMixvvH5OATcGCfxJUBnlLdb1us96xsbxJ659oiWvumdhNAgBa1tA6sv
	CI7Yx3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svPrF-000000017Sy-0gpt
	for ath12k@archiver.kernel.org;
	Mon, 30 Sep 2024 23:31:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svPrC-000000017Sc-0Yyc
	for ath12k@lists.infradead.org;
	Mon, 30 Sep 2024 23:31:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UBE0gw009627;
	Mon, 30 Sep 2024 23:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/cDQjzh4qGDzjLmltCTd474s3Nxs2cjVK4dri4VguQ=; b=VJGSo4alaQMaA/Rr
	N7JhF7r+3ESx6OQ8u1OMDnE13gli2khbUOcWle/eq7Ziro5N0JOzOnP9z/USstvB
	SfQl9uWP31572D38+2zGVZDBf+w/pI32LG1Tcuf7E9XWu56i2wGN90bw3Qdvk0gs
	I4DXvrhW5HKRyGmWEX/C80tPM3e3opSLTUh8KDaVnaEHe99SBKm9UeiMXe1O5mu5
	k+unOytbOa/OQrOazWP6f6LOTrYqgPLRHrTg+PKCQZ4qhk9bIsJmpSU8CFY6mkfa
	1FtBqVbMpO1+oCW5Vvr8j2A6QJ3zZ5IgPI2sa7nWlxv0bddnKbaioyQH5bGYNre1
	mugmrw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xb38x88b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 23:31:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UNV8iX022505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 23:31:08 GMT
Received: from [10.111.183.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 16:31:07 -0700
Message-ID: <d722ec11-1282-47f3-8a3a-4dbff5d835e0@quicinc.com>
Date: Mon, 30 Sep 2024 16:31:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Support Pdev OBSS Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240919101812.941145-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240919101812.941145-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pTxdLYaRWl0gE7AYTcE7yRviFz-InPh1
X-Proofpoint-ORIG-GUID: pTxdLYaRWl0gE7AYTcE7yRviFz-InPh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409300166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_163110_212800_51AA781F 
X-CRM114-Status: UNSURE (   8.85  )
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

On 9/19/2024 3:18 AM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request pdev OBSS stats from firmware through stats
> type 23. These stats give information about PPDUs transmitted or
> tried to be transmitted in Spatial Reuse Groups(SRG), Parameterized
> Spatial Reuse(PSR) and non-PSR groups.
> 
> Sample output:
> -------------
> echo 23 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_PDEV_OBSS_PD_STATS_TLV:
> num_spatial_reuse_tx = 0
> num_spatial_reuse_opportunities = 0
> num_non_srg_opportunities = 0
> num_non_srg_ppdu_tried = 0
> .....
> 
> HTT_PDEV_OBSS_PD_PER_AC_STATS:
> Access Category 0 (best effort)
> num_non_srg_ppdu_tried = 0
> num_non_srg_ppdu_success = 0
> num_srg_ppdu_tried = 0
> num_srg_ppdu_success = 0
> 
> Access Category 1 (background)
> num_non_srg_ppdu_tried = 0
> num_non_srg_ppdu_success = 0
> num_srg_ppdu_tried = 0
> num_srg_ppdu_success = 0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


