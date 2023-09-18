Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899EBCD13D8
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vO8B+3IACBiDa2WaWdxcwaDp36oRR7vsN6QxtFkcQ28=; b=REUqf/QedQoE9l
	9PrFgpPcde/ztsa/7+4IJtCPqQ3rbOYDFNo3WgBkD7BFGRFFB1v4b6ZRu65gyEoEq2gnH4PJbvtIO
	74YeujHwzcPI8fg5PSsftFowKKi7Hvn9dpPcwV3dd1/ZK6TWqpU4vni93JW3ywiMlOUa2bHYn/suI
	RuftMfqIYdH1kN7cxxpKCc7a74LKi00CSF9lFuHrvTUlTN+xqy/IGMwhOkGC+tOHR+aPWGzvqPmTh
	a/DwJWkk43HCmY5rHIIkodwFJYYEdqsvu0/Bs61X9F232NqZFkPifDUy+5v3upDVZE11PmXiGKjEY
	/VsFT7RktNMZfH/qk46Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBK-00FXpR-0x
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:20:54 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAt-00FXKv-1b;
	Mon, 18 Sep 2023 13:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043227; x=1726579227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TVpIxZltjnz+Zaq4u2l7j7EaR5dq+4x3KCuX5f2+zQ8=;
  b=ZL/mznTdcRVd3FUsv1YuHn9uT8KxjxFzPaK9Khv9HC8GzabU+q9GPD68
   jUcN5bpi0ju4a42prMvjP4tdRVoaEXJwzdwcJkxI5v5vWP5E2usqieY7t
   3S1DhZDsrAbUSP8lVxm5xpPCDZbBJS0n7Rs1r6pkDI6am8wFanUg2otgr
   oy7JhCqPvazjM0BOYjUgjlJFnadcxFYSbebfPgJISlFHBmgMLqeuhH9YG
   dIGsmz3g3NhBEllDWR1xVTD9vlRwVSkScuAE8eacDRMGJWOMMnrAi5cWv
   IYwG/RtmFZ9ecq/vk26ujkd+A4eZN1Q3L+2u0UuJQumQCMpmfPzS18LPr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113533"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342781"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342781"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:17 -0700
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
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 10/13] wifi: ath11k: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:11:00 +0300
Message-Id: <20230918131103.24119-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062027_594548_F388AA1F 
X-CRM114-Status: UNSURE (   9.76  )
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

YXRoMTFrIGRyaXZlciBhZGp1c3RzIEFTUE0gc3RhdGUgaXRzZWxmIHdoaWNoIGxlYXZlcyBBU1BN
IHNlcnZpY2UKZHJpdmVyIGluIFBDSSBjb3JlIHVuYXdhcmUgb2YgdGhlIGxpbmsgc3RhdGUgY2hh
bmdlcyB0aGUgZHJpdmVyCmltcGxlbWVudGVkLgoKQ2FsbCBwY2lfZGlzYWJsZV9saW5rX3N0YXRl
KCkgYW5kIHBjaV9lbmFibGVfbGlua19zdGF0ZSgpIGluc3RlYWQgb2YKYWRqdXN0aW5nIEFTUE1D
IGZpZWxkIGluIExOS0NUTCBkaXJlY3RseSBpbiB0aGUgZHJpdmVyIGFuZCBsZXQgUENJIGNvcmUK
aGFuZGxlIHRoZSBBU1BNIHN0YXRlIG1hbmFnZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBJbHBvIErD
pHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyB8IDEwICsrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMWsvcGNpLmMKaW5kZXggYTVhYTE4NTdlYzE0Li43NjRjZGY3NGIwZTkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYwpAQCAtNTgyLDE5ICs1ODIsMTUgQEAgc3RhdGljIHZv
aWQgYXRoMTFrX3BjaV9hc3BtX2Rpc2FibGUoc3RydWN0IGF0aDExa19wY2kgKmFiX3BjaSkKIAkJ
ICAgdTE2X2dldF9iaXRzKGFiX3BjaS0+bGlua19jdGwsIFBDSV9FWFBfTE5LQ1RMX0FTUE1fTDEp
KTsKIAogCS8qIGRpc2FibGUgTDBzIGFuZCBMMSAqLwotCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93
b3JkKGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJICAgUENJX0VYUF9MTktDVExf
QVNQTUMpOwotCisJcGNpX2Rpc2FibGVfbGlua19zdGF0ZShhYl9wY2ktPnBkZXYsIFBDSUVfTElO
S19TVEFURV9MMFMgfCBQQ0lFX0xJTktfU1RBVEVfTDEpOwogCXNldF9iaXQoQVRIMTFLX1BDSV9B
U1BNX1JFU1RPUkUsICZhYl9wY2ktPmZsYWdzKTsKIH0KIAogc3RhdGljIHZvaWQgYXRoMTFrX3Bj
aV9hc3BtX3Jlc3RvcmUoc3RydWN0IGF0aDExa19wY2kgKmFiX3BjaSkKIHsKIAlpZiAodGVzdF9h
bmRfY2xlYXJfYml0KEFUSDExS19QQ0lfQVNQTV9SRVNUT1JFLCAmYWJfcGNpLT5mbGFncykpCi0J
CXBjaWVfY2FwYWJpbGl0eV9jbGVhcl9hbmRfc2V0X3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQ
X0xOS0NUTCwKLQkJCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAotCQkJCQkJICAgYWJfcGNp
LT5saW5rX2N0bCAmCi0JCQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CisJCXBjaV9lbmFi
bGVfbGlua19zdGF0ZShhYl9wY2ktPnBkZXYsIGFiX3BjaS0+bGlua19jdGwgJgorCQkJCSAgICAg
IChQQ0lFX0xJTktfU1RBVEVfTDBTIHwgUENJRV9MSU5LX1NUQVRFX0wxKSk7CiB9CiAKIHN0YXRp
YyBpbnQgYXRoMTFrX3BjaV9wb3dlcl91cChzdHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiKQotLSAKMi4z
MC4yCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
