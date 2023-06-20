Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D59EB64D7
	for <ath12k@archiver.kernel.org>; Tue, 20 Jun 2023 13:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVRjFckblQfm9VTWSgtlFzDB24RbhdWpvHbVrI27TR8=; b=0GI/sErPhgnh0V
	KgkBMdL+Un2Z7qP+4tggAJTFVa5iVHvGNfz/yIqlmtN9Y1rpk+Vw3mSsfL75Vkygo0/mWI14ydqzq
	VHkJq/JWX/tIoLGDEAV7HMrNCzy55Xb/iCMY5rodPbunaGPMEIx/hhWzd2YHIvBbwEnp0exqHjyzG
	SxGWh9H01ihMyA8Q2iw1agZJoQy9Z34/wNmjhuMPG5CEfj8+p+6dDVtt4jWQUFkSdsA4sF1iDx4YD
	PaKGDQn5/l86AvrBGf43pzv8qGGbV7BjT4MFdYrWlZeFEMO9oxMNdB2uGXX9kSKW14xMk74wdbKc4
	wgTE1CvJ2kw0odTyqKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbiB-00BRiO-1f
	for ath12k@archiver.kernel.org;
	Tue, 20 Jun 2023 13:47:59 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbi9-00BRhf-2U
	for ath12k@lists.infradead.org;
	Tue, 20 Jun 2023 13:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687268877; x=1718804877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2aONb8S+WtuJgciB/fo47/+oXzDFiIbE8kHLjmQjiPE=;
  b=FxMJGVfBvmXJSpBs/coTI7eVEAToFEqB7zJLPWdT3S8FmmGioLd2Ym9d
   i1l/a8/Iwbe4Pc1ZBX7V7pDnfT/tWWd4cl/4kZ0qrMhsF7vEvxF2ZxyPS
   xcBUxM7QN0Mcmq90/4hnWvcLKPuxHsSLZ+Gfw8TcXuu/K67eaBk0+E1KG
   14d+MQWfbd0ItQc+fJqZvuK7V/VO9H1Kheo7w5Mlge/8tAfc3D+tnkBDm
   uIMznMUtOclBAAFTpIQzr4ZbrcNZaKvF2IIm0Xgu/7LEB/9DByauo5Me1
   dvvO7alfl5jDCJMmGx6QMtYJjatBAS0dD5+Ni8cdIHwZjrrKDH19veix7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362401636"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="362401636"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="827007074"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="827007074"
Received: from eshaanan-mobl.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.61.137])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:47:50 -0700
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
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 09/10] wifi: ath12k: Use RMW accessors for changing LNKCTL
Date: Tue, 20 Jun 2023 16:46:23 +0300
Message-Id: <20230620134624.99688-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
References: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_064757_858413_5AD6F37A 
X-CRM114-Status: GOOD (  11.88  )
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
ZW5AbGludXguaW50ZWwuY29tPgpBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9y
Zz4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTJrL3BjaS5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTJrL3BjaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9wY2ku
YwppbmRleCA5ZjE3NGRhZjMyNGMuLmUxZTQ1ZWI1MGYzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEyay9wY2kuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTJrL3BjaS5jCkBAIC03OTQsOCArNzk0LDggQEAgc3RhdGljIHZvaWQgYXRoMTJrX3Bj
aV9hc3BtX2Rpc2FibGUoc3RydWN0IGF0aDEya19wY2kgKmFiX3BjaSkKIAkJICAgdTE2X2dldF9i
aXRzKGFiX3BjaS0+bGlua19jdGwsIFBDSV9FWFBfTE5LQ1RMX0FTUE1fTDEpKTsKIAogCS8qIGRp
c2FibGUgTDBzIGFuZCBMMSAqLwotCXBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKGFiX3BjaS0+
cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJICAgYWJfcGNpLT5saW5rX2N0bCAmIH5QQ0lfRVhQ
X0xOS0NUTF9BU1BNQyk7CisJcGNpZV9jYXBhYmlsaXR5X2NsZWFyX3dvcmQoYWJfcGNpLT5wZGV2
LCBQQ0lfRVhQX0xOS0NUTCwKKwkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CiAKIAlzZXRf
Yml0KEFUSDEyS19QQ0lfQVNQTV9SRVNUT1JFLCAmYWJfcGNpLT5mbGFncyk7CiB9CkBAIC04MDMs
OCArODAzLDEwIEBAIHN0YXRpYyB2b2lkIGF0aDEya19wY2lfYXNwbV9kaXNhYmxlKHN0cnVjdCBh
dGgxMmtfcGNpICphYl9wY2kpCiBzdGF0aWMgdm9pZCBhdGgxMmtfcGNpX2FzcG1fcmVzdG9yZShz
dHJ1Y3QgYXRoMTJrX3BjaSAqYWJfcGNpKQogewogCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoQVRI
MTJLX1BDSV9BU1BNX1JFU1RPUkUsICZhYl9wY2ktPmZsYWdzKSkKLQkJcGNpZV9jYXBhYmlsaXR5
X3dyaXRlX3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkJICAgYWJfcGNp
LT5saW5rX2N0bCk7CisJCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl9hbmRfc2V0X3dvcmQoYWJfcGNp
LT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKKwkJCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAor
CQkJCQkJICAgYWJfcGNpLT5saW5rX2N0bCAmCisJCQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BN
Qyk7CiB9CiAKIHN0YXRpYyB2b2lkIGF0aDEya19wY2lfa2lsbF90YXNrbGV0cyhzdHJ1Y3QgYXRo
MTJrX2Jhc2UgKmFiKQotLSAKMi4zMC4yCgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTJrCg==
