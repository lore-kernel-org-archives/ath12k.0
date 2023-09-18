Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E23DC46CA1
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgNHJdLl5INDB/Q4SP8+n0VzZV2Te/641Fw4U7xNUEE=; b=jbJOW03DfpXwJQ
	PCSPlpuaHqToirrPvQ86kvJL2LCu3xum2K+nwTQvK3sacmY5MYmqcfTOXpGp2aeXSIdTx8OTtIy9F
	U85uWsEfwsG9x2PYzYUENiPdRgec4Zmkua2MyD2Sj8h8ThFTLVDXwfwMmjFHOy1tsR13Redw90js2
	kEJU0tzCVXe6nS3wfzs5HaXCPKLtegCaFti7XdTdyd3Pqaasc8zjpQs2EQhRXisjHtuiig8A12XkA
	ze04QQGq9lLXw4vaUZwRwCaSwPp+9cwn8mNrRsp/GViEP4Eecl6PvoPXhXr1SkTUyxmY1E+1tnixV
	k8aNgu+VgFw84hhUKWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBI-00FXnU-2E
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:20:52 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAt-00FXGW-0a;
	Mon, 18 Sep 2023 13:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043227; x=1726579227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1z4zU2kddqvhSnJhYzQ+kzmt/kJVDZXOqL2l9VfDNaA=;
  b=XNh5/HiSwyY0Q9XLS4f0+8qqLKhdTr52XorXeLcCpSK/0zsphLfEBqs9
   k4XkuG6hvKIs3d5SsSg7iLlBUXAwEtUx96JmWGSNCkeUltYTs/HL8ECNI
   lVuWPubxKAwtyhMZC11jHE56GGW7mHgIdbSYKwG7gjBXYuunmnmCeQVfJ
   FFcbQLhzSbD/ZscIxZTRSSO1Bvh/OVNayzKfWjE5vWx4nTvxA7uCma0Q+
   Sam2ZqHhEzDSvdWZZzWw+ngyjnh2FkQ6kb1rnD65BGhLm8fyaVfCEe9P4
   EZyom4IKQ9CVw+3tfKNZ3xvlYtO3Mj9b3EqSQXXdnbdyzOQou7zWp4W+o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113506"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113506"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342626"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342626"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:01 -0700
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
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 09/13] wifi: ath10k: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:10:59 +0300
Message-Id: <20230918131103.24119-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062027_415375_FA00640D 
X-CRM114-Status: GOOD (  10.45  )
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

YXRoMTBrIGRyaXZlciBhZGp1c3RzIEFTUE0gc3RhdGUgaXRzZWxmIHdoaWNoIGxlYXZlcyBBU1BN
IHNlcnZpY2UKZHJpdmVyIGluIFBDSSBjb3JlIHVuYXdhcmUgb2YgdGhlIGxpbmsgc3RhdGUgY2hh
bmdlcyB0aGUgZHJpdmVyCmltcGxlbWVudGVkLgoKQ2FsbCBwY2lfZGlzYWJsZV9saW5rX3N0YXRl
KCkgYW5kIHBjaV9lbmFibGVfbGlua19zdGF0ZSgpIGluc3RlYWQgb2YKYWRqdXN0aW5nIEFTUE1D
IGZpZWxkIGluIExOS0NUTCBkaXJlY3RseSBpbiB0aGUgZHJpdmVyIGFuZCBsZXQgUENJIGNvcmUK
aGFuZGxlIHRoZSBBU1BNIHN0YXRlIG1hbmFnZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBJbHBvIErD
pHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvcGNpLmMKaW5kZXggMjNmMzY2MjIxOTM5Li42NGY3MTMzY2UxMjIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9wY2kuYwpAQCAtMTk2Myw5ICsxOTYzLDggQEAgc3RhdGljIGludCBh
dGgxMGtfcGNpX2hpZl9zdGFydChzdHJ1Y3QgYXRoMTBrICphcikKIAlhdGgxMGtfcGNpX2lycV9l
bmFibGUoYXIpOwogCWF0aDEwa19wY2lfcnhfcG9zdChhcik7CiAKLQlwY2llX2NhcGFiaWxpdHlf
Y2xlYXJfYW5kX3NldF93b3JkKGFyX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJCSAg
IFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAotCQkJCQkgICBhcl9wY2ktPmxpbmtfY3RsICYgUENJX0VY
UF9MTktDVExfQVNQTUMpOworCXBjaV9lbmFibGVfbGlua19zdGF0ZShhcl9wY2ktPnBkZXYsIGFy
X3BjaS0+bGlua19jdGwgJgorCQkJICAgICAgKFBDSUVfTElOS19TVEFURV9MMFMgfCBQQ0lFX0xJ
TktfU1RBVEVfTDEpKTsKIAogCXJldHVybiAwOwogfQpAQCAtMjgyMiw4ICsyODIxLDcgQEAgc3Rh
dGljIGludCBhdGgxMGtfcGNpX2hpZl9wb3dlcl91cChzdHJ1Y3QgYXRoMTBrICphciwKIAogCXBj
aWVfY2FwYWJpbGl0eV9yZWFkX3dvcmQoYXJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKIAkJ
CQkgICZhcl9wY2ktPmxpbmtfY3RsKTsKLQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfd29yZChhcl9w
Y2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DKTsK
KwlwY2lfZGlzYWJsZV9saW5rX3N0YXRlKGFyX3BjaS0+cGRldiwgUENJRV9MSU5LX1NUQVRFX0ww
UyB8IFBDSUVfTElOS19TVEFURV9MMSk7CiAKIAkvKgogCSAqIEJyaW5nIHRoZSB0YXJnZXQgdXAg
Y2xlYW5seS4KLS0gCjIuMzAuMgoKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEyawo=
