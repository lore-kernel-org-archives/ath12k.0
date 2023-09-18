Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8166CD37B0
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkzmk2l+u6pGlYmVdskO9/NBf3tb0KcD6ksha3rdlyQ=; b=u6cyiqWu/h6iGe
	VfJUtF67Llyxyxp8CbCz6HNsD1ceux5gGkkxTVtZz2IJubGV5dxgwrL2lh8+M/SBvwWUOAeuj9zF0
	x3szB1UIrfXQ29I17uqEZXpN8rVilbIrhCFi2nFT9QqFaEeo6l0THN991Qc5SeEmG343hhtn+Vjz0
	RXHpVyCGu9D1bPmMTf0k/rDwWMTQ5Bl8WzC277DCaW74UQCOf3hk8hHH5/iPFBfuZLZ08/DoGBUQ4
	Fx7sIOQvCDMjgewFPIjH3Oya9/WOWOFQIEzd0GQhc23r8Oj5cF3vgL+G9lXSZ/d/ZOjRHmGX88HXM
	T7VGO9++lM0RjgIeJtnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEA8-00FWx3-1q
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:19:40 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEA5-00FWuq-0z;
	Mon, 18 Sep 2023 13:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043177; x=1726579177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ymkN+p4ogpYhyDF99HjDp+8yFzsuK5k5J5zb7K9eDd0=;
  b=gENzDZyLcKKxWf5lOCdSrC+oU6M6ze6Tb/BqZWe5SQ5LYrC1PNXtGfEk
   gNKJ/hrGZNLuisNq0z4aNFwQXE90uU1lQo+E01d+MW1BTMKH2tfQtZOdj
   3C5beo4nyZfWELchxgtJvEZfZaCqHUsIKEkP+jFWG/PVoNldEUjuSxIVp
   2utKhCc3p+IL8ERm4XLXbCmDzw+y88GSLNPEJmfxqd0jiSxVv48kIaQtT
   8P2dPQ5kzUbiIlUKRt3PPXFNkOWKo/vAuWwFkJKhaOiTtGIynRfXgMzME
   bVJaSDugw5GyIy4QcNb1jvbt5drIEzxv88lwq++JzIOBt7wPABk/fxaJJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113125"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811341856"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811341856"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:02 -0700
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
Subject: [PATCH v2 04/13] PCI/ASPM: Move L0S/L1/sub states mask calculation into a helper
Date: Mon, 18 Sep 2023 16:10:54 +0300
Message-Id: <20230918131103.24119-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061937_398019_50B3B6A5 
X-CRM114-Status: GOOD (  10.57  )
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

QVNQTSBzZXJ2aWNlIGRyaXZlciBkb2VzIHRoZSBzYW1lIEwwUyAvIEwxUyAvIHN1YiBzdGF0ZXMg
YWxsb3dlZApjYWxjdWxhdGlvbiBpbiBfX3BjaV9kaXNhYmxlX2xpbmtfc3RhdGUoKSBhbmQKcGNp
X3NldF9kZWZhdWx0X2xpbmtfc3RhdGUoKS4KCkNyZWF0ZSBhIGhlbHBlciB0byBjYWxjdWxhdGUg
dGhlIG1hc2sgZm9yIHRoZSBhbGxvd2VkIHN0YXRlcy4KClNpZ25lZC1vZmYtYnk6IElscG8gSsOk
cnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL3BjaS9w
Y2llL2FzcG0uYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGNpL3BjaWUvYXNwbS5jIGIvZHJpdmVycy9wY2kvcGNpZS9hc3BtLmMKaW5kZXgg
ZWM2ZDdhMDkyYWMxLi45MWRjOTVhY2E5MGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL3BjaWUv
YXNwbS5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaWUvYXNwbS5jCkBAIC0xMDM0LDYgKzEwMzQsMjYg
QEAgc3RhdGljIHN0cnVjdCBwY2llX2xpbmtfc3RhdGUgKnBjaWVfYXNwbV9nZXRfbGluayhzdHJ1
Y3QgcGNpX2RldiAqcGRldikKIAlyZXR1cm4gYnJpZGdlLT5saW5rX3N0YXRlOwogfQogCitzdGF0
aWMgdTggcGNpX2xpbmtfc3RhdGVfbWFzayhpbnQgc3RhdGUpCit7CisJdTggcmVzdWx0ID0gMDsK
KworCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMFMpCisJCXJlc3VsdCB8PSBBU1BNX1NU
QVRFX0wwUzsKKwlpZiAoc3RhdGUgJiBQQ0lFX0xJTktfU1RBVEVfTDEpCisJCXJlc3VsdCB8PSBB
U1BNX1NUQVRFX0wxOworCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMV8xKQorCQlyZXN1
bHQgfD0gQVNQTV9TVEFURV9MMV8xOworCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMV8y
KQorCQlyZXN1bHQgfD0gQVNQTV9TVEFURV9MMV8yOworCWlmIChzdGF0ZSAmIFBDSUVfTElOS19T
VEFURV9MMV8xX1BDSVBNKQorCQlyZXN1bHQgfD0gQVNQTV9TVEFURV9MMV8xX1BDSVBNOworCWlm
IChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMV8yX1BDSVBNKQorCQlyZXN1bHQgfD0gQVNQTV9T
VEFURV9MMV8yX1BDSVBNOworCisJcmV0dXJuIHJlc3VsdDsKK30KKwogc3RhdGljIGludCBfX3Bj
aV9kaXNhYmxlX2xpbmtfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGludCBzdGF0ZSwgYm9v
bCBzZW0pCiB7CiAJc3RydWN0IHBjaWVfbGlua19zdGF0ZSAqbGluayA9IHBjaWVfYXNwbV9nZXRf
bGluayhwZGV2KTsKQEAgLTEwNjMsMTggKzEwODMsNyBAQCBzdGF0aWMgaW50IF9fcGNpX2Rpc2Fi
bGVfbGlua19zdGF0ZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgaW50IHN0YXRlLCBib29sIHNlbSkK
IAlpZiAoc2VtKQogCQlkb3duX3JlYWQoJnBjaV9idXNfc2VtKTsKIAltdXRleF9sb2NrKCZhc3Bt
X2xvY2spOwotCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMFMpCi0JCWxpbmstPmFzcG1f
ZGlzYWJsZSB8PSBBU1BNX1NUQVRFX0wwUzsKLQlpZiAoc3RhdGUgJiBQQ0lFX0xJTktfU1RBVEVf
TDEpCi0JCWxpbmstPmFzcG1fZGlzYWJsZSB8PSBBU1BNX1NUQVRFX0wxOwotCWlmIChzdGF0ZSAm
IFBDSUVfTElOS19TVEFURV9MMV8xKQotCQlsaW5rLT5hc3BtX2Rpc2FibGUgfD0gQVNQTV9TVEFU
RV9MMV8xOwotCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMV8yKQotCQlsaW5rLT5hc3Bt
X2Rpc2FibGUgfD0gQVNQTV9TVEFURV9MMV8yOwotCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFU
RV9MMV8xX1BDSVBNKQotCQlsaW5rLT5hc3BtX2Rpc2FibGUgfD0gQVNQTV9TVEFURV9MMV8xX1BD
SVBNOwotCWlmIChzdGF0ZSAmIFBDSUVfTElOS19TVEFURV9MMV8yX1BDSVBNKQotCQlsaW5rLT5h
c3BtX2Rpc2FibGUgfD0gQVNQTV9TVEFURV9MMV8yX1BDSVBNOworCWxpbmstPmFzcG1fZGlzYWJs
ZSB8PSBwY2lfbGlua19zdGF0ZV9tYXNrKHN0YXRlKTsKIAlwY2llX2NvbmZpZ19hc3BtX2xpbmso
bGluaywgcG9saWN5X3RvX2FzcG1fc3RhdGUobGluaykpOwogCiAJaWYgKHN0YXRlICYgUENJRV9M
SU5LX1NUQVRFX0NMS1BNKQotLSAKMi4zMC4yCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRo
MTJrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTJrCg==
