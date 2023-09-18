Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0934CC46CA1
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwvnQh7VFqHLCifCLU4nZxqt+/PvIoCfwkePC4/5/9k=; b=Eu93XrX33n7ZBG
	uds+oIzXHTOMVDGjGvYttuvhOLnT6HLYUOx6sBPFltx6lFaI/iwPOFOyTyZ8ypH5pYs9YVjVezFQk
	kKeXwS8jC9VZ7VAgoW8U/82IglPX4tcpWcLb2C9dk2xfaCCWjCj9EbWqnS9nVKsuXr/x6IB9lmbRW
	GYqr8z9JUZO9ufURDDmlSkaEeEBYX3dqAM8cFShRQH9UMfuXJpyUmXxo0FbpwlgeRzIL3ZuZxzOcC
	erI2M++tKjciZDhgIFb9UTqhn0PTef8yybifbcspSwv+tg3T6wUPFshM2Za24KZhipeUSNz4rROQ5
	1xH2sdOw0kS3JEuAXoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAv-00FXPl-1V
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:20:29 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAl-00FXGW-31;
	Mon, 18 Sep 2023 13:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043219; x=1726579219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fG2lEBkT7mIaWcABDtYlaKTuVQodmkE/Rpx2qX2kUFA=;
  b=aK86d0A3YnVdChzVFZOg08jb7R0DQrmixnYJymxjWfTiOUovbeLVZtyj
   vyekFHUzwltYI5uHOAD1g+GgysBGDddnJ3kyAqGEDGbYUKN97rwuJkOgi
   g98S1PvsTFrbaF1MDjRULwLoVgiOfsGfqNdha3idymU5O3rVI3AgQ0Kel
   yUQPOaVcFrNTpop1uv359pjyAfY9yMcJGdO5ZbDdzct9FE2eCZUDinFJN
   q2bZWWzFlcYpCmjXFtnNLhAeq16sJpd1PwRoQv+Qi1Gf94kf9iFgc8Rqa
   xbCB0nke3qoWkZU1wThhJ3QYVHLFERSHeMF6DpHZuVLHbImGa0SK0NcAg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113440"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113440"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342282"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342282"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:38 -0700
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
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 06/13] Bluetooth: hci_bcm4377: Convert aspm disable to quirk
Date: Mon, 18 Sep 2023 16:10:56 +0300
Message-Id: <20230918131103.24119-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062020_021040_F5C7A4B4 
X-CRM114-Status: GOOD (  14.76  )
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

cGNpX2Rpc2FibGVfbGlua19zdGF0ZSgpIHdhcyBtYWRlIHJlbGlhYmxlIHJlZ2FyZGxlc3Mgb2Yg
QVNQTSBDT05GSUcKYW5kIE9TIGJlaW5nIGRpc2FsbG93ZWQgdG8gY2hhbmdlIEFTUE0gc3RhdGVz
IHRvIGFsbG93IGRyaXZlcnMgdG8gcmVseQpvbiBwY2lfZGlzYWJsZV9saW5rX3N0YXRlKCkgd29y
a2luZy4KClJlbW92ZSBkcml2ZXIgd29ya2luZyBhcm91bmQgdW5yZWxpYWJsZSBwY2lfZGlzYWJs
ZV9saW5rX3N0YXRlKCkgZnJvbQpoY2lfYmNtNDM3NyBkcml2ZXIgYW5kIGFkZCBhIFBDSSBxdWly
ayB0byBkaXNhYmxlIEFTUE0uCgpTaWduZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5q
YXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ibHVldG9vdGgvaGNpX2JjbTQz
NzcuYyB8IDIwIC0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3BjaS9xdWlya3MuYyAgICAg
ICAgICAgIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjAgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibHVldG9vdGgvaGNpX2JjbTQzNzcuYyBi
L2RyaXZlcnMvYmx1ZXRvb3RoL2hjaV9iY200Mzc3LmMKaW5kZXggMTlhZDBlNzg4NjQ2Li4yMzQ4
ZWUyMzgwZGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmx1ZXRvb3RoL2hjaV9iY200Mzc3LmMKKysr
IGIvZHJpdmVycy9ibHVldG9vdGgvaGNpX2JjbTQzNzcuYwpAQCAtNDkwLDcgKzQ5MCw2IEBAIHN0
cnVjdCBiY200Mzc3X2RhdGE7CiAgKiBjbGVhcl9wY2llY2ZnX3N1YnN5c3RlbV9jdHJsX2JpdDE5
OiBTZXQgdG8gdHJ1ZSBpZiBiaXQgMTkgaW4gdGhlCiAgKiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2ZW5kb3Itc3BlY2lmaWMgc3Vic3lzdGVtIGNvbnRyb2wKICAqICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyIGhhcyB0byBiZSBjbGVhcmVk
Ci0gKiBkaXNhYmxlX2FzcG06IFNldCB0byB0cnVlIGlmIEFTUE0gbXVzdCBiZSBkaXNhYmxlZCBk
dWUgdG8gaGFyZHdhcmUgZXJyYXRhCiAgKiBicm9rZW5fZXh0X3NjYW46IFNldCB0byB0cnVlIGlm
IHRoZSBjaGlwIGVycm9uZW91c2x5IGNsYWltcyB0byBzdXBwb3J0CiAgKiAgICAgICAgICAgICAg
ICAgIGV4dGVuZGVkIHNjYW5uaW5nCiAgKiBicm9rZW5fbXdzX3RyYW5zcG9ydF9jb25maWc6IFNl
dCB0byB0cnVlIGlmIHRoZSBjaGlwIGVycm9uZW91c2x5IGNsYWltcyB0bwpAQCAtNTA5LDcgKzUw
OCw2IEBAIHN0cnVjdCBiY200Mzc3X2h3IHsKIAogCXVuc2lnbmVkIGxvbmcgaGFzX2JhcjBfY29y
ZTJfd2luZG93MiA6IDE7CiAJdW5zaWduZWQgbG9uZyBjbGVhcl9wY2llY2ZnX3N1YnN5c3RlbV9j
dHJsX2JpdDE5IDogMTsKLQl1bnNpZ25lZCBsb25nIGRpc2FibGVfYXNwbSA6IDE7CiAJdW5zaWdu
ZWQgbG9uZyBicm9rZW5fZXh0X3NjYW4gOiAxOwogCXVuc2lnbmVkIGxvbmcgYnJva2VuX213c190
cmFuc3BvcnRfY29uZmlnIDogMTsKIApAQCAtMjIyMiwyMCArMjIyMCw2IEBAIHN0YXRpYyBpbnQg
YmNtNDM3N19wcm9iZV9vZihzdHJ1Y3QgYmNtNDM3N19kYXRhICpiY200Mzc3KQogCXJldHVybiAw
OwogfQogCi1zdGF0aWMgdm9pZCBiY200Mzc3X2Rpc2FibGVfYXNwbShzdHJ1Y3QgYmNtNDM3N19k
YXRhICpiY200Mzc3KQotewotCXBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoYmNtNDM3Ny0+cGRldiwK
LQkJCSAgICAgICBQQ0lFX0xJTktfU1RBVEVfTDBTIHwgUENJRV9MSU5LX1NUQVRFX0wxKTsKLQot
CS8qCi0JICogcGNpX2Rpc2FibGVfbGlua19zdGF0ZSBjYW4gZmFpbCBpZiBlaXRoZXIgQ09ORklH
X1BDSUVBU1BNIGlzIGRpc2FibGVkCi0JICogb3IgaWYgdGhlIEJJT1MgaGFzbid0IGhhbmRlZCBv
dmVyIGNvbnRyb2wgdG8gdXMuIFdlIG11c3QgKmFsd2F5cyoKLQkgKiBkaXNhYmxlIEFTUE0gZm9y
IHRoaXMgZGV2aWNlIGR1ZSB0byBoYXJkd2FyZSBlcnJhdGEgdGhvdWdoLgotCSAqLwotCXBjaWVf
Y2FwYWJpbGl0eV9jbGVhcl93b3JkKGJjbTQzNzctPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJ
CSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DKTsKLX0KLQogc3RhdGljIHZvaWQgYmNtNDM3N19wY2lf
ZnJlZV9pcnFfdmVjdG9ycyh2b2lkICpkYXRhKQogewogCXBjaV9mcmVlX2lycV92ZWN0b3JzKGRh
dGEpOwpAQCAtMjI4OCw5ICsyMjcyLDYgQEAgc3RhdGljIGludCBiY200Mzc3X3Byb2JlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJCXJldHVy
biAtRU5PREVWOwogCX0KIAotCWlmIChiY200Mzc3LT5ody0+ZGlzYWJsZV9hc3BtKQotCQliY200
Mzc3X2Rpc2FibGVfYXNwbShiY200Mzc3KTsKLQogCXJldCA9IHBjaV9yZXNldF9mdW5jdGlvbl9s
b2NrZWQocGRldik7CiAJaWYgKHJldCkKIAkJZGV2X3dhcm4oCkBAIC0yNDQ4LDcgKzI0MjksNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGJjbTQzNzdfaHcgYmNtNDM3N19od192YXJpYW50c1tdID0g
ewogCQkub3RwX29mZnNldCA9IDB4NDEyMCwKIAkJLmJhcjBfd2luZG93MSA9IDB4MTgwMGIwMDAs
CiAJCS5iYXIwX3dpbmRvdzIgPSAweDE4MTBjMDAwLAotCQkuZGlzYWJsZV9hc3BtID0gdHJ1ZSwK
IAkJLmJyb2tlbl9leHRfc2NhbiA9IHRydWUsCiAJCS5zZW5kX3B0YiA9IGJjbTQzNzdfc2VuZF9w
dGIsCiAJfSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3F1aXJrcy5jIGIvZHJpdmVycy9wY2kv
cXVpcmtzLmMKaW5kZXggZWVlYzFkNmY5MDIzLi5kNmFiMGU5ODAxM2YgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcGNpL3F1aXJrcy5jCisrKyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCkBAIC0yNTAyLDYg
KzI1MDIsOSBAQCBzdGF0aWMgdm9pZCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKHN0cnVjdCBw
Y2lfZGV2ICpkZXYpCiAgKi8KIERFQ0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBDSV9WRU5ET1JfSURf
QVNNRURJQSwgMHgxMDgwLCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKTsKIAorLyogQkNNNDM3
NyBtdXN0IGFsd2F5cyBkaXNhYmxlIEFTUE0gZHVlIHRvIGhhcmR3YXJlIGVycmF0YS4gKi8KK0RF
Q0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBDSV9WRU5ET1JfSURfQlJPQURDT00sIDB4NWZhMCwgcXVp
cmtfZGlzYWJsZV9hc3BtX2wwc19sMSk7CisKIC8qCiAgKiBTb21lIFBlcmljb20gUENJZS10by1Q
Q0kgYnJpZGdlcyBpbiByZXZlcnNlIG1vZGUgbmVlZCB0aGUgUENJZSBSZXRyYWluCiAgKiBMaW5r
IGJpdCBjbGVhcmVkIGFmdGVyIHN0YXJ0aW5nIHRoZSBsaW5rIHJldHJhaW4gcHJvY2VzcyB0byBh
bGxvdyB0aGlzCi0tIAoyLjMwLjIKCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMmsK
