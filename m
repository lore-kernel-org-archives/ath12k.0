Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A96FC001B0
	for <ath12k@archiver.kernel.org>; Mon, 14 Aug 2023 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlupx4m4lsbF9fDBAIdBR8wBM1p2n5aIRLYu9kKzqcU=; b=ZRsuleGCia8z3c
	UjE0p0fyaDv5qm1rsjPBdOZX5ntejWDfGyeHsTZJ0JMZQn9axriqLa+jo1Nuh/6z73+f1QeW46mee
	qzNKTfth7AKRm1iFRos1jK4Wmbs8ihellW51X2BK7Fel75Nb86UHciQJuTDF2/wLPkRhLrAdyV0Uh
	jMpHFM7jkLBuadh01enmOc5ekPnM/XLjUhrDZXy2MUg2MEEP4IMQdnCXlSLnCN9jhMRdfiOdzSEmS
	5zjoVVZdiPza0UhnuFPd7PN61jDP7nFEYmsmPh4Xl+vzcqQJCX16jMBdqmYrudV+BjeuEO08Ut1k3
	d8+n8h5Z3tYMdLFnO4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYUR-00HJl0-30
	for ath12k@archiver.kernel.org;
	Mon, 14 Aug 2023 14:24:15 +0000
Received: from mail.toke.dk ([45.145.95.4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYUN-00HJfx-2K
	for ath12k@lists.infradead.org;
	Mon, 14 Aug 2023 14:24:14 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1692023040; bh=8SoUg7FO+B5ltN+g6mc/GlWomKwJReuVjx+WDxr4fG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q7kRvaONx8fu6n6qI38VDGpzAWdZEDVoe1g+DoBmUZtrq0Fn5eI2ui186O6rxbt/Y
	 W8vwFlb2SGysuamOxs99cfHh6jlzfvdfjk3LkKtxJeqJR7T4U22IDSszXrc6tgPJy9
	 FieoOMY3S4Qa1zykwR5wTnoXLmUzCQarLx3+Mq/04aTOxHA13Jkyfao9XbNFtFZ27h
	 f8VptPi3zogfbPgb9CUSoyc7+njnL7+3Fq5yS2XD5eM4SgF7ziYxj3WdKlgL6lbWK2
	 a5HyqElzaFH/TI1EGlpEEksDpnsQ3fnt8tT2kB12mM6LkR+LV7gfOgW2gxRxuWWaun
	 WtClH1slP7r1A==
To: Arnd Bergmann <arnd@kernel.org>, Kalle Valo <kvalo@kernel.org>, Jeff
 Johnson <quic_jjohnson@quicinc.com>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain
 <mcgrof@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Aloka Dixit <quic_alokad@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>,
 Ramya Gnanasekar <quic_rgnanase@quicinc.com>, Karthik M
 <quic_karm@quicinc.com>, Aditya Kumar Singh <quic_adisi@quicinc.com>, Muna
 Sinada <quic_msinada@quicinc.com>, Johannes Berg
 <johannes.berg@intel.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] wireless: ath: remove unused-but-set parameter
In-Reply-To: <20230814073255.1065242-1-arnd@kernel.org>
References: <20230814073255.1065242-1-arnd@kernel.org>
Date: Mon, 14 Aug 2023 16:23:59 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87zg2tem80.fsf@toke.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_072412_674683_76FA0360 
X-CRM114-Status: UNSURE (   5.38  )
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

QXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBUaGlzIGhhcyBuZXZlciBiZWVuIHVzZWQgc2luY2Ug
dGhlIGRyaXZlciB3YXMgbWVyZ2VkLCBidXQgaXQgbm93IGNhdXNlcwo+IGEgVz0xIHdhcm5pbmcg
aW4gcmVjZW50IGNsYW5nIHZlcnNpb25zCj4KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
OWsvbWFpbi5jOjE1NjY6MjE6IGVycm9yOiBwYXJhbWV0ZXIgJ2NoYW5nZWRfZmxhZ3MnIHNldCBi
dXQgbm90IHVzZWQgWy1XZXJyb3IsLVd1bnVzZWQtYnV0LXNldC1wYXJhbWV0ZXJdCj4gZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDlrL2h0Y19kcnZfbWFpbi5jOjEyNTg6MjU6IGVycm9yOiBw
YXJhbWV0ZXIgJ2NoYW5nZWRfZmxhZ3MnIHNldCBidXQgbm90IHVzZWQgWy1XZXJyb3IsLVd1bnVz
ZWQtYnV0LXNldC1wYXJhbWV0ZXJdCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDVrL21h
YzgwMjExLW9wcy5jOjM2Nzo2MjogZXJyb3I6IHBhcmFtZXRlciAnY2hhbmdlZF9mbGFncycgc2V0
IGJ1dCBub3QgdXNlZCBbLVdlcnJvciwtV3VudXNlZC1idXQtc2V0LXBhcmFtZXRlcl0KPgo+IFJl
bW92ZSB0aGUgYml0IG1hbmlwdWxhdGlvbiBvbiB0aGUgb3RoZXJ3aXNlIHVudXNlZCBwYXJhbWV0
ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKRm9y
IGF0aDlrOgpBY2tlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+
CgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
czovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
