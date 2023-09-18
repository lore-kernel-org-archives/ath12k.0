Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAC2CD13D8
	for <ath12k@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwaPjp6f9MuyEBYWPzGdrIbnyqXcVNzgIoN+HvX/nBA=; b=BwDo7GqdC7oVsS
	ARoGPoq/mtCvVVRw5K+NAiRp6tOIFvLc9Lp0fQKI4gk29NvmnlBKFJPQyveZhahVJUvQev++rNFzF
	+Z/F7dYQbMPJSq2vrLVyUb7WN6P11RPp9Ihd35GK40ucD7uGtVpjuNRPJcD1xiVhTczSsgluuKcBc
	/B5waeb09AaOUtYgru4fHhs1Y8V5I7qlkJQ+iLT/xIoLWLzvJPIiiwkySRAFxtPgl3njBqhi/KuB1
	g/syMS4uHvAOKVwsd9aj+N9+awY/UdKlerqCvKdseqLP4uZ2uvqteZz5E1uzXQjFjWU6Uz/O6R3cI
	H4kA/Tw3rRUc/VKHfYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEB4-00FXZ1-0w
	for ath12k@archiver.kernel.org;
	Mon, 18 Sep 2023 13:20:38 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAq-00FXKv-2d;
	Mon, 18 Sep 2023 13:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043224; x=1726579224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zTpTCMfWjtWGKDy0jqcFW3mar26wQ+s3+v+7yTP0erY=;
  b=Lr7+IRXtRL71oZL8ScPvO+zvaDQmjt6H6c+VuTMBWqrXX31ys+Vq8/SN
   dSnzCu4GZLJ/lU9142Uq9AwW/rE0k2X13YE7qyKdGwpMyi8g4JTGwFWcT
   XYVZxEn5JgbMqC6V06AvBkM29wLQ8FBmvmouOJAHl6KFr98q8LWws/89/
   k6m3v4lAE/7zIO1bwfPu64IJf8bWNpV056yxZrwKiheMS38ghtQ/ppWz0
   Jrr6FVRdIBs/1LPgMO/x3Hl9PsfHChugJT5YKn2T7QgLFPxC7rXWQJpAX
   E68TKiUaiZWN4nKGcr+hWofkxv6D7dimpJIbI1+qUZKcf0KoDtUIGmmqi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113489"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113489"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342491"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342491"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:54 -0700
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
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 08/13] e1000e: Remove unreliable pci_disable_link_state{,_locked}() workaround
Date: Mon, 18 Sep 2023 16:10:58 +0300
Message-Id: <20230918131103.24119-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062024_945779_2977DB50 
X-CRM114-Status: GOOD (  14.11  )
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

cGNpX2Rpc2FibGVfbGlua19zdGF0ZSgpIGFuZCBwY2lfZGlzYWJsZV9saW5rX3N0YXRlX2xvY2tl
ZCgpIHdlcmUgbWFkZQpyZWxpYWJsZSByZWdhcmRsZXNzIG9mIEFTUE0gQ09ORklHIGFuZCBPUyBi
ZWluZyBkaXNhbGxvd2VkIHRvIGNoYW5nZQpBU1BNIHN0YXRlcyB0byBhbGxvdyBkcml2ZXJzIHRv
IHJlbHkgb24gdGhlbSB3b3JraW5nLgoKUmVtb3ZlIGRyaXZlciB3b3JraW5nIGFyb3VuZCB1bnJl
bGlhYmxlCnBjaV9kaXNhYmxlX2xpbmtfc3RhdGV7LF9sb2NrZWR9KCkgZnJvbSBlMTAwMGUgZHJp
dmVyIGFuZCBqdXN0IGNhbGwgdGhlCmZ1bmN0aW9ucyBkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6
IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9lMTAwMGUvbmV0ZGV2LmMgfCA3NyArLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3NSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9lMTAwMGUvbmV0ZGV2
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9lMTAwMGUvbmV0ZGV2LmMKaW5kZXggZjUz
NmM4NTY3MjdjLi5mYmU0NjgwNjE1OTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2ludGVsL2UxMDAwZS9uZXRkZXYuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9l
MTAwMGUvbmV0ZGV2LmMKQEAgLTY3NjUsNzkgKzY3NjUsNiBAQCBzdGF0aWMgaW50IF9fZTEwMDBf
c2h1dGRvd24oc3RydWN0IHBjaV9kZXYgKnBkZXYsIGJvb2wgcnVudGltZSkKIAlyZXR1cm4gMDsK
IH0KIAotLyoqCi0gKiBfX2UxMDAwZV9kaXNhYmxlX2FzcG0gLSBEaXNhYmxlIEFTUE0gc3RhdGVz
Ci0gKiBAcGRldjogcG9pbnRlciB0byBQQ0kgZGV2aWNlIHN0cnVjdAotICogQHN0YXRlOiBiaXQt
bWFzayBvZiBBU1BNIHN0YXRlcyB0byBkaXNhYmxlCi0gKiBAbG9ja2VkOiBpbmRpY2F0aW9uIGlm
IHRoaXMgY29udGV4dCBob2xkcyBwY2lfYnVzX3NlbSBsb2NrZWQuCi0gKgotICogU29tZSBkZXZp
Y2VzICptdXN0KiBoYXZlIGNlcnRhaW4gQVNQTSBzdGF0ZXMgZGlzYWJsZWQgcGVyIGhhcmR3YXJl
IGVycmF0YS4KLSAqKi8KLXN0YXRpYyB2b2lkIF9fZTEwMDBlX2Rpc2FibGVfYXNwbShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgdTE2IHN0YXRlLCBpbnQgbG9ja2VkKQotewotCXN0cnVjdCBwY2lfZGV2
ICpwYXJlbnQgPSBwZGV2LT5idXMtPnNlbGY7Ci0JdTE2IGFzcG1fZGlzX21hc2sgPSAwOwotCXUx
NiBwZGV2X2FzcG1jLCBwYXJlbnRfYXNwbWM7Ci0KLQlzd2l0Y2ggKHN0YXRlKSB7Ci0JY2FzZSBQ
Q0lFX0xJTktfU1RBVEVfTDBTOgotCWNhc2UgUENJRV9MSU5LX1NUQVRFX0wwUyB8IFBDSUVfTElO
S19TVEFURV9MMToKLQkJYXNwbV9kaXNfbWFzayB8PSBQQ0lfRVhQX0xOS0NUTF9BU1BNX0wwUzsK
LQkJZmFsbHRocm91Z2g7IC8qIGNhbid0IGhhdmUgTDEgd2l0aG91dCBMMHMgKi8KLQljYXNlIFBD
SUVfTElOS19TVEFURV9MMToKLQkJYXNwbV9kaXNfbWFzayB8PSBQQ0lfRVhQX0xOS0NUTF9BU1BN
X0wxOwotCQlicmVhazsKLQlkZWZhdWx0OgotCQlyZXR1cm47Ci0JfQotCi0JcGNpZV9jYXBhYmls
aXR5X3JlYWRfd29yZChwZGV2LCBQQ0lfRVhQX0xOS0NUTCwgJnBkZXZfYXNwbWMpOwotCXBkZXZf
YXNwbWMgJj0gUENJX0VYUF9MTktDVExfQVNQTUM7Ci0KLQlpZiAocGFyZW50KSB7Ci0JCXBjaWVf
Y2FwYWJpbGl0eV9yZWFkX3dvcmQocGFyZW50LCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkJICAmcGFy
ZW50X2FzcG1jKTsKLQkJcGFyZW50X2FzcG1jICY9IFBDSV9FWFBfTE5LQ1RMX0FTUE1DOwotCX0K
LQotCS8qIE5vdGhpbmcgdG8gZG8gaWYgdGhlIEFTUE0gc3RhdGVzIHRvIGJlIGRpc2FibGVkIGFs
cmVhZHkgYXJlICovCi0JaWYgKCEocGRldl9hc3BtYyAmIGFzcG1fZGlzX21hc2spICYmCi0JICAg
ICghcGFyZW50IHx8ICEocGFyZW50X2FzcG1jICYgYXNwbV9kaXNfbWFzaykpKQotCQlyZXR1cm47
Ci0KLQlkZXZfaW5mbygmcGRldi0+ZGV2LCAiRGlzYWJsaW5nIEFTUE0gJXMgJXNcbiIsCi0JCSAo
YXNwbV9kaXNfbWFzayAmIHBkZXZfYXNwbWMgJiBQQ0lfRVhQX0xOS0NUTF9BU1BNX0wwUykgPwot
CQkgIkwwcyIgOiAiIiwKLQkJIChhc3BtX2Rpc19tYXNrICYgcGRldl9hc3BtYyAmIFBDSV9FWFBf
TE5LQ1RMX0FTUE1fTDEpID8KLQkJICJMMSIgOiAiIik7Ci0KLSNpZmRlZiBDT05GSUdfUENJRUFT
UE0KLQlpZiAobG9ja2VkKQotCQlwY2lfZGlzYWJsZV9saW5rX3N0YXRlX2xvY2tlZChwZGV2LCBz
dGF0ZSk7Ci0JZWxzZQotCQlwY2lfZGlzYWJsZV9saW5rX3N0YXRlKHBkZXYsIHN0YXRlKTsKLQot
CS8qIERvdWJsZS1jaGVjayBBU1BNIGNvbnRyb2wuICBJZiBub3QgZGlzYWJsZWQgYnkgdGhlIGFi
b3ZlLCB0aGUKLQkgKiBCSU9TIGlzIHByZXZlbnRpbmcgdGhhdCBmcm9tIGhhcHBlbmluZyAob3Ig
Q09ORklHX1BDSUVBU1BNIGlzCi0JICogbm90IGVuYWJsZWQpOyBvdmVycmlkZSBieSB3cml0aW5n
IFBDSSBjb25maWcgc3BhY2UgZGlyZWN0bHkuCi0JICovCi0JcGNpZV9jYXBhYmlsaXR5X3JlYWRf
d29yZChwZGV2LCBQQ0lfRVhQX0xOS0NUTCwgJnBkZXZfYXNwbWMpOwotCXBkZXZfYXNwbWMgJj0g
UENJX0VYUF9MTktDVExfQVNQTUM7Ci0KLQlpZiAoIShhc3BtX2Rpc19tYXNrICYgcGRldl9hc3Bt
YykpCi0JCXJldHVybjsKLSNlbmRpZgotCi0JLyogQm90aCBkZXZpY2UgYW5kIHBhcmVudCBzaG91
bGQgaGF2ZSB0aGUgc2FtZSBBU1BNIHNldHRpbmcuCi0JICogRGlzYWJsZSBBU1BNIGluIGRvd25z
dHJlYW0gY29tcG9uZW50IGZpcnN0IGFuZCB0aGVuIHVwc3RyZWFtLgotCSAqLwotCXBjaWVfY2Fw
YWJpbGl0eV9jbGVhcl93b3JkKHBkZXYsIFBDSV9FWFBfTE5LQ1RMLCBhc3BtX2Rpc19tYXNrKTsK
LQotCWlmIChwYXJlbnQpCi0JCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93b3JkKHBhcmVudCwgUENJ
X0VYUF9MTktDVEwsCi0JCQkJCSAgIGFzcG1fZGlzX21hc2spOwotfQotCiAvKioKICAqIGUxMDAw
ZV9kaXNhYmxlX2FzcG0gLSBEaXNhYmxlIEFTUE0gc3RhdGVzLgogICogQHBkZXY6IHBvaW50ZXIg
dG8gUENJIGRldmljZSBzdHJ1Y3QKQEAgLTY4NDgsNyArNjc3NSw3IEBAIHN0YXRpYyB2b2lkIF9f
ZTEwMDBlX2Rpc2FibGVfYXNwbShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdTE2IHN0YXRlLCBpbnQg
bG9ja2VkKQogICoqLwogc3RhdGljIHZvaWQgZTEwMDBlX2Rpc2FibGVfYXNwbShzdHJ1Y3QgcGNp
X2RldiAqcGRldiwgdTE2IHN0YXRlKQogewotCV9fZTEwMDBlX2Rpc2FibGVfYXNwbShwZGV2LCBz
dGF0ZSwgMCk7CisJcGNpX2Rpc2FibGVfbGlua19zdGF0ZShwZGV2LCBzdGF0ZSk7CiB9CiAKIC8q
KgpAQCAtNjg2MSw3ICs2Nzg4LDcgQEAgc3RhdGljIHZvaWQgZTEwMDBlX2Rpc2FibGVfYXNwbShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgdTE2IHN0YXRlKQogICoqLwogc3RhdGljIHZvaWQgZTEwMDBl
X2Rpc2FibGVfYXNwbV9sb2NrZWQoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHUxNiBzdGF0ZSkKIHsK
LQlfX2UxMDAwZV9kaXNhYmxlX2FzcG0ocGRldiwgc3RhdGUsIDEpOworCXBjaV9kaXNhYmxlX2xp
bmtfc3RhdGVfbG9ja2VkKHBkZXYsIHN0YXRlKTsKIH0KIAogc3RhdGljIGludCBlMTAwMGVfcG1f
dGhhdyhzdHJ1Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjMwLjIKCgotLSAKYXRoMTJrIG1haWxpbmcg
bGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
