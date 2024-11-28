Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088A5D69103
	for <ath12k@archiver.kernel.org>; Thu, 28 Nov 2024 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ewiP1mT4pP6xw/KE+41hy91ranXtzsNIUTwlX/bI9I=; b=lyz4b41eMKUrHNKC6JP9NS+MwA
	SAnxW8SMJcFRMy6JUngRD4cXtIgCd/Yw/ghBBqnxPlAL/K3DStqNQ1O6hDxiB2sV5w/HDz8scBC9d
	j3W7EbaZrMfv5hPDCAX7smuSyogVKZqetkRKINad8RXt2rJPXqRBrh7TnF3LLk2uusaVh2ZWd0uHE
	9oTJVnK3lriNugp5w4MUQGqGhZHlyACjsLG4fKy4L/xi90X0K2EaBzDWmzfxZD1vE87j2l6liY+Ug
	M5pkuc1G8/x7b1V+P1AIPgROtfxvnVYwsaIvKzZ/fVpko+VK+kkBqMxP7A3bESvNUATsTbvMywIbS
	jwvi964g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdKO-0000000FRD8-34eW
	for ath12k@archiver.kernel.org;
	Thu, 28 Nov 2024 12:09:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdKL-0000000FRCc-3yg0
	for ath12k@lists.infradead.org;
	Thu, 28 Nov 2024 12:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F3BDA415D9;
	Thu, 28 Nov 2024 12:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F235C4CECE;
	Thu, 28 Nov 2024 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732795735;
	bh=M7XUhFj2CBG6AIiPB6HZ7jrcFq/PWCF9szTudLUMOfU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QGha05shSD5jCag2NbDx724fWeOoFzQuuRyWiJgJx4wl27x401l9esfEsfAhdrEac
	 s7ndBJhbaqGcmBv8zwsKsVprKvqSMoOsfyYnmgrqWivg15efRHSZpxWqmum+1L1oAf
	 mjpzgy5pKqHLK9wcCP8v253shAagrttzWqldKGZ9cyhqgv5AK9mL3n7ZGUkWIyI3Zg
	 /QEMIL39nUCyLosRYKFQJ4UNWzvfbxj3U/Ls2HGZE2qYIMRHOidE5lPHMcbodzmXsc
	 fEdh+h00YxbPIFWLnlWy88spFs9A4IGz00SDTdSy8V4Nqn6d8hHcL7zxeTxhYgRiDv
	 auaCPNqBkubMA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 01/10] wifi: ath12k: convert struct
 ath12k::wmi_mgmt_tx_work to struct wiphy_work
References: <20241126171139.2350704-1-kvalo@kernel.org>
	<20241126171139.2350704-2-kvalo@kernel.org>
	<83b2325e-4d98-49a1-ae32-a69d7962e4a3@quicinc.com>
Date: Thu, 28 Nov 2024 14:08:53 +0200
In-Reply-To: <83b2325e-4d98-49a1-ae32-a69d7962e4a3@quicinc.com> (Baochen
	Qiang's message of "Wed, 27 Nov 2024 10:34:00 +0800")
Message-ID: <87y113v9uy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_040858_122616_D17EF570 
X-CRM114-Status: GOOD (  16.21  )
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
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -6726,6 +6726,8 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
>>  {
>>  	int num_mgmt;
>>  
>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>
> why would we need wiphy lock protect here? I don;t see anything in this function need it.
>
>> +
>>  	ieee80211_free_txskb(ath12k_ar_to_hw(ar), skb);
>>  
>>  	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
>> @@ -6787,6 +6789,8 @@ static int ath12k_mac_mgmt_tx_wmi(struct ath12k *ar, struct ath12k_link_vif *arv
>>  	int buf_id;
>>  	int ret;
>>  
>> +	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>
> and here the same question as above. I know this function is only called from
> ath12k_mgmt_over_wmi_tx_work() which is under wiphy lock protection. But the function
> itself doesn't need to assert it if the function does not need its protection.
>
>> +
>>  	ATH12K_SKB_CB(skb)->ar = ar;
>>  	spin_lock_bh(&ar->txmgmt_idr_lock);
>>  	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
>> @@ -6841,7 +6845,7 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
>>  		ath12k_mgmt_over_wmi_tx_drop(ar, skb);
>>  }
>>  
>> -static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
>> +static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
>>  {
>>  	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
>>  	struct ath12k_skb_cb *skb_cb;
>> @@ -6850,6 +6854,8 @@ static void ath12k_mgmt_over_wmi_tx_work(struct work_struct *work)
>>  	struct sk_buff *skb;
>>  	int ret;
>>  
>> +	lockdep_assert_wiphy(wiphy);
>
> we are definitely under wiphy lock protection since this is a wiphy_work item, hence no
> need to assert it explicitly. see also
>
> ieee80211_sta_monitor_work()
> ieee80211_beacon_connection_loss_work()
> ieee80211_csa_connection_drop_work()
> ieee80211_teardown_ttlm_work()

I have deliberately added all these lockdep_assert_wiphy() calls to
document which functions are called with wiphy_lock() held, otherwise
doing any locking analysis is much harder. My plan is that once MLO
support has landed to ath-next my plan is to document ath12k locking
design properly in the code. I think at that point we can also discuss
how we should use lockdep_assert_wiphy() in ath12k and should we drop
the extra calls.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

