Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78AACD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vA0/QoH1mnNDQt62DXyQdCKrfaoZdJ1B7dNYKaH4KIs=; b=0xomTWyZSSXymnRPzMO184j+F9
	puh0fsG8Jf3HpUmLZIwKxKxIkoKtkDmbUoYQ7ZHTBSouHY8Fb/1t3Ww32v5xF/jo/N0DzvQyDwX02
	/+Z90XvFvaZxEDQiknaBjDRJN/BccjrHTp5WNlxN+8XcFgf0yqcKaELGpJi2IGXOgWq/pyTt/vkRX
	anxtvz1WsEgCk48SpI/Z5m7a5Aakc4HLfNni49tFnSvBZaFT2I0cyF/4upoYckalmjc6mZ+CYobB+
	McMSnDozziBsPp8ZkBvcqneXCls+rqjJwE+hxcSUUopfi53CSbNLO1FXLYnAjQqpUnNtlrAlmWbdj
	nlru/rHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuoL-0000000FFTx-2RmI
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 18:49:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuoG-0000000FFRa-3Bdz
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 18:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BF1EECE102A;
	Thu, 28 Mar 2024 18:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D10C433F1;
	Thu, 28 Mar 2024 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711651745;
	bh=99VsYl9LLb/Fgf4qp6tFM6y8MYoeu/u9qF5KbrJouGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pUXYyF4LKffpWAHKSOSBBDM9VU4bzm9YdG/yU93M5ND28v79HezOyMi8jsUvGwCQU
	 FSb7X3GsU1qpKUf92xWygjKSCVFJH1KCnIPHddz6n29IMJQjlh5iQFoJdoAHvgNd0F
	 ZbQ8bVGZPN7+lAd631fadKn/2vb4H2JWCuYRAUwPEW375WyeO9F7ezdqYSsAK2Zc2u
	 Ab/IJ1F8JG8u1ToVTX6xs3vnYIBCh12Fw++nRegRO1lEHcJQOUZUOlNa+k+uU8HicV
	 avyCGlvU8KfrjVuZD0pD/zFTfb6CULhfln/ABODz7VAniRT6sp02fqqG6CqtQ/2nVl
	 n9B0ItU6Q8vfQ==
Date: Thu, 28 Mar 2024 11:49:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Vasanthakumar
 Thiagarajan  <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
Message-ID: <20240328114903.1d0c8af9@kernel.org>
In-Reply-To: <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	<20240328072916.1164195-3-quic_periyasa@quicinc.com>
	<6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	<9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	<9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_114911_687398_C90F680B 
X-CRM114-Status: GOOD (  12.17  )
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

On Thu, 28 Mar 2024 13:01:55 +0100 Johannes Berg wrote:
> If we do that, including NL80211_MULTI_HW_ATTR_IDX for illustrative
> purposes though I think it should be removed, we'd end up with:
> 
> NL80211_ATTR_MULTI_HW
>  - NL80211_MULTI_HW_ATTR_IDX: 0
>  - NL80211_MULTI_HW_ATTR_FREQ: 2412
>  - NL80211_MULTI_HW_ATTR_FREQ: 2417
>  ...
> NL80211_ATTR_MULTI_HW
>  - NL80211_MULTI_HW_ATTR_IDX: 1
>  - NL80211_MULTI_HW_ATTR_FREQ: 5180
>  - NL80211_MULTI_HW_ATTR_FREQ: 5200
>  ...
> 
> which _is_ a lot more compact, and removes all the uninteresting mid-
> level indexing.
> 
> So in that sense, I prefer that, but I'm truly not sure how the (hand-
> written) userspace code would deal with that.

I think the best way today would be two walks:

	for_each_attr() {
		switch (type):
		case THE_A_ARRAY_1:
			cnt1++;
			break;
		case THE_A_ARRAY_2:
			cnt2++;
			break;
	}

	if (cnt1)
		array_1 = calloc();
	cnt1 = 0; /* we'll use it as index in second loop */
	if (cnt2)
		array_2 = calloc();
	cnt2 = 0;

	for_each_attr() {
		/* [ normal parsing, populating array_1[cnt1++] etc. ] */
	}

Compared to "indexed array" the only practical difference I think is
the fact that all attrs are walked. I think you have to count them
either way before parsing.

I was wondering at some point whether we should require that all
multi-attr attributes are grouped together. Or add an explicit "count"
attribute. But couldn't convince myself that such extra rules will
pay off sufficiently with perf and/or ease of use...

