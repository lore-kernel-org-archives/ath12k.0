Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEBFD1712B
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 19:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELoGXcMeqax1GzVL+5XEJ7sG7liXvHxrJAzQ5/2E0N8=; b=LsBsSl5Qg4wY1NXQJk6poa0WOX
	1Hmm86hRS4tzwBcQ2u/IItfQp5bvJhTCKDGX703IAn4ox0jxDulY99QSFhilVMTLg+9jE64ZsMRlX
	X5eDr9dgI18cbV18lAclVXBC0TO7fK1UpP2We3E+Sf7c5hcNNjGEraHK+H+7seq8ypoIMXaesATpy
	CryKsXVs1+MYelyukj4yKPfc/Nryj+v+qrSwisXejJ2WqjmvUZJSZ4tHVtK3YQuIXK2L9Y3buD+Br
	P3wlu63v1nQEVISskkrbfMCL67BSBV210Kc+eaxk1S3NBWJ4WIIRvwwu5klVZiX/Hwc0f6Wnr0W4k
	Os1A5QYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2yNl-00000008UTn-0z48
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 19:48:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2yNg-00000008UTI-3k8e
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 19:47:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LACGsi023157;
	Mon, 21 Oct 2024 19:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ELoGXcMeqax1GzVL+5XEJ7sG7liXvHxrJAzQ5/2E0N8=; b=X1EJzdvnd4A9xQFW
	ZebHLaWjw2jbyInCOQSt4KdC7lBtoVFt6S0APH6Mv1hWYI1HVu6ctkYuAfXnyYyf
	pJrdut701QAgQ+tI9gCjr+OSLBJSksLk+wnaFJ6Et38eOXv2tpzSxh3riZO+9hbj
	PXmeNPsyUr5yIY91fxP7/K0DYGNXMWRpRlF09FKKcxW6k/Pd+hd5gLNMQafJ/1ZA
	BP4mSu/UnhM7DUDb8IwCZbhb8Z8PphIHen6ghRW4mVyeF2f4UOxv5IpZij0ZDttj
	B8Gq2/GGVrlffNriKDO7Aj47ndBd4u20uKAfP12O52dY3lyhwiNS4dgbVyklkEn1
	ktZNsQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rbdwap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 19:47:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LJliEH015343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 19:47:44 GMT
Received: from [10.48.241.209] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 12:47:44 -0700
Message-ID: <249ebd4c-1278-45a8-a4af-6a47520400af@quicinc.com>
Date: Mon, 21 Oct 2024 12:47:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Introduce a helper macro for print
 functions
To: Kees Bakker <kees@ijzerbout.nl>, ATH12K <ath12k@lists.infradead.org>,
        Linux Wireless <linux-wireless@vger.kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
References: <20241021182415.6993818DB71@bout3.ijzerbout.nl>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241021182415.6993818DB71@bout3.ijzerbout.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tvBUm4pYsAuz7QXSnQIMZ7iAp9cZk0L2
X-Proofpoint-GUID: tvBUm4pYsAuz7QXSnQIMZ7iAp9cZk0L2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_124757_064244_096F5CD4 
X-CRM114-Status: GOOD (  21.89  )
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

On 10/21/2024 11:11 AM, Kees Bakker wrote:

Please follow the order normally used in the kernel:
1) describe the current code
2) describe the problem with the current code
3) describe how to fix the code (in imperative voice)

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> The functions print_array_to_buf_index and print_array_to_buf are now
> wrapped by macro's to avoid mistakes with passing the array size. The
> actual cause was this mistake
> 	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
> 					htt_stats_buf->ax_mu_mimo_brpoll,
> 					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
> The problem is that the size of array ax_mu_mimo_brpoll is
> ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS - 1.
> That is an easy error to make and the consequence is that the print
> function is trying to access more array entries than there actually are.
> 
> The new macro is taking care of finding the array size using ARRAY_SIZE.
> The new code becomes cleaner.
> 	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
> 					htt_stats_buf->ax_mu_mimo_brpoll,
> 					"\n");
> 
> The incorrect array size was detected by Coverity, CID 1600742

Not sure how this CID helps unless it is something I can uniquely reference in
a database somewhere.

> 
> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> ---
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 226 +++++++-----------
>  1 file changed, 93 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index 799b865b89e5..a50ffbc081f7 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -11,8 +11,13 @@
>  #include "dp_tx.h"
>  #include "dp_rx.h"
>  
> +#define print_array_to_buf_index(buf, offset, header, stats_index, \
> +			 array, footer) \
> +	_print_array_to_buf_index(buf, offset, header, stats_index, \
> +		array, ARRAY_SIZE(array), footer \
> +	)
>  static u32
> -print_array_to_buf_index(u8 *buf, u32 offset, const char *header, u32 stats_index,
> +_print_array_to_buf_index(u8 *buf, u32 offset, const char *header, u32 stats_index,
>  			 const __le32 *array, u32 array_len, const char *footer)
>  {
>  	int index = 0;
> @@ -40,11 +45,16 @@ print_array_to_buf_index(u8 *buf, u32 offset, const char *header, u32 stats_inde
>  	return index;
>  }
>  
> +#define print_array_to_buf(buf, offset, header, array, footer) \
> +	_print_array_to_buf(buf, offset, header, \
> +		array, ARRAY_SIZE(array), \
> +		footer \
> +	)
>  static u32
> -print_array_to_buf(u8 *buf, u32 offset, const char *header,
> +_print_array_to_buf(u8 *buf, u32 offset, const char *header,
>  		   const __le32 *array, u32 array_len, const char *footer)
>  {
> -	return print_array_to_buf_index(buf, offset, header, 0, array, array_len,
> +	return _print_array_to_buf_index(buf, offset, header, 0, array, array_len,
>  					footer);
>  }
>  
> @@ -253,7 +263,7 @@ htt_print_tx_pdev_stats_urrn_tlv(const void *tag_buf,
>  	len += scnprintf(buf + len, buf_len - len,
>  			"HTT_TX_PDEV_STATS_URRN_TLV:\n");
>  
> -	len += print_array_to_buf(buf, len, "urrn_stats", htt_stats_buf->urrn_stats,
> +	len += _print_array_to_buf(buf, len, "urrn_stats", htt_stats_buf->urrn_stats,
>  				  num_elems, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -274,7 +284,7 @@ htt_print_tx_pdev_stats_flush_tlv(const void *tag_buf,
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_TX_PDEV_STATS_FLUSH_TLV:\n");
>  
> -	len += print_array_to_buf(buf, len, "flush_errs", htt_stats_buf->flush_errs,
> +	len += _print_array_to_buf(buf, len, "flush_errs", htt_stats_buf->flush_errs,
>  				  num_elems, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -295,7 +305,7 @@ htt_print_tx_pdev_stats_sifs_tlv(const void *tag_buf,
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_TX_PDEV_STATS_SIFS_TLV:\n");
>  
> -	len += print_array_to_buf(buf, len, "sifs_status", htt_stats_buf->sifs_status,
> +	len += _print_array_to_buf(buf, len, "sifs_status", htt_stats_buf->sifs_status,
>  				  num_elems, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -407,7 +417,7 @@ htt_print_tx_pdev_stats_sifs_hist_tlv(const void *tag_buf,
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_TX_PDEV_STATS_SIFS_HIST_TLV:\n");
>  
> -	len += print_array_to_buf(buf, len, "sifs_hist_status",
> +	len += _print_array_to_buf(buf, len, "sifs_hist_status",
>  				  htt_stats_buf->sifs_hist_status, num_elems, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -429,7 +439,7 @@ htt_print_pdev_ctrl_path_tx_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 "HTT_TX_PDEV_STATS_CTRL_PATH_TX_STATS:\n");
>  	len += print_array_to_buf(buf, len, "fw_tx_mgmt_subtype",
>  				 htt_stats_buf->fw_tx_mgmt_subtype,
> -				 ATH12K_HTT_STATS_SUBTYPE_MAX, "\n\n");
> +				 "\n\n");
>  
>  	stats_req->buf_len = len;
>  }
> @@ -557,7 +567,7 @@ ath12k_htt_print_sched_txq_cmd_posted_tlv(const void *tag_buf,
>  	u16 num_elements = tag_len >> 2;
>  
>  	len += scnprintf(buf + len, buf_len - len, "HTT_SCHED_TXQ_CMD_POSTED_TLV:\n");
> -	len += print_array_to_buf(buf, len, "sched_cmd_posted",
> +	len += _print_array_to_buf(buf, len, "sched_cmd_posted",
>  				  htt_stats_buf->sched_cmd_posted, num_elements, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -575,7 +585,7 @@ ath12k_htt_print_sched_txq_cmd_reaped_tlv(const void *tag_buf,
>  	u16 num_elements = tag_len >> 2;
>  
>  	len += scnprintf(buf + len, buf_len - len, "HTT_SCHED_TXQ_CMD_REAPED_TLV:\n");
> -	len += print_array_to_buf(buf, len, "sched_cmd_reaped",
> +	len += _print_array_to_buf(buf, len, "sched_cmd_reaped",
>  				  htt_stats_buf->sched_cmd_reaped, num_elements, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -595,7 +605,7 @@ ath12k_htt_print_sched_txq_sched_order_su_tlv(const void *tag_buf,
>  
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_SCHED_TXQ_SCHED_ORDER_SU_TLV:\n");
> -	len += print_array_to_buf(buf, len, "sched_order_su",
> +	len += _print_array_to_buf(buf, len, "sched_order_su",
>  				  htt_stats_buf->sched_order_su,
>  				  sched_order_su_num_entries, "\n\n");
>  
> @@ -616,7 +626,7 @@ ath12k_htt_print_sched_txq_sched_ineligibility_tlv(const void *tag_buf,
>  
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_SCHED_TXQ_SCHED_INELIGIBILITY:\n");
> -	len += print_array_to_buf(buf, len, "sched_ineligibility",
> +	len += _print_array_to_buf(buf, len, "sched_ineligibility",
>  				  htt_stats_buf->sched_ineligibility,
>  				  sched_ineligibility_num_entries, "\n\n");
>  
> @@ -638,7 +648,7 @@ ath12k_htt_print_sched_txq_supercycle_trigger_tlv(const void *tag_buf,
>  
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_SCHED_TXQ_SUPERCYCLE_TRIGGER:\n");
> -	len += print_array_to_buf(buf, len, "supercycle_triggers",
> +	len += _print_array_to_buf(buf, len, "supercycle_triggers",
>  				  htt_stats_buf->supercycle_triggers, num_elems, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -1043,7 +1053,7 @@ ath12k_htt_print_tx_tqm_gen_mpdu_stats_tlv(const void *tag_buf, u16 tag_len,
>  	u16 num_elements = tag_len >> 2;
>  
>  	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TQM_GEN_MPDU_STATS_TLV:\n");
> -	len += print_array_to_buf(buf, len, "gen_mpdu_end_reason",
> +	len += _print_array_to_buf(buf, len, "gen_mpdu_end_reason",
>  				  htt_stats_buf->gen_mpdu_end_reason, num_elements,
>  				  "\n\n");
>  
> @@ -1062,7 +1072,7 @@ ath12k_htt_print_tx_tqm_list_mpdu_stats_tlv(const void *tag_buf, u16 tag_len,
>  			      ATH12K_HTT_TX_TQM_MAX_LIST_MPDU_END_REASON);
>  
>  	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TQM_LIST_MPDU_STATS_TLV:\n");
> -	len += print_array_to_buf(buf, len, "list_mpdu_end_reason",
> +	len += _print_array_to_buf(buf, len, "list_mpdu_end_reason",
>  				  htt_stats_buf->list_mpdu_end_reason, num_elems, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -1080,7 +1090,7 @@ ath12k_htt_print_tx_tqm_list_mpdu_cnt_tlv(const void *tag_buf, u16 tag_len,
>  			      ATH12K_HTT_TX_TQM_MAX_LIST_MPDU_CNT_HISTOGRAM_BINS);
>  
>  	len += scnprintf(buf + len, buf_len - len, "HTT_TX_TQM_LIST_MPDU_CNT_TLV_V:\n");
> -	len += print_array_to_buf(buf, len, "list_mpdu_cnt_hist",
> +	len += _print_array_to_buf(buf, len, "list_mpdu_cnt_hist",
>  				  htt_stats_buf->list_mpdu_cnt_hist, num_elems, "\n\n");
>  
>  	stats_req->buf_len = len;
> @@ -1562,7 +1572,7 @@ ath12k_htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_ndp));
>  	len += print_array_to_buf_index(buf, len, "ac_mu_mimo_brpollX_tried = ", 1,
>  					htt_stats_buf->ac_mu_mimo_brpoll,
> -					ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS, "\n\n");
> +					"\n\n");
>  
>  	stats_req->buf_len = len;
>  }
> @@ -1590,7 +1600,7 @@ ath12k_htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
>  	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
>  					htt_stats_buf->ax_mu_mimo_brpoll,
> -					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
> +					"\n");
>  	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
>  			 le32_to_cpu(htt_stats_buf->ax_basic_trigger));
>  	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_total_trigger = %u\n",
> @@ -1636,15 +1646,12 @@ ath12k_htt_print_tx_selfgen_be_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 le32_to_cpu(htt_stats_buf->be_mu_mimo_ndp));
>  	len += print_array_to_buf_index(buf, len, "be_mu_mimo_brpollX_queued = ", 1,
>  					htt_stats_buf->be_mu_mimo_brpoll_queued,
> -					ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS - 1,
>  					"\n");
>  	len += print_array_to_buf_index(buf, len, "be_mu_mimo_brpollX_tried = ", 1,
>  					htt_stats_buf->be_mu_mimo_brpoll,
> -					ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS - 1,
>  					"\n");
>  	len += print_array_to_buf(buf, len, "be_ul_mumimo_trigger = ",
> -				  htt_stats_buf->be_ul_mumimo_trigger,
> -				  ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS, "\n");
> +				  htt_stats_buf->be_ul_mumimo_trigger, "\n");
>  	len += scnprintf(buf + len, buf_len - len, "be_basic_trigger = %u\n",
>  			 le32_to_cpu(htt_stats_buf->be_basic_trigger));
>  	len += scnprintf(buf + len, buf_len - len, "be_ulmumimo_total_trigger = %u\n",
> @@ -1713,7 +1720,6 @@ ath12k_htt_print_tx_selfgen_ax_err_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp_err));
>  	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpX_err", 1,
>  					htt_stats_buf->ax_mu_mimo_brp_err,
> -					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS - 1,
>  					"\n");
>  	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger_err = %u\n",
>  			 le32_to_cpu(htt_stats_buf->ax_basic_trigger_err));
> @@ -1760,18 +1766,14 @@ ath12k_htt_print_tx_selfgen_be_err_stats_tlv(const void *tag_buf, u16 tag_len,
>  			 le32_to_cpu(htt_stats_buf->be_mu_mimo_ndp_flushed));
>  	len += print_array_to_buf_index(buf, len, "be_mu_mimo_brpX_err", 1,
>  					htt_stats_buf->be_mu_mimo_brp_err,
> -					ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS - 1,
>  					"\n");
>  	len += print_array_to_buf_index(buf, len, "be_mu_mimo_brpollX_flushed", 1,
>  					htt_stats_buf->be_mu_mimo_brpoll_flushed,
> -					ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS - 1,
>  					"\n");
>  	len += print_array_to_buf(buf, len, "be_mu_mimo_num_cbf_rcvd_on_brp_err",
> -				  htt_stats_buf->be_mu_mimo_brp_err_num_cbf_rxd,
> -				  ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS, "\n");
> +				  htt_stats_buf->be_mu_mimo_brp_err_num_cbf_rxd, "\n");
>  	len += print_array_to_buf(buf, len, "be_ul_mumimo_trigger_err",
> -				  htt_stats_buf->be_ul_mumimo_trigger_err,
> -				  ATH12K_HTT_TX_NUM_BE_MUMIMO_USER_STATS, "\n");
> +				  htt_stats_buf->be_ul_mumimo_trigger_err, "\n");
>  	len += scnprintf(buf + len, buf_len - len, "be_basic_trigger_err = %u\n",
>  			 le32_to_cpu(htt_stats_buf->be_basic_trigger_err));
>  	len += scnprintf(buf + len, buf_len - len, "be_ulmumimo_total_trig_err = %u\n",
> @@ -1802,29 +1804,21 @@ ath12k_htt_print_tx_selfgen_ac_sched_status_stats_tlv(const void *tag_buf, u16 t
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_TX_SELFGEN_AC_SCHED_STATUS_STATS_TLV:\n");
>  	len += print_array_to_buf(buf, len, "ac_su_ndpa_sch_status",
> -				  htt_stats_buf->ac_su_ndpa_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ac_su_ndpa_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ac_su_ndp_sch_status",
> -				  htt_stats_buf->ac_su_ndp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ac_su_ndp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ac_mu_mimo_ndpa_sch_status",
> -				  htt_stats_buf->ac_mu_mimo_ndpa_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ac_mu_mimo_ndpa_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ac_mu_mimo_ndp_sch_status",
> -				  htt_stats_buf->ac_mu_mimo_ndp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ac_mu_mimo_ndp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ac_mu_mimo_brp_sch_status",
> -				  htt_stats_buf->ac_mu_mimo_brp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ac_mu_mimo_brp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ac_su_ndp_sch_flag_err",
> -				  htt_stats_buf->ac_su_ndp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->ac_su_ndp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "ac_mu_mimo_ndp_sch_flag_err",
> -				  htt_stats_buf->ac_mu_mimo_ndp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->ac_mu_mimo_ndp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "ac_mu_mimo_brp_sch_flag_err",
> -				  htt_stats_buf->ac_mu_mimo_brp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n\n");
> +				  htt_stats_buf->ac_mu_mimo_brp_sch_flag_err, "\n\n");
>  
>  	stats->buf_len = len;
>  }
> @@ -1845,47 +1839,33 @@ ath12k_htt_print_tx_selfgen_ax_sched_status_stats_tlv(const void *tag_buf, u16 t
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_TX_SELFGEN_AX_SCHED_STATUS_STATS_TLV:\n");
>  	len += print_array_to_buf(buf, len, "ax_su_ndpa_sch_status",
> -				  htt_stats_buf->ax_su_ndpa_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_su_ndpa_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_su_ndp_sch_status",
> -				  htt_stats_buf->ax_su_ndp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_su_ndp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_mu_mimo_ndpa_sch_status",
> -				  htt_stats_buf->ax_mu_mimo_ndpa_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_mu_mimo_ndpa_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_mu_mimo_ndp_sch_status",
> -				  htt_stats_buf->ax_mu_mimo_ndp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_mu_mimo_ndp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_mu_brp_sch_status",
> -				  htt_stats_buf->ax_mu_brp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_mu_brp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_mu_bar_sch_status",
> -				  htt_stats_buf->ax_mu_bar_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_mu_bar_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_basic_trig_sch_status",
> -				  htt_stats_buf->ax_basic_trig_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_basic_trig_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_su_ndp_sch_flag_err",
> -				  htt_stats_buf->ax_su_ndp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->ax_su_ndp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "ax_mu_mimo_ndp_sch_flag_err",
> -				  htt_stats_buf->ax_mu_mimo_ndp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->ax_mu_mimo_ndp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "ax_mu_brp_sch_flag_err",
> -				  htt_stats_buf->ax_mu_brp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->ax_mu_brp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "ax_mu_bar_sch_flag_err",
> -				  htt_stats_buf->ax_mu_bar_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->ax_mu_bar_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "ax_basic_trig_sch_flag_err",
> -				  htt_stats_buf->ax_basic_trig_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->ax_basic_trig_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "ax_ulmumimo_trig_sch_status",
> -				  htt_stats_buf->ax_ulmumimo_trig_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->ax_ulmumimo_trig_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "ax_ulmumimo_trig_sch_flag_err",
> -				  htt_stats_buf->ax_ulmumimo_trig_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n\n");
> +				  htt_stats_buf->ax_ulmumimo_trig_sch_flag_err, "\n\n");
>  
>  	stats->buf_len = len;
>  }
> @@ -1906,47 +1886,33 @@ ath12k_htt_print_tx_selfgen_be_sched_status_stats_tlv(const void *tag_buf, u16 t
>  	len += scnprintf(buf + len, buf_len - len,
>  			 "HTT_TX_SELFGEN_BE_SCHED_STATUS_STATS_TLV:\n");
>  	len += print_array_to_buf(buf, len, "be_su_ndpa_sch_status",
> -				  htt_stats_buf->be_su_ndpa_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_su_ndpa_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "be_su_ndp_sch_status",
> -				  htt_stats_buf->be_su_ndp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_su_ndp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "be_mu_mimo_ndpa_sch_status",
> -				  htt_stats_buf->be_mu_mimo_ndpa_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_mu_mimo_ndpa_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "be_mu_mimo_ndp_sch_status",
> -				  htt_stats_buf->be_mu_mimo_ndp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_mu_mimo_ndp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "be_mu_brp_sch_status",
> -				  htt_stats_buf->be_mu_brp_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_mu_brp_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "be_mu_bar_sch_status",
> -				  htt_stats_buf->be_mu_bar_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_mu_bar_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "be_basic_trig_sch_status",
> -				  htt_stats_buf->be_basic_trig_sch_status,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_basic_trig_sch_status, "\n");
>  	len += print_array_to_buf(buf, len, "be_su_ndp_sch_flag_err",
> -				  htt_stats_buf->be_su_ndp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->be_su_ndp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "be_mu_mimo_ndp_sch_flag_err",
> -				  htt_stats_buf->be_mu_mimo_ndp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->be_mu_mimo_ndp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "be_mu_brp_sch_flag_err",
> -				  htt_stats_buf->be_mu_brp_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->be_mu_brp_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "be_mu_bar_sch_flag_err",
> -				  htt_stats_buf->be_mu_bar_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->be_mu_bar_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "be_basic_trig_sch_flag_err",
> -				  htt_stats_buf->be_basic_trig_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n");
> +				  htt_stats_buf->be_basic_trig_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "be_basic_trig_sch_flag_err",
> -				  htt_stats_buf->be_basic_trig_sch_flag_err,
> -				  ATH12K_HTT_TX_PDEV_STATS_NUM_TX_ERR_STATUS, "\n");
> +				  htt_stats_buf->be_basic_trig_sch_flag_err, "\n");
>  	len += print_array_to_buf(buf, len, "be_ulmumimo_trig_sch_flag_err",
> -				  htt_stats_buf->be_ulmumimo_trig_sch_flag_err,
> -				  ATH12K_HTT_TX_SELFGEN_SCH_TSFLAG_ERR_STATS, "\n\n");
> +				  htt_stats_buf->be_ulmumimo_trig_sch_flag_err, "\n\n");
>  
>  	stats->buf_len = len;
>  }
> @@ -2116,7 +2082,7 @@ ath12k_htt_print_sfm_client_user_tlv(const void *tag_buf, u16 tag_len,
>  	u16 num_elems = tag_len >> 2;
>  
>  	len += scnprintf(buf + len, buf_len - len, "HTT_SFM_CLIENT_USER_TLV:\n");
> -	len += print_array_to_buf(buf, len, "dwords_used_by_user_n",
> +	len += _print_array_to_buf(buf, len, "dwords_used_by_user_n",
>  				  htt_stats_buf->dwords_used_by_user_n,
>  				  num_elems, "\n\n");
>  
> @@ -2256,33 +2222,28 @@ ath12k_htt_print_tx_pdev_mumimo_grp_stats_tlv(const void *tag_buf, u16 tag_len,
>  	len += scnprintf(buf + len, buf_len - len, "HTT_TX_PDEV_MUMIMO_GRP_STATS:\n");
>  	len += print_array_to_buf(buf, len,
>  				  "dl_mumimo_grp_tputs_observed (per bin = 300 mbps)",
> -				  htt_stats_buf->dl_mumimo_grp_tputs,
> -				  ATH12K_HTT_STATS_MUMIMO_TPUT_NUM_BINS, "\n");
> +				  htt_stats_buf->dl_mumimo_grp_tputs, "\n");
>  	len += print_array_to_buf(buf, len, "dl_mumimo_grp eligible",
> -				  htt_stats_buf->dl_mumimo_grp_eligible,
> -				  ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ, "\n");
> +				  htt_stats_buf->dl_mumimo_grp_eligible, "\n");
>  	len += print_array_to_buf(buf, len, "dl_mumimo_grp_ineligible",
> -				  htt_stats_buf->dl_mumimo_grp_ineligible,
> -				  ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ, "\n");
> +				  htt_stats_buf->dl_mumimo_grp_ineligible, "\n");
>  	len += scnprintf(buf + len, buf_len - len, "dl_mumimo_grp_invalid:\n");
>  	for (j = 0; j < ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ; j++) {
>  		len += scnprintf(buf + len, buf_len - len, "grp_id = %u", j);
> -		len += print_array_to_buf(buf, len, "",
> +		len += _print_array_to_buf(buf, len, "",
>  					  htt_stats_buf->dl_mumimo_grp_invalid,
>  					  ATH12K_HTT_STATS_MAX_INVALID_REASON_CODE,
>  					  "\n");
>  	}
>  
>  	len += print_array_to_buf(buf, len, "ul_mumimo_grp_best_grp_size",
> -				  htt_stats_buf->ul_mumimo_grp_best_grp_size,
> -				  ATH12K_HTT_STATS_NUM_MAX_MUMIMO_SZ, "\n");
> +				  htt_stats_buf->ul_mumimo_grp_best_grp_size, "\n");
>  	len += print_array_to_buf_index(buf, len, "ul_mumimo_grp_best_num_usrs = ", 1,
>  					htt_stats_buf->ul_mumimo_grp_best_usrs,
> -					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
> +					"\n");
>  	len += print_array_to_buf(buf, len,
>  				  "ul_mumimo_grp_tputs_observed (per bin = 300 mbps)",
> -				  htt_stats_buf->ul_mumimo_grp_tputs,
> -				  ATH12K_HTT_STATS_MUMIMO_TPUT_NUM_BINS, "\n\n");
> +				  htt_stats_buf->ul_mumimo_grp_tputs, "\n\n");
>  
>  	stats_req->buf_len = len;
>  }
> @@ -2608,46 +2569,46 @@ ath12k_htt_print_pdev_sched_algo_ofdma_stats_tlv(const void *tag_buf, u16 tag_le
>  			 u32_get_bits(mac_id_word, ATH12K_HTT_STATS_MAC_ID));
>  	len += print_array_to_buf(buf, len, "rate_based_dlofdma_enabled_count",
>  				  htt_stats_buf->rate_based_dlofdma_enabled_cnt,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "rate_based_dlofdma_disabled_count",
>  				  htt_stats_buf->rate_based_dlofdma_disabled_cnt,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "rate_based_dlofdma_probing_count",
>  				  htt_stats_buf->rate_based_dlofdma_disabled_cnt,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "rate_based_dlofdma_monitoring_count",
>  				  htt_stats_buf->rate_based_dlofdma_monitor_cnt,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "chan_acc_lat_based_dlofdma_enabled_count",
>  				  htt_stats_buf->chan_acc_lat_based_dlofdma_enabled_cnt,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "chan_acc_lat_based_dlofdma_disabled_count",
>  				  htt_stats_buf->chan_acc_lat_based_dlofdma_disabled_cnt,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "chan_acc_lat_based_dlofdma_monitoring_count",
>  				  htt_stats_buf->chan_acc_lat_based_dlofdma_monitor_cnt,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "downgrade_to_dl_su_ru_alloc_fail",
>  				  htt_stats_buf->downgrade_to_dl_su_ru_alloc_fail,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "candidate_list_single_user_disable_ofdma",
>  				  htt_stats_buf->candidate_list_single_user_disable_ofdma,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "dl_cand_list_dropped_high_ul_qos_weight",
>  				  htt_stats_buf->dl_cand_list_dropped_high_ul_qos_weight,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "ax_dlofdma_disabled_due_to_pipelining",
>  				  htt_stats_buf->ax_dlofdma_disabled_due_to_pipelining,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "dlofdma_disabled_su_only_eligible",
>  				  htt_stats_buf->dlofdma_disabled_su_only_eligible,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "dlofdma_disabled_consec_no_mpdus_tried",
>  				  htt_stats_buf->dlofdma_disabled_consec_no_mpdus_tried,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "dlofdma_disabled_consec_no_mpdus_success",
>  				  htt_stats_buf->dlofdma_disabled_consec_no_mpdus_success,
> -				  ATH12K_HTT_NUM_AC_WMM, "\n\n");
> +				  "\n\n");
>  
>  	stats_req->buf_len = len;
>  }
> @@ -2676,10 +2637,10 @@ ath12k_htt_print_tx_pdev_rate_stats_be_ofdma_tlv(const void *tag_buf, u16 tag_le
>  			 le32_to_cpu(htt_stats_buf->be_ofdma_tx_ldpc));
>  	len += print_array_to_buf(buf, len, "be_ofdma_tx_mcs",
>  				  htt_stats_buf->be_ofdma_tx_mcs,
> -				  ATH12K_HTT_TX_PDEV_NUM_BE_MCS_CNTRS, "\n");
> +				  "\n");
>  	len += print_array_to_buf(buf, len, "be_ofdma_eht_sig_mcs",
>  				  htt_stats_buf->be_ofdma_eht_sig_mcs,
> -				  ATH12K_HTT_TX_PDEV_NUM_EHT_SIG_MCS_CNTRS, "\n");
> +				  "\n");
>  	len += scnprintf(buf + len, buf_len - len, "be_ofdma_tx_ru_size = ");
>  	for (i = 0; i < ATH12K_HTT_TX_RX_PDEV_NUM_BE_RU_SIZE_CNTRS; i++)
>  		len += scnprintf(buf + len, buf_len - len, " %s:%u ",
> @@ -2688,15 +2649,14 @@ ath12k_htt_print_tx_pdev_rate_stats_be_ofdma_tlv(const void *tag_buf, u16 tag_le
>  	len += scnprintf(buf + len, buf_len - len, "\n");
>  	len += print_array_to_buf_index(buf, len, "be_ofdma_tx_nss = ", 1,
>  					htt_stats_buf->be_ofdma_tx_nss,
> -					ATH12K_HTT_TX_PDEV_STATS_NUM_SPATIAL_STREAMS,
>  					"\n");
>  	len += print_array_to_buf(buf, len, "be_ofdma_tx_bw",
>  				  htt_stats_buf->be_ofdma_tx_bw,
> -				  ATH12K_HTT_TX_PDEV_NUM_BE_BW_CNTRS, "\n");
> +				  "\n");
>  	for (i = 0; i < ATH12K_HTT_TX_PDEV_NUM_GI_CNTRS; i++) {
>  		len += scnprintf(buf + len, buf_len - len,
>  				 "be_ofdma_tx_gi[%u]", i);
> -		len += print_array_to_buf(buf, len, "", htt_stats_buf->gi[i],
> +		len += _print_array_to_buf(buf, len, "", htt_stats_buf->gi[i],
>  					  ATH12K_HTT_TX_PDEV_NUM_BE_MCS_CNTRS, "\n");
>  	}
>  	len += scnprintf(buf + len, buf_len - len, "\n");

Our ath12k-check script reports:
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:14: Macro argument reuse 'array' - possible side-effects?
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:21: Alignment should match open parenthesis
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:48: Macro argument reuse 'array' - possible side-effects?
drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:55: Alignment should match open parenthesis

I'm also thinking it would be better to first fix the problematic calls by
adding the "- 1" to those calls so that the simple fix could be backported to
earlier kernels that have the issue.  This would need a "Fixes:" tag (or tags).

And then introduce the new APIs for changes going forward.

/jeff

