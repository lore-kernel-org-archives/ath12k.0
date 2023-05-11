Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E435AC7EE22
	for <ath12k@archiver.kernel.org>; Thu, 11 May 2023 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5ORQ0JIHaNjg74wpUr5CJECbfXrKtV+vpxA9Y+WOFQ=; b=IzzTweLySNDRwf
	TYPnk4YG+NT+LrBpexVyP5WdPJb5dXgLDwLi9O8wZ7DVeYjiq//+zII4UUeWDhJULKtDW/zWdqO0k
	70seYWM0gxPm0hfwldxEFcSjhU50QMjsCB67XcmPBr2L1dLjqdrTO/0igwNlJU+DswLtc7a8dEHC0
	vJEJ35prRA3y9WEg2zjhK7uBlkSq7h79wk8kf6BQ6EdHaJFBSCDf8TPp09lpouyViy1sIgCfOEJf7
	K72uOZnt/Hp7A10XWw9ZtryJueh+VWl92cw+Q3r0vODHqr2InjakM+tE56bYK+sdXsBq+Y232BjRP
	y1RTi7LjsrsFLRvUpPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px75T-0090zg-1b
	for ath12k@archiver.kernel.org;
	Thu, 11 May 2023 14:16:07 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px69K-008q4F-1o
	for ath12k@lists.infradead.org;
	Thu, 11 May 2023 13:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683810962; x=1715346962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TAC73s9QwdyGD3M/5SJI0+AWbjKADBP6Sv9hNzZQGXc=;
  b=aPA3fcpLhKj9hI/x6rTsXBluonD6kCqOO/wqyxmUPzs3Yjr7SrkjZaJc
   bjBvsgMQi9gMEIYiC8ArsMDhVtmu7MyiAbWOUPynoTpTH1nmObqvqbVIv
   D5ShGCbYO2ACMs3+ZSxeiS6KdZ0SJDrDGDbXeIyP0gcAKJOA9inknDLmy
   i7oycAOIwJnfqoBb+Q1t/If3ipl4oSJEEPj4TDq8FyQ8RWY2d/Xgagzcp
   e16R3vmI2COPQOTZCuDdmV17Dp1JkmlN6R6/jeMp516RbNf9hT/vULQR5
   wI5VGiShp3BvfSqOb86QFnf1SZxmA7hIdLVKylbcXNqeTUJLm2XPZfuCp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378619785"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="378619785"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650170161"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="650170161"
Received: from jsanche3-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.39.112])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:15:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
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
Subject: [PATCH 16/17] wifi: ath12k: Use pcie_lnkctl_clear_and_set() for changing LNKCTL
Date: Thu, 11 May 2023 16:14:40 +0300
Message-Id: <20230511131441.45704-17-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
References: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_061602_616269_F7876A62 
X-CRM114-Status: GOOD (  12.49  )
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
ZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KClVzZSBwY2llX2xua2N0bF9jbGVhcl9hbmRfc2V0KCkg
d2hpY2ggZG9lcyBwcm9wZXIgbG9ja2luZyB0byBhdm9pZApsb3NpbmcgY29uY3VycmVudCB1cGRh
dGVzIHRvIHRoZSByZWdpc3RlciB2YWx1ZS4KClN1Z2dlc3RlZC1ieTogTHVrYXMgV3VubmVyIDxs
dWthc0B3dW5uZXIuZGU+ClNpZ25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZp
bmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJr
L3BjaS5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJr
L3BjaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9wY2kuYwppbmRleCA5ZjE3
NGRhZjMyNGMuLmZhODhhMGI4ODUyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDEyay9wY2kuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL3Bj
aS5jCkBAIC03OTQsOCArNzk0LDggQEAgc3RhdGljIHZvaWQgYXRoMTJrX3BjaV9hc3BtX2Rpc2Fi
bGUoc3RydWN0IGF0aDEya19wY2kgKmFiX3BjaSkKIAkJICAgdTE2X2dldF9iaXRzKGFiX3BjaS0+
bGlua19jdGwsIFBDSV9FWFBfTE5LQ1RMX0FTUE1fTDEpKTsKIAogCS8qIGRpc2FibGUgTDBzIGFu
ZCBMMSAqLwotCXBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKGFiX3BjaS0+cGRldiwgUENJX0VY
UF9MTktDVEwsCi0JCQkJICAgYWJfcGNpLT5saW5rX2N0bCAmIH5QQ0lfRVhQX0xOS0NUTF9BU1BN
Qyk7CisJcGNpZV9sbmtjdGxfY2xlYXJfYW5kX3NldChhYl9wY2ktPnBkZXYsCisJCQkJICBhYl9w
Y2ktPmxpbmtfY3RsICYgUENJX0VYUF9MTktDVExfQVNQTUMsIDApOwogCiAJc2V0X2JpdChBVEgx
MktfUENJX0FTUE1fUkVTVE9SRSwgJmFiX3BjaS0+ZmxhZ3MpOwogfQpAQCAtODAzLDggKzgwMyw4
IEBAIHN0YXRpYyB2b2lkIGF0aDEya19wY2lfYXNwbV9kaXNhYmxlKHN0cnVjdCBhdGgxMmtfcGNp
ICphYl9wY2kpCiBzdGF0aWMgdm9pZCBhdGgxMmtfcGNpX2FzcG1fcmVzdG9yZShzdHJ1Y3QgYXRo
MTJrX3BjaSAqYWJfcGNpKQogewogCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoQVRIMTJLX1BDSV9B
U1BNX1JFU1RPUkUsICZhYl9wY2ktPmZsYWdzKSkKLQkJcGNpZV9jYXBhYmlsaXR5X3dyaXRlX3dv
cmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkJICAgYWJfcGNpLT5saW5rX2N0
bCk7CisJCXBjaWVfbG5rY3RsX2NsZWFyX2FuZF9zZXQoYWJfcGNpLT5wZGV2LCAwLAorCQkJCQkg
IGFiX3BjaS0+bGlua19jdGwgJiBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CiB9CiAKIHN0YXRpYyB2
b2lkIGF0aDEya19wY2lfa2lsbF90YXNrbGV0cyhzdHJ1Y3QgYXRoMTJrX2Jhc2UgKmFiKQotLSAK
Mi4zMC4yCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
