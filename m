Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDB5C3271E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jul 2024 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6i2dhfJybEBeRl1sbHfNDLBM2hRI88tH+fOvYf1kUE4=; b=XJeYbBFht5sOren6wNeUWNRnCG
	d789OLOH08vEzQoCkjioqMbYP2RAADZ2AmxqZbTKFHHuqZmzF7vGaH30XOZwKbbl/8l7GZwT4+USO
	IAH037jLlXRhHYM978G2K8kS/MhSUVX+aHhWc94jD4MXx05HItE+rb7MS8PZBcU/FAoI3naVjQhEY
	m2jRpl0DxXYcVduzwIFUpfoP2gULgvAsWBa0LDVvr3DfaQ9c93kGdyZv5XsvO4BB2/QOzs1Gt0x17
	XzGRjHbF9V6QRAEEucWIAs4ag/NAixU3tkB2bEFkwt/7XbLBAQilgb1T7B2lo8Xeh0nyt0hL40/1g
	hlOejLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQteq-00000004mXO-3rSZ
	for ath12k@archiver.kernel.org;
	Mon, 08 Jul 2024 19:04:17 +0000
Received: from fout5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQten-00000004mWo-3CJS
	for ath12k@lists.infradead.org;
	Mon, 08 Jul 2024 19:04:15 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2E2C6138019B;
	Mon,  8 Jul 2024 15:04:12 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 08 Jul 2024 15:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720465452; x=1720551852; bh=6i2dhfJybE
	BeRl1sbHfNDLBM2hRI88tH+fOvYf1kUE4=; b=R5iI5lmWyJlOoZj1phtAWvfoNI
	JHR8RzX83q+kAYMiVxUd8c68RHxV3rjWY3Rgibw6c9+OtWhjLW4Cr10RqVZjso9x
	yVRSnOOdLdScLGcseOFhxwxlmwIV5iGfEvTTFWjVhH3bVZoznZ63mQM759TUy3yh
	O9Xp9Y7JzT63RnohQ8nc2VtWD7uCss38nl3vrdRQqAvJ0g8jDZwXTa4x6RKcC3IB
	2VcAsrttH0ULPV1PSiTHGXtJjJgHmYhh8WKOsXtQgpIkQFLlS+IZshTDcpEnXe9M
	MyA7WWMpB5dET2QgUaUl8Z92IhE6RD0VcjYNZlb0YnWHxvw7W+gcHSX8vrWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720465452; x=1720551852; bh=6i2dhfJybEBeRl1sbHfNDLBM2hRI
	88tH+fOvYf1kUE4=; b=vWj1Xje6fOVjh92Yep0f6KlHfz+Trkz7eZ15mfTbYSbN
	wdygL67DrDfUlPWvTulVqZjvqJA2g/Ku38lWXQSQCINk09ubY/Fm1QyMMhYMcA6X
	BBu+X8V9w9rTFy20TrIieJJBAeMvbPEO+HuA+knO/+tD6LcoA4GqYaIzU6uMC6Ne
	RZodmZVFav3xLUrUrfvt3W8MS6rJ9PGjeETPrkSK5ELAMxrGeEe5LL47g96XBtPO
	LcZcH7IvQFy/392/x8VLwGJZif+KWjqMECAGb+Pz4ihseuiJq0sad8PTBUATRmct
	Ybo7Ngj5JslVOygnl1NLCrVwgLgTnvc1aOlXyk13ww==
X-ME-Sender: <xms:KjiMZpLkqsuzlDy-D603xKfcZ8WwTV31GxKfMh-pLetq3mYVELIsyw>
    <xme:KjiMZlKarNtP1X8omyXp5ArhYJzfBN74HT4X0_G5KoH2LvaE2mXEGaDNpzbpN_Ufp
    83uOb9AFVLGU3ci4ys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejgddufeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:KziMZhu5G_Kj4MSpPCDiWPbwzfgSE5oC927ZKZlNdQGUDyUmeG1wWA>
    <xmx:KziMZqZ-41FHMgmsYmAXFyRaB8IyMNh6MSUvUzGjnYOKyDkOLksS-g>
    <xmx:KziMZgbV8TKB-hsPPGjSv-yYmYGZTUrRBXUinmxjw6kYnZAJTkJlcQ>
    <xmx:KziMZuCzyQwBM3-LCVUkIUt1eCLnv9q4im_4KxP3wA6P0aM_2Gd7hA>
    <xmx:LDiMZvk8JAUyRaQqNqI9Dp4PT0EjaU_Wdoa_sGXqIv9TOE5S-Kwi_DEO>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E73AFB60092; Mon,  8 Jul 2024 15:04:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <0ddafa32-1fc2-45e1-b71c-beb64f8cd589@app.fastmail.com>
In-Reply-To: <87y16bbvgb.fsf@kernel.org>
References: <87y16bbvgb.fsf@kernel.org>
Date: Mon, 08 Jul 2024 21:03:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kalle Valo" <kvalo@kernel.org>
Cc: linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
Subject: Re: crosstool: x86 kernel compiled with GCC 14.1 fails to boot
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_120414_068882_DAF27B81 
X-CRM114-Status: GOOD (  17.01  )
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

On Mon, Jul 8, 2024, at 20:16, Kalle Valo wrote:
> Hi Arnd,
>
> I installed GCC 14.1 from:
>
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14.1.0/
>
> But I have a problem that a kernel compiled with that compiler fails to
> boot on my x86 NUC test box. I don't see any errors, just black screen
> and I assume after that the kernel either crashes or reboots and goes to
> back to the GRUB menu. This loop seems to continue forever. GCC 13.2 and
> older from crosstool work just fine.
>
> Do you happen to have any ideas what could cause this or how to debug
> further?

Thanks for the report. Unfortunately I have no idea what the
problem may be, and so far nobody else has reported this.

For debugging, what I'd try first is to run the same kernel in
qemu to see if that works, or attach gdb and step through the
early boot if it doesn't.

I have tried reproducing it, but with my arm64 hosted x86-64
cross-compiler, it boots a defconfig x86-64 kernel in qemu just
fine.

     Arnd

