Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743ACEB64DC
	for <ath12k@archiver.kernel.org>; Mon, 17 Jul 2023 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywC6jon/0CR2rCvEVaFA+WWGM8/0YSdDW+t+1IVUcx4=; b=pzloRoQEZXTnx+
	bF4nySXN7bUwiTYJ/Ob7M0JsJVfFCYG+5s9/VIadaFHCzuBpc8MJEhsG8xLu7w3gAyJylfwg2rbQn
	+J0YPvQe1aOmzsrX4DTqkGHVwj8BZrkyzBIKhtWEr+3yt1ManelbFP/ewzINu1sXAq/9dKqDpzLNs
	5LRLfcKZs6/hXaKGwYqcqtjzHzkPNt788GEvX5fmklxAGGJO7jnuHQ3uk1s34PRRt7rXcYQesRiM1
	cuZVQ7wJKAbOPwY7WfP5OdYYPKZ5+j9MHG3q7IVuKi8rplDBonEvYqn+QRJECm7TnXGClRt+kL9pQ
	GRgY5hYvGIhNeATAoLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLN0R-003whJ-0n
	for ath12k@archiver.kernel.org;
	Mon, 17 Jul 2023 12:07:12 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLN0B-003wek-0p
	for ath12k@lists.infradead.org;
	Mon, 17 Jul 2023 12:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689595615; x=1721131615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cyGe5BDTrg3RfJfvClt7NBXd+coMOb9txcFpO3hBJoM=;
  b=FTMGew2wskcEYYi308Po0ZIu8MFob3qedIvUEgikGLY8yNdvppAhk3HO
   4ip3sN/gg5IQJZTRNREXgbCRHOiyPENJjRLN2avUHCyS1WXHfzcxQEHmc
   oZAkA+/ees4Xd/7ZrXuVRAcGnIxA3Cz0MZeauhDksxsFJOlzSz29JPc4s
   fzig6oVqtyqYLunrWPHma9ifjafD3d8rpYmAEggj0ULn1ki/FZR+qfwIb
   iArcXUhXG8GKVn193RJIH2XYzlZPsYoYIDmnbgrT4lKbrgo8fEuoH3MXb
   oyknPfiw5yq9GzF8w7UKKUqTQBbxEijBUl6YSwdJG8zT2XnLGQHy9gKCY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="432081896"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432081896"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 05:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="752876370"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="752876370"
Received: from dkravtso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.45.233])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 05:06:48 -0700
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	=?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Simon Horman <simon.horman@corigine.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 09/11] wifi: ath12k: Use RMW accessors for changing LNKCTL
Date: Mon, 17 Jul 2023 15:05:01 +0300
Message-Id: <20230717120503.15276-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230717120503.15276-1-ilpo.jarvinen@linux.intel.com>
References: <20230717120503.15276-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_050655_357175_A3BB2AC1 
X-CRM114-Status: GOOD (  10.03  )
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
ZW5AbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxzaW1vbi5ob3Jt
YW5AY29yaWdpbmUuY29tPgpBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4K
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTJrL3BjaS5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTJrL3BjaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9wY2kuYwpp
bmRleCA1OTkwYTU1ODAxZjAuLmU0ZjA4YTA2NmNhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEyay9wY2kuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTJrL3BjaS5jCkBAIC03OTQsOCArNzk0LDggQEAgc3RhdGljIHZvaWQgYXRoMTJrX3BjaV9h
c3BtX2Rpc2FibGUoc3RydWN0IGF0aDEya19wY2kgKmFiX3BjaSkKIAkJICAgdTE2X2dldF9iaXRz
KGFiX3BjaS0+bGlua19jdGwsIFBDSV9FWFBfTE5LQ1RMX0FTUE1fTDEpKTsKIAogCS8qIGRpc2Fi
bGUgTDBzIGFuZCBMMSAqLwotCXBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKGFiX3BjaS0+cGRl
diwgUENJX0VYUF9MTktDVEwsCi0JCQkJICAgYWJfcGNpLT5saW5rX2N0bCAmIH5QQ0lfRVhQX0xO
S0NUTF9BU1BNQyk7CisJcGNpZV9jYXBhYmlsaXR5X2NsZWFyX3dvcmQoYWJfcGNpLT5wZGV2LCBQ
Q0lfRVhQX0xOS0NUTCwKKwkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CiAKIAlzZXRfYml0
KEFUSDEyS19QQ0lfQVNQTV9SRVNUT1JFLCAmYWJfcGNpLT5mbGFncyk7CiB9CkBAIC04MDMsOCAr
ODAzLDEwIEBAIHN0YXRpYyB2b2lkIGF0aDEya19wY2lfYXNwbV9kaXNhYmxlKHN0cnVjdCBhdGgx
MmtfcGNpICphYl9wY2kpCiBzdGF0aWMgdm9pZCBhdGgxMmtfcGNpX2FzcG1fcmVzdG9yZShzdHJ1
Y3QgYXRoMTJrX3BjaSAqYWJfcGNpKQogewogCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoQVRIMTJL
X1BDSV9BU1BNX1JFU1RPUkUsICZhYl9wY2ktPmZsYWdzKSkKLQkJcGNpZV9jYXBhYmlsaXR5X3dy
aXRlX3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkJICAgYWJfcGNpLT5s
aW5rX2N0bCk7CisJCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl9hbmRfc2V0X3dvcmQoYWJfcGNpLT5w
ZGV2LCBQQ0lfRVhQX0xOS0NUTCwKKwkJCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAorCQkJ
CQkJICAgYWJfcGNpLT5saW5rX2N0bCAmCisJCQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7
CiB9CiAKIHN0YXRpYyB2b2lkIGF0aDEya19wY2lfa2lsbF90YXNrbGV0cyhzdHJ1Y3QgYXRoMTJr
X2Jhc2UgKmFiKQotLSAKMi4zMC4yCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTJrCg==
