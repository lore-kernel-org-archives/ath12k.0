Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAECD42BB3
	for <ath12k@archiver.kernel.org>; Tue, 12 Nov 2024 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSGshtPQSXfFxxDYuW96Kc9pvlTZ2tugMIb7/5AxjAg=; b=E/bYMVxW+xQ/RmW8EmJO7jJhov
	lsEx6KwrkNaCqM0P6otN/M7HWJuviWVqlQFyvst6WPPzgQBdQm6xWX7Ar1ERpbvrEGpufw/4KxAkl
	QY77AyyO2qrRfIvfAjpLA1JOEiE3MW4b1ZMTvwU98Mo5m3yV3Lb+gBIbRVJj71SpYK70Sh6BgJ/CI
	ykhjpYEGQbQ6BPXGHHEcgZ5nZes2epD4dHOua4L2prJBD1GU/z9S7/NE0gV96FldxllXQKqeqejbr
	UhFq9VJJsTFK9c18wt4KXfl2Qh4RxAQQDzqdvqZCFrOBEJvBmXo18Elxi+J3OCoIApr4iTf9raoUM
	la82wbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuKp-00000004Hll-2uN4
	for ath12k@archiver.kernel.org;
	Tue, 12 Nov 2024 17:05:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuBG-00000004F3m-3x9n
	for ath12k@lists.infradead.org;
	Tue, 12 Nov 2024 16:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA0CEA41F20;
	Tue, 12 Nov 2024 16:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60FEC4CECD;
	Tue, 12 Nov 2024 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731430553;
	bh=Q98Q34J4kAW3zme2ihDg8My/MPc2+GNVAfgPsUeYKJ4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GVeRfKE9zix5Sioqj8apw1vphSAgIqq0885DPOnDQ34AtyeHaRQHrvo6nMUC3T14W
	 2EuVCvH/htopgn2J8ukRuL3P5iJYw6LjvScuMGjTl8XFTFVeoK+WeJAEHa5PykKMzP
	 VrcZsZiuf+fNPQV26p4MGscdOk+IMNePyuJdr1TkbK8GqaxVrYLkR0Oada6H7MPvx5
	 LCD1XSSkHD+u8XkIXEa7Y+KdJeVR+FoUnxXnX2dOzR/5phv4XJodTgyE55JGsig6sk
	 +YfZaDJPn+9xTFYlC87Hu5wnLwnxECH6CJXHPzzM3TqhJH2NcyoZ9/+6cQpbxexsv/
	 9dKR9vwTVIg0g==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/8] wifi: ath12k: support change_sta_links() mac80211 op
References: <20241106142617.660901-1-kvalo@kernel.org>
	<20241106142617.660901-3-kvalo@kernel.org>
	<e028f65c-9faa-46e0-ae34-35815a121ba9@quicinc.com>
Date: Tue, 12 Nov 2024 18:55:51 +0200
In-Reply-To: <e028f65c-9faa-46e0-ae34-35815a121ba9@quicinc.com> (Baochen
	Qiang's message of "Thu, 7 Nov 2024 15:14:55 +0800")
Message-ID: <8734jw4ciw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_085555_069586_B993CD90 
X-CRM114-Status: GOOD (  13.48  )
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

> On 11/6/2024 10:26 PM, Kalle Valo wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>> 
>> Add ath12k_mac_op_change_sta_links() for adding and removing
>> link station.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> 
>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/mac.c | 97 ++++++++++++++++++++++++++-
>>  1 file changed, 96 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 0ff886e4b3ed..c0cc4e51a4d1 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -5572,6 +5572,101 @@ static void ath12k_mac_op_sta_rc_update(struct ieee80211_hw *hw,
>>  	rcu_read_unlock();
>>  }
>>  
>> +static struct ath12k_link_sta *
>> +ath12k_mac_alloc_assign_link_sta(struct ath12k_hw *ah,
>> +				 struct ath12k_sta *ahsta,
>> +				 struct ath12k_vif *ahvif, u8 link_id)
>> +{
>> +	struct ath12k_link_sta *arsta;
>> +	int ret;
>> +
>> +	lockdep_assert_wiphy(ah->hw->wiphy);
>> +
>> +	if (link_id >= IEEE80211_MLD_MAX_NUM_LINKS)
>> +		return NULL;
>> +
>> +	arsta = wiphy_dereference(ah->hw->wiphy, ahsta->link[link_id]);
>> +	if (arsta)
>> +		return NULL;
>> +
>> +	arsta = kzalloc(sizeof(*arsta), GFP_KERNEL);
>
> kmalloc() is preferred as ath12k_mac_assign_link_sta() will do 'zero'?

That's true. Jeff, are you able to change this in the pending branch?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

