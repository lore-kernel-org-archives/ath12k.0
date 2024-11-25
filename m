Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3857BD58D6A
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfOdtv0OuH9+Jv/FOnEqQ+BIeAdWlICeSHuJjHxI03Y=; b=ehl/730VCytU70zxrfsryRIKhh
	FtBFn6tSBFaNufeaJ293D5iSrjnLvCvDacCqj5/NM+ReoWYHYbFbLxMqXJcsTJcUKCVXlJYSDWyKx
	N1kk5/L7vCR6tIBu1CIElNke0nUHFxQx6haEGyJKcTqnQFmerQGc889tt6Kzc9SzNWnQ/85Qqq3Fs
	pit/0moULzE0QYMaZaVUQTfFAjAH6qdosULNnfoE8kXjYqLnGP5xeBycn5u03pagcxaDzrUyZ0+eD
	bQ0p3K2r9CNbLHmVEdLywj0QJAQFNBZyVA5S5S1+go/LmN6KvVUqTJr00v0xSB4V2l4c5GGaLrAAI
	EM88ocgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcRH-00000008gtU-4C7v
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 16:59:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcRF-00000008gt4-2FmM
	for ath12k@lists.infradead.org;
	Mon, 25 Nov 2024 16:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7837BA415C4;
	Mon, 25 Nov 2024 16:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBC1C4CECE;
	Mon, 25 Nov 2024 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732553992;
	bh=XNq8q55584h79E89kcVLCw2LeiYgjOWnn4wWoaKuqr4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=U/JONB8i42F/pz+SKflSuA3y4hmEab2TuB5OHhIBv1zggW4moc3oaD9Ks7zS2dPu/
	 Dk35IUABDsAWrfli2ZKZvkDWbpDn0PNvRf+W15G/t3fe4SBRk5mb3LMP4+bVeMPuUs
	 U96gE2Z4PSvHmi8oKGUl61HNQ7n4e7ppNeTj3ZRoMb8GFu9Egc1LaGHGI5FE4oRvi1
	 hHLe9Z8XFLnFTmPOG1+r4qxDlbIChlisUBHydixBL/KVmFoLmyYyf5XC8nrxq9YfZv
	 frYyPFQrrUxsUJFSH98IeZjzpGpN5MtSQ+foOZZu8vqN346IWvALDgWc2PlZtWZQmw
	 EuAvPqjcoEGVQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 8/8] wifi: ath12k: Use mac80211 sta's link_sta instead
 of deflink
References: <20241121155806.1862733-1-kvalo@kernel.org>
	<20241121155806.1862733-9-kvalo@kernel.org>
	<84214119-96d9-4873-a655-bd2f6f649bb6@quicinc.com>
Date: Mon, 25 Nov 2024 18:59:49 +0200
In-Reply-To: <84214119-96d9-4873-a655-bd2f6f649bb6@quicinc.com> (Jeff
	Johnson's message of "Thu, 21 Nov 2024 16:27:42 -0800")
Message-ID: <87bjy3w8oq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_085953_634505_5AF1D20C 
X-CRM114-Status: UNSURE (   6.78  )
X-CRM114-Notice: Please train this message.
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 11/21/2024 7:58 AM, Kalle Valo wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>> 
>> Currently mac80211's struct ieee80211_sta deflink is used to fetch any sta
>> related configurations in driver. With MLO multiple link sta's (struct
>> ieee80211_link_sta) are affiliated to an ML sta and corresponding link configs
>> are present in sta->link[]. Fetch link sta of corresponding link from ML sta
>> and use the same for configurations.
>> 
>> Add ath12k_get_link_sta() helper to fetch ieee80211_link_sta from arsta. But as
>
> nit: Add ath12k_mac_get_link_sta() ...

Fixed in the pending branch, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

