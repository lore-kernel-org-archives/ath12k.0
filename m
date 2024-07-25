Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00ADC3DA49
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxWNrG7TDS9ocUQ/fIQrVh2j5pkat/1rssiPDdcVfos=; b=OjcroB8qAzF7QnJaDTTzrRPOcw
	Q1Vf3NdShvo69zQ9bEIvS1PPxDPuCRhQFdvIWSDGh+OLDOL/zsO8aWOqv/c7Nfqa3dN7+Ooblv+ML
	qREkv2SQcJ4x5099E3x+okt8Z6Xj9Bf8oEUNePyZRX4de3hJhxAAkbNbomn6+KFcEv/JojLmJKtXE
	iFgzoY28K61EWb8AhdnpdVCL9XwIrx8t/TF+aVlCgVpyShnBzR0GXEhSOpB1v1WibTbtltNtp2v4F
	Oi+w2KyNnn6JU33SCIuDOUSz7C2lNG2cCunRn4Nk3PDSkVCBso35RSmdgWMuGNuQmR6nZAp+LvxV5
	K824snPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX2Yl-00000001h9t-1S6d
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 17:47:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX2Yi-00000001h9S-118t
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 17:47:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P957YR031745;
	Thu, 25 Jul 2024 17:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxWNrG7TDS9ocUQ/fIQrVh2j5pkat/1rssiPDdcVfos=; b=Jxz3LqucEedulsaf
	/3UGkAkpePN9v/W9KnxgjBqizno5zGD+tM+6oCQ+e7VAC5WR2wBx7NquVDvQ4bJn
	IBAixiSwRa2gL4ApRs7jMA+eAEHbMlTuzmeHkqyD6PmCWTBw13ePmXYtbNcpGQlE
	WPKWfBcIn5CnYgIkTxHgZMMD4fEW1hjoHc/ayoc73JE+SJYaSiQoSvJN/mNVDmoW
	dKgjhxn2gHDkgx+HNl+7DLHGwfCa3SiCQONGhl2IsrFXTuk727fPn8aJd1sReZs1
	UY7u0XLkk2qUOvnCEGX981dNpVnFyvPY1fgmADNoKP++cpLqbaHa6zf0QnyuzZkG
	p7lApw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40gurtvh0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 17:47:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PHlHk3015142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 17:47:17 GMT
Received: from [10.111.176.36] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 10:47:16 -0700
Message-ID: <a1c7a799-fa9f-4b5a-a40b-dffd392ca928@quicinc.com>
Date: Thu, 25 Jul 2024 10:47:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Support Rx PDEV HTT stats
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240725054227.986851-1-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725054227.986851-1-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j3dE_y7K_4dHAQjBbVF4zPQLqNwhgpDg
X-Proofpoint-ORIG-GUID: j3dE_y7K_4dHAQjBbVF4zPQLqNwhgpDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_16,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_104720_512483_12D274CD 
X-CRM114-Status: GOOD (  18.28  )
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

On 7/24/2024 10:42 PM, Ramya Gnanasekar wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to parse and dump the Rx PDEV related stats such as
> SOC stats, PHY error, MPDU error through htt stats type 2.
> 
> Sample output:
> -------------
> echo 2 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> 
> HTT_RX_PDEV_FW_STATS_TLV:
> mac_id = 0
> ppdu_recvd = 215
> mpdu_cnt_fcs_ok = 215
> mpdu_cnt_fcs_err = 0
> tcp_msdu_cnt = 0
> tcp_ack_msdu_cnt = 0
> udp_msdu_cnt = 0
> other_msdu_cnt = 215
> fw_ring_mpdu_ind = 215
> fw_ring_mgmt_subtype =  0:0, 1:0, 2:0, 3:0, 4:21, 5:1, 6:0, 7:0, 8:193, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> fw_ring_ctrl_subtype =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> fw_ring_mcast_data_msdu = 0
> fw_ring_bcast_data_msdu = 0
> fw_ring_ucast_data_msdu = 0
> fw_ring_null_data_msdu = 0
> fw_ring_mpdu_drop = 0
> ofld_local_data_ind_cnt = 0
> ofld_local_data_buf_recycle_cnt = 0
> drx_local_data_ind_cnt = 0
> drx_local_data_buf_recycle_cnt = 0
> local_nondata_ind_cnt = 215
> local_nondata_buf_recycle_cnt = 215
> fw_status_buf_ring_refill_cnt = 215
> fw_status_buf_ring_empty_cnt = 0
> fw_pkt_buf_ring_refill_cnt = 215
> fw_pkt_buf_ring_empty_cnt = 0
> fw_link_buf_ring_refill_cnt = 215
> fw_link_buf_ring_empty_cnt = 0
> host_pkt_buf_ring_refill_cnt = 0
> host_pkt_buf_ring_empty_cnt = 0
> mon_pkt_buf_ring_refill_cnt = 0
> mon_pkt_buf_ring_empty_cnt = 0
> mon_status_buf_ring_refill_cnt = 0
> mon_status_buf_ring_empty_cnt = 0
> mon_desc_buf_ring_refill_cnt = 0
> mon_desc_buf_ring_empty_cnt = 0
> mon_dest_ring_update_cnt = 0
> mon_dest_ring_full_cnt = 0
> rx_suspend_cnt = 0
> rx_resume_fail_cnt = 0
> rx_ring_switch_cnt = 0
> rx_ring_restore_cnt = 0
> rx_flush_cnt = 0
> rx_recovery_reset_cnt = 0
> 
> HTT_RX_PDEV_FW_RING_MPDU_ERR_TLV:
> fw_ring_mpdu_err =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> 
> HTT_RX_PDEV_FW_MPDU_DROP_TLV:
> fw_mpdu_drop =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> 
> HTT_RX_SOC_FW_STATS_TLV:
> fw_reo_ring_data_msdu = 0
> fw_to_host_data_msdu_bcmc = 0
> fw_to_host_data_msdu_uc = 0
> ofld_remote_data_buf_recycle_cnt = 0
> ofld_remote_free_buf_indication_cnt = 0
> ofld_buf_to_host_data_msdu_uc = 0
> reo_fw_ring_to_host_data_msdu_uc = 0
> wbm_sw_ring_reap = 0
> wbm_forward_to_host_cnt = 0
> wbm_target_recycle_cnt = 0
> target_refill_ring_recycle_cnt = 0
> 
> HTT_RX_SOC_FW_REFILL_RING_EMPTY_TLV:
> refill_ring_empty_cnt =  0:0, 1:0, 2:0, 3:0
> 
> HTT_RX_SOC_FW_REFILL_RING_NUM_REFILL_TLV:
> refill_ring_num_refill =  0:0, 1:0, 2:0, 3:0
> 
> HTT_RX_SOC_FW_REFILL_RING_NUM_RXDMA_ERR_TLV:
> rxdma_err =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> 
> HTT_RX_SOC_FW_REFILL_RING_NUM_REO_ERR_TLV:
> reo_err =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0
> 
> HTT_RX_PDEV_FW_STATS_PHY_ERR_TLV:
> mac_id_word = 0
> total_phy_err_nct = 0
> phy_errs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0, 17:0, 18:0, 19:0, 20:0, 21:0, 22:0, 23:0, 24:0, 25:0, 26:0, 27:0, 28:0, 29:0, 30:0, 31:0, 32:0, 33:0, 34:0, 35:0, 36:0, 37:0, 38:0, 39:0, 40:0, 41:0, 42:0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs.h     |   2 +
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 342 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 138 +++++++
>  3 files changed, 482 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
> index 8d64ba03aa9a..00b34e00cdf2 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.h
> @@ -7,6 +7,8 @@
>  #ifndef _ATH12K_DEBUGFS_H_
>  #define _ATH12K_DEBUGFS_H_
>  
> +#define IEEE80211_MGMT_FRAME_SUBTYPE_MAX	16

why define this here given that this header file doesn't need it?

seems this should be defined in debugfs_htt_stats.h since that actually uses it

also seems we should drop "MGMT_" since this is applicable to all frame types,
not just management frames

> +
>  #ifdef CONFIG_ATH12K_DEBUGFS
>  void ath12k_debugfs_soc_create(struct ath12k_base *ab);
>  void ath12k_debugfs_soc_destroy(struct ath12k_base *ab);
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index f1b7e74aefe4..c2b0bb134c11 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -1447,6 +1447,320 @@ ath12k_htt_print_tx_de_compl_stats_tlv(const void *tag_buf, u16 tag_len,
>  	stats_req->buf_len = len;
>  }
>  
...
> +static void
> +htt_print_rx_soc_fw_refill_ring_num_refill_tlv(const void *tag_buf,
> +					       u16 tag_len,
> +					       struct debug_htt_stats_req *stats_req)
> +{
> +	const struct ath12k_htt_rx_soc_fw_refill_ring_num_refill_tlv *htt_stats_buf =
> +									tag_buf;
> +	u8 *buf = stats_req->buf;
> +	u32 len = stats_req->buf_len;
> +	u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
> +	u16 num_elems = min_t(u16, (tag_len >> 2),
> +				    ATH12K_HTT_RX_STATS_REFILL_MAX_RING);

bad alignment? align on min_t(

> +
> +	len += scnprintf(buf + len, buf_len - len,
> +			 "HTT_RX_SOC_FW_REFILL_RING_NUM_REFILL_TLV:\n");
> +
> +	len += print_array_to_buf(buf, len, "refill_ring_num_refill",
> +			   htt_stats_buf->refill_ring_num_refill,
> +			   num_elems, "\n\n");
> +
> +	stats_req->buf_len = len;
> +}
...
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> index d52b26b23e65..c411e7da4e09 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.h
> @@ -7,6 +7,8 @@
>  #ifndef DEBUG_HTT_STATS_H
>  #define DEBUG_HTT_STATS_H
>  
> +#include "debugfs.h"

is this needed if you move IEEE80211_[MGMT_]FRAME_SUBTYPE_MAX to this file?

just those nit comments from me

/jeff

