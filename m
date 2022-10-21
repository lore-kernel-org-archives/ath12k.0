Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ADDC43217
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 11:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEVpxR23g3g4d1rD+REW4PNDn8SN5LFEty6Z0SlazCc=; b=c/OIlI0wzjbfjM
	9m6koE/JtgPi0RvQbfspHSaZK/meQ12D9LIUP1gI4mWBPPfAAPZMyOWMw3Mx1V22ZWh1uzM7FI6td
	DVpNnSpvdE4e3LKs6JJSprSXXr70mDNAvalV+okVpwllBgWgTAmJmCqUuLiLtgziNstNwwtI7B8Fi
	YJrXKrygtBCibLtza8k04e1KgTMqUvXV6XyH5kR1qC7aYmpPzJwFoXnhwnHH/GHlk0mHZrMaw9STu
	xVFDk/yivl1qUt1RIOepLn3qwkzUtNbo9pmLAqCrPnJmBz0bo2ImpDE+ehWz5k7/JAoxoaNAG6Aus
	Mx6cvlVaRLJTUt3kS0mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqR8-007RjR-AC
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 11:43:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olqR3-007RhP-Nd
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 11:43:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 49B87CE2A67;
	Fri, 21 Oct 2022 11:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF22C433D6;
	Fri, 21 Oct 2022 11:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666352608;
	bh=hSbkDBgVkQZMF5v5LAj+S+yAEoTFgXL9G3upMgANou4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HaJPd9w1Qfj1tfrK+wLFGY4q9VSDo19DIblrEPasS8Eu17oyEp5wfuFVoLg8o2kJU
	 AeVIHZmxU1r0rSWmSeeUECuZqNrggvzMe6Ak4Juibtq+MKhLYB7fpwGhQJJWdyx8sO
	 NXCIZzHQkhoxM+7+HzcWbsnaYxRMgbgV2XS88Z1F0f5SRo+Dqzg/AQCTXB8R+byTZ4
	 Nzs6ghJHbuy75b9x5yxAOjNObvgwVNBKJF7DPnUfAtPhTNgvrmzm6qGuGQpm/SUmqq
	 /59h5WW4r4GHPwa0Xumv/zTNsve9WzKdx/E0opRhF2KvDSoFsQhrhKpzIa5vVLbSxs
	 tzKfxNHUswVTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 11/50] wifi: ath12k: add dp.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-12-kvalo@kernel.org>
	<65a4750f-1798-a624-0a2e-96930f8ec816@quicinc.com>
Date: Fri, 21 Oct 2022 14:43:23 +0300
In-Reply-To: <65a4750f-1798-a624-0a2e-96930f8ec816@quicinc.com> (Jeff
	Johnson's message of "Tue, 16 Aug 2022 08:17:19 -0700")
Message-ID: <87czaljtb8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_044334_798688_F4E9F416 
X-CRM114-Status: GOOD (  43.54  )
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

[...]

>> +int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr)
>> +{
>> +	struct ath12k_base *ab = ar->ab;
>> +	struct ath12k_peer *peer;
>> +	u32 reo_dest;
>> +	int ret = 0, tid;
>> +
>> +	/* NOTE: reo_dest ring id starts from 1 unlike mac_id which starts from 0 */
>> +	reo_dest = ar->dp.mac_id + 1;
>> +	ret = ath12k_wmi_set_peer_param(ar, addr, vdev_id,
>> +					WMI_PEER_SET_DEFAULT_ROUTING,
>> +					DP_RX_HASH_ENABLE | (reo_dest << 1));
>> +
>> +	if (ret) {
>> + ath12k_warn(ab, "failed to set default routing %d peer :%pM
>> vdev_id :%d\n",
>> +			    ret, addr, vdev_id);
>> +		return ret;
>> +	}
>> +
>> +	for (tid = 0; tid <= IEEE80211_NUM_TIDS; tid++) {
>> +		ret = ath12k_dp_rx_peer_tid_setup(ar, addr, vdev_id, tid, 1, 0,
>> +						  HAL_PN_TYPE_NONE);
>> +		if (ret) {
>> + ath12k_warn(ab, "failed to setup rxd tid queue for tid %d: %d\n",
>> +				    tid, ret);
>> +			goto peer_clean;
>> +		}
>> +	}
>> +
>> +	ret = ath12k_dp_rx_peer_frag_setup(ar, addr, vdev_id);
>> +	if (ret) {
>> +		ath12k_warn(ab, "failed to setup rx defrag context\n");
>> +		return ret;
>
> why does this failure simply return whereas just previously upon the
> failure of ath12k_dp_rx_peer_tid_setup() we goto peer_clean. don't we
> need to do the peer_clean logic here as well to undo the
> ath12k_dp_rx_peer_tid_setup() calls?

Pradeep Kumar fixed this:

7887e032942a wifi: ath12k: fix dp peer setup error handling

>> +static
>> +void ath12k_dp_tx_get_vdev_bank_config(struct ath12k_base *ab,
>> struct ath12k_vif *arvif,
>> +				       u32 *bank_config)
>
> rather than be a void function with a writable param, why not return
> the bank_config as the function return value?

Pradeep Kumar also fixed this:

6b650b8d9fd3 wifi: ath12k: make bank_config as return value instead of an argument

>> +{
>> +	enum hal_encrypt_type encrypt_type = 0;
>
> I would expect an enum initializer to be one of the enumerators.
> 0 is HAL_ENCRYPT_TYPE_WEP_40 -- is that really the correct value?

Also fixed in the above commit.

>> +static int ath12k_dp_tx_get_bank_profile(struct ath12k_base *ab,
>> struct ath12k_vif *arvif,
>> +					 struct ath12k_dp *dp)
>> +{
>> +	int bank_id = DP_INVALID_BANK_ID;
>> +	int i;
>> +	u32 bank_config = 0;
>
> this initializer would be unnecessary if
> ath12k_dp_tx_get_vdev_bank_config() returns the config as the function
> return value instead of doing so by reference via a function param

Fixed in above commit.

>> +static void ath12k_dp_deinit_bank_profiles(struct ath12k_base *ab)
>> +{
>> +	struct ath12k_dp *dp = &ab->dp;
>> +
>> +	kfree(dp->bank_profiles);
>
> suggest setting dp->bank_profiles = NULL to avoid dangling pointer to
> freed memory

Pradeep Kumar fixed in:

d09d40c053b3 wifi: ath12k: fix dangling pointer during vdev bank profile cleanup

>> +static void ath12k_dp_srng_common_cleanup(struct ath12k_base *ab)
>> +{
>> +	struct ath12k_dp *dp = &ab->dp;
>> +	int i;
>> +
>> +	ath12k_dp_srng_cleanup(ab, &dp->wbm_desc_rel_ring);
>> +	ath12k_dp_srng_cleanup(ab, &dp->tcl_cmd_ring);
>> +	ath12k_dp_srng_cleanup(ab, &dp->tcl_status_ring);
>> +	for (i = 0; i < ab->hw_params->max_tx_ring; i++) {
>> +		ath12k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_data_ring);
>> +		ath12k_dp_srng_cleanup(ab, &dp->tx_ring[i].tcl_comp_ring);
>> +	}
>> +	ath12k_dp_srng_cleanup(ab, &dp->reo_reinject_ring);
>> +	ath12k_dp_srng_cleanup(ab, &dp->rx_rel_ring);
>> +	ath12k_dp_srng_cleanup(ab, &dp->reo_except_ring);
>> +	ath12k_dp_srng_cleanup(ab, &dp->reo_cmd_ring);
>> +	ath12k_dp_srng_cleanup(ab, &dp->reo_status_ring);
>
> i'm used to seeing deinit code do things in reverse order of init
> code, but the above is doing things in the same order. yes it probably
> doesn't matter in this case, but if you consistently deinit in reverse
> order of init then you'll get it right in the cases where it does
> matter

Pradeep Kumar fixed in:

4a033426a7e2 wifi: ath12k: reverse the order of common srng cleanup

>> +int ath12k_dp_service_srng(struct ath12k_base *ab,
>> +			   struct ath12k_ext_irq_grp *irq_grp,
>> +			   int budget)
>> +{
>> +	struct napi_struct *napi = &irq_grp->napi;
>> +	int grp_id = irq_grp->grp_id;
>> +	int work_done = 0;
>> +	int i = 0, j;
>> +	int tot_work_done = 0;
>> +	bool flag;
>
> not a fan of a bool named flag.
>
> better would be a name that tells us what it means when the flag is set.
>
> I see this issue throughout the dp_mon functions:
> ath12k_dp_mon_process_ring(...bool flag)
> ath12k_dp_mon_srng_process(...bool flag, ...)
>
> looking further I see:
> #define ATH12K_DP_TX_MONITOR_MODE 0
> #define ATH12K_DP_RX_MONITOR_MODE 1
> (note 0 and 1 are not bool enumerators)
>
> and logic like:
> 	if (flag == ATH12K_DP_RX_MONITOR_MODE) {
>
> so IMO based upon this kind of logic it would make more sense to have
> either:
>
> an enum ath12k_dp_monitor_mode and use that everywhere, or
> rename bool flag to bool rx_mode and use that everywhere

Pradeep Kumar fixed in:

eaa2ce8b29bd wifi: ath12k: use enum for determining tx or rx monitor mode

>> +	while (i < ab->hw_params->max_tx_ring) {
>> +		if (ab->hw_params->ring_mask->tx[grp_id] &
>> + BIT(ab->hw_params->hal_ops->tcl_to_wbm_rbm_map[i].wbm_ring_num))
>> +			ath12k_dp_tx_completion_handler(ab, i);
>> +		i++;
>> +	}
>> +
>> +	if (ab->hw_params->ring_mask->rx_err[grp_id]) {
>> +		work_done = ath12k_dp_rx_process_err(ab, napi, budget);
>> +		budget -= work_done;
>> +		tot_work_done += work_done;
>> +		if (budget <= 0)
>> +			goto done;
>> +	}
>> +
>> +	if (ab->hw_params->ring_mask->rx_wbm_rel[grp_id]) {
>> +		work_done = ath12k_dp_rx_process_wbm_err(ab,
>> +							 napi,
>> +							 budget);
>> +		budget -= work_done;
>> +		tot_work_done += work_done;
>> +
>> +		if (budget <= 0)
>> +			goto done;
>> +	}
>> +
>> +	if (ab->hw_params->ring_mask->rx[grp_id]) {
>> +		i = fls(ab->hw_params->ring_mask->rx[grp_id]) - 1;
>> +		work_done = ath12k_dp_rx_process(ab, i, napi,
>> +						 budget);
>> +		budget -= work_done;
>> +		tot_work_done += work_done;
>> +		if (budget <= 0)
>> +			goto done;
>> +	}
>> +
>> +	if (ab->hw_params->ring_mask->rx_mon_dest[grp_id]) {
>> +		for (i = 0; i < ab->num_radios; i++) {
>> +			for (j = 0; j < ab->hw_params->num_rxmda_per_pdev; j++) {
>> +				int id = i * ab->hw_params->num_rxmda_per_pdev + j;
>> + > +				flag = ATH12K_DP_RX_MONITOR_MODE;
>
> this is invariant so it should be assigned outside the loops. yes, the
> compiler will probably do that for you, but why not do it yourself?
>
>> +
>> +				if (ab->hw_params->ring_mask->rx_mon_dest[grp_id] &
>
> isn't ab->hw_params->ring_mask->rx_mon_dest[grp_id] also invariant?
>
>> +					BIT(id)) {
>
> indentation the same as the code that follows makes it difficult to
> distinguish the condition from the conditional code
>
>> +					work_done =
>> + ath12k_dp_mon_process_ring(ab, id, napi, budget,
>
> descendant is not indented from the first line, making it difficult to
> see the code structure

Pradeep Kumar fixed in:

8589ba1261da wifi: ath12k: cleanup monitor interrupt processing


>> +								   flag);
>> +					budget -= work_done;
>> +					tot_work_done += work_done;
>> +
>> +					if (budget <= 0)
>> +						goto done;
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	if (ab->hw_params->ring_mask->tx_mon_dest[grp_id]) {
>
> this block of code has the same issues as the RX block. in fact it
> seems that this block is identical to the block above other than the
> flag and the tx_mon_desc vs rx_mon_desc, so I'm curious if it could be
> refactored into a single function that could be used by both tx and rx
> instead of duplicating code

No refactoring but the commit above also cleaned up this one.

>> +int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
>> +{
>> +	struct ath12k *ar;
>> +	int ret;
>> +	int i;
>> +
>> +	ret = ath12k_dp_rx_htt_setup(ab);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* TODO: Per-pdev rx ring unlike tx ring which is mapped to different AC's */
>> +	for (i = 0; i < ab->num_radios; i++) {
>> +		ar = ab->pdevs[i].ar;
>> +		ret = ath12k_dp_rx_pdev_alloc(ab, i);
>> +		if (ret) {
>> + ath12k_warn(ab, "failed to allocate pdev rx for pdev_id :%d\n",
>> +				    i);
>> +			goto err;
>> +		}
>> +		ret = ath12k_dp_rx_pdev_mon_attach(ar);
>> +		if (ret) {
>> +			ath12k_warn(ab, "failed to initialize mon pdev %d\n",
>> +				    i);
>
> nit: unnecssary line break

Pradeep Kumar fixed in:

54ea2140eb0f wifi: ath12k: avoid using memset for initializing structure

>> +int ath12k_dp_htt_connect(struct ath12k_dp *dp)
>> +{
>> +	struct ath12k_htc_svc_conn_req conn_req;
>> +	struct ath12k_htc_svc_conn_resp conn_resp;
>> +	int status;
>> +
>> +	memset(&conn_req, 0, sizeof(conn_req));
>> +	memset(&conn_resp, 0, sizeof(conn_resp));
>
> consider using = {} initializers

Fixed in the above commit.

>> +static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
>> +{
>> +	struct ath12k_rx_desc_info *desc_info, *tmp;
>> +	struct ath12k_tx_desc_info *tx_desc_info, *tmp1;
>> +	struct ath12k_dp *dp = &ab->dp;
>> +	struct sk_buff *skb;
>> +	int i;
>> +
>> +	if (!dp->spt_info)
>> +		return;
>> +
>> +	/* RX Descriptor cleanup */
>> +	spin_lock_bh(&dp->rx_desc_lock);
>> +
>> +	list_for_each_entry_safe(desc_info, tmp, &dp->rx_desc_used_list, list) {
>> +		list_del(&desc_info->list);
>> +		skb = desc_info->skb;
>> +
>> +		if (!skb)
>> +			continue;
>> +
>> +		dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(skb)->paddr,
>> +				 skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
>> +		dev_kfree_skb_any(skb);
>> +	}
>> +
>> +	spin_unlock_bh(&dp->rx_desc_lock);
>> +
>> +	/* TX Descriptor cleanup */
>> +	for (i = 0; i < ATH12K_HW_MAX_QUEUES; i++) {
>> +		spin_lock_bh(&dp->tx_desc_lock[i]);
>> +
>> + list_for_each_entry_safe(tx_desc_info, tmp1,
>> &dp->tx_desc_used_list[i],
>> +					 list) {
>> +			list_del(&tx_desc_info->list);
>> +			skb = tx_desc_info->skb;
>> +
>> +			if (!skb)
>> +				continue;
>> +
>> +			dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(skb)->paddr,
>
> why RXCB() in the TX path?

That's a good question, I added it to my todo list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
