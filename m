Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48376C001B0
	for <ath12k@archiver.kernel.org>; Tue, 15 Aug 2023 22:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKKWswuid5hm3fWI+1YdQqRzPIT9xwzKn/WywarKuRA=; b=pJARkgiSlNzPmfoCxgcfw+TSXK
	ppSxFC0hS10QMfR7/1I6ocdUWOI2BUSZhAO0BNkkgyiQIocwh69KyL6YFAUPOlJv3xKLkuBkM1rgj
	zqFpJfgJEM09kCGNSBWmnQAcciMkKSuvjpDaApJXqIpZ0McBOsDJxtrG1p8TUICZmqR5dhuWrd8XN
	RNEFloPWqTVVRRFfEIIMnnDqdEOQRJiqQQs1zahZFdPGwQ/1ZX4Me2KeZmddb7EMj907zRk3juJe2
	TgxNO24q/MHNKrGHMem5DXBuTFUyU5OxRh1trdilyb9AXJthYglX4E7zAVms4dDbM6JmkuEPhUY4d
	eeyhqYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2X0-002ic1-2x
	for ath12k@archiver.kernel.org;
	Tue, 15 Aug 2023 22:28:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2Wx-002ibL-1b
	for ath12k@lists.infradead.org;
	Tue, 15 Aug 2023 22:28:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37FM6LSg021860
	for <ath12k@lists.infradead.org>; Tue, 15 Aug 2023 22:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=shpxq6HslkxRJgJvRkvm6S7VsRMysqHFT5KGvaHeHmk=;
 b=k4pd4UszMIPn2gpMP2e6VrimcNBccqSG1SdDcH9g/5S7zgqmdpakju8/Z0NJD97OrP43
 EjnXW2V1Byle8mmfNG46AjzmOo+qYdqtfjT8zfhkwZQ/Mp6JPcymfoOReWHsEklV+pVL
 sp0v2XpHTz2Q3jg5x9zm8gLiW3Yj50g5qFG9qHecFYEmXfizv01B3YYPMnGu28yvr5V/
 yxBWvJHF4sE9B0MEUXB1tdV+9c3oUu4OOcbZpFCcjCIvy/XfXoidW/IIAD2CsY2nH7UJ
 ms7mKqINbUvlfvmVHfBIPdi8pnpMNRlXfdPYYkFyu1/er+wVLxOqD8D7Zh/TA4aLPk4a 7g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sggu804eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Aug 2023 22:28:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37FMSmQ7027776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Aug 2023 22:28:48 GMT
Received: from [10.48.240.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 15 Aug
 2023 15:28:47 -0700
Message-ID: <18b72ba8-7f0c-ed88-38f7-7422a179519f@quicinc.com>
Date: Tue, 15 Aug 2023 15:28:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] wifi: ath12k: add msdu_end structure for WCN7850
Content-Language: en-US
To: <ath12k@lists.infradead.org>
References: <20230815062610.59248-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230815062610.59248-1-quic_kangyang@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H94ywjVtzpsvdDjBsL7M9m9gwb3dcNMk
X-Proofpoint-ORIG-GUID: H94ywjVtzpsvdDjBsL7M9m9gwb3dcNMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-15_19,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308150202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_152851_575236_13A5950F 
X-CRM114-Status: GOOD (  28.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/14/2023 11:26 PM, Kang Yang wrote:
> WCN7850 and QCN9274 use the same structure rx_msdu_end_qcn9274 for

Suggest s/use/currently use/ to clarify this is the current behavior and 
not the expected behavior

> msdu_end. But content of msdu_end on WCN7850 is different from that of
> QCN9274. Need to update it for WCN7850, otherwise will get the wrong
> values when using it.
> 
> For example, TID is no longer in WCN7850's msdu_end. But
> ath12k_dp_rx_process_err and ath12k_dp_rx_process_wbm_err still get TID

Please add () to function references

> from msdu_end. So an uncertain value will be used in these two functions
> on WCN7850.
> 
> Therefore, add new structure rx_msdu_end_wcn7850 for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/hal.c     |  6 +--
>   drivers/net/wireless/ath/ath12k/rx_desc.h | 53 ++++++++++++++++++++++-
>   2 files changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index e7a150e7158e..19b4207ca048 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -824,8 +824,8 @@ static u8 ath12k_hw_wcn7850_rx_desc_get_msdu_nss(struct hal_rx_desc *desc)
>   
>   static u8 ath12k_hw_wcn7850_rx_desc_get_mpdu_tid(struct hal_rx_desc *desc)
>   {
> -	return le16_get_bits(desc->u.wcn7850.msdu_end.info5,
> -			     RX_MSDU_END_INFO5_TID);
> +	return le32_get_bits(desc->u.wcn7850.mpdu_start.info2,
> +			     RX_MPDU_START_INFO2_TID);
>   }
>   
>   static u16 ath12k_hw_wcn7850_rx_desc_get_mpdu_peer_id(struct hal_rx_desc *desc)
> @@ -837,7 +837,7 @@ static void ath12k_hw_wcn7850_rx_desc_copy_end_tlv(struct hal_rx_desc *fdesc,
>   						   struct hal_rx_desc *ldesc)
>   {
>   	memcpy(&fdesc->u.wcn7850.msdu_end, &ldesc->u.wcn7850.msdu_end,
> -	       sizeof(struct rx_msdu_end_qcn9274));
> +	       sizeof(struct rx_msdu_end_wcn7850));
>   }
>   
>   static u32 ath12k_hw_wcn7850_rx_desc_get_mpdu_start_tag(struct hal_rx_desc *desc)
> diff --git a/drivers/net/wireless/ath/ath12k/rx_desc.h b/drivers/net/wireless/ath/ath12k/rx_desc.h
> index f99556a253e5..8769d8f3e7ea 100644
> --- a/drivers/net/wireless/ath/ath12k/rx_desc.h
> +++ b/drivers/net/wireless/ath/ath12k/rx_desc.h
> @@ -782,6 +782,57 @@ struct rx_msdu_end_qcn9274 {
>   	__le32 info14;
>   } __packed;
>   
> +struct rx_msdu_end_wcn7850 {
> +	__le16 info0;
> +	__le16 phy_ppdu_id;
> +	__le16 ip_hdr_cksum;
> +	__le16 info1;
> +	__le16 info2;
> +	__le16 cumulative_l3_checksum;
> +	__le32 rule_indication0;
> +	__le32 rule_indication1;
> +	__le16 info3;
> +	__le16 l3_type;
> +	__le32 ipv6_options_crc;
> +	__le32 tcp_seq_num;
> +	__le32 tcp_ack_num;
> +	__le16 info4;
> +	__le16 window_size;
> +	__le16 tcp_udp_chksum;
> +	__le16 info5;
> +	__le16 sa_idx;
> +	__le16 da_idx_or_sw_peer_id;
> +	__le32 info6;
> +	__le32 fse_metadata;
> +	__le16 cce_metadata;
> +	__le16 sa_sw_peer_id;
> +	__le16 info7;
> +	__le16 rsvd0;
> +	__le16 cumulative_l4_checksum;
> +	__le16 cumulative_ip_length;
> +	__le32 info9;
> +	__le32 info10;
> +	__le32 info11;
> +	__le32 toeplitz_hash_2_or_4;
> +	__le32 flow_id_toeplitz;
> +	__le32 info12;
> +	__le32 ppdu_start_timestamp_31_0;
> +	__le32 ppdu_start_timestamp_63_32;
> +	__le32 phy_meta_data;
> +	__le16 vlan_ctag_ci;
> +	__le16 vlan_stag_ci;
> +	__le32 rsvd[3];
> +	__le32 info13;
> +	__le32 info14;
> +} __packed;
> +
> +/* These macro definitions are only used for WCN7850 */
> +#define RX_MSDU_END_INFO5_MSDU_LIMIT_ERR       BIT(2)
> +#define RX_MSDU_END_INFO5_IDX_TIMOUT           BIT(3)
> +#define RX_MSDU_END_INFO5_IDX_INVLID           BIT(4)
> +#define RX_MSDU_END_INFO5_WIFI_PARSE_ERR       BIT(5)
> +#define RX_MSDU_END_INFO5_AMSDU_PARSER_ERR     BIT(6)
> +

What uses these macros?
Is there a reason to not spell out TIMEOUT and INVALID?

If there are two different structs with two different decodings for 
info5 then it seems strange to have macros which don't have the chipset 
in the macro name. So I'd expect these to be named 
RX_MSDU_END_WCN7850_INFO5_* and the QCN9274 ones to be named 
RX_MSDU_END_QCN9274_INFO5_*. Only if there are members that are 
identical between WCN7850 and QCN9274 would it make sense to not have a 
chipset-specific name.

>   /* rx_msdu_end
>    *
>    * rxpcu_mpdu_filter_in_category
> @@ -1410,7 +1461,7 @@ struct rx_pkt_hdr_tlv {
>   
>   struct hal_rx_desc_wcn7850 {
>   	__le64 msdu_end_tag;
> -	struct rx_msdu_end_qcn9274 msdu_end;
> +	struct rx_msdu_end_wcn7850 msdu_end;
>   	u8 rx_padding0[RX_BE_PADDING0_BYTES];
>   	__le64 mpdu_start_tag;
>   	struct rx_mpdu_start_qcn9274 mpdu_start;


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
