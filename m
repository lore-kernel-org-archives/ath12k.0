Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD53AC3DA41
	for <ath12k@archiver.kernel.org>; Mon,  8 Jul 2024 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uKINBeW+4gCbuQ50TvRh1npwZdC1iST+0dwE9UFEZs=; b=OLfRZbUVX8bzIaS2LlHOiWHN+3
	2Q4mtysh7KbovDb1acSQSPwSJ1RStMDlndBVhtsNXmQmHTp/oIkscMOs/B6LLWUskCyEeKyl0HxFA
	djZEWvWzBCNXCPN1ijmbb0K55lZqwjMYLRYsHBvw8qGBpEL4xjtZuE93U9xYo8iXNAAVBMWJShtVb
	Kk+km8Aqx+IU16KEeXuZH/ArRvuHlFWGOF0WpHg5zlat1FthPSTdaZvKgQlaELt+sM9wOBrgtWcAd
	ELiGFQucNaTbj/muNWZQrEsCCx/uJFP5Gc1jOdaXfiSUuXRkwe+L51hRJ/jLDkXCO61X6o/6sdKvD
	TpXG3/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuLJ-00000004sMT-1nJS
	for ath12k@archiver.kernel.org;
	Mon, 08 Jul 2024 19:48:09 +0000
Received: from fout6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQuLH-00000004sLq-0f4H
	for ath12k@lists.infradead.org;
	Mon, 08 Jul 2024 19:48:08 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1B1D0138050A;
	Mon,  8 Jul 2024 15:48:06 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 08 Jul 2024 15:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720468086; x=1720554486; bh=8uKINBeW+4
	gCbuQ50TvRh1npwZdC1iST+0dwE9UFEZs=; b=yenoeTylzsBKXbZVmvDoXRrvKs
	8WGjT1Ps5A4r4srehRBfKREwvtdXSdDSGLAZsXWrmZi0ynQdn63nRZSbSjuCgGFp
	fZZlDNvjdbPhw8Xjs35F0sCLcUkT6ED8mMnhOgn8YwQ0owsSZdHRBFWsJZoXCRH2
	QWSA+h4RFXko1+pem0BpseAMvlEd8/PnECyLHaPcQ57Bja1qM+JQfxkcWxMQOWgg
	7u/wFDcCygMcmB2rnzHSQZvE2SojlZ79mpWXCVjJSwBW9zIHDl0hbKPr3wcDmho9
	cj0nnzPYiQr1+GyOBzS6dCSPEB2Q0QQCoHKPeCpOMJnipkWEy6Hd5t00SEUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720468086; x=1720554486; bh=8uKINBeW+4gCbuQ50TvRh1npwZdC
	1iST+0dwE9UFEZs=; b=teJjY86yZ3DdlHnBkBbBYeSBMXxLUBO57qhQDPC/0w9P
	Kty0OysCIRHqnQitBHLie/VE8dG/egUT7l72VKIQmM8vn5I/4ZV4UCqiKMMpn1tB
	uo8F4mX9mFD9JL3IQsiUwNiy53iaZsrRz6rQKZDRGS3ERH0L/1Vz65a9F4AzVAAL
	v4/segf1/EWiJMp5Tpdat91Fjwo+sx8ttURQdpV8ud/8RxnQyjlTtq5t238L4EVL
	DEiSvAujS32VYG9MUCK1NIhsM7yQjEV2Ex9wx9AkMTisZvrhOzIwGRbK9n0cYSiw
	x6HzDEs2s8Pl//Qi8+MMOtFav9l+EEfAsTzx/1L4Jw==
X-ME-Sender: <xms:dEKMZmg0BBf6oIWk_bDNUI_GZm1XOv80b8DgM84XO_OH0j1omA7lvA>
    <xme:dEKMZnDctVubWMPSI4gvUbZijAZl8YA8kDRug3aIOnG8r0IGOHljjphnjBZYUA2Oj
    7xPz3jThg8mbYbMiQU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejgddugeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dEKMZuHTG7_B3AQT_1R8dU7MX0pB4Z1dVa8MGHMlQYbW6ypcK9MwbA>
    <xmx:dEKMZvTIhBXIriiLDyUJOtvhE4OZutu2aZZ-ckqI5w9UW8tzkyTCXw>
    <xmx:dEKMZjyMSIsr0ZldDUkbchPWPzNtVaMaZ5veOUJCl2fhY7PnFJSjFw>
    <xmx:dEKMZt45GEzePkqerozn8uTSy-fAU32ed1Fo1T78ITmjb2NLSjsheA>
    <xmx:dkKMZj-9zv_RgVC0_AO6fu-qV5MCWWt2H2BeYmKu4Z0bCWcEnW6SU7NL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8A7EB6008D; Mon,  8 Jul 2024 15:48:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <973f9a20-0807-4302-a286-d3ff6478529f@app.fastmail.com>
In-Reply-To: <202407081226.94B1FB24@keescook>
References: <20240704144341.207317-1-kvalo@kernel.org>
 <202407041551.1DC8C03D@keescook> <877cdvdgpz.fsf@kernel.org>
 <202407081226.94B1FB24@keescook>
Date: Mon, 08 Jul 2024 21:47:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kees Cook" <kees@kernel.org>, "Kalle Valo" <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH RFC] wifi: ath12k: workaround fortify warnings in
 ath12k_wow_convert_8023_to_80211()
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_124807_285460_6503899B 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Jul 8, 2024, at 21:31, Kees Cook wrote:
> On Mon, Jul 08, 2024 at 06:51:52PM +0300, Kalle Valo wrote:
>
> I suspect this won't be the only place in the kernel where -Wrestrict
> will give weird results with GCC 11, and there are still plenty of folks
> using GCC 11. I think the best option would probably be to version-check
> GCC to gate the addition of -Wrestrict.
>
> Arnd, what do you think? This looks like a more extreme version of
> commit f9fc1ec28bae ("crypto: drivers - avoid memcpy size warning")

The f9fc1ec28bae patch was the other way around, it showed up
in new compilers but not old ones. I don't think I've seen
more gcc-11 -Wrestrict warnings during testing, but I'm currently
not set up to do a thorough search. If it's the only one, then
Kalle's suggested workaround is probably best, but if there
are additional warnings on gcc-11, making the warning depend
newer compilers is also fine. I just don't want to give up the
warning for new compilers altogether.

      Arnd

