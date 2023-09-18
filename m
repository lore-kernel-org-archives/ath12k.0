Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE19CD37B0
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KfvQYm5MN5SNg1w8bKJtKroYJP17ISY5DrJo/xzjBw=; b=SJvk3H6QSL/yxa
	q6lxx2mrfEbmzXpkFhlUl33/HY8obs2w2AV1TQSecnUev6oSiEqJAg7e4lHYBboFVR3JmVJ1HXxKE
	kN3QrHBitoW1h5qMImOGWauzp2c+3dNDCbRRewMn4372NYIwDQcVzf3CtCw4dEU23+uIMaaEcfSWS
	j9QhF+BdZk9ZC5w/6qb9TwTjNli58p7R74sbucv/mjlNX9KOE0AHxPmD/19bMMTeUcZV0wEo/OWQO
	qFzBrvixrNfKnPqKFIIyJNtPn8qDtHMQpA1kgoYBu8t0bd3tsY8sB28fKMxRStaRbUjXHChSLBn90
	Wd5+dQG2VlHH8wzmk1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE9O-00FWaJ-2Q
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:18:54 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE9K-00FWXt-2T;
	Mon, 18 Sep 2023 13:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043130; x=1726579130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GntG1C/Of1kw8Cak4jvrKOjbZB9Dh17vQJmAQuf8VNA=;
  b=eL7u45zipEtku7/bGnBSatSBQ5a8u5ddZm98SipC4RNsAzG1FoH/oy/b
   xxjmVRgdiegzUv3BtAxZ0Vl6PHUFiy8A5ptOuUzUHgy0suKVB1sdLD7It
   rpWxL9sGPkyZ9ZA6WASs+9mPddL3bMkml6Fer2aMU45bJpQ8L0S4Qj3oQ
   AGAPwX/2F0bocIFZh6DIIePdSFCQKKlV85U3vrRFgUm93O6jDErwvy/W7
   2ocB03i6vuKsTuyXDEsgB6dIDt1ctY5flYRyFDFYHVAQG6EVe7uOrTewF
   MjHQjLjWapm0oUkUX6zJrhVtxGL8JLMFqsVMWn3NCWWGCFnB0Kpgan/If
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446112782"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446112782"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811341486"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811341486"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 02/13] PCI/ASPM: Improve pci_set_default_link_state() kerneldoc
Date: Mon, 18 Sep 2023 16:10:52 +0300
Message-Id: <20230918131103.24119-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061850_844902_1E9FE9F9 
X-CRM114-Status: GOOD (  12.63  )
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

SW1wcm92ZSBwY2lfc2V0X2RlZmF1bHRfbGlua19zdGF0ZSgpIGRvY3VtZW50YXRpb246CgotIE5v
dGUgdGhlIGxpbmsgc3RhdGUgbWF5IGdldCBjaGFuZ2VkIGlmIHRoZSBkZWZhdWx0IHBvbGljeSBp
cyBpbiB1c2UKLSBCZXR0ZXIgZm9sbG93IGtlcm5lbGRvYyBmb3JtYXR0aW5nIGd1aWRlbGluZXMg
KHNlcGFyYXRlIGRlc2NyaXB0aW9uCiAgYmxvY2sgYW5kIHJldHVybiBlbnRyaWVzKQoKU2lnbmVk
LW9mZi1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPgot
LS0KIGRyaXZlcnMvcGNpL3BjaWUvYXNwbS5jIHwgMTYgKysrKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wY2kvcGNpZS9hc3BtLmMgYi9kcml2ZXJzL3BjaS9wY2llL2FzcG0uYwppbmRleCBm
YzkwOWUyMDM2NWYuLjg2MGJjOTQ5NzRlYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvcGNpZS9h
c3BtLmMKKysrIGIvZHJpdmVycy9wY2kvcGNpZS9hc3BtLmMKQEAgLTExMDIsMTQgKzExMDIsMTgg
QEAgaW50IHBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGludCBz
dGF0ZSkKIEVYUE9SVF9TWU1CT0wocGNpX2Rpc2FibGVfbGlua19zdGF0ZSk7CiAKIC8qKgotICog
cGNpX3NldF9kZWZhdWx0X2xpbmtfc3RhdGUgLSBDbGVhciBhbmQgc2V0IHRoZSBkZWZhdWx0IGRl
dmljZSBsaW5rIHN0YXRlIHNvCi0gKiB0aGF0IHRoZSBsaW5rIG1heSBiZSBhbGxvd2VkIHRvIGVu
dGVyIHRoZSBzcGVjaWZpZWQgc3RhdGVzLiBOb3RlIHRoYXQgaWYgdGhlCi0gKiBCSU9TIGRpZG4n
dCBncmFudCBBU1BNIGNvbnRyb2wgdG8gdGhlIE9TLCB0aGlzIGRvZXMgbm90aGluZyBiZWNhdXNl
IHdlIGNhbid0Ci0gKiB0b3VjaCB0aGUgTE5LQ1RMIHJlZ2lzdGVyLiBBbHNvIG5vdGUgdGhhdCB0
aGlzIGRvZXMgbm90IGVuYWJsZSBzdGF0ZXMKLSAqIGRpc2FibGVkIGJ5IHBjaV9kaXNhYmxlX2xp
bmtfc3RhdGUoKS4gUmV0dXJuIDAgb3IgYSBuZWdhdGl2ZSBlcnJuby4KLSAqCisgKiBwY2lfc2V0
X2RlZmF1bHRfbGlua19zdGF0ZSAtIFNldCB0aGUgZGVmYXVsdCBkZXZpY2UgbGluayBzdGF0ZQog
ICogQHBkZXY6IFBDSSBkZXZpY2UKICAqIEBzdGF0ZTogTWFzayBvZiBBU1BNIGxpbmsgc3RhdGVz
IHRvIGVuYWJsZQorICoKKyAqIFNldCB0aGUgZGVmYXVsdCBkZXZpY2UgbGluayBzdGF0ZSBzbyB0
aGF0IHRoZSBsaW5rIG1heSBiZSBhbGxvd2VkIHRvCisgKiBlbnRlciB0aGUgc3BlY2lmaWVkIHN0
YXRlcy4gSWYgdGhlIGRlZmF1bHQgcG9saWN5IGlzIGluIHVzZSwgdGhlIGxpbmsKKyAqIHN0YXRl
IG1heSBhbHNvIGJlIHVwZGF0ZWQgdG8gcmVmbGVjdCB0aGUgbmV3IGRlZmF1bHQgbGluayBzdGF0
ZS4gTm90ZQorICogdGhhdCBpZiB0aGUgQklPUyBkaWRuJ3QgZ3JhbnQgQVNQTSBjb250cm9sIHRv
IHRoZSBPUywgdGhpcyBkb2VzIG5vdGhpbmcKKyAqIGJlY2F1c2Ugd2UgY2FuJ3QgdG91Y2ggdGhl
IExOS0NUTCByZWdpc3Rlci4gQWxzbyBub3RlIHRoYXQgdGhpcyBkb2VzIG5vdAorICogZW5hYmxl
IHN0YXRlcyBkaXNhYmxlZCBieSBwY2lfZGlzYWJsZV9saW5rX3N0YXRlKCkuCisgKgorICogUmV0
dXJuOiAwIG9yIGEgbmVnYXRpdmUgZXJybm8uCiAgKi8KIGludCBwY2lfc2V0X2RlZmF1bHRfbGlu
a19zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgaW50IHN0YXRlKQogewotLSAKMi4zMC4yCgoK
LS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
