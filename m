Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B0CC27C40
	for <ath12k@archiver.kernel.org>; Wed, 23 Aug 2023 18:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGe2Z/TD7kfnTfjzQdGCtTPXxBRvDWYjeXsJdpB6Q5w=; b=FwKfqpS26JVG+l
	PVYaSyJGLZMbEsbwZNJzGiGLflGxQt639U56Tdw/kMskhO4sJjwXZaFnwSWt+o/YYVUm6eFza+GRu
	70LAoEaWZ9AC1vZI6WcCnPjhIXV6uIl1TPY9aYO/oVLlV1qgPwWmVOcYNdUNPoBJbH2JWomhs5XSS
	W+htpgC0tT0R+fsNgX4uhzF8QrPPl/2jyKY7VUEL2vMwO+sRQ5pxPn1vU3W7TeWBLMl3rbvdszALF
	zwQ6Q06QpDnmg9Ma7fOaO0x3u3I5qEW5toiLF8irH5Q8HLvmOxz4wbOubGEw4xiiN3uytqajMHF57
	K/3zBJSe12aeF78YktDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsJY-001HkP-2V
	for ath12k@archiver.kernel.org;
	Wed, 23 Aug 2023 18:10:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsJV-001Hk2-0S
	for ath12k@lists.infradead.org;
	Wed, 23 Aug 2023 18:10:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 678FD62023;
	Wed, 23 Aug 2023 18:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B15C433C7;
	Wed, 23 Aug 2023 18:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692814239;
	bh=jNZFGP+120T2tyTOnJvNI4FpAdzkDciSJn/F1GpL+o8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=n216cYSq/SZ/kKivwMtO7Pe8dURTChp4a/4WNN/QZZHVM3tNgNG5DEtRBtmfmc35w
	 q+CuGY92RxHZNqlcTmDY1Sak8LT5epMtc03C+tYZR0StljIHj60W+y9MsyEd/RCWvR
	 NKBorHHE4HizKTzoTUiDwX12yXoJIWkceZGeDUb3ZVJiUI3CROkQKeHEqCW0YYKnwR
	 nr9h7VANS9Y+II3rCs0Wc/dyDMIbt+8JyOGJ0CCYMKs93WZSuKQwqDWQTUT/TEJZsq
	 c1i8MxUFtxFKvYzXfbEfdkc7E4mU2VP9BQyW3IxwwT3CXK8544KBXSqXPUYfU/N8P2
	 YZYSMG26Y0HfQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/1] wifi: ath12k: add msdu_end structure for WCN7850
References: <20230815062610.59248-1-quic_kangyang@quicinc.com>
	<18b72ba8-7f0c-ed88-38f7-7422a179519f@quicinc.com>
Date: Wed, 23 Aug 2023 21:10:36 +0300
In-Reply-To: <18b72ba8-7f0c-ed88-38f7-7422a179519f@quicinc.com> (Jeff
	Johnson's message of "Tue, 15 Aug 2023 15:28:47 -0700")
Message-ID: <87jztlhboj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_111041_283854_57D2EB4C 
X-CRM114-Status: GOOD (  26.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/14/2023 11:26 PM, Kang Yang wrote:
>> WCN7850 and QCN9274 use the same structure rx_msdu_end_qcn9274 for
>
> Suggest s/use/currently use/ to clarify this is the current behavior
> and not the expected behavior
>
>> msdu_end. But content of msdu_end on WCN7850 is different from that of
>> QCN9274. Need to update it for WCN7850, otherwise will get the wrong
>> values when using it.
>> For example, TID is no longer in WCN7850's msdu_end. But
>> ath12k_dp_rx_process_err and ath12k_dp_rx_process_wbm_err still get TID
>
> Please add () to function references
>
>> from msdu_end. So an uncertain value will be used in these two functions
>> on WCN7850.
>> Therefore, add new structure rx_msdu_end_wcn7850 for WCN7850.
>> Tested-on: WCN7850 hw2.0 PCI
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/hal.c     |  6 +--
>>   drivers/net/wireless/ath/ath12k/rx_desc.h | 53 ++++++++++++++++++++++-
>>   2 files changed, 55 insertions(+), 4 deletions(-)
>> diff --git a/drivers/net/wireless/ath/ath12k/hal.c
>> b/drivers/net/wireless/ath/ath12k/hal.c
>> index e7a150e7158e..19b4207ca048 100644
>> --- a/drivers/net/wireless/ath/ath12k/hal.c
>> +++ b/drivers/net/wireless/ath/ath12k/hal.c
>> @@ -824,8 +824,8 @@ static u8 ath12k_hw_wcn7850_rx_desc_get_msdu_nss(struct hal_rx_desc *desc)
>>     static u8 ath12k_hw_wcn7850_rx_desc_get_mpdu_tid(struct
>> hal_rx_desc *desc)
>>   {
>> -	return le16_get_bits(desc->u.wcn7850.msdu_end.info5,
>> -			     RX_MSDU_END_INFO5_TID);
>> +	return le32_get_bits(desc->u.wcn7850.mpdu_start.info2,
>> +			     RX_MPDU_START_INFO2_TID);
>>   }
>>     static u16 ath12k_hw_wcn7850_rx_desc_get_mpdu_peer_id(struct
>> hal_rx_desc *desc)
>> @@ -837,7 +837,7 @@ static void ath12k_hw_wcn7850_rx_desc_copy_end_tlv(struct hal_rx_desc *fdesc,
>>   						   struct hal_rx_desc *ldesc)
>>   {
>>   	memcpy(&fdesc->u.wcn7850.msdu_end, &ldesc->u.wcn7850.msdu_end,
>> -	       sizeof(struct rx_msdu_end_qcn9274));
>> +	       sizeof(struct rx_msdu_end_wcn7850));
>>   }
>>     static u32 ath12k_hw_wcn7850_rx_desc_get_mpdu_start_tag(struct
>> hal_rx_desc *desc)
>> diff --git a/drivers/net/wireless/ath/ath12k/rx_desc.h b/drivers/net/wireless/ath/ath12k/rx_desc.h
>> index f99556a253e5..8769d8f3e7ea 100644
>> --- a/drivers/net/wireless/ath/ath12k/rx_desc.h
>> +++ b/drivers/net/wireless/ath/ath12k/rx_desc.h
>> @@ -782,6 +782,57 @@ struct rx_msdu_end_qcn9274 {
>>   	__le32 info14;
>>   } __packed;
>>   +struct rx_msdu_end_wcn7850 {
>> +	__le16 info0;
>> +	__le16 phy_ppdu_id;
>> +	__le16 ip_hdr_cksum;
>> +	__le16 info1;
>> +	__le16 info2;
>> +	__le16 cumulative_l3_checksum;
>> +	__le32 rule_indication0;
>> +	__le32 rule_indication1;
>> +	__le16 info3;
>> +	__le16 l3_type;
>> +	__le32 ipv6_options_crc;
>> +	__le32 tcp_seq_num;
>> +	__le32 tcp_ack_num;
>> +	__le16 info4;
>> +	__le16 window_size;
>> +	__le16 tcp_udp_chksum;
>> +	__le16 info5;
>> +	__le16 sa_idx;
>> +	__le16 da_idx_or_sw_peer_id;
>> +	__le32 info6;
>> +	__le32 fse_metadata;
>> +	__le16 cce_metadata;
>> +	__le16 sa_sw_peer_id;
>> +	__le16 info7;
>> +	__le16 rsvd0;
>> +	__le16 cumulative_l4_checksum;
>> +	__le16 cumulative_ip_length;
>> +	__le32 info9;
>> +	__le32 info10;
>> +	__le32 info11;
>> +	__le32 toeplitz_hash_2_or_4;
>> +	__le32 flow_id_toeplitz;
>> +	__le32 info12;
>> +	__le32 ppdu_start_timestamp_31_0;
>> +	__le32 ppdu_start_timestamp_63_32;
>> +	__le32 phy_meta_data;
>> +	__le16 vlan_ctag_ci;
>> +	__le16 vlan_stag_ci;
>> +	__le32 rsvd[3];
>> +	__le32 info13;
>> +	__le32 info14;
>> +} __packed;
>> +
>> +/* These macro definitions are only used for WCN7850 */
>> +#define RX_MSDU_END_INFO5_MSDU_LIMIT_ERR       BIT(2)
>> +#define RX_MSDU_END_INFO5_IDX_TIMOUT           BIT(3)
>> +#define RX_MSDU_END_INFO5_IDX_INVLID           BIT(4)
>> +#define RX_MSDU_END_INFO5_WIFI_PARSE_ERR       BIT(5)
>> +#define RX_MSDU_END_INFO5_AMSDU_PARSER_ERR     BIT(6)
>> +
>
> What uses these macros?
> Is there a reason to not spell out TIMEOUT and INVALID?
>
> If there are two different structs with two different decodings for
> info5 then it seems strange to have macros which don't have the
> chipset in the macro name. So I'd expect these to be named
> RX_MSDU_END_WCN7850_INFO5_* and the QCN9274 ones to be named
> RX_MSDU_END_QCN9274_INFO5_*. Only if there are members that are
> identical between WCN7850 and QCN9274 would it make sense to not have
> a chipset-specific name.
>
>>   /* rx_msdu_end
>>    *
>>    * rxpcu_mpdu_filter_in_category
>> @@ -1410,7 +1461,7 @@ struct rx_pkt_hdr_tlv {
>>     struct hal_rx_desc_wcn7850 {
>>   	__le64 msdu_end_tag;
>> -	struct rx_msdu_end_qcn9274 msdu_end;
>> +	struct rx_msdu_end_wcn7850 msdu_end;
>>   	u8 rx_padding0[RX_BE_PADDING0_BYTES];
>>   	__le64 mpdu_start_tag;
>>   	struct rx_mpdu_start_qcn9274 mpdu_start;

Jeff, for some reason your mail didn't have Cc linux-wireless so
patchwork don't show your comments:

https://patchwork.kernel.org/project/linux-wireless/patch/20230815062610.59248-1-quic_kangyang@quicinc.com/

The problem is that if there are no comments in patchwork I will most
likely miss them. Adding linux-wireless back now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
