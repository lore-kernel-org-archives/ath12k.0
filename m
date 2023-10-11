Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32300CDB47E
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 21:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wUS5vJW6bLybl7W2AYgewlt3QQcq8v6lXFW6x2jjYzI=; b=Jz7leO7GBQvBHH
	XYWjFIysbbZj9VgHyqXjEquBInJUxQWc8fF+dPgmpsEJk9Tfhpptpo59I7zbYGeK4kcXOCoMfQbIl
	6S23IRqjgSOUSGU7VWNk+UQGcHn7ei22/lNL2f++uIPMcfThcVbzFh/ASIcVWecSdrVod6Df1yQao
	puroWAewMsLB/arhNOAKdwp9VZCu9mpoj7F5fx00C14yats9DNNpnn0p1bOmHvMUkCg0xL6s2+Dfn
	AiLUarOYlOuUXm9Z/AtlXj+LRoRYFHzQFFVsnoaSlqx7BPxL7wfQfVlJJqzmclltK0yCT2+/lnAua
	9FEI9OzkSkunbby3HFig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqgel-00Gjjg-2w
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 21:22:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqgeg-00Gjgd-2e;
	Wed, 11 Oct 2023 21:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 510AAB82264;
	Wed, 11 Oct 2023 21:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCE2C433C8;
	Wed, 11 Oct 2023 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697059328;
	bh=qpNUqw05PLc7b1md/614fr1Zk6arYszd1WK9gMvl0Os=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ghyoFWHuCUoYAQQVImwLJec5By6IY8ldZU+IpgLhM86gHWNMMGsDK4I3bZN3O9HN6
	 DZ662abX5LzoV0AuEi9+5Ki6vZZQBQwOyiKdPRI4rA2aI7uLPzLKnygGYsAASzsGrz
	 QKdQ9RXXuApQ6HirgahUGTdW+uLPDMBSzhJdQjS18i+uHHpiCtlwWFOhjYSCOugggW
	 Duv0TMGaORQs/RXdvsCl/MbpQ76sczbG4Y1+Ext0ZSAafYpDZUgO9tYsFTZwJorZnI
	 X29tvX4dE26f0/NdjlsksaHY7OVFRWeD2ft2MA6pgB+n+l9lv7LOpuKtJ8H4lcIsBg
	 tvwjDEZAHbqog==
Date: Wed, 11 Oct 2023 16:22:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	ath10k@lists.infradead.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 03/13] PCI/ASPM: Disable ASPM when driver requests it
Message-ID: <20231011212206.GA1043224@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918131103.24119-4-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_142211_122002_05E1CC11 
X-CRM114-Status: GOOD (  22.63  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMDQ6MTA6NTNQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gUENJIGNvcmUvQVNQTSBzZXJ2aWNlIGRyaXZlciBhbGxvd3MgY29udHJvbGxpbmcg
QVNQTSBzdGF0ZSB0aHJvdWdoCj4gcGNpX2Rpc2FibGVfbGlua19zdGF0ZSgpIGFuZCBwY2lfZW5h
YmxlX2xpbmtfc3RhdGUoKSBBUEkuIEl0IHdhcwo+IGRlY2lkZWQgZWFybGllciAoc2VlIHRoZSBM
aW5rIGJlbG93KSwgdG8gbm90IGFsbG93IEFTUE0gY2hhbmdlcyB3aGVuIE9TCj4gZG9lcyBub3Qg
aGF2ZSBjb250cm9sIG92ZXIgaXQgYnV0IG9ubHkgbG9nIGEgd2FybmluZyBhYm91dCB0aGUgcHJv
YmxlbQo+IChjb21taXQgMmFkZDBlYzE0YzI1ICgiUENJL0FTUE06IFdhcm4gd2hlbiBkcml2ZXIg
YXNrcyB0byBkaXNhYmxlIEFTUE0sCj4gYnV0IHdlIGNhbid0IGRvIGl0IikpLiBTaW1pbGFybHks
IGlmIEFTUE0gaXMgbm90IGVuYWJsZWQgdGhyb3VnaAo+IGNvbmZpZywgQVNQTSBjYW5ub3QgYmUg
ZGlzYWJsZWQuCj4gLi4uCgo+ICsjaWZuZGVmIENPTkZJR19QQ0lFQVNQTQo+ICsvKgo+ICsgKiBB
bHdheXMgZGlzYWJsZSBBU1BNIHdoZW4gcmVxdWVzdGVkLCBldmVuIHdoZW4gQ09ORklHX1BDSUVB
U1BNIGlzCj4gKyAqIG5vdCBidWlsZCB0byBhdm9pZCBkcml2ZXJzIGFkZGluZyBjb2RlIHRvIGRv
IGl0IG9uIHRoZWlyIG93bgo+ICsgKiB3aGljaCBjYXVzZWQgaXNzdWVzIHdoZW4gY29yZSBkb2Vz
IG5vdCBrbm93IGFib3V0IHRoZSBvdXQtb2YtYmFuZAo+ICsgKiBBU1BNIHN0YXRlIGNoYW5nZXMu
Cj4gKyAqLwo+ICtpbnQgcGNpX2Rpc2FibGVfbGlua19zdGF0ZV9sb2NrZWQoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsIGludCBzdGF0ZSkKPiArewo+ICsJc3RydWN0IHBjaV9kZXYgKnBhcmVudCA9IHBk
ZXYtPmJ1cy0+c2VsZjsKPiArCXN0cnVjdCBwY2lfYnVzICpsaW5rYnVzID0gcGRldi0+YnVzOwo+
ICsJc3RydWN0IHBjaV9kZXYgKmNoaWxkOwo+ICsJdTE2IGFzcG1fZW5hYmxlZCwgbGlua2N0bDsK
PiArCWludCByZXQ7Cj4gKwo+ICsJaWYgKCFwYXJlbnQpCj4gKwkJcmV0dXJuIC1FTk9ERVY7CgpQ
LlMuIEkgdGhpbmsgdGhpcyBzaG91bGQgbG9vayB0aGUgc2FtZSB0byB0aGUgdXNlciAoc2FtZSBk
bWVzZyBsb2cgYW5kCnNhbWUgdGFpbnQsIGlmIHdlIGRvIHRoYXQpIGFzIHRoZSBDT05GSUdfUENJ
RUFTUE09eSBjYXNlLgoKPiArCXJldCA9IHBjaWVfY2FwYWJpbGl0eV9yZWFkX3dvcmQocGFyZW50
LCBQQ0lfRVhQX0xOS0NUTCwgJmxpbmtjdGwpOwo+ICsJaWYgKHJldCAhPSBQQ0lCSU9TX1NVQ0NF
U1NGVUwpCj4gKwkJcmV0dXJuIHBjaWJpb3NfZXJyX3RvX2Vycm5vKHJldCk7Cj4gKwlhc3BtX2Vu
YWJsZWQgPSBsaW5rY3RsICYgUENJX0VYUF9MTktDVExfQVNQTUM7Cj4gKwo+ICsJcmV0ID0gcGNp
ZV9jYXBhYmlsaXR5X3JlYWRfd29yZChwZGV2LCBQQ0lfRVhQX0xOS0NUTCwgJmxpbmtjdGwpOwo+
ICsJaWYgKHJldCAhPSBQQ0lCSU9TX1NVQ0NFU1NGVUwpCj4gKwkJcmV0dXJuIHBjaWJpb3NfZXJy
X3RvX2Vycm5vKHJldCk7Cj4gKwlhc3BtX2VuYWJsZWQgfD0gbGlua2N0bCAmIFBDSV9FWFBfTE5L
Q1RMX0FTUE1DOwo+ICsKPiArCS8qIElmIG5vIHN0YXRlcyBuZWVkIHRvIGJlIGRpc2FibGVkLCBk
b24ndCB0b3VjaCBMTktDVEwgKi8KPiArCWlmIChzdGF0ZSAmIGFzcG1fZW5hYmxlZCkKPiArCQly
ZXR1cm4gMDsKPiArCj4gKwlyZXQgPSBwY2llX2NhcGFiaWxpdHlfY2xlYXJfd29yZChwYXJlbnQs
IFBDSV9FWFBfTE5LQ1RMLCBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7Cj4gKwlpZiAocmV0ICE9IFBD
SUJJT1NfU1VDQ0VTU0ZVTCkKPiArCQlyZXR1cm4gcGNpYmlvc19lcnJfdG9fZXJybm8ocmV0KTsK
PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoY2hpbGQsICZsaW5rYnVzLT5kZXZpY2VzLCBidXNfbGlz
dCkKPiArCQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfd29yZChjaGlsZCwgUENJX0VYUF9MTktDVEws
IFBDSV9FWFBfTE5LQ1RMX0FTUE1DKTsKClRoaXMgZGlzYWJsZXMgKmFsbCogQVNQTSBzdGF0ZXMs
IHVubGlrZSB0aGUgdmVyc2lvbiB3aGVuCkNPTkZJR19QQ0lFQVNQTSBpcyBlbmFibGVkLiAgSSBz
dXBwb3NlIHRoZXJlJ3MgYSByZWFzb24sIGFuZCBtYXliZSBhCmNvbW1lbnQgY291bGQgZWxhYm9y
YXRlIG9uIGl0PwoKV2hlbiBDT05GSUdfUENJRUFTUE0gaXMgbm90IGVuYWJsZWQsIEkgZG9uJ3Qg
dGhpbmsgd2UgYWN0aXZlbHkKKmRpc2FibGUqIEFTUE0gaW4gdGhlIGhhcmR3YXJlOyB3ZSBqdXN0
IGxlYXZlIGl0IGFzLWlzLCBzbyBmaXJtd2FyZQptaWdodCBoYXZlIGxlZnQgaXQgZW5hYmxlZC4K
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KCkNvbmNlcHR1YWxseSBpdCBzZWVtcyBsaWtlIHRoZSBM
TktDVEwgdXBkYXRlcyBoZXJlIHNob3VsZCBiZSB0aGUgc2FtZQp3aGV0aGVyIENPTkZJR19QQ0lF
QVNQTSBpcyBlbmFibGVkIG9yIG5vdCAoc3ViamVjdCB0byB0aGUgcXVlc3Rpb24KYWJvdmUpLgoK
V2hlbiBDT05GSUdfUENJRUFTUE0gaXMgZW5hYmxlZCwgd2UgbWlnaHQgbmVlZCB0byBkbyBtb3Jl
IHN0dWZmLCBidXQKaXQgc2VlbXMgbGlrZSB0aGUgY29yZSBzaG91bGQgYmUgdGhlIHNhbWUuCgpC
am9ybgoKLS0gCmF0aDEyayBtYWlsaW5nIGxpc3QKYXRoMTJrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTJrCg==
