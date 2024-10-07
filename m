Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA531CFB446
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1Eplt5jSrHG+ETZBKvNMSfHB1rzYkLDGtLmplynIEc=; b=aizfdMRxSqpApaY5R0fqsJwX5m
	LnTIXVb/XcbKjVwFgaykeFxATz14GDXEVQ33QkhBNDcN6AL0DwFEV1jV8WpJQVw0bMJLdNWiVKFNM
	uCxZNi+2iNjztEgTnHgEzDDOSyo56s8CeXr5+VXZbwAbKQaSxUhehiAdUjP1zDOvsVuTLW2XOlW0e
	iF1UoHLY47erA+G4Hi+PZWorCtJWX4Yre/3CrRMYVPAR+WwdrxdFnoHhDZdMoHMLiGOicIbpvCvba
	DNBXSl/fEd01z5MFzszSpvu3xw2hz4PTdgNehBIxo2WsgktE/xgCYQyxesgMC5HA2NJ4h4Ijyzw2b
	fjWc3Csw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpoQ-00000002ytB-1yNu
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 15:38:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpo3-00000002yqX-1dVZ
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 15:37:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497EU5M5015709;
	Mon, 7 Oct 2024 15:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1Eplt5jSrHG+ETZBKvNMSfHB1rzYkLDGtLmplynIEc=; b=E3Dz8ZT38P8cgqI+
	H84l5j+qxxm05hSfw6NyYwc9t1kjM3D51UP+TFXr2GmdfBxM6IXKvx59tuVUEU7T
	6TW8PTpUiuSz3DOqo3Br2PQ1AOBbadtAKLTI2rpZE5c8Lgz9wFX7AExbmwkLvnAl
	M8sryHU5RfAGvSoETJbPf+2Js6vmFsLY0NKMiAzSjnVmvWgLCZW9GO+Bm4zJXImP
	KR4G2e9ZyzWaqYGNSppeDMgVij9MDB4cf5LV6jL6qJeyO3uxbeKasdCvhtLWu8Ie
	zvgB8A8d9UJyC9CL133khJAiCQzRWZel5hW48oy+2pthN40q+tREYSr9qjZepuzK
	3C+Udw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xs74ktr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 15:37:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497Fbq38006139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 15:37:52 GMT
Received: from [10.48.240.101] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 08:37:52 -0700
Message-ID: <a6190d4e-aff9-48bc-b674-071656090c74@quicinc.com>
Date: Mon, 7 Oct 2024 08:37:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Support DMAC Reset Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20241005105207.3350790-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241005105207.3350790-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uDdFa9LoDLjYkiiKp9j7A6fAOiYUI63z
X-Proofpoint-GUID: uDdFa9LoDLjYkiiKp9j7A6fAOiYUI63z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_083755_493619_00EA4F39 
X-CRM114-Status: GOOD (  18.89  )
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

On 10/5/2024 3:52 AM, Roopni Devanathan wrote:
> From: Rajat Soni <quic_rajson@quicinc.com>
> 
> Add support to request DMAC reset stats from firmware through HTT stats
> type 45. These stats give debug SoC error stats such as reset count, reset
> time, engage time and count, disengage time and count and destination
> ring mask.
> 
> Sample output:
> -------------
> echo 45 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_DMAC_RESET_STATS_TLV:
> reset_count = 1
> reset_time_ms = 8036717648
> disengage_time_ms = 8036717648
> engage_time_ms = 8036717649
> disengage_count = 1
> engage_count = 1
> drain_dest_ring_mask = 0x0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> ---
> v2:
>  - Updated dependencies. No change in code.
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
> ---
> ---
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 41 +++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 15 +++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index d890679a3f16..2debb253185c 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -2502,6 +2502,44 @@ ath12k_htt_print_pdev_obss_pd_stats_tlv(const void *tag_buf, u16 tag_len,
>  	stats_req->buf_len = len;
>  }
>  
> +static void
> +ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
> +				      struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_dmac_reset_stats_tlv *htt_stats_buf = tag_buf;
> +	u8 *buf = stats_req->buf;
> +	u32 len = stats_req->buf_len;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	unsigned long time;
> +
> +	if (tag_len < sizeof(*htt_stats_buf))
> +		return;
> +
> +	len += scnprintf(buf + len, buf_len - len, "HTT_DMAC_RESET_STATS_TLV:\n");
> +	len += scnprintf(buf + len, buf_len - len, "reset_count = %u\n",
> +			 le32_to_cpu(htt_stats_buf->reset_count));
> +	time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
> +		le32_to_cpu(htt_stats_buf->reset_time_lo_ms);

The v1 version was flagged by the Intel 0-DAY CI Kernel Test Service:
https://lore.kernel.org/all/202410040200.Mwb85JzQ-lkp@intel.com/

I believe you need to use u64 instead of unsigned long since unsigned long
will only be 32 bits on a 32-bit system. Also suggest you refactor into a
helper function to remove any ambiguity about the order of operations between
(typecast) and <<, i.e.:

/* untested */
static u64 ath12k_le32hilo_to_u64(__le32 hi, __le32 lo)
{
	u64 hi64 = le32_to_cpu(hi);
	u64 lo64 = le32_to_cpu(lo);

	return (hi64 << 32) | lo64;
}


