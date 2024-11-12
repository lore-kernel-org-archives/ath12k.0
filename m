Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23C5D42BB7
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Cr9+SCLWc91myjwgn7mTZl3FDsyePFWbEd0Uvz2xqE=; b=fWlB6y9ed0IERfiLiAe9zytoOd
	jmU86wFy1NxzUetAJmFwoR5FOwatc9fZDugsBxL/y6uPuf7fxmeU7xaUI06vRlUYFOzBQs6l9ORjW
	0mUtm6ry56R/ZF45HWhkl+c3uvjkTr0TdbmH4Ut7KjHuvmAJEtT6E0ok9Fm9sxvuVJyTpFUPioCuP
	QJSGbUg+5SM3G4PUANRzLaM7Vz5KpznGtFC3Tdie7FtsteOeWqi5aVSDmzg1YXPyzlT4nq6tNkgIr
	plw5OL+Ln2eXogHsvc1mkDKld8t9q3CLI2916ZHO0nxVYESg0GbViJLTxY8Vws/T2z+Dmrx7UEs9o
	bcbzj04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAupr-00000004Oh0-1vOd
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 17:37:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuQV-00000004J18-3irP
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 17:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B692BA41F26;
	Tue, 12 Nov 2024 17:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C925EC4CED0;
	Tue, 12 Nov 2024 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731431498;
	bh=ga3dKBc62Z4mi0etr/9wyQGY2vEKZ6lsaiEZ72u5JI8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=II3dfFNf55ntWQTMR78MPvosfiLX76ErO3YcT8n/b9MwWm5/ROWyPt7eujU9/AdhO
	 wAQZVaWZ+sqYwOVsP7FjAUH1dttPnVlTfb4eie7DAxE3Aj/J25NT5332cHtaxlj5v1
	 5Bmi5/hvMJ6LcEd/Rufs3vP6Idx8q6PZm0q/w/9qJSu48XWim7TpLSVC7RUFeUrBfy
	 HKnUJMfmgYwJBwjJk9KTkR/HQFtwH+rd46Ii5dTP1DnskMBJzBm+pM5+oV0zf+ZItL
	 kshymC0+lvkpMs4rZSFFLf9CROamY2MANkdPp6FhtgoS2Jp9H/+Lmlaq7+SIJFcO3Z
	 BiZ5Isczg6jrQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/8] wifi: ath12k: support change_sta_links() mac80211 op
References: <20241106142617.660901-1-kvalo@kernel.org>
	<20241106142617.660901-3-kvalo@kernel.org>
	<e028f65c-9faa-46e0-ae34-35815a121ba9@quicinc.com>
	<8734jw4ciw.fsf@kernel.org>
Date: Tue, 12 Nov 2024 19:11:36 +0200
In-Reply-To: <8734jw4ciw.fsf@kernel.org> (Kalle Valo's message of "Tue, 12 Nov
	2024 18:55:51 +0200")
Message-ID: <87ttcc2x87.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_091140_014315_581617E6 
X-CRM114-Status: GOOD (  12.15  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> On 11/6/2024 10:26 PM, Kalle Valo wrote:
>>> From: Sriram R <quic_srirrama@quicinc.com>
>>> 
>>> Add ath12k_mac_op_change_sta_links() for adding and removing
>>> link station.
>>> 
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>> 
>>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>>> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>> ---
>>>  drivers/net/wireless/ath/ath12k/mac.c | 97 ++++++++++++++++++++++++++-
>>>  1 file changed, 96 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>>> index 0ff886e4b3ed..c0cc4e51a4d1 100644
>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>> @@ -5572,6 +5572,101 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
>>>  	rcu_read_unlock();
>>>  }
>>>  
>>> +static struct ath12k_link_sta *
>>> +ath12k_mac_alloc_assign_link_sta(struct ath12k_hw *ah,
>>> +				 struct ath12k_sta *ahsta,
>>> +				 struct ath12k_vif *ahvif, u8 link_id)
>>> +{
>>> +	struct ath12k_link_sta *arsta;
>>> +	int ret;
>>> +
>>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>>> +
>>> +	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
>>> +		return NULL;
>>> +
>>> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
>>> +	if (arsta)
>>> +		return NULL;
>>> +
>>> +	arsta = kzalloc(sizeof(*arsta), GFP_KERNEL);
>>
>> kmalloc() is preferred as ath12k_mac_assign_link_sta() will do 'zero'?
>
> That's true. Jeff, are you able to change this in the pending branch?

Actually ignore that, I'll submit v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

