Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E256CD5BC0
	for <ath12k@archiver.kernel.org>; Tue, 19 Sep 2023 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmaleQgEKZD1bRaL3UR3t5JQRE0s7AxHx98ZWheI6Mc=; b=hhZQSF0S862tN1
	5nBXW7c/wxGXDAC5h3tdH4a+Wo/bpjb/jqmcAcN7BbRIJhO5iQA1sCfLh6lFewUrf0BRxuqykkDeJ
	4TRNTuGlbvleUq40rJ2NY2MVI2tpwWCz5uRoM9fdrA0zg69F09aozyMjcBoW6kRTxDTjnaJ0tWDQ9
	KmDGXdAnqc2p9aiEgnzR10R4teHVqmE4N58gaQGcvZdEeZFQ0AD8c1BopsnQPLGP+cH0+hr0AdEI+
	SmpHEYAquQzd1vKI79m92urMl9U9tvIlh6vk4DRZ6RCp7ktPxYyJRgngqdz8V5bpySiVcvqLuOF5g
	01wveN+eBOGQlhTaQ0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiauF-000Xss-0z
	for ath12k@archiver.kernel.org;
	Tue, 19 Sep 2023 13:36:47 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiauB-000Xr4-1T;
	Tue, 19 Sep 2023 13:36:44 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0A3D15C00A5;
	Tue, 19 Sep 2023 09:36:34 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
  by compute5.internal (MEProxy); Tue, 19 Sep 2023 09:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1695130594; x=1695216994; bh=G3Kkrzt0AGrrY/tjL0EyntUuI
	Bb8mCCGj+mtTnmx+Q8=; b=UnODe/CFFm/fKyGaSWbPPfJGyccMgh1Fl4ql7J8B2
	9jTTCbW7SBL9mmZVXktU9NHHOKE59vNmIt0/3PhYLyfB2ct9PpB2TtdW2GrTNk0N
	p54KxQZhj60LKixvUfYSDQa4v3EbvN8Xt+LCAGQGVQ26IZGNwzMCGuce3Gghezi+
	NDemRIJWikj5y3YJh93ZKtlx/6vlOGJnSRujwbi6RlScOarSzktohPxAwVVayDgE
	wc1G63LzMMrc7gbgXgfjjE3fjf+QuIdkFrVuooWiII9CtYxJ0KGYCqtctLBBxlXB
	a0MaGet4EcXXzcNEDj0hlAAITshodNu2ZUQSCM82e95IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695130594; x=1695216994; bh=G3Kkrzt0AGrrY/tjL0EyntUuIBb8mCCGj+m
	tTnmx+Q8=; b=Ki98uDeNfz0jsUIT+QrBfvj6hR3UdAj0JGP0Kk0m3is6XGITVnc
	DitfO8Z+GtWWohKTB22DWPAWKANFWZvwpnHoOdj68y6C4Z7ADQwwOPv0cl9n2b+x
	ySjituYs4vc8wTr6657lSCf6nuZlPaevwRT+ZlC5EloYB2OJvQKrFkiBrlsDjKms
	R/4JDdefME8w8YDPy5+wnxG2+Fya9/liDAL5qCMMKpXum+43+FmCAvT5DhfpQlfI
	HT3jt59lJiwFge+hvLDqbVFgQ4bt7cNR/bPeevGW7CpYG9z9TksRHzzWy5ZpkhSc
	+qvxWapAs7q7hQNor2DKBFbtWnh42FwH2mg==
X-ME-Sender: <xms:4KMJZbW9LbqWPcHkGh_DlPuxCBkGLtv3JnsYlVzXjKzSIeeti7RIhg>
    <xme:4KMJZTmAvH4L7z_nGaP5KdfIvqOZiks__CHr-LlmDmPx7zd2plYewMvSEyaWyUHFk
    jKbOhCbS2QMQUW6WgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekuddgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfu
    vhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtf
    frrghtthgvrhhnpeevhedthffgffelhedujefgueduudeutdefleevvdetudelhfeihfdv
    ffelteeuudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:4KMJZXYmYuvL3nH0_SgD_kNdsC7XHLClfVBAmruidR-V60B6y3P-MQ>
    <xmx:4KMJZWXQA3WzRBb5zCu-QYvcA4iZm-q-O5n5rA4kxuHe43SgaGHuSg>
    <xmx:4KMJZVk9Oi99N4mk7qm3lIUI4afyU90X7PI_XuVzNp7f82_pACbMKw>
    <xmx:4qMJZdNsFBGmk6guzMsje_BoEdpEh-d6HrZzup8N865hs4SPZgsPDA>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0378AA60077; Tue, 19 Sep 2023 09:36:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
MIME-Version: 1.0
Message-Id: <aabaa49f-8988-42c0-bf8e-2266005e2155@app.fastmail.com>
In-Reply-To: <20230918131103.24119-7-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
 <20230918131103.24119-7-ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Sep 2023 15:36:10 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, "Bjorn Helgaas" <helgaas@kernel.org>,
 "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
 "Rob Herring" <robh@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "Lukas Wunner" <lukas@wunner.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Heiner Kallweit" <hkallweit1@gmail.com>,
 "Emmanuel Grumbach" <emmanuel.grumbach@intel.com>,
 linux-kernel@vger.kernel.org, "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Marcel Holtmann" <marcel@holtmann.org>,
 "Johan Hedberg" <johan.hedberg@gmail.com>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, intel-wired-lan@lists.osuosl.org,
 linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 06/13] Bluetooth: hci_bcm4377: Convert aspm disable to quirk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_063643_577320_1211611E 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBNb24sIFNlcCAxOCwgMjAyMywgYXQgMTU6MTAsIElscG8gSsOkcnZpbmVuIHdyb3Rl
Ogo+IHBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoKSB3YXMgbWFkZSByZWxpYWJsZSByZWdhcmRsZXNz
IG9mIEFTUE0gQ09ORklHCj4gYW5kIE9TIGJlaW5nIGRpc2FsbG93ZWQgdG8gY2hhbmdlIEFTUE0g
c3RhdGVzIHRvIGFsbG93IGRyaXZlcnMgdG8gcmVseQo+IG9uIHBjaV9kaXNhYmxlX2xpbmtfc3Rh
dGUoKSB3b3JraW5nLgo+Cj4gUmVtb3ZlIGRyaXZlciB3b3JraW5nIGFyb3VuZCB1bnJlbGlhYmxl
IHBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoKSBmcm9tCj4gaGNpX2JjbTQzNzcgZHJpdmVyIGFuZCBh
ZGQgYSBQQ0kgcXVpcmsgdG8gZGlzYWJsZSBBU1BNLgo+Cj4gU2lnbmVkLW9mZi1ieTogSWxwbyBK
w6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPgo+IC0tLQoKQWNrZWQtYnk6
IFN2ZW4gUGV0ZXIgPHN2ZW5Ac3ZlbnBldGVyLmRldj4KCgpUaGFua3MsCgpTdmVuCgotLSAKYXRo
MTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
