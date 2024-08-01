Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D9BC3DA64
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 15:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjiY/np2bCegIdu2HZqv2NvpIREACxVg6059zZEjFj0=; b=zPUaMdGlsw+hm6mT9DZhbx/lzP
	7ZZyq/DdbH/BUdPdu/++bJKlOI7HnVtlIw6/zbZEPsgnKGMkCJhtbdFKMjPhRLJMH+BWElM651SI3
	mT8PtwppcWPjStSMZJGxLrvnhTptQAxLFhbxyKmJXz/h22huDXh34HHRazNdNNtWyY7lcY9FZoIVA
	ZoMD7N1BuoWqLUiN9tE5RMhkWGGbB9TEKfj+iI95UPtwdhKm5vXCszDFUmHwnRzLEFLRyvMqoP8+j
	2aSx1a2Fp3HESdphrXbgk9X4wC559V0uPD9Rlk8Md8xJB9ntB5RymK0LI2HdMSVgiAA7Y9bGTsSjv
	UTjrq8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXbQ-00000005q51-1uMG
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 15:20:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXbO-00000005q4Q-07ph
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 15:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 66BFECE1862;
	Thu,  1 Aug 2024 15:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58546C32786;
	Thu,  1 Aug 2024 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722525623;
	bh=Z5w3It2q9WeUub/jU2zGmZpsP0nu9rBLj/RN5LKP+ek=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pW1KIJq/ssHR9+E//i/alrP7hypHlFM1xh3tXi3scjzuocg7GZL6UqO3PT+8F1GYD
	 jDVRJ85pV6p/+RMqNw6+hbbcASpBy6jNL0lzQrENftQEojdK+BQJ8888c0U51Jq5nP
	 P4dzV34Y/ctu3NmoRbQpDsXS1S/t/ygWQK6xLYJ6C/hMiJbm/RYuRXY9abmeMNsPBh
	 6mK95XPDHK4p0apfc1gu99hWNkLKZcZKt5GAJvxZVn+ibsNcRwsT2CzRmH3nc0Rn3E
	 0unSssxb04nCfXPe8FW/ZouB8HZ1IAWgc3Iqst6xpsmZjMx2NR7rcg8beQlJ8k3TGP
	 +1bzxVzLOzlbA==
From: Kalle Valo <kvalo@kernel.org>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "Baochen Qiang" <quic_bqiang@quicinc.com>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  kernel@quicinc.com,
  netdev@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: use 128 bytes aligned iova in transmit
 path for WCN7850
References: <20240715023814.20242-1-quic_bqiang@quicinc.com>
	<2cdac1e1-dff4-451c-a214-510c4736160a@app.fastmail.com>
Date: Thu, 01 Aug 2024 18:20:20 +0300
In-Reply-To: <2cdac1e1-dff4-451c-a214-510c4736160a@app.fastmail.com> (Mark
	Pearson's message of "Fri, 19 Jul 2024 09:07:18 -0400")
Message-ID: <875xsk8e2z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_082026_263771_C0743B25 
X-CRM114-Status: GOOD (  18.94  )
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

"Mark Pearson" <mpearson-lenovo@squebb.ca> writes:

> On Sun, Jul 14, 2024, at 10:38 PM, Baochen Qiang wrote:
>
>> In transmit path, it is likely that the iova is not aligned to PCIe TLP
>> max payload size, which is 128 for WCN7850. Normally in such cases hardware
>> is expected to split the packet into several parts in a manner such that
>> they, other than the first one, have aligned iova. However due to hardware
>> limitations, WCN7850 does not behave like that properly with some specific
>> unaligned iova in transmit path. This easily results in target hang in a
>> KPI transmit test: packet send/receive failure, WMI command send timeout
>> etc. Also fatal error seen in PCIe level:
>>
>> 	...
>> 	Capabilities: ...
>> 		...
>> 		DevSta: ... FatalErr+ ...
>> 		...
>> 	...
>>
>> Work around this by manually moving/reallocating payload buffer such that
>> we can map it to a 128 bytes aligned iova. The moving requires sufficient
>> head room or tail room in skb: for the former we can do ourselves a favor
>> by asking some extra bytes when registering with mac80211, while for the
>> latter we can do nothing.
>>
>> Moving/reallocating buffer consumes additional CPU cycles, but the good news
>> is that an aligned iova increases PCIe efficiency. In my tests on some X86
>> platforms the KPI results are almost consistent.
>>
>> Since this is seen only with WCN7850, add a new hardware parameter to
>> differentiate from others.
>>
>> Tested-on: WCN7850 hw2.0 PCI 
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>
> We've tested this in the Lenovo lab using the T14 G5 AMD with a
> 6.10.0-rc7+ kernel from wireless-next and this patch applied.
> Previously we had stability issues under traffic load. With the patch
> applied we can no longer reproduce the issue.
>
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Can this be tagged for stable backporting? It's an important fix.

I added cc stable to the commit message. I forgot to do it before I
pushed my changes out, but it's in my local branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

