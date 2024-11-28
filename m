Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D2D69104
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwLhkZZvnPZ/MR0IzbsubWRz2gjV918vWXOMDPVyzdc=; b=S7Q8xwKTRWPNN7JWyccRuNBPqq
	SD84ivxCukaEEBx5Umcp27WZIfv6QIvG/FJFSMG/06AgOmGI/UyhfoOnHw3gxT6ERH+OJlJ2xx8Ex
	HCheDFnpYSsbUibAzFWjGyxzGqlktKHemWimxqi4o9D5l9jGIhDmPz6XeahQ8vu6PPSSoVs/wiIiv
	9vzyUhANRBN1LwZnGjKoqO9v9HRDRCdeyezc6yfTm2At3gLJPFW8jTnhwpxNt2Kunjevo2h47plqa
	Wx/5WdPwBK6hzlzL5YDgD2xA4jwZT7wdjEr9UI1hXTFUYCeRJFAHBYP1v7VpeZLFpO4t8lY+gUopL
	A3L+ymAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdhb-0000000FUOb-1CMx
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 12:32:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdh4-0000000FUHg-4Bhy
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 12:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BF715C5779;
	Thu, 28 Nov 2024 12:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ED7C4CECE;
	Thu, 28 Nov 2024 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732797146;
	bh=z55rZ5wrhdyhw6V1NlACku/0MHLUshsG+jTuIobXNV4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=I4bgbDDEAmVhjUL35qcUKHJqdEd4qty+/dssZbML9bXvaugv9rWswMtn/WqbyCvcr
	 1waNZfrQR8mUVMbtBkNOoqpFFBzfX7wd429iBYR+v1KhvgprPiTLg7y8ou0cLuDA7/
	 cW3YrAEICxGIlhvnj+bP5l01uA1vaj2M/0KoOHKeRwUfhORUelqjLiE/2bq1wYGC/f
	 daLAJS0tL0lBbVVrizsF1JPuv5z6DlfkOcSZSKLmlOchxugHI5NKdg96XJENDBAeZn
	 7zvQnUsZ4sWk0ONk9w2YTLh2nbHlQrrXvLQi6Qqi6f228gvwVnPOhiw244mMaQ3i/a
	 a9rTHzbh7C37w==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 02/10] wifi: ath12k: ath12k_mac_op_tx(): MLO support
References: <20241126171139.2350704-1-kvalo@kernel.org>
	<20241126171139.2350704-3-kvalo@kernel.org>
	<28bdb726-a7cf-40e7-8bc4-f7602bba1e93@quicinc.com>
Date: Thu, 28 Nov 2024 14:32:23 +0200
In-Reply-To: <28bdb726-a7cf-40e7-8bc4-f7602bba1e93@quicinc.com> (Baochen
	Qiang's message of "Wed, 27 Nov 2024 10:49:13 +0800")
Message-ID: <87ttbrv8rs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043227_127728_4C2137CF 
X-CRM114-Status: GOOD (  13.89  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 11/27/2024 1:11 AM, Kalle Valo wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>> 
>> @@ -6848,6 +6848,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
>>  static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
>>  {
>>  	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
>> +	struct ath12k_hw *ah = ar->ah;
>>  	struct ath12k_skb_cb *skb_cb;
>>  	struct ath12k_vif *ahvif;
>>  	struct ath12k_link_vif *arvif;
>> @@ -6865,7 +6866,15 @@ static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work
>>  		}
>>  
>>  		ahvif = ath12k_vif_to_ahvif(skb_cb->vif);
>> -		arvif = &ahvif->deflink;
>> +		if (!(ahvif->links_map & BIT(skb_cb->link_id))) {
>> +			ath12k_warn(ar->ab,
>> +				    "invalid linkid %u in mgmt over wmi tx with linkmap 0x%X\n",
>
> s/0x%X/0x%x/ ?

Fixed.

>
>> +				    skb_cb->link_id, ahvif->links_map);
>> +			ath12k_mgmt_over_wmi_tx_drop(ar, skb);
>> +			continue;
>> +		}
>> +
>> +		arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[skb_cb->link_id]);
>>  		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id)) {
>>  			ret = ath12k_mac_mgmt_tx_wmi(ar, arvif, skb);
>>  			if (ret) {
>> @@ -6875,9 +6884,10 @@ static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work
>>  			}
>>  		} else {
>>  			ath12k_warn(ar->ab,
>> -				    "dropping mgmt frame for vdev %d, is_started %d\n",
>> +				    "dropping mgmt frame for vdev %d link_id %u, is_started %d\n",
>>  				    arvif->vdev_id,
>> -				    arvif->is_started);
>> +				    arvif->is_started,
>> +				    skb_cb->link_id);
>
> swap 'arvif->is_started' and 'skb_cb->link_id'.

Good catch! Fixed as well.

>> +/* Note: called under rcu_read_lock() */
>> +static u8 ath12k_mac_get_tx_link(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
>> +				 u8 link, struct sk_buff *skb, u32 info_flags)
>> +{
>> +	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
>> +	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>> +	struct ieee80211_link_sta *link_sta;
>> +	struct ieee80211_bss_conf *bss_conf;
>> +	struct ath12k_sta *ahsta;
>
> better to assert RCU read lock here?

You mean something like WARN_ON(!rcu_read_lock_held())? I'm not really a
fan of that, I think it's better that we discuss this also once we
document locking design properly.

>> +/* Note: called under rcu_read_lock() */
>>  static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>>  			     struct ieee80211_tx_control *control,
>>  			     struct sk_buff *skb)
>> @@ -6945,13 +7054,16 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>>  	struct ieee80211_vif *vif = info->control.vif;
>>  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>>  	struct ath12k_link_vif *arvif = &ahvif->deflink;
>> -	struct ath12k *ar = arvif->ar;
>>  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
>>  	struct ieee80211_key_conf *key = info->control.hw_key;
>> +	struct ieee80211_sta *sta = control->sta;
>>  	u32 info_flags = info->flags;
>> +	struct ath12k *ar;
>>  	bool is_prb_rsp;
>> +	u8 link_id;
>>  	int ret;
>>  
> better to assert RCU read lock here?

Same comment here as above.

>
>> +	link_id = u32_get_bits(info->control.flags, IEEE80211_TX_CTRL_MLO_LINK);
>>  	memset(skb_cb, 0, sizeof(*skb_cb));
>>  	skb_cb->vif = vif;
>>  
>> @@ -6960,6 +7072,27 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
>>  		skb_cb->flags |= ATH12K_SKB_CIPHER_SET;
>>  	}
>>  
>> +	/* handle only for MLO case, use deflink for non MLO case */
>> +	if (vif->valid_links) {
>
> better to use ieee80211_vif_is_mld() helper?

Indeed, fixed.

I did all the changes directly in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=57ee27f3b3aa13c63978f03ce544c2f4210a9cd7

BTW when you reply please include an empty line between the quote and
your reply, this improves readability.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

