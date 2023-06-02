Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8385C7EE29
	for <ath12k@archiver.kernel.org>; Fri,  2 Jun 2023 11:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oD2jVoXI3B9T2t+pgxWghIVq0vEEdJ2sP1IIk211+48=; b=39XWDk8pRWAtYU
	J7kj3WEzgU0EHm2vJdOz/e9H4B0ezHu197k45f06mgffug4MxijmygIGHGKlTBeV5J1FNRkr4Zh+i
	3hdaxXrL3/4OsNVILaPYXl3JN1kTS2rsUmXNfV9RnH6d28ijjWFv8gHzlDw/G9+A6f4ZgzD5D/cLr
	UNtd6XFPk9Ic7oAJzlHj2bg2hrYFLRxesXZvBpzjmzvGxOYERoQD54JRjc19mAFj4sTOD2MC4dr6/
	NMYn3jFiQ1RT4tvHvSEVm6smPO+R5A6p0Ytr1pkyg69ssbW+Ttk6GkJe48Edsp0fwBKM+nGuH/olA
	hyq43gd6aAmGEKrj2/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q53HN-006nmh-17
	for ath12k@archiver.kernel.org;
	Fri, 02 Jun 2023 11:49:13 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q53HK-006ng4-0J
	for ath12k@lists.infradead.org;
	Fri, 02 Jun 2023 11:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685706550; x=1717242550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aQjPDwWRzWzs+gV1YQG6XJoskPW79jaEO1/n4+Mecro=;
  b=a5qjhdF/cyI9ggpNDlHSX+tRwKoZe1yKKt/KyNOqn0CG/loH05RWuy3C
   nGlcGjpql/f9j28FFFpJb+XIi0nJZDLLkyYQO/OzrWgCA5qrnblwTr9/i
   eKHnQ6hIvI4rkVNOMNZJgepOHTTDIigUoOYcKd1MCiX/HXTjvH5gVlB8v
   aiO7pdNxxYMr8JAwK/UJ7OIDmYi02e8jDnbG9gYV3U8EcBQddZX0tuxrR
   RvnT0mGxhv/+tyqP0mEyZDPfn3ij+TLgf+PQ/EXlFAP3k/lm+vwHWB0fx
   nOlb4RCXVKlk5USXJXR4j9oSgAYeFwleIbV0afhKCr2+EV4JlbFM81t3M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358279780"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="358279780"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707819546"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="707819546"
Received: from rspatil-mobl3.gar.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.208.112])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:49:03 -0700
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
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 11/13] wifi: ath12k: Use pci_disable/enable_link_state()
Date: Fri,  2 Jun 2023 14:47:48 +0300
Message-Id: <20230602114751.19671-12-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
References: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_044910_202708_4F41EDF7 
X-CRM114-Status: GOOD (  11.26  )
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

YXRoMTJrIGRyaXZlciBhZGp1c3RzIEFTUE0gc3RhdGUgaXRzZWxmIHdoaWNoIGxlYXZlcyBBU1BN
IHNlcnZpY2UKZHJpdmVyIGluIFBDSSBjb3JlIHVuYXdhcmUgb2YgdGhlIGxpbmsgc3RhdGUgY2hh
bmdlcyB0aGUgZHJpdmVyCmltcGxlbWVudGVkLgoKQ2FsbCBwY2lfZGlzYWJsZV9saW5rX3N0YXRl
KCkgYW5kIHBjaV9lbmFibGVfbGlua19zdGF0ZSgpIGluc3RlYWQgb2YKYWRqdXN0aW5nIEFTUE1D
IGZpZWxkIGluIExOS0NUTCBkaXJlY3RseSBpbiB0aGUgZHJpdmVyIGFuZCBsZXQgUENJIGNvcmUK
aGFuZGxlIHRoZSBBU1BNIHN0YXRlIG1hbmFnZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBJbHBvIErD
pHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEyay9wY2kuYyB8IDEwICsrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMmsvcGNpLmMKaW5kZXggZTFlNDVlYjUwZjNlLi5jMDcyMDI2ZDY2OTkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMmsvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEyay9wY2kuYwpAQCAtNzk0LDE5ICs3OTQsMTUgQEAgc3RhdGljIHZv
aWQgYXRoMTJrX3BjaV9hc3BtX2Rpc2FibGUoc3RydWN0IGF0aDEya19wY2kgKmFiX3BjaSkKIAkJ
ICAgdTE2X2dldF9iaXRzKGFiX3BjaS0+bGlua19jdGwsIFBDSV9FWFBfTE5LQ1RMX0FTUE1fTDEp
KTsKIAogCS8qIGRpc2FibGUgTDBzIGFuZCBMMSAqLwotCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93
b3JkKGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJICAgUENJX0VYUF9MTktDVExf
QVNQTUMpOwotCisJcGNpX2Rpc2FibGVfbGlua19zdGF0ZShhYl9wY2ktPnBkZXYsIFBDSUVfTElO
S19TVEFURV9MMFMgfCBQQ0lFX0xJTktfU1RBVEVfTDEpOwogCXNldF9iaXQoQVRIMTJLX1BDSV9B
U1BNX1JFU1RPUkUsICZhYl9wY2ktPmZsYWdzKTsKIH0KIAogc3RhdGljIHZvaWQgYXRoMTJrX3Bj
aV9hc3BtX3Jlc3RvcmUoc3RydWN0IGF0aDEya19wY2kgKmFiX3BjaSkKIHsKIAlpZiAodGVzdF9h
bmRfY2xlYXJfYml0KEFUSDEyS19QQ0lfQVNQTV9SRVNUT1JFLCAmYWJfcGNpLT5mbGFncykpCi0J
CXBjaWVfY2FwYWJpbGl0eV9jbGVhcl9hbmRfc2V0X3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQ
X0xOS0NUTCwKLQkJCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAotCQkJCQkJICAgYWJfcGNp
LT5saW5rX2N0bCAmCi0JCQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CisJCXBjaV9lbmFi
bGVfbGlua19zdGF0ZShhYl9wY2ktPnBkZXYsIGFiX3BjaS0+bGlua19jdGwgJgorCQkJCSAgICAg
IChQQ0lFX0xJTktfU1RBVEVfTDBTIHwgUENJRV9MSU5LX1NUQVRFX0wxKSk7CiB9CiAKIHN0YXRp
YyB2b2lkIGF0aDEya19wY2lfa2lsbF90YXNrbGV0cyhzdHJ1Y3QgYXRoMTJrX2Jhc2UgKmFiKQot
LSAKMi4zMC4yCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJr
Cg==
