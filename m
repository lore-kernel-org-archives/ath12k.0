Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AA7CD37B0
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kc10RQ5AZX19Fu0Gw7cS6khBf2JPZ4zgCJryMyR7Krk=; b=YJCDt5toWaxn+P
	7YNqbDxTnqhTQ3Or0NPY0pnKJ2aRH5ewTEBKGH33uWUAV0lNezgLJmA7GH/QCALseWr2xx9TRhT4Q
	WULy4rHG0YDEV/5B1Sph3U8LGEQLW+yEn6GYJ/5kLQyMQjPpoIFutlmgJdCHKzSqLAmUPTT4F1WHN
	2gKe/YuotbsdQ0Asav9l/dF8PWbyiptVLDiolowfKgWegnEW4oDaUIkgn2pKwA3xRbLd2k/Pxe3qh
	OX9AeHNN7U7vBDOYiaV/tXXFqLaEywuzzYcdGNfhKctYHdvkvkYaYfUm0guDd0LWJvQLJeBAsBLpR
	kgsFuG0iwYdCqdYpTRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE90-00FWPu-2z
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:18:30 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE8x-00FWOo-0n;
	Mon, 18 Sep 2023 13:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043107; x=1726579107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Um9SQvE/5HeieZqdelS3qtLTo5NsX9iapqTm1J+iScg=;
  b=JBsD6tllrTA8PfoIFVAI4bGnUqFKbAqKdgijCo3BJAXKGh0UXELkX8d5
   vaf/YxOXtPPQGGOF66uGP1xWcl267j+Ld4s2x5sukJmeTPhFgsCDrRd7K
   bPpiRUtahjMCy7041cAAfsOpOKszVCP40ilLCDqROvHuBj++5QgtsRCmS
   IbisjDedS8NRComhPSzHTVjNtZ8lDZ/y9gmwlR/PcG7JJz8ksu4o+xYft
   CG6QN5oJIDd95BOG48byrOVdTkZhiv2Usrt6Xmz1abKLoGDabwsFKJgpW
   mt7aP9SajstbvkzMkQW12lWPGILp73tKcoeMWQ0E7xVUVdda5y/qRuT0T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446112587"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446112587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811341354"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811341354"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:23 -0700
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
	linux-kernel@vger.kernel.org
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
Subject: [PATCH v2 00/13] PCI/ASPM: Make ASPM in core robust and remove driver workarounds
Date: Mon, 18 Sep 2023 16:10:50 +0300
Message-Id: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061827_392880_54258AEB 
X-CRM114-Status: GOOD (  14.72  )
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

UHJldmlvdXNseSwgQVNQTSBzZXJ2aWNlIGRyaXZlciBoYXMgaWdub3JlZCBsaW5rIHN0YXRlIG1h
bmFnZW1lbnQKcmVxdWVzdHMgd2hlbiBPUyBpcyBub3QgYXV0aG9yaXplZCB0byB0b3VjaCBMTktD
VEwgKG9yIEFTUE0gaXMgbm90CmNvbmZpZ3VyZWQgYXQgYWxsKS4gQmVjYXVzZSB0aGUgY29yZSBp
bnRlcmZhY2UgaGFzIG5vdCBiZWVuIHJlbGlhYmxlLApkcml2ZXJzIGhhdmUgY3JlYXRlIHdvcmth
cm91bmRzIHRvIGZvcmNlIEFTUE0gc3RhdGUgYnkgZGlyZWN0bHkKd3JpdGluZyBpbnRvIExOS0NU
TCB0aGVtc2VsdmVzLgoKQSBzZWNvbmQgcHJvYmxlbSBpcyBsYWNrIG9mIHN5bW1ldHJpYyBwYWly
IGZvcgpwY2lfZGlzYWJsZV9saW5rX3N0YXRlKCkuIEFueSBsaW5rIHN0YXRlIGRpc2FibGUgaXMg
cGVybWFuZW50IChOT1RFOgpwY2lfZW5hYmxlX2xpbmtfc3RhdGUoKSBkZXNwaXRlIGl0cyBuYW1l
IGlzIG5vdCBhIHN5bW1ldHJpYyBwYWlyIGZvcgpwY2lfZGlzYWJsZV9saW5rX3N0YXRlKCkpLiBU
aGUgbGFjayBvZiB3YXkgdG8gcmUtZW5hYmxlIEFTUE0gcHJldmVudHMKZHJpdmVycyBmcm9tIHVz
aW5nIHBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoKSB0byBkaXNhYmxpbmcgQVNQTSBmb3IKY2VydGFp
biBwaGFzZXMgb2YgZHJpdmVyIG9wZXJhdGlvbiBhbmQgcmUtZW5hYmxpbmcgaXQgbGF0ZXIuCgpC
b3RoIGNhc2VzIGFyZSBwcm9ibGVtYXRpYyBiZWNhdXNlIHdoZW4gQVNQTSBpcyB3b3JraW5nIG5v
cm1hbGx5CnRocm91Z2ggdGhlIHNlcnZpY2UgZHJpdmVyLCBpdCBpcyBub3QgYXdhcmUgb2YgdGhl
IGV4dHJhIGxpbmsgc3RhdGUKY2hhbmdlcyBkcml2ZXJzIHBlcmZvcm0gZGlyZWN0bHkgY2F1c2lu
ZyB0aGUgc2VydmljZSBkcml2ZXIgdG8gaGF2ZQppbmNvcnJlY3QgdmlldyBhYm91dCB0aGUgQVNQ
TSBzdGF0ZS4KCkFkZHJlc3MgdGhlc2UgcHJvYmxlbXMgYnkgbWFraW5nIHBjaV9kaXNhYmxlX2xp
bmtfc3RhdGUoKSByZWxpYWJsZSBhbmQKYnkgcHJvdmlkaW5nIHByb3BlciBwY2lfZW5hYmxlX2xp
bmtfc3RhdGUoKSBwYWlyIGZvciBpdCAodGhlIGZ1bmN0aW9uCmN1cnJlbnRseSBvbiB0aGUgd2F5
IGlzIHJlbmFtZWQgZmlyc3QgdG8gYSBtb3JlIGRlc2NyaXB0aXZlIG5hbWUpLgpBZnRlciBjb3Jl
IGltcHJvdmVtZW50cywgY29udmVydCBkcml2ZXJzIHRvIHVzZSB0aGUgbmV3IGludGVyZmFjZSBh
bmQKZHJvcCB0aGUgd29ya2Fyb3VuZHMuCgp2MjoKLSBSZWJhc2VkIHRoZSBzZXJpZXMKLSBSZW9y
ZGVyIHBhdGNoZXMgKHJlbmFtZSBwYXRjaCBmaXJzdCkKCklscG8gSsOkcnZpbmVuICgxMyk6CiAg
UENJL0FTUE06IFJlbmFtZSBwY2lfZW5hYmxlX2xpbmtfc3RhdGUoKSB0bwogICAgcGNpX3NldF9k
ZWZhdWx0X2xpbmtfc3RhdGUoKQogIFBDSS9BU1BNOiBJbXByb3ZlIHBjaV9zZXRfZGVmYXVsdF9s
aW5rX3N0YXRlKCkga2VybmVsZG9jCiAgUENJL0FTUE06IERpc2FibGUgQVNQTSB3aGVuIGRyaXZl
ciByZXF1ZXN0cyBpdAogIFBDSS9BU1BNOiBNb3ZlIEwwUy9MMS9zdWIgc3RhdGVzIG1hc2sgY2Fs
Y3VsYXRpb24gaW50byBhIGhlbHBlcgogIFBDSS9BU1BNOiBBZGQgcGNpX2VuYWJsZV9saW5rX3N0
YXRlKCkKICBCbHVldG9vdGg6IGhjaV9iY200Mzc3OiBDb252ZXJ0IGFzcG0gZGlzYWJsZSB0byBx
dWlyawogIG10NzY6IFJlbW92ZSB1bnJlbGlhYmxlIHBjaV9kaXNhYmxlX2xpbmtfc3RhdGUoKSB3
b3JrYXJvdW5kCiAgZTEwMDBlOiBSZW1vdmUgdW5yZWxpYWJsZSBwY2lfZGlzYWJsZV9saW5rX3N0
YXRleyxfbG9ja2VkfSgpCiAgICB3b3JrYXJvdW5kCiAgd2lmaTogYXRoMTBrOiBVc2UgcGNpX2Rp
c2FibGUvZW5hYmxlX2xpbmtfc3RhdGUoKQogIHdpZmk6IGF0aDExazogVXNlIHBjaV9kaXNhYmxl
L2VuYWJsZV9saW5rX3N0YXRlKCkKICB3aWZpOiBhdGgxMms6IFVzZSBwY2lfZGlzYWJsZS9lbmFi
bGVfbGlua19zdGF0ZSgpCiAgUkRNQS9oZmkxOiBVc2UgcGNpX2Rpc2FibGUvZW5hYmxlX2xpbmtf
c3RhdGUoKQogIG1pc2M6IHJ0c3g6IFVzZSBwY2lfZGlzYWJsZS9lbmFibGVfbGlua19zdGF0ZSgp
CgogZHJpdmVycy9ibHVldG9vdGgvaGNpX2JjbTQzNzcuYyAgICAgICAgICAgICAgIHwgIDIwIC0t
LQogZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvYXNwbS5jICAgICAgICAgICAgIHwgIDM4ICst
LS0tLQogZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvcGNpZS5jICAgICAgICAgICAgIHwgICAy
ICstCiBkcml2ZXJzL21pc2MvY2FyZHJlYWRlci9ydHM1MjI4LmMgICAgICAgICAgICAgfCAgIDYg
Ky0KIGRyaXZlcnMvbWlzYy9jYXJkcmVhZGVyL3J0czUyNjEuYyAgICAgICAgICAgICB8ICAgNiAr
LQogZHJpdmVycy9taXNjL2NhcmRyZWFkZXIvcnRzeF9wY3IuYyAgICAgICAgICAgIHwgICA4ICst
CiBkcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9lMTAwMGUvbmV0ZGV2LmMgICAgfCAgNzcgKy0t
LS0tLS0tLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMgICAgICAgICB8
ICAgOCArLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyAgICAgICAgIHwg
IDEwICstCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTJrL3BjaS5jICAgICAgICAgfCAg
MTAgKy0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvTWFrZWZpbGUgICB8ICAg
MSAtCiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzYuaCAgICAgfCAgIDEg
LQogLi4uL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzYxNS9wY2kuYyAgIHwgICAyICst
CiAuLi4vbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NngwL3BjaS5jICAgfCAgIDIgKy0K
IC4uLi9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2eDIvcGNpLmMgICB8ICAgMiArLQog
Li4uL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkxNS9wY2kuYyAgIHwgICAyICstCiAu
Li4vbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTIxL3BjaS5jICAgfCAgIDIgKy0KIC4u
Li9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5OTYvcGNpLmMgICB8ICAgMiArLQogZHJp
dmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9wY2kuYyAgICAgIHwgIDQ3IC0tLS0tLS0K
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvdm1kLmMgICAgICAgICAgICAgICAgICB8ICAgMiArLQog
ZHJpdmVycy9wY2kvcGNpZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRy
aXZlcnMvcGNpL3BjaWUvYXNwbS5jICAgICAgICAgICAgICAgICAgICAgICB8IDEyNiArKysrKysr
KysrKysrLS0tLS0KIGRyaXZlcnMvcGNpL3BjaWUvYXNwbV9taW5pbWFsLmMgICAgICAgICAgICAg
ICB8ICA2NiArKysrKysrKysKIGRyaXZlcnMvcGNpL3F1aXJrcy5jICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMyArCiBpbmNsdWRlL2xpbnV4L3BjaS5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTAgKy0KIDI1IGZpbGVzIGNoYW5nZWQsIDE5OSBpbnNlcnRpb25zKCspLCAyNTUg
ZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVk
aWF0ZWsvbXQ3Ni9wY2kuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGNpL3BjaWUvYXNw
bV9taW5pbWFsLmMKCi0tIAoyLjMwLjIKCgotLSAKYXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMmsK
