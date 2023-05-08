Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157F5C77B75
	for <ath12k@archiver.kernel.org>; Mon,  8 May 2023 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djuMsTS1Yne5HKQPrCL4GcP1cTtmUJjBr+diBL74xSw=; b=qJHpUsZ8dBmnuI
	d1LBw2Y+cN35qcNbIXa1XvgylBP01/hbsNSRhy9+tRpi/Dlg3f2DQiiQ5Ifu7RtlB0qxX7pfF3IER
	muXXXcrg+9I3VimyTKuJ3zVzYKWnEWF+TmIxVttPJSfcE30ypLc8NP1/UgpUvw2/H0N1wY4z3Gkci
	V3ftKORAU6RYNCCS3I7vjGVVWXxjZ0x8gWqYAANchovWhi12PBaZPadmOW8hhB6ZH2pW5egeIg5p5
	SAXRX3YwS//SDHBfPa5FFKARy/fO3sMCBpTPek7X6ftxFjIf0hWazwASCfQP7R3QH2a6Z97cY41t6
	JKGF85YIOEDMuEwmZCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwbt-0001Ok-1K
	for ath12k@archiver.kernel.org;
	Mon, 08 May 2023 08:52:45 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwbo-0001NR-2g;
	Mon, 08 May 2023 08:52:43 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id D7A3D32002E2;
	Mon,  8 May 2023 04:52:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 08 May 2023 04:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683535952; x=1683622352; bh=iJ
	dvc4SRQrLz+3W/Ez8+i72AurjuOlLDf24cELwYcVE=; b=pnJ0mn5Pa/QzV8ZIaM
	SRbHsFrI9iqt/gq2ptRf7jKyTxVwaTK69qoRXP1rgps2xX3U0RXmYPC1IZ2LHTgW
	pu9bi28FR+JI3j/Urvw75XRPf8JXoeXE44CVskN1L8laOSSJRefqZdEC522Irwc9
	W/plnnBQKyozVG/bMVRIPbkkziSP56XzjGwiXkSWge++GOrHcNxjUm2nf6J4Dg01
	Hsuh4pXa66FhryZxOycnQJ5OrMm119+yiCe4hpaF1Bnhm1cZGMPspXxofSxdX5Si
	/29C8NsP9yQrn+mXinIr0qLXuQlcXzJrx5jqO7k9EZzc1cLhGSWxYPi6rlz2aizS
	fNvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683535952; x=1683622352; bh=iJdvc4SRQrLz+
	3W/Ez8+i72AurjuOlLDf24cELwYcVE=; b=SgDJPcdzZzknasipJlIz/AHKCTPE+
	4PdbFI+yda23wf8OKl5GJPIwLycT6p1dYp0C/zcOky7Hxim6GZEcgdeciW/YLBHf
	slHORB546oVXtKGUXQQ8sLiFec1eBfkr466qoagbjPxHAfJbU+2LQxeRYMLn4jbr
	9pxlabN50OOq/PoGByfDegIKI9mlrTbHQ+IrjMISALEOz07BQIXMJ4SPiZ5ayJlL
	93dw8oZyw3R0lkOISE64Gr4iZgaCrPbGlcSUha8JYvRgKFdsilDGs6/aHikT32P4
	8kJ8Mik45kP4NhbRzGl4tf0mxvmHHnYYdJixq6xLlKpwMTYP04ku6FqgQ==
X-ME-Sender: <xms:ULhYZPJFmqn4J9UETLTJLNH8DtkPV_V_YoCQTCfBFDaim3kOcrqt6w>
    <xme:ULhYZDJQlXAdYjy9W4se8h-D_UIVvF4Efk3Ps0o5qq8PuViTDzrZM0INfUATDH5go
    ANZh3tGcIdn95uScFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ULhYZHtpGFdF_240rDsYEjyS1GGrw_MlViAB2BwQtKnuI3-0hEfnHA>
    <xmx:ULhYZIbXcDDXy_Eu-P90z1fN-2OlNNPPK57dR2UdEC8iamrVqmUbhw>
    <xmx:ULhYZGbseSHMBtETCdUBuKStSE6RJtB3OwcjRYDVkZcuIH-RQMaNgg>
    <xmx:ULhYZOqO-DWRySw_E1PrXJiso16T58m0yr7AqYfJxU784pQZkXD33A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0DCB5B60086; Mon,  8 May 2023 04:52:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <504c5a7d-0bfd-4b1e-a7f0-65d072657e0a@app.fastmail.com>
In-Reply-To: <87ttwnnrer.fsf@kernel.org>
References: <20230417205447.1800912-1-arnd@kernel.org>
 <87ttwnnrer.fsf@kernel.org>
Date: Mon, 08 May 2023 10:52:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kalle Valo" <kvalo@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Johannes Berg" <johannes.berg@intel.com>,
 "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>,
 "Wen Gong" <quic_wgong@quicinc.com>,
 "Baochen Qiang" <quic_bqiang@quicinc.com>,
 "Sowmiya Sree Elavalagan" <quic_ssreeela@quicinc.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 ath12k@lists.infradead.org
Subject: Re: [PATCH] wireless: ath: work around false-positive stringop-overread
 warning
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_015241_539870_DB081EB4 
X-CRM114-Status: GOOD (  12.23  )
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

On Mon, May 8, 2023, at 10:44, Kalle Valo wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> In a rare arm64 randconfig build, I got multiple warnings for ath11k
>> and ath12k:
>>
>> In function 'ath11k_peer_assoc_h_ht',
>>     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2665:2:
>> drivers/net/wireless/ath/ath11k/mac.c:1709:13: error: 'ath11k_peer_assoc_h_ht_masked' reading 10 bytes from a region of size 0 [-Werror=stringop-overread]
>>  1709 |         if (ath11k_peer_assoc_h_ht_masked(ht_mcs_mask))
>>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> This happens whenever gcc-13 fails to inline one of the functions
>> that take a fixed-length array argument but gets passed a pointer.
>>
>> Change these functions to all take a regular pointer argument
>> instead.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> s/wireless:/wifi:/ but I can fix that.

Ok, thanks!

> In a awat it's a shame to lose the explicit length but I guess there's
> no other way to fix this?

There might be, but I couldn't figure out a way that works.

> Also I hope you find the time to add GCC 13 to crosstool :) Related to
> this

I uploaded gcc-13.1.0 binaries last week, but still need to
update the html page, so it's not yet linked. You can navigate
the directories from the gcc-12 builds.

     Arnd

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
