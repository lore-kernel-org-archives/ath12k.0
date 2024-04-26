Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DE5C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 11:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPZICCYeL2hCcEA8XlJVjoIlgn2pWHXoDZmhpfOngbU=; b=cseOpIj1xbU4m7ma/efJWoD46V
	Uq3qPLeayEMvpJUJhRqXnOxQ4KWtLutPJ+YQ1U9PEMNQ8Whf2cmXGVzlXVrlnBQ4U5sRRNJzapvZx
	CEuuoM52i25XZZMSfnBsRFuXE4BVa8rW+2e3Byh4JWbDgQxXn67+3nclaZpzrBqf8schWRqlYER9+
	xEUGmFP3wQ7KXAuY9TBfNyL1CpONAHo9faFcc+6iINj4HxqsXaMKqOtyLhWpiTvxzFFP6Fac0AO+i
	h8NU/O78zgCXZjhIMNrCgXkXvyT8RBYxnLVkQBBZljTFyQRTgKPWsKQ1ZqiEKljm4/1VqkXQTs0ed
	X8dSkRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Jdq-0000000CKHW-1QGU
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 11:21:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Jdm-0000000CKGn-2ZZV
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 11:21:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98861CE1398;
	Fri, 26 Apr 2024 11:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9E0C113CD;
	Fri, 26 Apr 2024 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714130472;
	bh=mhBi+vrcS4Fy8zp+GC5pGosCtmCgqqvpS4W1W39uIEI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qqHng6fbOZrw5Rdam/rL7VnqAgC265jAiGJOHd17zfXQmjaMdV3NTp8baRkyYYv1X
	 HLHk+AdxpDs5B0WkqIP2XwjOXnnhiVP9qv8viXnAguqjkhTsYFRHwiRwHAwc4+hML4
	 ltnTQrRmV8V5KelVooorRmIOQmyQcsbiOSsW8WMBtrFD7q9ZowqfL4GT1ZSpUUzCcQ
	 0qoD9Kera0Ih/gNAu0ukcnuRnXC1rnDryN6ngC+gn/k2njK2SvlcdOUrThrCrQpXPz
	 cVXnVbdj4qcOxeexFPUUNkE61q+xb0XQjKmUhDIcxzADkmuQlwLjia1yxjycEBu2Kz
	 QJNtCn7L/9u5w==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] wifi: ath12k: report station mode transmit rate
References: <20240419032122.7009-1-quic_lingbok@quicinc.com>
	<20240419032122.7009-2-quic_lingbok@quicinc.com>
	<87bk5xs7qj.fsf@kernel.org>
	<050ae0d4-c879-40c2-b2ac-1766aaa2c789@quicinc.com>
Date: Fri, 26 Apr 2024 14:21:10 +0300
In-Reply-To: <050ae0d4-c879-40c2-b2ac-1766aaa2c789@quicinc.com> (Lingbo Kong's
	message of "Fri, 26 Apr 2024 14:41:33 +0800")
Message-ID: <87v844qsih.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_042119_038457_6D21436E 
X-CRM114-Status: GOOD (  15.69  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> On 2024/4/26 0:54, Kalle Valo wrote:
>> Lingbo Kong <quic_lingbok@quicinc.com> writes:
>> 
>>> +static void ath12k_dp_tx_update_txcompl(struct ath12k *ar, struct
>>> hal_tx_status *ts)
>>> +{
>>> +	struct ath12k_base *ab = ar->ab;
>>> +	struct ath12k_peer *peer;
>>> +	struct ath12k_sta *arsta;
>>> +	struct ieee80211_sta *sta;
>>> +	u16 rate;
>>> +	u8 rate_idx = 0;
>>> +	int ret;
>>> +
>>> +	spin_lock_bh(&ab->base_lock);
>>
>> Did you analyse how this function, and especially taking the
>> base_lock,
>> affects performance?
>
> The base_lock is used here because of the need to look for peers based
> on the ts->peer_id when calling ath12k_peer_find_by_id() function,
> which i think might affect performance.
>
> Do i need to run a throughput test?

Ok, so to answer my question: no, you didn't do any performance
analysis. Throughput test might not be enough, for example the driver
can be used on slower systems and running the test on a fast CPU might
not reveal any problem. A proper analysis would be much better.

>>> +enum nl80211_he_ru_alloc
>>> ath12k_mac_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)
>>> +{
>>> +	enum nl80211_he_ru_alloc ret;
>>> +
>>> +	switch (ru_tones) {
>>> +	case 26:
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
>>> +		break;
>>> +	case 52:
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_52;
>>> +		break;
>>> +	case 106:
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_106;
>>> +		break;
>>> +	case 242:
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_242;
>>> +		break;
>>> +	case 484:
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_484;
>>> +		break;
>>> +	case 996:
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_996;
>>> +		break;
>>> +	case (996 * 2):
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_2x996;
>>> +		break;
>>> +	default:
>>> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
>>> +		break;
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>> How does this function compare to
>> ath12k_he_ru_tones_to_nl80211_he_ru_alloc()?
>> 
>
> ath12k_mac_he_ru_tones_to_nl80211_he_ru_alloc() is different from
> ath12k_he_ru_tones_to_nl80211_he_ru_alloc().
>
> the logic of ath12k_he_ru_tones_to_nl80211_he_ru_alloc() is

Sure, I can read C. But _why_ do we have two very similar but still
different functions. That looks fishy to me.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

