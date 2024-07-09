Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D29C2BD09
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AE0fFzRZO99KbEKs+v9clAHq1pXfvPK0Ierrsu1abhs=; b=vxke92Rr/I4tqkpUB9Yyfsnkcy
	84r2TRKR5nOVSJhVGQ+h65u6+LUx0+87aJtQVkFBS1FUtW6TZzCFO+RKmFKYyHLSGiTnJWZO437+W
	mKx/LtxjULMgO0oqow9Uu4Nn3EItOOgQiITOUov33o6oyhxK18x7g2Gut6YJioFySEuSsqdOVUukD
	rAF6tG1EFY7mqsU1sNPn88XJvQwlvbnS1yYDwAAJEtm4pzxHIrE7RgbEViKI/beRiLAV8v3ZUsmAD
	5DQmC4ujvZ5SaMhkULxQODqmb5pjLZj1pIHsGqclRuZaLMEFVy4Gx6Im45dp53sXxmLfD7TGHLCKq
	uN7UVesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRGat-00000008PDE-44Cv
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 19:33:43 +0000
Received: from fhigh8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRGac-00000008P9X-2us3
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 19:33:28 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id BA6ED1140138;
	Tue,  9 Jul 2024 15:33:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 15:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720553603; x=1720640003; bh=AE0fFzRZO9
	9KbEKs+v9clAHq1pXfvPK0Ierrsu1abhs=; b=nch44eC1+Zbz0IdTfvfecqBNjX
	YpXM7HfjV2RciRb0wXchwubHQzpnH6PsvZHaW2jiMaSutbhGYPkhFgNlggZLphkF
	ka2kBNm81rXrOEukmnBzavFh0WgXb4hW6PxEopZ8YB/+5MG9IwLiKo9Exe8xrHY+
	s7EMJCQEOba+aIs7L1ZhTAtROrenuQTPOfWAef+5Tb5/i8gm8OH5uw0y36kOtgSe
	njIGjb3XJkKkw8JuK8Q6fJsIq8fF0ZlgOdDiIapJ9FDonaSEfhlLc2PtX09g7e+Z
	kPFTnoy2/AN6g4kcb8IiUzGJhNsYNLWEG05LcZ1iFZaSRhmt4aCiKnd66a0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720553603; x=1720640003; bh=AE0fFzRZO99KbEKs+v9clAHq1pXf
	vPK0Ierrsu1abhs=; b=BPwP3bQn0yC3nVNRRRTrZkI7J45R1r79uxSCNIOfwTX/
	Pf/vybLFrBjHGHYBFGFefAIufoSNeY+eOh1iR8OIW2uBmICIykw+b46SFnORVyBf
	DQmqAW8s19+7AP9EaD+uqrQZlYwhZlDJjnT4SUeauxLj3TC/YUM0O9ueWtUPaV9F
	gAWIwDSwpXbbEIpVuzG0uIhiHFmFnUQPnYevbcRuJ8A9MuY8wyYPqnOC5ymgsX6X
	sqgbzu9H2rUkXoxmx7WtGNNJoklgBL3yVZwsrdRMm7HnayPetzYF6PEvITva/c7k
	aylQh60k0iUAJJ3AI6hT9iauRp8VpPwRVoiLC8PArA==
X-ME-Sender: <xms:gpCNZoCXVKxZYgd-tL_p2k9_uAle5NRuWFn4b8oB91ZexvboAwvAow>
    <xme:gpCNZqidF1K-9jUuTpzLvnQflD26Kb9sEmupPhPbyGA9GSp03Apa1q1viLXpquDUZ
    AokqUCeyiJz8LMOVVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgddufeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:gpCNZrlo8ynwoKGV2tVyoVZMt7SWJuifyw3wICL6bMUVIvZwXZo-jA>
    <xmx:gpCNZuw4KcrMuigBpuH5fvIFjqsotTvmBsQtqM4r_KdKiRkHuKaHIQ>
    <xmx:gpCNZtQIhXrJAMWS_snE1w-VQFd1vK5gHYOcGo9BFyaUAxzSgEFSjQ>
    <xmx:gpCNZpbW6SzaKP6FffvTqJOfe6Ku42gxdzjTMmwUfEj0O7Ox92ndQQ>
    <xmx:g5CNZq9s7g6T8sbAgzbFYlPgW05GWwkwxKheEFU6xYuovRAa8A8CY_up>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2F097B6008D; Tue,  9 Jul 2024 15:33:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <5bfebbd4-d12e-4735-acab-549a7cf9604a@app.fastmail.com>
In-Reply-To: <0e0150ca-fdfa-40cb-ad7f-6ac695b702e4@quicinc.com>
References: <87y16bbvgb.fsf@kernel.org>
 <917565ee-732a-4df0-a717-a71fbb34fd79@quicinc.com>
 <837cd2e4-d231-411a-8af4-64b950c4066a@quicinc.com>
 <c9b23ee3-6790-404d-80a3-4ca196327546@app.fastmail.com>
 <0e0150ca-fdfa-40cb-ad7f-6ac695b702e4@quicinc.com>
Date: Tue, 09 Jul 2024 21:33:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Kalle Valo" <kvalo@kernel.org>
Cc: linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
 kasan-dev@googlegroups.com, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>,
 "Dmitry Vyukov" <dvyukov@google.com>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Subject: Re: crosstool: x86 kernel compiled with GCC 14.1 fails to boot
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_123327_001411_A045DE44 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue, Jul 9, 2024, at 17:29, Jeff Johnson wrote:
> On 7/8/2024 10:44 PM, Arnd Bergmann wrote:
>> On Tue, Jul 9, 2024, at 05:55, Jeff Johnson wrote:
>
> I picked my favorite to begin with, enabling KASAN (which in turn enabled a
> few others). The resulting kernel did not boot for me (just saw a black screen
> after the GRUB menu). Diff between working and non-working config is below.

Ok, good to know. I've added the KASAN developers to Cc now, maybe
they have already seen reports of x86 kernels failing with gcc-14?

> I then downloaded and built the config you supplied. With that I have the same
> behavior as my original config, the display is frozen with:
> Loading initial ramdisk ...

Interesting, so the same config that works for me fails on your
machine. I can see three possible reasons for this:

- qemu vs hardware -- Can you try running this kernel in
  qemu-system-x86_64 to see if that still boots

- kernel version -- it's possible that this is a known bug
  that was already fixed in the 6.10-rc7 kernel source I
  tried, or that your source tree has a new bug that I don't.
  Which version did you try?

- cross-compile vs native compile -- It's possible that my
  cross-built native x86_64 compiler has a bug that is not
  in natively built gcc binaries, or in the cross compiler
  I have on ARM. I've mostly ruled this one out by building
  the same kernel using the x86 compilers through qemu-user.

     Arnd

