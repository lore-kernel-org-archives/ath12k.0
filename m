Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D8FC02182
	for <ath12k@archiver.kernel.org>; Thu, 23 Jan 2025 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vD6ev/Q9izmh4qjUpLovgYp568RmpGoOLa3bA8TX4A=; b=PsdYhTEPttPbLSQP5BQXJtoBK4
	Ea93af7J1XVQkvJ6A/fnqkFaM7oiq27yK0c+vAvhFjjhgL0A/iUiMaBXlbpMO04+3x8pCFpKGDlur
	pEW9ZeokgbPto/AYpjhiywNDm1HtMGkxYW5cjEa7MntKPOaWImYtIuMYr/JIlnBz3P5IjCvaHu8hw
	zunFCWsDMi3shbrSLq5h7rIzph5cslt7OvSomJJNISw9tVsiORP3txHjJtP6Sl/pIGRy5j3+rQW0V
	aPQEqo8dpLltZmmtB4OI1Ymlr+nB7KHriZexVasBBlXitZrMIyXmjl+BUGkEgnqUCocQfzUNiDDD4
	RwkbJCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tav2l-0000000CHiW-0YTk
	for ath12k@archiver.kernel.org;
	Thu, 23 Jan 2025 11:06:39 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tav2h-0000000CHha-09se
	for ath12k@lists.infradead.org;
	Thu, 23 Jan 2025 11:06:37 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id EA60720172;
	Thu, 23 Jan 2025 12:06:28 +0100 (CET)
Received: from [192.168.108.70] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id DB2FF2012E;
	Thu, 23 Jan 2025 12:06:28 +0100 (CET)
Message-ID: <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
From: Maxime Bizon <mbizon@freebox.fr>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <quic_msinada@quicinc.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 23 Jan 2025 12:06:28 +0100
In-Reply-To: <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
	 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_030635_220951_1183D6FD 
X-CRM114-Status: UNSURE (   7.41  )
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
Reply-To: mbizon@freebox.fr
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Ck9uIE1vbiwgMjAyNS0wMS0xMyBhdCAxNjozOCAtMDgwMCwgUHJhZGVlcCBLdW1hciBDaGl0cmFw
dSB3cm90ZToKCkhlbGxvLArCoAo+IEBAIC04Mzc2LDEwICs4NjM3LDEzIEBAIHN0YXRpYyBpbnQg
YXRoMTJrX21hY19vcF9hZGRfaW50ZXJmYWNlKHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3LAo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGFydmlmLT5iaXRy
YXRlX21hc2suY29udHJvbCk7IGkrKykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYXJ2aWYtPmJpdHJhdGVfbWFzay5jb250cm9sW2ldLmxlZ2FjeSA9IDB4ZmZmZmZmZmY7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFydmlmLT5iaXRyYXRlX21hc2suY29udHJv
bFtpXS5naSA9IE5MODAyMTFfVFhSQVRFX0ZPUkNFX1NHSTsKCmNhbiB5b3UgZXhwbGFpbiB3aHkg
aXQncyBub3QgTkw4MDIxMV9UWFJBVEVfREVGQVVMVF9HSSA/Cgo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgbWVtc2V0KGFydmlmLT5iaXRyYXRlX21hc2suY29udHJvbFtpXS5odF9t
Y3MsIDB4ZmYsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2l6ZW9mKGFydmlmLT5iaXRyYXRlX21hc2suY29udHJvbFtpXS5odF9tY3MpKTsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1lbXNldChhcnZpZi0+Yml0cmF0ZV9tYXNrLmNvbnRy
b2xbaV0udmh0X21jcywgMHhmZiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzaXplb2YoYXJ2aWYtPmJpdHJhdGVfbWFzay5jb250cm9sW2ldLnZodF9tY3Mp
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtc2V0KGFydmlmLT5iaXRyYXRl
X21hc2suY29udHJvbFtpXS5oZV9tY3MsIDB4ZmYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoYXJ2aWYtPmJpdHJhdGVfbWFzay5jb250cm9sW2ld
LmhlX21jcykpOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKCgpUaGUgc2FtZSBpbml0aWFsaXph
dGlvbiBvZiBoZV9tY3MgaXMgbWlzc2luZyBpbiB0aGUgYXRoMTJrX21hY19hc3NpZ25fbGlua192
aWYoKQoKLS0gCk1heGltZQoKCgo=


