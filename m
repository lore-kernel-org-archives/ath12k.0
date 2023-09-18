Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC47C46CA1
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQBSGpH+rv7tN7180B5lM2K1Z7E1jgFGSQKbAGStOck=; b=ogFOVlvelpnuMc
	kEbbSQPn1cjNR0Qd1hPr+fRccP5IXtoNGELhqJ1N5yG0VEKHlPk2djS17jzHDQbG0Wf8SY8zoAdcu
	ta5MAE408MQbIRWnVVC7FDClhs6x4DbHuAbXmNzd+b1YAFjrIeuMK/GpTbjYFmMCxAe23/nwHifep
	XVLthZVNovKQEAo5wmn3Mu7cnZPKTxzg0iwsn8/OXN9jhzxb1J90CG6dpIDpA1uuPVa/HpDMFrRia
	PjE625CwnxKO0VCske7p6kO1ViNUoa6r3jE9esrF1+Ft6x98Eaep4535JUcjlauWoQnvwtCXSRqM7
	/nRDPKFSggMeLv1LOzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEC0-00FYU3-1B
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:21:36 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBV-00FXun-17;
	Mon, 18 Sep 2023 13:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043265; x=1726579265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/jlflr+zDO/ybJEIj9ZeNbSBAg1LjrmA0JjnTT6qqL0=;
  b=JiwmXCqEQKdRA7Wz6HgGe3pNrxIADPe4FBx5dhiDbhqLquwu6TGs7Buu
   G177jpP9tybJlO7jGwf8RXsGQmbq6QSBXJHNulidr4DzZGq+ilQFQf8Yn
   QO6Zz9qZ1LtK6u8vnu4tXWgdJm2TmBDVIoSXB9tryQu3MZ5r5YIJauyx6
   ZC7Wg+fdzhq3I1GK3yYk5oNFF1l7Qk51/GlBDYPTne2uSJIxxN3w0S36+
   LKtIK+5Hvn/csxfAfObFayq6mi05PjoNnRbjy9sp89r9+ZBhUY1HXy1Pl
   IZk53AJhM7XttkZKIRFMKK47BaXtWjn0nu5sd6BqP2AfHLKQ94Y6ZGfNc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113648"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113648"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811343218"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811343218"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:54 -0700
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
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Subject: [PATCH v2 13/13] misc: rtsx: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:11:03 +0300
Message-Id: <20230918131103.24119-14-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062105_449323_98E2F257 
X-CRM114-Status: GOOD (  10.98  )
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

cnRzeCBkcml2ZXIgYWRqdXN0cyBBU1BNIHN0YXRlIGl0c2VsZiB3aGljaCBsZWF2ZXMgQVNQTSBz
ZXJ2aWNlCmRyaXZlciBpbiBQQ0kgY29yZSB1bmF3YXJlIG9mIHRoZSBsaW5rIHN0YXRlIGNoYW5n
ZXMgdGhlIGRyaXZlcgppbXBsZW1lbnRlZC4KCkNhbGwgcGNpX2Rpc2FibGVfbGlua19zdGF0ZSgp
IGFuZCBwY2lfZW5hYmxlX2xpbmtfc3RhdGUoKSBpbnN0ZWFkIG9mCmFkanVzdGluZyBBU1BNQyBm
aWVsZCBpbiBMTktDVEwgZGlyZWN0bHkgaW4gdGhlIGRyaXZlciBhbmQgbGV0IFBDSSBjb3JlCmhh
bmRsZSB0aGUgQVNQTSBzdGF0ZSBtYW5hZ2VtZW50LgoKU2lnbmVkLW9mZi1ieTogSWxwbyBKw6Ry
dmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvbWlzYy9j
YXJkcmVhZGVyL3J0czUyMjguYyAgfCA2ICsrLS0tLQogZHJpdmVycy9taXNjL2NhcmRyZWFkZXIv
cnRzNTI2MS5jICB8IDYgKystLS0tCiBkcml2ZXJzL21pc2MvY2FyZHJlYWRlci9ydHN4X3Bjci5j
IHwgOCArKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9jYXJkcmVhZGVyL3J0czUyMjguYyBi
L2RyaXZlcnMvbWlzYy9jYXJkcmVhZGVyL3J0czUyMjguYwppbmRleCBmNGFiMDk0MzlkYTcuLjhk
MzIxNmM2NGFkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9taXNjL2NhcmRyZWFkZXIvcnRzNTIyOC5j
CisrKyBiL2RyaXZlcnMvbWlzYy9jYXJkcmVhZGVyL3J0czUyMjguYwpAQCAtNDk3LDggKzQ5Nyw3
IEBAIHN0YXRpYyB2b2lkIHJ0czUyMjhfZW5hYmxlX2FzcG0oc3RydWN0IHJ0c3hfcGNyICpwY3Is
IGJvb2wgZW5hYmxlKQogCXZhbCA9IEZPUkNFX0FTUE1fQ1RMMCB8IEZPUkNFX0FTUE1fQ1RMMTsK
IAl2YWwgfD0gKHBjci0+YXNwbV9lbiAmIDB4MDIpOwogCXJ0c3hfcGNpX3dyaXRlX3JlZ2lzdGVy
KHBjciwgQVNQTV9GT1JDRV9DVEwsIG1hc2ssIHZhbCk7Ci0JcGNpZV9jYXBhYmlsaXR5X2NsZWFy
X2FuZF9zZXRfd29yZChwY3ItPnBjaSwgUENJX0VYUF9MTktDVEwsCi0JCQkJCSAgIFBDSV9FWFBf
TE5LQ1RMX0FTUE1DLCBwY3ItPmFzcG1fZW4pOworCXBjaV9lbmFibGVfbGlua19zdGF0ZShwY3It
PnBjaSwgcGNyLT5hc3BtX2VuKTsKIAlwY3ItPmFzcG1fZW5hYmxlZCA9IGVuYWJsZTsKIH0KIApA
QCAtNTA5LDggKzUwOCw3IEBAIHN0YXRpYyB2b2lkIHJ0czUyMjhfZGlzYWJsZV9hc3BtKHN0cnVj
dCBydHN4X3BjciAqcGNyLCBib29sIGVuYWJsZSkKIAlpZiAocGNyLT5hc3BtX2VuYWJsZWQgPT0g
ZW5hYmxlKQogCQlyZXR1cm47CiAKLQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3Jk
KHBjci0+cGNpLCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkJICAgUENJX0VYUF9MTktDVExfQVNQTUMs
IDApOworCXBjaV9kaXNhYmxlX2xpbmtfc3RhdGUocGNyLT5wY2ksIFBDSUVfTElOS19TVEFURV9M
MFMgfCBQQ0lFX0xJTktfU1RBVEVfTDEpOwogCW1hc2sgPSBGT1JDRV9BU1BNX1ZBTF9NQVNLIHwg
Rk9SQ0VfQVNQTV9DVEwwIHwgRk9SQ0VfQVNQTV9DVEwxOwogCXZhbCA9IEZPUkNFX0FTUE1fQ1RM
MCB8IEZPUkNFX0FTUE1fQ1RMMTsKIAlydHN4X3BjaV93cml0ZV9yZWdpc3RlcihwY3IsIEFTUE1f
Rk9SQ0VfQ1RMLCBtYXNrLCB2YWwpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL2NhcmRyZWFk
ZXIvcnRzNTI2MS5jIGIvZHJpdmVycy9taXNjL2NhcmRyZWFkZXIvcnRzNTI2MS5jCmluZGV4IDk0
YWY2YmY4YTI1YS4uZjFlZjE1NjgzYTJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL21pc2MvY2FyZHJl
YWRlci9ydHM1MjYxLmMKKysrIGIvZHJpdmVycy9taXNjL2NhcmRyZWFkZXIvcnRzNTI2MS5jCkBA
IC01NzgsOCArNTc4LDcgQEAgc3RhdGljIHZvaWQgcnRzNTI2MV9lbmFibGVfYXNwbShzdHJ1Y3Qg
cnRzeF9wY3IgKnBjciwgYm9vbCBlbmFibGUpCiAKIAl2YWwgfD0gKHBjci0+YXNwbV9lbiAmIDB4
MDIpOwogCXJ0c3hfcGNpX3dyaXRlX3JlZ2lzdGVyKHBjciwgQVNQTV9GT1JDRV9DVEwsIG1hc2ss
IHZhbCk7Ci0JcGNpZV9jYXBhYmlsaXR5X2NsZWFyX2FuZF9zZXRfd29yZChwY3ItPnBjaSwgUENJ
X0VYUF9MTktDVEwsCi0JCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLCBwY3ItPmFzcG1fZW4p
OworCXBjaV9lbmFibGVfbGlua19zdGF0ZShwY3ItPnBjaSwgcGNyLT5hc3BtX2VuKTsKIAlwY3It
PmFzcG1fZW5hYmxlZCA9IGVuYWJsZTsKIH0KIApAQCAtNTkxLDggKzU5MCw3IEBAIHN0YXRpYyB2
b2lkIHJ0czUyNjFfZGlzYWJsZV9hc3BtKHN0cnVjdCBydHN4X3BjciAqcGNyLCBib29sIGVuYWJs
ZSkKIAlpZiAocGNyLT5hc3BtX2VuYWJsZWQgPT0gZW5hYmxlKQogCQlyZXR1cm47CiAKLQlwY2ll
X2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3JkKHBjci0+cGNpLCBQQ0lfRVhQX0xOS0NUTCwK
LQkJCQkJICAgUENJX0VYUF9MTktDVExfQVNQTUMsIDApOworCXBjaV9kaXNhYmxlX2xpbmtfc3Rh
dGUocGNyLT5wY2ksIFBDSUVfTElOS19TVEFURV9MMFMgfCBQQ0lFX0xJTktfU1RBVEVfTDEpOwog
CXJ0c3hfcGNpX3dyaXRlX3JlZ2lzdGVyKHBjciwgQVNQTV9GT1JDRV9DVEwsIG1hc2ssIHZhbCk7
CiAJcnRzeF9wY2lfd3JpdGVfcmVnaXN0ZXIocGNyLCBTRF9DRkcxLCBTRF9BU1lOQ19GSUZPX05P
VF9SU1QsIDApOwogCXVkZWxheSgxMCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvY2FyZHJl
YWRlci9ydHN4X3Bjci5jIGIvZHJpdmVycy9taXNjL2NhcmRyZWFkZXIvcnRzeF9wY3IuYwppbmRl
eCBhM2Y0YjUyYmIxNTkuLjZlZmI3OTIxNTJmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9taXNjL2Nh
cmRyZWFkZXIvcnRzeF9wY3IuYworKysgYi9kcml2ZXJzL21pc2MvY2FyZHJlYWRlci9ydHN4X3Bj
ci5jCkBAIC04Niw5ICs4NiwxMSBAQCBzdGF0aWMgdm9pZCBydHN4X2NvbW1fc2V0X2FzcG0oc3Ry
dWN0IHJ0c3hfcGNyICpwY3IsIGJvb2wgZW5hYmxlKQogCQlyZXR1cm47CiAKIAlpZiAocGNyLT5h
c3BtX21vZGUgPT0gQVNQTV9NT0RFX0NGRykgewotCQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5k
X3NldF93b3JkKHBjci0+cGNpLCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkJCVBDSV9FWFBfTE5LQ1RM
X0FTUE1DLAotCQkJCQkJZW5hYmxlID8gcGNyLT5hc3BtX2VuIDogMCk7CisJCWlmIChlbmFibGUp
CisJCQlwY2lfZW5hYmxlX2xpbmtfc3RhdGUocGNyLT5wY2ksIHBjci0+YXNwbV9lbik7CisJCWVs
c2UKKwkJCXBjaV9kaXNhYmxlX2xpbmtfc3RhdGUocGNyLT5wY2ksIFBDSUVfTElOS19TVEFURV9M
MFMgfAorCQkJCQkJCSBQQ0lFX0xJTktfU1RBVEVfTDEpOwogCX0gZWxzZSBpZiAocGNyLT5hc3Bt
X21vZGUgPT0gQVNQTV9NT0RFX1JFRykgewogCQlpZiAocGNyLT5hc3BtX2VuICYgMHgwMikKIAkJ
CXJ0c3hfcGNpX3dyaXRlX3JlZ2lzdGVyKHBjciwgQVNQTV9GT1JDRV9DVEwsIEZPUkNFX0FTUE1f
Q1RMMCB8Ci0tIAoyLjMwLjIKCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMmsK
