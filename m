Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65462C3064D
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnF/RZb8R+XJl1MhpGFg7GXqCArCVajSGQM25cvukSk=; b=c4ELO0eu5c46yhkjJBii9vlG3/
	r8WNEZECyDenpfRGvRdlggybk/jEM3OYsdDvMRsA0gW4j2INAecFdfbwgmmzJBLDUmlvsWLBZnqWK
	yLzmVDZZ13hxuxFkxQpDwkAVr4Wr5HrQFcNcQuwlLhL9w5/UeyKIngQx+dUihJTnNiwuV6PnvLJrO
	HAuDCwrLG/emMYhx9tZ/ijiAXpIV139SgOoqpSc0aCvklUzRXy7C4yeAgEAnNSvk1y7HjAO06mceN
	3AEJ5+dL+cnvfswLwAT/Y11hiDCriQvIauZkjz4lfyx4gCHM0MLPa2xzSzE5bCtJmCic6Krb3QI1E
	AfwGT10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAms-000000044n1-0BZl
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 18:21:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAmp-000000044mL-3akG
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 18:21:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PAaUSX013485;
	Tue, 25 Jun 2024 18:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnF/RZb8R+XJl1MhpGFg7GXqCArCVajSGQM25cvukSk=; b=cQSSwsoPCvu0XSNU
	z+AX96X9CCs6k34BjEKBE/yiU6iMquF+JPqjQg4Xs8E35JBdDOeMnROG9uvhQkmu
	7nau3AIf3BrnuzjqpfU1p3av0PmQGyD3tRd6FkRgc2BR/5iEbvyU0yl7YpJFWWeK
	sRijgYMVxvqJ4+ScIbu4gsxvsX8GcBI4h3hNs7SKZP5gK9WHxA8ANy8vY8Gqq9RE
	xj1BHyN2pNYG5OiIgCFRxCCRs4Wt7i+jcREVpNUcpJQcgVUivN6F7+gy2+nZjwBn
	pamhnsJtFb5LT8LVEiLEncviq6ITJXglR+IFXnfBxxRAzVeK3Foaey9eWhVFPuSL
	h5MtDA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnxgy9f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:20:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PIKum5030678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:20:56 GMT
Received: from [10.216.38.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 11:20:54 -0700
Message-ID: <c343a63c-5190-4e76-a00d-552d7d8399a4@quicinc.com>
Date: Tue, 25 Jun 2024 23:50:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] wifi: ath12k: Add support to parse requested
 stats_type
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240624043845.3502520-1-quic_rgnanase@quicinc.com>
 <20240624043845.3502520-4-quic_rgnanase@quicinc.com>
 <741236ea-3f8e-4690-8719-f6207f2f3da6@quicinc.com>
Content-Language: en-US
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
In-Reply-To: <741236ea-3f8e-4690-8719-f6207f2f3da6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DCQRxfCsxpqYPQUjcC0CyPIK7mSExsS4
X-Proofpoint-ORIG-GUID: DCQRxfCsxpqYPQUjcC0CyPIK7mSExsS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_112100_174722_E5AEFF94 
X-CRM114-Status: GOOD (  23.78  )
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



On 6/25/2024 12:29 AM, Jeff Johnson wrote:
> On 6/23/2024 9:38 PM, Ramya Gnanasekar wrote:
>> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>>
>> Add extended htt stats parser and print the corresponding TLVs associated
>> with the requested htt_stats_type.
>> Add support for TX PDEV related htt stats.
>>
>> Sample output:
>> --------------
>> echo 1 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
>> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
>>
>> HTT_TX_PDEV_STATS_CMN_TLV:
>> mac_id = 0
>> comp_delivered = 0
>> self_triggers = 256
>> hw_queued = 275
>> hw_reaped = 275
>> underrun = 241
>> hw_paused = 0
>> hw_flush = 0
>> hw_filt = 1
>> tx_abort = 0
>> ppdu_ok = 246
>> mpdu_requeued = 0
>> tx_xretry = 0
>> data_rc = 3
>> mpdu_dropped_xretry = 0
>> illegal_rate_phy_err = 0
>> cont_xretry = 0
>> tx_timeout = 0
>> tx_time_dur_data = 0
>> pdev_resets = 0
>> phy_underrun = 0
>> txop_ovf = 0
>> seq_posted = 247
>> seq_failed_queueing = 0
>> seq_completed = 247
>> seq_restarted = 0
>> seq_txop_repost_stop = 0
>> next_seq_cancel = 0
>> dl_mu_mimo_seq_posted = 0
>> dl_mu_ofdma_seq_posted = 0
>> ul_mu_mimo_seq_posted = 0
>> ul_mu_ofdma_seq_posted = 0
>> mu_mimo_peer_blacklisted = 0
>> seq_qdepth_repost_stop = 0
>> seq_min_msdu_repost_stop = 0
>> mu_seq_min_msdu_repost_stop = 0
>> seq_switch_hw_paused = 0
>> next_seq_posted_dsr = 0
>> seq_posted_isr = 0
>> seq_ctrl_cached = 0
>> mpdu_count_tqm = 0
>> msdu_count_tqm = 0
>> mpdu_removed_tqm = 0
>> msdu_removed_tqm = 0
>> remove_mpdus_max_retries = 0
>> mpdus_sw_flush = 0
>> mpdus_hw_filter = 0
>> mpdus_truncated = 0
>> mpdus_ack_failed = 0
>> mpdus_expired = 0
>> mpdus_seq_hw_retry = 0
>> ack_tlv_proc = 0
>> coex_abort_mpdu_cnt_valid = 0
>> coex_abort_mpdu_cnt = 5
>> num_total_ppdus_tried_ota = 5
>> num_data_ppdus_tried_ota = 0
>> local_ctrl_mgmt_enqued = 247
>> local_ctrl_mgmt_freed = 247
>> local_data_enqued = 0
>> local_data_freed = 0
>> mpdu_tried = 0
>> isr_wait_seq_posted = 0
>> tx_active_dur_us_low = 0
>> tx_active_dur_us_high = 0
>> fes_offsets_err_cnt = 0
>>
>> HTT_TX_PDEV_STATS_URRN_TLV:
>> urrn_stats =  0:0, 1:241, 2:0
>>
>> HTT_TX_PDEV_STATS_SIFS_TLV:
>> sifs_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0
>>
>> HTT_TX_PDEV_STATS_FLUSH_TLV:
>> flush_errs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0,
>> 11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0, 21:0, 22:0,
>> 23:0, 24:0, 25:0, 26:0, 27:0, 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0,
>> 35:0, 36:0, 37:0, 38:0, 39:0, 40:0, 41:0, 42:0, 43:0, 44:0, 45:0, 46:0,
>> 47:0, 48:0, 49:0, 50:0, 51:0, 52:0, 53:0, 54:0, 55:0, 56:0, 57:0, 58:0,
>> 59:0, 60:0, 61:0, 62:0, 63:0, 64:0, 65:0, 66:0, 67:0, 68:0, 69:0, 70:0,
>> 71:0, 72:0, 73:0, 74:0, 75:0, 76:0, 77:0, 78:0, 79:0, 80:0, 81:0, 82:0,
>> 83:0, 84:0, 85:0, 86:0, 87:0, 88:0, 89:0, 90:0, 91:0, 92:0, 93:0, 94:0,
>> 95:0, 96:0, 97:0, 98:0, 99:0, 100:0, 101:0, 102:0, 103:0, 104:0, 105:0,
>> 106:0, 107:0, 108:0, 109:0, 110:0, 111:0, 112:0, 113:0, 114:0, 115:0,
>> 116:0, 117:0, 118:0, 119:0, 120:0, 121:0, 122:0, 123:0, 124:0, 125:0,
>> 126:0, 127:0
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>> Co-developed-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
>> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
>> ---
>>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 324 ++++++++++++++++++
>>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 211 ++++++++++++
>>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  10 +-
>>  drivers/net/wireless/ath/ath12k/dp_rx.h       |   4 +
>>  4 files changed, 545 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> index 9f44285caa58..11daa842ab55 100644
>> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>> @@ -9,6 +9,330 @@
>>  #include "debug.h"
>>  #include "debugfs_htt_stats.h"
>>  #include "dp_tx.h"
>> +#include "dp_rx.h"
>> +
>> +static u32
>> +print_array_to_buf(u8 *buf, u32 offset, const char *header,
>> +		   const __le32 *array, u32 array_len, char *newline)
> 
> newline should be const
> 
> but perhaps call it 'footer' to mirror the existing param 'header'

Sure. Will take care of the naming.
> 
>> +{
>> +	int index = 0;
>> +	u8 i;
>> +
>> +	if (header) {
>> +		index += scnprintf(buf + offset,
>> +				   ATH12K_HTT_STATS_BUF_SIZE - offset,
>> +				   "%s = ", header);
>> +	}
>> +	for (i = 0; i < array_len; i++) {
>> +		index += scnprintf(buf + offset + index,
>> +				   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
>> +				   " %u:%u,", i, le32_to_cpu(array[i]));
>> +	}
>> +	/* To overwrite the last trailing comma */
>> +	index--;
> 
> let's go ahead and explicitly overwrite the comma here with:
> 	buf[offset + index] = '\0';
> or
> 	*(buf + offset + index) = '\0';
> 
> i'm not sure which I prefer, pick which you prefer

Sure Jeff. Thanks for the inputs.

> 
> i want to add that explicit overwrite since now you are introducing a new
> 'newline/footer' param. and i'm thinking that if header is optional, should
> this be optional as well? maybe the below should be inside
> 
> 	if (newline [or footer])
> 
> and hence we'd no longer guarantee that the trailing comma is overwritten by
> this function, and hence why i think it should be done explicitly
> 
>> +	index += scnprintf(buf + offset + index,
>> +			   (ATH12K_HTT_STATS_BUF_SIZE - offset) - index,
>> +			   "%s", newline);
>> +	return index;
>> +}
> rest of the patch LGTM

Thanks. I will re-spin with changes.
> 

