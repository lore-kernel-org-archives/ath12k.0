Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA7BC001DF
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzYC8OunlAa3LoWvyy1Ta2QJA8rgiePdBInula9AWUU=; b=HuYv4V+Squ5xFN
	B2t17SYmUQV9DcZRBD30U7D17s4t/6jNlG3KQ9iMJ08ZJg6Avp9ltYCq+r4mGeTG1ny9aS6J1BA3x
	DwxR3gOnmNHWG0UC3FFKMb3yugxMuEBfKmPIbPQb7UOPz+BKm88IZ9nhe/uRfvjzMmcNa3wDvOGye
	3W29zPCHUOyO/PR0MrzmgZjEFfOegzuvy3q+J7AdeS6gaTvEawr5QTufl027d2RwnuU2/Yg83ImCa
	g+u+Mc7oDK+SzpJ+APwP6d+O/OfeZA1q1zzCRGdMy++Ydnuyis9ex97UUzEgxyiBRUmKCk/C8/8tm
	xClJ3Bx2ELl7/89isdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUBR-0075wL-0S
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 08:59:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUBN-0075uy-0g
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 08:59:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD1A461CA0;
	Thu,  3 Aug 2023 08:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3C7C433C7;
	Thu,  3 Aug 2023 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691053184;
	bh=FOUSVlS4DmqKvFMq4nd0pwUYJjTJ5rOsM1GI0RE2orc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fctF0RjbY9Hkwv7bfIm3oJ9/22/8OaasWld4SyX1ghA22QVdk+rii5Lc/Lonhxs5b
	 tfrLikiOTFmKdDnRuhMSZROcLDdJQgfyaLc6jL/1WkiqRw0+UJzBOpk/h//IIptOtX
	 +BGIf8bHQKUbBzx14JQ58TcYLU+ZMYmi5jeI1JcB5S2vR2etu7xo1+ROLLrjQ0J17U
	 roVvrikvzFb6pU7jjp1rgYaXBpfnQMtm+ruwomxklode2q3oVWayNcXSzT8BVCJ9nY
	 IO0hVoGUaeAdN9mKuCZKOvKWXLFMbRyR6ss6pI2cijF2lERphQGB7MP0BMlKHueVFg
	 FNcn7kRjq/w9Q==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  Pradeep Kumar Chitrapu
 <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH v5 06/11] wifi: ath12k: prepare EHT peer assoc parameters
References: <20230725224034.14045-1-quic_alokad@quicinc.com>
	<20230725224034.14045-7-quic_alokad@quicinc.com>
	<293dd873-1d9d-afc0-a122-48dfe4bb0fde@quicinc.com>
	<333fd74a-4178-3cef-5748-62a14ba2da5a@quicinc.com>
	<47396ec0-a0b3-8275-b29d-9ed72a9922cf@quicinc.com>
	<eac30246-1360-2854-3f53-28bdf5a24e24@quicinc.com>
Date: Thu, 03 Aug 2023 11:59:40 +0300
In-Reply-To: <eac30246-1360-2854-3f53-28bdf5a24e24@quicinc.com> (Aloka Dixit's
	message of "Thu, 27 Jul 2023 09:59:14 -0700")
Message-ID: <87v8dwtsar.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_015945_358838_6784303E 
X-CRM114-Status: GOOD (  17.28  )
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

QWxva2EgRGl4aXQgPHF1aWNfYWxva2FkQHF1aWNpbmMuY29tPiB3cml0ZXM6Cgo+IE9uIDcvMjYv
MjAyMyAxMDo0OCBQTSwgV2VuIEdvbmcgd3JvdGU6Cj4KPj4gT24gNy8yNy8yMDIzIDEyOjM4IEFN
LCBBbG9rYSBEaXhpdCB3cm90ZToKPj4+IE9uIDcvMjUvMjAyMyA4OjQzIFBNLCBXZW4gR29uZyB3
cm90ZToKPj4+PiBPbiA3LzI2LzIwMjMgNjo0MCBBTSwgQWxva2EgRGl4aXQgd3JvdGU6Cj4+Pj4g
Wy4uLl0KPj4+Pj4gKwo+Pj4+PiArc3RhdGljIHZvaWQgYXRoMTJrX3BlZXJfYXNzb2NfaF9laHQo
c3RydWN0IGF0aDEyayAqYXIsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgaWVlZTgwMjExX3ZpZiAqdmlmLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGllZWU4MDIxMV9zdGEgKnN0YSwKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBhdGgxMmtfd21p
X3BlZXJfYXNzb2NfYXJnICphcmcpCj4+Pj4+ICt7Cj4+Pj4+ICsKPj4+PiBUaGlzIGlzIHRoZSBJ
RXMgb2YgbXkgQVAgYmVsb3csIHRoZW4gaXQgd2lsbCBzdGlsbCBlbnRlcmVkIGludG8KPj4+PiB0
aGlzIGJyYW5jaCBmb3IgbXkgYXRoMTJrIHN0YXRpb24gbW9kZS4KPj4+PiBzdGEtPmRlZmxpbmsu
ZWh0X2NhcCBhbmQgc3RhLT5kZWZsaW5rLmhlX2NhcCBpcyBjb3BpZWQgZnJvbSBwZWVyCj4+Pj4g
cmVtb3RlLCBmb3IgYXRoMTJrIHN0YXRpb24gbW9kZSwgcGVlcgo+Pj4+IHJlbW90ZSBpcyB0aGUg
QVAuIFRoZSBmaWVsZCBvbmx5XzIwbWh6IGlzIG9ubHkgdmFsaWQgd2hlbiB0aGUgSUVzCj4+Pj4g
aXMgZnJvbSBhIHN0YXRpb24gd2hpY2ggb25seSBzdXBwb3J0Cj4+Pj4gMjAgTUh6Lgo+Pj4+Cj4+
Pj4gSSB0aGluayB0aGUgZmxhZyBmcm9tX2FwIHNob3VsZCBiZSBhZGRlZCBoZXJlIGFzIHdlbGwg
YXMgZnVuY3Rpb24KPj4+PiBpZWVlODAyMTFfZWh0X21jc19uc3Nfc2l6ZSgpLgo+Pj4+Cj4+Pj4g
UGxlYXNlIGNvcnJlY3QgbWUgaWYgd3JvbmcuCj4+Pj4KPj4+Cj4+PiBPa2F5LCBjYW4geW91IGZp
eCB0aGlzIGluIGEgZm9sbG93LXVwIHBhdGNoPwo+Pj4gSSBkb24ndCBoYXZlIGEgZGV2aWNlIHRv
IHRlc3QgdGhlIHN0YXRpb24gbW9kZSB0byB2ZXJpZnkgYSBmaXguCj4+PiBUaGFua3MuCj4+IFRo
ZSBmaXggcGF0Y2ggaXMgc2ltcGxlIGxpa2UgdGhpcyAoSSBoYXZlIHZlcmlmaWVkIE9LKSwgeW91
IGNhbgo+PiBtZXJnZSBpdCB0byB5b3VyIHBhdGNoLvCfmIEKPj4gSXQgaXMgdG8gbm90IHVzZSBv
bmx5XzIwbWh6IHdoZW4gYXRoMTJrIGlzIHN0YXRpb24gbW9kZS4KCldlbiwgcGxlYXNlIHN1Ym1p
dCBhIGZvbGxvdy11cCBwYXRjaCB3aGljaCBleHBsYWlucyB0aGUgc2l0dWF0aW9uCmNsZWFybHku
IFRoZSByZWFzb25pbmcgZm9yIHlvdXIgY2hhbmdlIGlzIG5vdCBvYnZpb3VzIGZvciBtZS4gQWxz
bwpjb25zaWRlciBpZiB0aGVyZSBzaG91bGQgYmUgYSBjb21tZW50IGluIHRoZSBjb2RlLgoKPiBF
dmVyeSB0aW1lIEkgcmUtYmFzZSB0aGUgc2VyaWVzIEkgaGF2ZSB0byB0ZXN0LCBhZGQgY292ZXIt
bGV0dGVyLAo+IGNoYW5nZS1sb2cgaW4gMTEgcGF0Y2hlcy4KCkJUVyB5b3UgZG9uJ3QgbmVlZCB0
byBhZGQgYSBjaGFuZ2Vsb2cgb24gZXZlcnkgcGF0Y2guIElNSE8gaXQncyBhIGxvdAplYXNpZXIg
Zm9yIGV2ZXJ5b25lIGlmIGFsbCB0aGUgY2hhbmdlcyBhcmUgbGlzdGVkIGluIHRoZSBjb3ZlciBs
ZXR0ZXIsCm5vIG5lZWQgcmVwZWF0IHRoYXQgaW5mb3JtYXRpb24gaW4gaW5kaXZpZHVhbCBwYXRj
aGVzLgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJl
bGVzcy9saXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVy
cy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgotLSAKYXRoMTJrIG1haWxpbmcgbGlz
dAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
