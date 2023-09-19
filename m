Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C738CD54AE
	for <ath12k@archiver.kernel.org>; Tue, 19 Sep 2023 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zz9AZe5NU2NS5f9Dt86ViUwVAl3Ya9AXfM9Th5SjtSM=; b=gBSn6eIuMYMz2i
	zYvZEp/ULI4hhD1An67hAYc39+doyYU1/2FpUHxKT1KnY9h/G+1ixwnTJ12kofL2T+GrCAxjxPqf4
	jbQVtDXuhz3aZtMreuK8km5CDHOM9oYdfBjmK7VFWtVvi+hKKbw2mJTZhuGDOacwVeHfTQeJQbntl
	+kKO86un07tVgxdk3iMa7y4h/WoHMc+gK1A8HgmEmejqzQ7k+Z8If6AZk+VqK0bFj/TrTHfhpM7O2
	7Z4+rJBhH2DI1uLHLjERWfcJI9xmdW4UvAFnDXxTAdOLxgQQuP/sXPD6CO1cN0R9uXVofU3UOlCxj
	8umkhhX0yQD63ATnzFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXED-00HWdm-1D
	for ath12k@archiver.kernel.org;
	Tue, 19 Sep 2023 09:41:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXE9-00HWb2-0e;
	Tue, 19 Sep 2023 09:41:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8FE0FB8117B;
	Tue, 19 Sep 2023 09:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA312C433C8;
	Tue, 19 Sep 2023 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695116462;
	bh=m+3hur1NYakFhwVVM9QubHkOlW+nEYeKslg6uKnJKmU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CML037E+zpEE3oZZc6aRLXqmea6pNid/66KYalApNxJSjydgAg0WstMAoFXN+hJt1
	 I4xt00gNzk3Qs290qAspY0vBXL2okCcTREoiXyFqeb4w1okB2ISdofz3iZS2abZOi/
	 siE9o8KPpUQfhz5/DuJ2gIDlrC1ONtdyfjpy3JU9vIFH5zWwSOhwWtLNz50zCrdeIM
	 ZtOaUscuX6VwtJjEyUmovQxRjGYtisMfGH4dXBoGxZGdkEiYTgdv+nF9l0Y4CtuIBc
	 9Wnkbpsu0I7bev8qa0W0yXdxbSZwOtM1rRCXioy1HFeq3udvFr1hpMc6v4rdqTu+6Q
	 P0yXf7kKd4jXQ==
From: Kalle Valo <kvalo@kernel.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,  Bjorn Helgaas <helgaas@kernel.org>,  Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,  Lukas Wunner
 <lukas@wunner.de>,
  "Rafael J . Wysocki" <rafael@kernel.org>,  Heiner Kallweit
 <hkallweit1@gmail.com>,  Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
  linux-kernel@vger.kernel.org,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  ath11k@lists.infradead.org,
  intel-wired-lan@lists.osuosl.org,  linux-arm-kernel@lists.infradead.org,
  linux-bluetooth@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  linux-rdma@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH v2 11/13] wifi: ath12k: Use pci_disable/enable_link_state()
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
	<20230918131103.24119-12-ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Sep 2023 12:40:55 +0300
In-Reply-To: <20230918131103.24119-12-ilpo.jarvinen@linux.intel.com> ("Ilpo
	=?utf-8?Q?J=C3=A4rvinen=22's?= message of "Mon, 18 Sep 2023 16:11:01
 +0300")
Message-ID: <87ediubivs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_024105_370578_607E487E 
X-CRM114-Status: UNSURE (   9.60  )
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

SWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPiB3cml0ZXM6Cgo+
IGF0aDEyayBkcml2ZXIgYWRqdXN0cyBBU1BNIHN0YXRlIGl0c2VsZiB3aGljaCBsZWF2ZXMgQVNQ
TSBzZXJ2aWNlCj4gZHJpdmVyIGluIFBDSSBjb3JlIHVuYXdhcmUgb2YgdGhlIGxpbmsgc3RhdGUg
Y2hhbmdlcyB0aGUgZHJpdmVyCj4gaW1wbGVtZW50ZWQuCj4KPiBDYWxsIHBjaV9kaXNhYmxlX2xp
bmtfc3RhdGUoKSBhbmQgcGNpX2VuYWJsZV9saW5rX3N0YXRlKCkgaW5zdGVhZCBvZgo+IGFkanVz
dGluZyBBU1BNQyBmaWVsZCBpbiBMTktDVEwgZGlyZWN0bHkgaW4gdGhlIGRyaXZlciBhbmQgbGV0
IFBDSSBjb3JlCj4gaGFuZGxlIHRoZSBBU1BNIHN0YXRlIG1hbmFnZW1lbnQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CgpB
Y2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9yZz4KCi0tIApodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2ly
ZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0
aW5ncGF0Y2hlcwoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJr
Cg==
