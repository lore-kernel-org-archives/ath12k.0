Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1430FC5AD44
	for <ath12k@archiver.kernel.org>; Fri, 20 Feb 2026 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0srCeho4DTy1RFWev4F97XRwpqyAchfSz4tNZb1F+Ug=; b=iov5o1n9PAha9bQdWJfwhWhKeF
	PDkehQjdajIzTYuCmRlw/ZMzGkE0HshGmNpuU7or8ZOWyzXR1Z5ldEvFJEh0pp0d8Z60kYnDXD9yY
	PCvcQxBmYGEShnyRwZR2b0Us/2lfoRL4kko3HE3Vqn5KoA55vtQM30LTEM/jgVNWnOY2+yjLqCUST
	GV66coWg5CyC3SdGl1rBYlqGvoSCFUMfkdoNEY8DrtFkfNt84nLkTpXUhqLGsF0XBrZZoC5EHmyy/
	93DxO7sROHmPvYUnq6Wns+OturQ31VMAiMc/uOJb4LQtPB6WrKdPO6BGDakn0NrnfhAWUqx0BMQCd
	G1bJ//tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUhE-0000000FPx6-3INb;
	Fri, 20 Feb 2026 17:53:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUhB-0000000FPwD-22a7;
	Fri, 20 Feb 2026 17:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8306843CD3;
	Fri, 20 Feb 2026 17:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B9EC116C6;
	Fri, 20 Feb 2026 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771610020;
	bh=zNATZPRtqPD3ySxmy8GYe+CARDOEJ9t0TrF6n5pOmTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B/kT1Cv5HlExiMa1VET81TqQAYYr9tLcOCAnJJOdYaK/sPblFipClpHYyjogdEkG0
	 HKk85M77RiFqctmJv2TKiFzu0iTYJ98/4FyPJyPHRLzUFPff0p9dtjSyWqTnpNl151
	 hIn5yV2EWQmaVjj4NBWUpNo7stuvoREiuWcuUE51B11JG4W46absJE1rza03DKOni7
	 yffyAmnqEx/nFTM8RU+HQMaX7rJuM2MSqY/sKZfNI53l9saPewBvCrwSwMBwrVqkld
	 KdLhrcXUnSMVKKQMzK+kbVvcnrDlhrlQjh9QUSv13NXam3yqbRhppYpAq5tKj0a3Ua
	 WCmRfCeSGkzeg==
Message-ID: <3b0d26bd-35ff-40af-af8e-fbc1dd0d31cd@kernel.org>
Date: Fri, 20 Feb 2026 09:53:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next 0/2] wifi: mac80211: fetch FILS and
 unsolicited probe response templates by link ID
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Sriram R <quic_srirrama@quicinc.com>
References: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_095341_549522_66A677B7 
X-CRM114-Status: GOOD (  10.75  )
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

On 2/19/2026 11:42 AM, Raj Kumar Bhagat wrote:
> Currently, the FILS discovery and unsolicited probe response templates
> are always fetched from the default link of a virtual interface in both
> Multi-Link Operation (MLO) and non-MLO cases. However, in the MLO case
> there is a need to fetch these templates from a specific link instead of
> the default link.
> 
> Hence, add support for fetching these templates based on the link ID from
> the corresponding link data.
> 
> ---
> Sriram R (2):
>       wifi: mac80211: fetch FILS discovery template by link ID
>       wifi: mac80211: fetch unsolicited probe response template by link ID
> 
>  drivers/net/wireless/ath/ath11k/mac.c           |  4 +--
>  drivers/net/wireless/ath/ath12k/mac.c           |  6 ++--

Acked-by: Jeff Johnson <jjohnson@kernel.org> # for drivers/net/wireless/ath

>  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  4 +--
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  6 ++--
>  include/net/mac80211.h                          |  8 +++--
>  net/mac80211/tx.c                               | 40 ++++++++++++++++---------
>  6 files changed, 44 insertions(+), 24 deletions(-)
> ---
> base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
> change-id: 20260220-fils-prob-by-link-eef176414f1b
> 


