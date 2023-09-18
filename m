Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8FBC46CA1
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5n5QV+GNo/icUPV8dVN7mKab4TFP9cQAe0LPyRDe9rU=; b=xpNjfo6iG0h894
	7+EmHSp2AJisSK+vaWrsDZCS94TvdV4VzCxMKbiBoNeQ5Q/RSnxilUSBdzodmBHEG+6EDlYZCW/3f
	fFQSc2ympJEXdpLJpjpbf08/zPNZf5hVw7Kmn/CpwrEa8nBK4Fhb/XeUjf0D8YL+URlNZb1pitKvW
	z6ImlpLIYH0eZNKkFHMsj4C/sZ3EQ7x7zEtUi2jjP9KMDyogKaOJRcRpCepgn7K80dLUE3toK9p/j
	QRueCBbjX4OJ/IdjC2F84DMjsUHbovdxWyfXwr4p9aiRyv5PU9pfj/NG+AWPE2DpEmwr5YHVElh8T
	i0xDPDoQ40BSz21CLX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAn-00FXJ2-2c
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:20:21 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAk-00FXGW-0Z;
	Mon, 18 Sep 2023 13:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043218; x=1726579218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uEKrgp0fS4TcV/kqj/T1ibXnz9U6nSS/hcSxBB6l/C0=;
  b=Hu2/MVYAR9cFZT28C5yCMzLPEOEG3FlmX2If6VZE8jg3MCZZ7kJ2ba0O
   g6IaneKy+LKXYu9pHTyqWZ2ORk6yCOCCYvywwOgtWWmf0CIEmq64M9QrA
   a8S2m/S4BT+Ch8bEtc/zAsTH54FDrcknytD/KZ357k8tqAF4euJmrX2Ou
   W84kNFB4lSRcHy9BmaJy4MMcN/Hq5k0AZ1V9GPgMsu/y9KLVDHvOSK2BU
   ZcP63JASCSh1fziAz+Hc4i5hd57sdPUOvC09VqllP713an04dS/Nuyi38
   y59yCNLRYF0uD1gh3k8KtWbDdWdeWYDI7GjHmP0br1voARL2P09t/nuoo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113410"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113410"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342150"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342150"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:30 -0700
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
Subject: [PATCH v2 05/13] PCI/ASPM: Add pci_enable_link_state()
Date: Mon, 18 Sep 2023 16:10:55 +0300
Message-Id: <20230918131103.24119-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062018_262779_B6A082B3 
X-CRM114-Status: GOOD (  15.16  )
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

cGNpX2Rpc2FibGVfbGlua19zdGF0ZSgpIGxhY2tzIGEgc3ltbWV0cmljIHBhaXIuIFNvbWUgZHJp
dmVycyB3YW50IHRvCmRpc2FibGUgQVNQTSBkdXJpbmcgY2VydGFpbiBwaGFzZXMgb2YgdGhlaXIg
b3BlcmF0aW9uIGJ1dCB0aGVuCnJlLWVuYWJsZSBpdCBsYXRlciBvbi4gSWYgcGNpX2Rpc2FibGVf
bGlua19zdGF0ZSgpIGlzIG1hZGUgZm9yIHRoZQpkZXZpY2UsIHRoZXJlIGlzIGN1cnJlbnRseSBu
byB3YXkgdG8gcmUtZW5hYmxlIHRoZSBzdGF0ZXMgdGhhdCB3ZXJlCmRpc2FibGVkLgoKQWRkIHBj
aV9lbmFibGVfbGlua19zdGF0ZSgpIHRvIHJlbW92ZSBBU1BNIHN0YXRlcyBmcm9tIHRoZSBzdGF0
ZQpkaXNhYmxlIG1hc2suCgpTaWduZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2
aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9wY2kvcGNpZS9hc3BtLmMgfCA0MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9w
Y2kuaCAgICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvcGNpZS9hc3BtLmMgYi9kcml2ZXJzL3BjaS9wY2llL2FzcG0u
YwppbmRleCA5MWRjOTVhY2E5MGYuLmY0NWQxOGQ0N2MyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
Y2kvcGNpZS9hc3BtLmMKKysrIGIvZHJpdmVycy9wY2kvcGNpZS9hc3BtLmMKQEAgLTExMTcsNiAr
MTExNyw0OCBAQCBpbnQgcGNpX2Rpc2FibGVfbGlua19zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgaW50IHN0YXRlKQogfQogRVhQT1JUX1NZTUJPTChwY2lfZGlzYWJsZV9saW5rX3N0YXRlKTsK
IAorLyoqCisgKiBwY2lfZW5hYmxlX2xpbmtfc3RhdGUgLSBSZS1lbmFibGUgZGV2aWNlJ3MgbGlu
ayBzdGF0ZQorICogQHBkZXY6IFBDSSBkZXZpY2UKKyAqIEBzdGF0ZTogQVNQTSBsaW5rIHN0YXRl
cyB0byByZS1lbmFibGUKKyAqCisgKiBFbmFibGUgZGV2aWNlJ3MgbGluayBzdGF0ZSB0aGF0IHdl
cmUgcHJldmlvdXNseSBkaXNhYmxlIHNvIHRoZSBsaW5rIGlzCisgKiBhbGxvd2VkIHRvIGVudGVy
IHRoZSBzcGVjaWZpYyBzdGF0ZXMuIE5vdGUgdGhhdCBpZiB0aGUgQklPUyBkaWRuJ3QgZ3JhbnQK
KyAqIEFTUE0gY29udHJvbCB0byB0aGUgT1MsIHRoaXMgZG9lcyBub3RoaW5nIGJlY2F1c2Ugd2Ug
Y2FuJ3QgdG91Y2ggdGhlCisgKiBMTktDVEwgcmVnaXN0ZXIuCisgKgorICogUmV0dXJuOiAwIG9y
IGEgbmVnYXRpdmUgZXJybm8uCisgKi8KK2ludCBwY2lfZW5hYmxlX2xpbmtfc3RhdGUoc3RydWN0
IHBjaV9kZXYgKnBkZXYsIGludCBzdGF0ZSkKK3sKKwlzdHJ1Y3QgcGNpZV9saW5rX3N0YXRlICps
aW5rID0gcGNpZV9hc3BtX2dldF9saW5rKHBkZXYpOworCisJaWYgKCFsaW5rKQorCQlyZXR1cm4g
LUVJTlZBTDsKKwkvKgorCSAqIEEgZHJpdmVyIHJlcXVlc3RlZCB0aGF0IEFTUE0gYmUgZW5hYmxl
ZCBvbiB0aGlzIGRldmljZSwgYnV0CisJICogaWYgd2UgZG9uJ3QgaGF2ZSBwZXJtaXNzaW9uIHRv
IG1hbmFnZSBBU1BNIChlLmcuLCBvbiBBQ1BJCisJICogc3lzdGVtcyB3ZSBoYXZlIHRvIG9ic2Vy
dmUgdGhlIEZBRFQgQUNQSV9GQURUX05PX0FTUE0gYml0IGFuZAorCSAqIHRoZSBfT1NDIG1ldGhv
ZCksIHdlIGNhbid0IGhvbm9yIHRoYXQgcmVxdWVzdC4KKwkgKi8KKwlpZiAoYXNwbV9kaXNhYmxl
ZCkgeworCQlwY2lfd2FybihwZGV2LCAiY2FuJ3QgZW5hYmxlIEFTUE07IE9TIGRvZXNuJ3QgaGF2
ZSBBU1BNIGNvbnRyb2xcbiIpOworCQlyZXR1cm4gLUVQRVJNOworCX0KKworCW11dGV4X2xvY2so
JmFzcG1fbG9jayk7CisJbGluay0+YXNwbV9kaXNhYmxlICY9IH5wY2lfbGlua19zdGF0ZV9tYXNr
KHN0YXRlKTsKKwlwY2llX2NvbmZpZ19hc3BtX2xpbmsobGluaywgcG9saWN5X3RvX2FzcG1fc3Rh
dGUobGluaykpOworCisJaWYgKHN0YXRlICYgUENJRV9MSU5LX1NUQVRFX0NMS1BNKQorCQlsaW5r
LT5jbGtwbV9kaXNhYmxlID0gMDsKKwlwY2llX3NldF9jbGtwbShsaW5rLCBwb2xpY3lfdG9fY2xr
cG1fc3RhdGUobGluaykpOworCW11dGV4X3VubG9jaygmYXNwbV9sb2NrKTsKKworCXJldHVybiAw
OworfQorRVhQT1JUX1NZTUJPTChwY2lfZW5hYmxlX2xpbmtfc3RhdGUpOworCiAvKioKICAqIHBj
aV9zZXRfZGVmYXVsdF9saW5rX3N0YXRlIC0gU2V0IHRoZSBkZWZhdWx0IGRldmljZSBsaW5rIHN0
YXRlCiAgKiBAcGRldjogUENJIGRldmljZQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wY2ku
aCBiL2luY2x1ZGUvbGludXgvcGNpLmgKaW5kZXggM2MyNGNhMTY0MTA0Li44NDRkMDkyMzAyNjQg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGNpLmgKKysrIGIvaW5jbHVkZS9saW51eC9wY2ku
aApAQCAtMTc3NiwxMSArMTc3NiwxMyBAQCBleHRlcm4gYm9vbCBwY2llX3BvcnRzX25hdGl2ZTsK
IGludCBwY2lfZGlzYWJsZV9saW5rX3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBpbnQgc3Rh
dGUpOwogaW50IHBjaV9kaXNhYmxlX2xpbmtfc3RhdGVfbG9ja2VkKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCBpbnQgc3RhdGUpOwogI2lmZGVmIENPTkZJR19QQ0lFQVNQTQoraW50IHBjaV9lbmFibGVf
bGlua19zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgaW50IHN0YXRlKTsKIGludCBwY2lfc2V0
X2RlZmF1bHRfbGlua19zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgaW50IHN0YXRlKTsKIHZv
aWQgcGNpZV9ub19hc3BtKHZvaWQpOwogYm9vbCBwY2llX2FzcG1fc3VwcG9ydF9lbmFibGVkKHZv
aWQpOwogYm9vbCBwY2llX2FzcG1fZW5hYmxlZChzdHJ1Y3QgcGNpX2RldiAqcGRldik7CiAjZWxz
ZQorc3RhdGljIGlubGluZSBpbnQgcGNpX2VuYWJsZV9saW5rX3N0YXRlKHN0cnVjdCBwY2lfZGV2
ICpwZGV2LCBpbnQgc3RhdGUpIHsgcmV0dXJuIC1FT1BOT1RTVVBQOyB9CiBzdGF0aWMgaW5saW5l
IGludCBwY2lfc2V0X2RlZmF1bHRfbGlua19zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgaW50
IHN0YXRlKQogeyByZXR1cm4gMDsgfQogc3RhdGljIGlubGluZSB2b2lkIHBjaWVfbm9fYXNwbSh2
b2lkKSB7IH0KLS0gCjIuMzAuMgoKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEyawo=
