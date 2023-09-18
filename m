Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34237CD37B0
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9xPpaLR80qVU1gS3v8Sg5q3l1NAeYFIK7Z3hFALtyo=; b=W+bC0QXBykd+Zh
	b7EbyfQlUvuveZEpt7/RCYq4hzn+l1hNfMsNud6+8aTr++zTCmTRHfhriEwC3txMeKbS/8/5UZHrn
	7B9Qu4EgrCWSPVuLTX/HWHSfXl8aP2a9p5D7luHCJZz2bh1UShsSwWo5GdzbgiSLVEtjORecj+q3l
	bbBkT93z3DFFn8Najawf2TtgeysFaH6XLJHukXKrG8/hwTlz3glJPCwJly+zcIgEPKSEGCNdv2AIP
	4RWS0gF8fWsa2IHCiSxNdTuIgPk/5VKtSQs+gP/MvS4MIMR6V/Pe+T62SvMaXX1ls/1na9ylDc1cc
	JgfTg8mCv4yT9QBw5goA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBt-00FYLr-2h
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:21:29 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBT-00FXxG-2E;
	Mon, 18 Sep 2023 13:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043263; x=1726579263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kDT+yWJAUHrBQ8ex5Uxk7tCrxharMirq80UQzoJeAvk=;
  b=GYyPIWdowD/ob5GCOQymj+xHB7XGKHUzXBeDVgG+9r2BR4qrKG+ksQux
   PqudH3mL+mT1BCr+OcUZux3wIrGxWX0YU56zjrvB8xjn3dWpiBzsRPWQU
   KB62nX4z+v+UDjzLmteA2zyHcBo8EYEUxAxXUfy/FPWvLlIv1j8DaX2y0
   o6KsNt8eIr21oZ19+BPxzh+E7VnhPOuhbiOpV1VbpM6fwdfxcJ+p/yrxh
   zfr/5COvFuf2fMe3TqRL/KJgLCbogAG3Q5N5wEHM6IDwRP9quTsmy2b2e
   eAozQYmkQ88f53339Cqrezy0Nyr7eNY4BBdCqhVWNt1B4vqVUoeyNQqgF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113626"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113626"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811343130"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811343130"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:47 -0700
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
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dean Luick <dean.luick@cornelisnetworks.com>
Subject: [PATCH v2 12/13] RDMA/hfi1: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:11:02 +0300
Message-Id: <20230918131103.24119-13-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062103_892302_E036FF40 
X-CRM114-Status: GOOD (  12.84  )
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

SUIvaGZpMSBkcml2ZXIgYWRqdXN0cyBBU1BNIHN0YXRlIGl0c2VsZiB3aGljaCBsZWF2ZXMgQVNQ
TSBzZXJ2aWNlCmRyaXZlciBpbiBQQ0kgY29yZSB1bmF3YXJlIG9mIHRoZSBsaW5rIHN0YXRlIGNo
YW5nZXMgdGhlIGRyaXZlcgppbXBsZW1lbnRlZC4KCkNhbGwgcGNpX2Rpc2FibGVfbGlua19zdGF0
ZSgpIGFuZCBwY2lfZW5hYmxlX2xpbmtfc3RhdGUoKSBpbnN0ZWFkIG9mCmFkanVzdGluZyBBU1BN
QyBmaWVsZCBpbiBMTktDVEwgZGlyZWN0bHkgaW4gdGhlIGRyaXZlciBhbmQgbGV0IFBDSSBjb3Jl
CmhhbmRsZSB0aGUgQVNQTSBzdGF0ZSBtYW5hZ2VtZW50LiBSZW1vdmUgdGhlIGZ1bmN0aW9ucyB0
aGF0IGhhbmRsZWQgdGhlCkFTUE0gY2hhbmdlcyB0aGF0IGFyZSBub3cgdW5uZWNlc3NhcnkuCgpT
aWduZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5j
b20+ClJldmlld2VkLWJ5OiBEZWFuIEx1aWNrIDxkZWFuLmx1aWNrQGNvcm5lbGlzbmV0d29ya3Mu
Y29tPgotLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL2FzcG0uYyB8IDM4ICsrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkxL3BjaWUu
YyB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvYXNwbS5jIGIvZHJp
dmVycy9pbmZpbmliYW5kL2h3L2hmaTEvYXNwbS5jCmluZGV4IGEzYzUzYmU0MDcyYy4uOGUzZmMx
ZDRjOWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvaGZpMS9hc3BtLmMKKysr
IGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvYXNwbS5jCkBAIC01NCw0NSArNTQsMTMgQEAg
c3RhdGljIHZvaWQgYXNwbV9od19zZXRfbDFfZW50X2xhdGVuY3koc3RydWN0IGhmaTFfZGV2ZGF0
YSAqZGQpCiAJcGNpX3dyaXRlX2NvbmZpZ19kd29yZChkZC0+cGNpZGV2LCBQQ0lFX0NGR19SRUdf
UEwzLCByZWczMik7CiB9CiAKLXN0YXRpYyB2b2lkIGFzcG1faHdfZW5hYmxlX2wxKHN0cnVjdCBo
ZmkxX2RldmRhdGEgKmRkKQotewotCXN0cnVjdCBwY2lfZGV2ICpwYXJlbnQgPSBkZC0+cGNpZGV2
LT5idXMtPnNlbGY7Ci0KLQkvKgotCSAqIElmIHRoZSBkcml2ZXIgZG9lcyBub3QgaGF2ZSBhY2Nl
c3MgdG8gdGhlIHVwc3RyZWFtIGNvbXBvbmVudCwKLQkgKiBpdCBjYW5ub3Qgc3VwcG9ydCBBU1BN
IEwxIGF0IGFsbC4KLQkgKi8KLQlpZiAoIXBhcmVudCkKLQkJcmV0dXJuOwotCi0JLyogRW5hYmxl
IEFTUE0gTDEgZmlyc3QgaW4gdXBzdHJlYW0gY29tcG9uZW50IGFuZCB0aGVuIGRvd25zdHJlYW0g
Ki8KLQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3JkKHBhcmVudCwgUENJX0VYUF9M
TktDVEwsCi0JCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAotCQkJCQkgICBQQ0lfRVhQX0xO
S0NUTF9BU1BNX0wxKTsKLQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3JkKGRkLT5w
Y2lkZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQywKLQkJ
CQkJICAgUENJX0VYUF9MTktDVExfQVNQTV9MMSk7Ci19Ci0KLXZvaWQgYXNwbV9od19kaXNhYmxl
X2wxKHN0cnVjdCBoZmkxX2RldmRhdGEgKmRkKQotewotCXN0cnVjdCBwY2lfZGV2ICpwYXJlbnQg
PSBkZC0+cGNpZGV2LT5idXMtPnNlbGY7Ci0KLQkvKiBEaXNhYmxlIEFTUE0gTDEgZmlyc3QgaW4g
ZG93bnN0cmVhbSBjb21wb25lbnQgYW5kIHRoZW4gdXBzdHJlYW0gKi8KLQlwY2llX2NhcGFiaWxp
dHlfY2xlYXJfYW5kX3NldF93b3JkKGRkLT5wY2lkZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJCQkg
ICBQQ0lfRVhQX0xOS0NUTF9BU1BNQywgMHgwKTsKLQlpZiAocGFyZW50KQotCQlwY2llX2NhcGFi
aWxpdHlfY2xlYXJfYW5kX3NldF93b3JkKHBhcmVudCwgUENJX0VYUF9MTktDVEwsCi0JCQkJCQkg
ICBQQ0lfRVhQX0xOS0NUTF9BU1BNQywgMHgwKTsKLX0KLQogc3RhdGljICB2b2lkIGFzcG1fZW5h
YmxlKHN0cnVjdCBoZmkxX2RldmRhdGEgKmRkKQogewogCWlmIChkZC0+YXNwbV9lbmFibGVkIHx8
IGFzcG1fbW9kZSA9PSBBU1BNX01PREVfRElTQUJMRUQgfHwKIAkgICAgIWRkLT5hc3BtX3N1cHBv
cnRlZCkKIAkJcmV0dXJuOwogCi0JYXNwbV9od19lbmFibGVfbDEoZGQpOworCXBjaV9lbmFibGVf
bGlua19zdGF0ZShkZC0+cGNpZGV2LCBQQ0lfRVhQX0xOS0NUTF9BU1BNX0wxKTsKIAlkZC0+YXNw
bV9lbmFibGVkID0gdHJ1ZTsKIH0KIApAQCAtMTAxLDcgKzY5LDcgQEAgc3RhdGljICB2b2lkIGFz
cG1fZGlzYWJsZShzdHJ1Y3QgaGZpMV9kZXZkYXRhICpkZCkKIAlpZiAoIWRkLT5hc3BtX2VuYWJs
ZWQgfHwgYXNwbV9tb2RlID09IEFTUE1fTU9ERV9FTkFCTEVEKQogCQlyZXR1cm47CiAKLQlhc3Bt
X2h3X2Rpc2FibGVfbDEoZGQpOworCXBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoZGQtPnBjaWRldiwg
UENJRV9MSU5LX1NUQVRFX0wwUyB8IFBDSUVfTElOS19TVEFURV9MMSk7CiAJZGQtPmFzcG1fZW5h
YmxlZCA9IGZhbHNlOwogfQogCkBAIC0yNTQsNyArMjIyLDcgQEAgdm9pZCBhc3BtX2luaXQoc3Ry
dWN0IGhmaTFfZGV2ZGF0YSAqZGQpCiAJLyogU3RhcnQgd2l0aCBBU1BNIGRpc2FibGVkICovCiAJ
YXNwbV9od19zZXRfbDFfZW50X2xhdGVuY3koZGQpOwogCWRkLT5hc3BtX2VuYWJsZWQgPSBmYWxz
ZTsKLQlhc3BtX2h3X2Rpc2FibGVfbDEoZGQpOworCXBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoZGQt
PnBjaWRldiwgUENJRV9MSU5LX1NUQVRFX0wwUyB8IFBDSUVfTElOS19TVEFURV9MMSk7CiAKIAkv
KiBOb3cgdHVybiBvbiBBU1BNIGlmIGNvbmZpZ3VyZWQgKi8KIAlhc3BtX2VuYWJsZV9hbGwoZGQp
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvcGNpZS5jIGIvZHJpdmVy
cy9pbmZpbmliYW5kL2h3L2hmaTEvcGNpZS5jCmluZGV4IDA4NzMyZTFhYzk2Ni4uNzY3ZjZjYjc3
MGI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvaGZpMS9wY2llLmMKKysrIGIv
ZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvcGNpZS5jCkBAIC0xMTgyLDcgKzExODIsNyBAQCBp
bnQgZG9fcGNpZV9nZW4zX3RyYW5zaXRpb24oc3RydWN0IGhmaTFfZGV2ZGF0YSAqZGQpCiAJICog
d2lsbCBiZSBlbmFibGVkIGlmIHJlcXVpcmVkIGxhdGVyCiAJICovCiAJZGRfZGV2X2luZm8oZGQs
ICIlczogY2xlYXJpbmcgQVNQTVxuIiwgX19mdW5jX18pOwotCWFzcG1faHdfZGlzYWJsZV9sMShk
ZCk7CisJcGNpX2Rpc2FibGVfbGlua19zdGF0ZShkZC0+cGNpZGV2LCBQQ0lFX0xJTktfU1RBVEVf
TDBTIHwgUENJRV9MSU5LX1NUQVRFX0wxKTsKIAogCS8qCiAJICogc3RlcCA1ZjogY2xlYXIgRGly
ZWN0U3BlZWRDaGFuZ2UKLS0gCjIuMzAuMgoKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEy
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEyawo=
