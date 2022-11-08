Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E70C4332F
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mjT55VrPO7tIgoMA2GoofxdJhjl0CUU9p4eT2CkBVY=; b=o6+l5tGtbP0veo
	QQtE4LZ4px/XDr2lLkWABDUqsyWbjY4VnLHG/E2OH54tGRizUQRWhF2bcptM+iKHsJbx/PgFkrSNF
	1yve2K6CWaLDJgPSkSEGtGgXcAtYxUFWpH3mJzhDh7nxHOvbgi14rBXh4sV7KIE1mIUMKxG8HNVGp
	X9oz/esH0CeTrybc2oVz2PiyHbF+Kcs1n8uhQ5iqW315I0/DwwZwdH9B4OfsYnd5aHZFP48z0dZdd
	sMTjG5tmjU/u5tQ29VJesyAtir35gVxo5QBHJscc/5YvP8/LfTBPvZh+JjrWT8Sxp//eUuphjr/Le
	eyTPjW4NWDfZ4TeTacwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOR2-005W5R-D9
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 13:14:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOQz-005W3U-Lk
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 13:14:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4DA00CE1B79;
	Tue,  8 Nov 2022 13:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5445C433C1;
	Tue,  8 Nov 2022 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667913262;
	bh=HHRinKYYN9c17xVJWvh42OWBaiHiv4AidfQy3vA2TIE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Z6z0ADsP3hEHQ2B4UhqnhGOfq5RZv1yeQY6/MiQu4uy/Dr/Jz5+hD/RrySvkQrEPe
	 BmFSihbthIHOhLN1xOwDWauqlL254odz/J3xzmX6o9P15bbUrOG0wYq2shV08jyYHO
	 HIzLqJELkA7Rgd0Bnjaa+VWWO7hkripim3WjycalNqOglHaG7Gs+UBOwCr2txe46xI
	 Yw86HaD/mEs4e1WuiJ7wJupIBEqBvkfQ48452/aT5ytxY0jCVrbbMmWFTlZA81PaUv
	 RUR/a9rSt0y/HF8PzpWj75NBJX9oQCZ9w6IW8ODAFm4LPYobWTCwbs9ie+wmz/Hyx1
	 qUHiwWUdp7tFg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 17/50] wifi: ath12k: add dp_tx.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-18-kvalo@kernel.org>
	<de6d5e1a-0ff4-a303-ed25-508816a39a0d@quicinc.com>
Date: Tue, 08 Nov 2022 15:14:18 +0200
In-Reply-To: <de6d5e1a-0ff4-a303-ed25-508816a39a0d@quicinc.com> (Jeff
	Johnson's message of "Wed, 17 Aug 2022 16:35:27 -0700")
Message-ID: <87v8npeggl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_051434_092964_ED62BBEC 
X-CRM114-Status: GOOD (  12.75  )
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

> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/dp_tx.c | 1206 +++++++++++++++++++++++++++++++
>>   1 file changed, 1206 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c
>> b/drivers/net/wireless/ath/ath12k/dp_tx.c
>
> snip
>
>> +static struct ath12k_tx_desc_info *ath12k_dp_tx_assign_buffer(struct ath12k_dp *dp,
>> +							      u8 pool_id)
>> +{
>> +	struct ath12k_tx_desc_info *desc = NULL;
>
> nit: initializer always overwritten

Now fixed.

>> +int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
>> +		 struct sk_buff *skb)
>> +{
>> +	struct ath12k_base *ab = ar->ab;
>> +	struct ath12k_dp *dp = &ab->dp;
>> +	struct hal_tx_info ti = {0};
>> +	struct ath12k_tx_desc_info *tx_desc = NULL;
>> +	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
>> +	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
>> +	struct hal_tcl_data_cmd *hal_tcl_desc;
>> +	struct hal_tx_msdu_ext_desc *msg;
>> +	struct sk_buff *skb_ext_desc;
>> +	struct hal_srng *tcl_ring;
>> +	struct ieee80211_hdr *hdr = (void *)skb->data;
>> +	struct dp_tx_ring *tx_ring;
>> +	u8 pool_id;
>> +	u8 hal_ring_id;
>> +	int ret;
>> +	u8 ring_selector = 0, ring_map = 0;
>
> nit: ring_selector initializer always overwritten

Fixed.

>> +int ath12k_dp_tx_htt_monitor_mode_ring_config(struct ath12k *ar, bool reset)
>> +{
>> +	struct ath12k_base *ab = ar->ab;
>> +	int ret = 0;
>
> nit: initializer always overwritten

Fixed.

>> +int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
>> +{
>> +	struct ath12k_base *ab = ar->ab;
>> +	struct ath12k_dp *dp = &ab->dp;
>> +	struct htt_rx_ring_tlv_filter tlv_filter = {0};
>> +	int ret = 0, ring_id = 0;
>
> nit: both initializers always overwritten

Both fixed.

>> +int ath12k_dp_tx_htt_tx_monitor_mode_ring_config(struct ath12k *ar, bool reset)
>> +{
>> +	struct ath12k_base *ab = ar->ab;
>> +	struct ath12k_dp *dp = &ab->dp;
>> +	struct htt_tx_ring_tlv_filter tlv_filter = {0};
>> +	int ret = 0, ring_id = 0;
>
> nit: ring_id initializer always overwritten

ring_id initialisation fixed now, but also ret is not initialised
anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
