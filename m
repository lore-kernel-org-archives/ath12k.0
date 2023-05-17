Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70976C77B7F
	for <ath12k@archiver.kernel.org>; Wed, 17 May 2023 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbvSrierCB3KlhROJg+7iOt67w88QkhBAzKxG0NfpRY=; b=C+jx3CxgpurG9c
	SLTphdptVm/ySi7EZbXEFo7FNfk7alifdTF67caUh/bU+gcihAMV32w2/g5MwAYLSO4CdOXwEX2DX
	4z8pxw8W3pfR+6T2Afobv9K7CBv4v3Rdta56GTZFtn4qzmagFDQIFbZYKFtFlaAcbnEV5okaEu3ro
	MI+EFI3ORogR/owG/Y/WleReTlBeVP0x9cmzoFDLqdf3vdliZMrJJgjGI/0wKB2uO62ypfLFJyoKB
	bzEXV0NfLzfgnzIII7uDQHNt+QXYi9HEpbzbQVQJiuM7IkNHJyvikJnmvMDBPj/k2BoBrWOTKi4H9
	lVgcrk1jibaVM7EEXEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEx2-009WuP-0P
	for ath12k@archiver.kernel.org;
	Wed, 17 May 2023 11:04:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEwz-009Wte-15
	for ath12k@lists.infradead.org;
	Wed, 17 May 2023 11:04:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 756A763A7C;
	Wed, 17 May 2023 11:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E08C433A1;
	Wed, 17 May 2023 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684321445;
	bh=tR3qS12+MUYmkZK6jLAcuvivmBsfJSWs1iLgSwCi8fY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Q6w2br9fnsK/saD7J/nbmuE4MtaDXepq8RRZpSubF96Trnm6BvliJeDLqoVyWp+8z
	 egyinTUw3TEb4Y0N8JqJj19LLSGRYy8AwmGRHsov8tnU7aYGwUAXMoOD/7ZOxJ1Jn2
	 sIBxxCFFMzvMJYG1uWo5JZR1i2U6GBQdoW0xx/9JOt+ZgA96vEljgHPYz+ZJEcW3iZ
	 Pz1tXLN2HjdWaBEuYzPqNICJAGHli8WhH5+0PKIkpAb5t5/Tj8p0aoiIqZ2c6AZlox
	 gvjjVTQRDDlvr2prU1hIAtj7QPMX8jgFBRFhd0SGyfMKEtS8mNuV1RdNiuOY6Xnj4U
	 v2nQnGG9XAu1Q==
From: Kalle Valo <kvalo@kernel.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,  Bjorn Helgaas <bhelgaas@google.com>,
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>,  "Rafael J . Wysocki"
 <rafael@kernel.org>,  Heiner Kallweit <hkallweit1@gmail.com>,  Lukas
 Wunner <lukas@wunner.de>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Sriram R <quic_srirrama@quicinc.com>,  P
 Praneesh <quic_ppranees@quicinc.com>,  Ramya Gnanasekar
 <quic_rgnanase@quicinc.com>,  Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>,  Vasanthakumar Thiagarajan
 <quic_vthiagar@quicinc.com>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Dean Luick
 <dean.luick@cornelisnetworks.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  stable@vger.kernel.org
Subject: Re: [PATCH v2 8/9] wifi: ath12k: Use RMW accessors for changing LNKCTL
References: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
	<20230517105235.29176-9-ilpo.jarvinen@linux.intel.com>
Date: Wed, 17 May 2023 14:03:57 +0300
In-Reply-To: <20230517105235.29176-9-ilpo.jarvinen@linux.intel.com> ("Ilpo
	\=\?utf-8\?Q\?J\=C3\=A4rvinen\=22's\?\= message of "Wed, 17 May 2023 13:52:34
 +0300")
Message-ID: <871qjfmd7m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_040409_417675_F7AAFC16 
X-CRM114-Status: GOOD (  10.23  )
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

SWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPiB3cml0ZXM6Cgo+
IERvbid0IGFzc3VtZSB0aGF0IG9ubHkgdGhlIGRyaXZlciB3b3VsZCBiZSBhY2Nlc3NpbmcgTE5L
Q1RMLiBBU1BNCj4gcG9saWN5IGNoYW5nZXMgY2FuIHRyaWdnZXIgd3JpdGUgdG8gTE5LQ1RMIG91
dHNpZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KPgo+IFVzZSBSTVcgY2FwYWJpbGl0eSBhY2Nlc3Nv
cnMgd2hpY2ggZG8gcHJvcGVyIGxvY2tpbmcgdG8gYXZvaWQgbG9zaW5nCj4gY29uY3VycmVudCB1
cGRhdGVzIHRvIHRoZSByZWdpc3RlciB2YWx1ZS4gT24gcmVzdG9yZSwgY2xlYXIgdGhlIEFTUE1D
Cj4gZmllbGQgcHJvcGVybHkuCj4KPiBGaXhlczogZDg4OTkxMzIwNWNmICgid2lmaTogYXRoMTJr
OiBkcml2ZXIgZm9yIFF1YWxjb21tIFdpLUZpIDcgZGV2aWNlcyIpCj4gU3VnZ2VzdGVkLWJ5OiBM
dWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2
aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcKCkFja2VkLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgoKLS0gCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoK
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMmsK
