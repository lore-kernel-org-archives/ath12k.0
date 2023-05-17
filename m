Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D504C77B7F
	for <ath12k@archiver.kernel.org>; Wed, 17 May 2023 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+AxYa2/nBDdvUFqFFo3o2gsihew84i60wpZh7L5l+k=; b=xB5uxpqOHKwmjI
	pdeEDWkwq1lMV0cJxkffoRZMDGu7dPuQ0ahUCzjciQDUV0G4rGS2q09BUkfxdFQmXSPPoofxIzTK6
	trsGvoke+ZvEhPa6Wgx3eWm9dEgC1Kxi7WWjJqLHsSCHhaA4CavLwgubWABz6GYmqQ+5PM1gTuisx
	wfECUeUX20UZemkLa2jN6XMm/8tAqFqBtiC6XT0e2ZjJNumPIyikCO3/30B3fmj06bE9VaIsXCc2k
	Ibt8idFKlkkukDMLeMF4H8pOPd8gsMXDnM0Cx4xWlSebhbUtCdP/6wwKRttOMZdbhSz+S8rcJwz9B
	E++lmJAsL1lLJM/9UfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEnO-009V2A-2B
	for ath12k@archiver.kernel.org;
	Wed, 17 May 2023 10:54:14 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEnM-009UzX-0J
	for ath12k@lists.infradead.org;
	Wed, 17 May 2023 10:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684320852; x=1715856852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GmDJbthkhSJpq5HQ5xMtwPdMc3rhKpWsiGNjPf0ymVE=;
  b=cCgdW1i7s64VtlNqL8Q9L+cVjfYzJTLVOOPOZrdRiftECGo2XKs1jY47
   R5YgAkIPvW1xjpXQmtjwYETY9OodCKSgFOgR6bl5iHcu9HZQ1mF/AowS2
   UO5I1HqeqpLB1udeZqAiWTRgK8jsFQ/t99MQL5K2O4KwSniUW9JVJV4U9
   /Qyf3BeEagqvECN1HlIeZ5caBX7NuJDIRgaPFSwNZ2Ik7F71HTBH3FAI6
   FYbMB3tQex9DMSpmHTY3YoXuYhSLgUIc2G4dD3OR5vX4bT5tCXGgC7r7S
   gz0YAFfJePP3xrImRE2fT6mf/GihsABQDmfCgm2cl64LTSCVF5q19Xtww
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438071860"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="438071860"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="734651303"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="734651303"
Received: from lnstern-mobl1.amr.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.221.185])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:53:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sriram R <quic_srirrama@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 8/9] wifi: ath12k: Use RMW accessors for changing LNKCTL
Date: Wed, 17 May 2023 13:52:34 +0300
Message-Id: <20230517105235.29176-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
References: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035412_147872_3F676A46 
X-CRM114-Status: GOOD (  11.44  )
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

RG9uJ3QgYXNzdW1lIHRoYXQgb25seSB0aGUgZHJpdmVyIHdvdWxkIGJlIGFjY2Vzc2luZyBMTktD
VEwuIEFTUE0KcG9saWN5IGNoYW5nZXMgY2FuIHRyaWdnZXIgd3JpdGUgdG8gTE5LQ1RMIG91dHNp
ZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KClVzZSBSTVcgY2FwYWJpbGl0eSBhY2Nlc3NvcnMgd2hp
Y2ggZG8gcHJvcGVyIGxvY2tpbmcgdG8gYXZvaWQgbG9zaW5nCmNvbmN1cnJlbnQgdXBkYXRlcyB0
byB0aGUgcmVnaXN0ZXIgdmFsdWUuIE9uIHJlc3RvcmUsIGNsZWFyIHRoZSBBU1BNQwpmaWVsZCBw
cm9wZXJseS4KCkZpeGVzOiBkODg5OTEzMjA1Y2YgKCJ3aWZpOiBhdGgxMms6IGRyaXZlciBmb3Ig
UXVhbGNvbW0gV2ktRmkgNyBkZXZpY2VzIikKU3VnZ2VzdGVkLWJ5OiBMdWthcyBXdW5uZXIgPGx1
a2FzQHd1bm5lci5kZT4KU2lnbmVkLW9mZi1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmlu
ZW5AbGludXguaW50ZWwuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvcGNpLmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvcGNpLmMgYi9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTJrL3BjaS5jCmluZGV4IDlmMTc0ZGFmMzI0Yy4uZTFlNDVlYjUwZjNlIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL3BjaS5jCisrKyBiL2RyaXZl
cnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvcGNpLmMKQEAgLTc5NCw4ICs3OTQsOCBAQCBzdGF0
aWMgdm9pZCBhdGgxMmtfcGNpX2FzcG1fZGlzYWJsZShzdHJ1Y3QgYXRoMTJrX3BjaSAqYWJfcGNp
KQogCQkgICB1MTZfZ2V0X2JpdHMoYWJfcGNpLT5saW5rX2N0bCwgUENJX0VYUF9MTktDVExfQVNQ
TV9MMSkpOwogCiAJLyogZGlzYWJsZSBMMHMgYW5kIEwxICovCi0JcGNpZV9jYXBhYmlsaXR5X3dy
aXRlX3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkgICBhYl9wY2ktPmxp
bmtfY3RsICYgflBDSV9FWFBfTE5LQ1RMX0FTUE1DKTsKKwlwY2llX2NhcGFiaWxpdHlfY2xlYXJf
d29yZChhYl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAorCQkJCSAgIFBDSV9FWFBfTE5LQ1RM
X0FTUE1DKTsKIAogCXNldF9iaXQoQVRIMTJLX1BDSV9BU1BNX1JFU1RPUkUsICZhYl9wY2ktPmZs
YWdzKTsKIH0KQEAgLTgwMyw4ICs4MDMsMTAgQEAgc3RhdGljIHZvaWQgYXRoMTJrX3BjaV9hc3Bt
X2Rpc2FibGUoc3RydWN0IGF0aDEya19wY2kgKmFiX3BjaSkKIHN0YXRpYyB2b2lkIGF0aDEya19w
Y2lfYXNwbV9yZXN0b3JlKHN0cnVjdCBhdGgxMmtfcGNpICphYl9wY2kpCiB7CiAJaWYgKHRlc3Rf
YW5kX2NsZWFyX2JpdChBVEgxMktfUENJX0FTUE1fUkVTVE9SRSwgJmFiX3BjaS0+ZmxhZ3MpKQot
CQlwY2llX2NhcGFiaWxpdHlfd3JpdGVfd29yZChhYl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RM
LAotCQkJCQkgICBhYl9wY2ktPmxpbmtfY3RsKTsKKwkJcGNpZV9jYXBhYmlsaXR5X2NsZWFyX2Fu
ZF9zZXRfd29yZChhYl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAorCQkJCQkJICAgUENJX0VY
UF9MTktDVExfQVNQTUMsCisJCQkJCQkgICBhYl9wY2ktPmxpbmtfY3RsICYKKwkJCQkJCSAgIFBD
SV9FWFBfTE5LQ1RMX0FTUE1DKTsKIH0KIAogc3RhdGljIHZvaWQgYXRoMTJrX3BjaV9raWxsX3Rh
c2tsZXRzKHN0cnVjdCBhdGgxMmtfYmFzZSAqYWIpCi0tIAoyLjMwLjIKCgotLSAKYXRoMTJrIG1h
aWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
