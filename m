Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96101CDB487
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Kw4eVXvJdmw5yBNFkYtE6Y12s9aX3Kaj9FOU6GnsSYw=; b=phgNscG2TYN6o/
	aPKIfQ9M/6lxMz7/HhP1+bwf94kdp0WvDxzfOu4WQw3Wrf6twreUWi05/oGorazrH+RTBO+2KSy6P
	ny9gGGM/JMb69VIy9UQEXehjsaXwakzaN5GSX71XZwtnzfhRggbRgPt6lCzGZiBaaKLGJsbFUjuvj
	9pOchzQFf2V/b/u1IHnLSQkdDQo455BHthHZ/3qV+YGin1kTbxGUdoTZIGSnAoBvKSFQEtLWtOwLF
	o9dyiL3GSJz4alz4bRLIO2ZEH7vaORTZ9OeZxOHu0puOwAJZUHOpVWqpuBjNkMhVsnLRn+oPLLYS/
	N51pRr+50L4GPvdDedWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLFE-003trT-12
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 16:42:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrLFA-003toi-2d;
	Fri, 13 Oct 2023 16:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2D17ACE315D;
	Fri, 13 Oct 2023 16:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C518C433C8;
	Fri, 13 Oct 2023 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697215350;
	bh=MqC3yrRRj3UMGOPti8ERknVNqGEUu0oFiV03E0Vidv0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=b86OTm7/vWPz1lXdWBiZn7RcGveX1aFsvL5jmXTq2YbcyNGIbGhWA6q1/AnMGbd1N
	 IFYYegR+vc8lMskeUk8lajThoc+bo1PlPWPhNqD2fwOG3AfKYpg90Eza/kNH0uSNPW
	 Jky7Vj9783vlIkTQS3O7jJucPYVzjXAq/DJZUjUVY+A/BEROWzFLMN0GpWgbN/I8Vu
	 ImQsRWZuesvRBHjxd0H3/8ZdxSWJjJnhbYb4F5CAQ1P15D5R2lTSA+hkWwJq0LpHAe
	 Bn/6fD9G+fr9mHm/5sCM1EEe3TdFQCGEcv6U3ysqKGhpLI6CBcvRuzJ9zOUE+g+0U1
	 YdquVEXDnza8g==
Date: Fri, 13 Oct 2023 11:42:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, ath10k@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	Netdev <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 03/13] PCI/ASPM: Disable ASPM when driver requests it
Message-ID: <20231013164228.GA1117889@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa3386a4-c22d-6d5d-112d-f36b22cda6d3@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_094233_197241_07A7B50C 
X-CRM114-Status: GOOD (  29.33  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDE6NTY6MTZQTSArMDMwMCwgSWxwbyBKw6RydmluZW4g
d3JvdGU6Cj4gT24gV2VkLCAxMSBPY3QgMjAyMywgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiA+IE9u
IE1vbiwgU2VwIDE4LCAyMDIzIGF0IDA0OjEwOjUzUE0gKzAzMDAsIElscG8gSsOkcnZpbmVuIHdy
b3RlOgo+ID4gPiBQQ0kgY29yZS9BU1BNIHNlcnZpY2UgZHJpdmVyIGFsbG93cyBjb250cm9sbGlu
ZyBBU1BNIHN0YXRlIHRocm91Z2gKPiA+ID4gcGNpX2Rpc2FibGVfbGlua19zdGF0ZSgpIGFuZCBw
Y2lfZW5hYmxlX2xpbmtfc3RhdGUoKSBBUEkuIEl0IHdhcwo+ID4gPiBkZWNpZGVkIGVhcmxpZXIg
KHNlZSB0aGUgTGluayBiZWxvdyksIHRvIG5vdCBhbGxvdyBBU1BNIGNoYW5nZXMgd2hlbiBPUwo+
ID4gPiBkb2VzIG5vdCBoYXZlIGNvbnRyb2wgb3ZlciBpdCBidXQgb25seSBsb2cgYSB3YXJuaW5n
IGFib3V0IHRoZSBwcm9ibGVtCj4gPiA+IChjb21taXQgMmFkZDBlYzE0YzI1ICgiUENJL0FTUE06
IFdhcm4gd2hlbiBkcml2ZXIgYXNrcyB0byBkaXNhYmxlIEFTUE0sCj4gPiA+IGJ1dCB3ZSBjYW4n
dCBkbyBpdCIpKS4gU2ltaWxhcmx5LCBpZiBBU1BNIGlzIG5vdCBlbmFibGVkIHRocm91Z2gKPiA+
ID4gY29uZmlnLCBBU1BNIGNhbm5vdCBiZSBkaXNhYmxlZC4KPiAuLi4KCj4gPiBUaGlzIGRpc2Fi
bGVzICphbGwqIEFTUE0gc3RhdGVzLCB1bmxpa2UgdGhlIHZlcnNpb24gd2hlbgo+ID4gQ09ORklH
X1BDSUVBU1BNIGlzIGVuYWJsZWQuICBJIHN1cHBvc2UgdGhlcmUncyBhIHJlYXNvbiwgYW5kIG1h
eWJlIGEKPiA+IGNvbW1lbnQgY291bGQgZWxhYm9yYXRlIG9uIGl0Pwo+ID4KPiA+IFdoZW4gQ09O
RklHX1BDSUVBU1BNIGlzIG5vdCBlbmFibGVkLCBJIGRvbid0IHRoaW5rIHdlIGFjdGl2ZWx5Cj4g
PiAqZGlzYWJsZSogQVNQTSBpbiB0aGUgaGFyZHdhcmU7IHdlIGp1c3QgbGVhdmUgaXQgYXMtaXMs
IHNvIGZpcm13YXJlCj4gPiBtaWdodCBoYXZlIGxlZnQgaXQgZW5hYmxlZC4KPiAKPiBUaGlzIHdo
b2xlIHRyaWNrZXJ5IGlzIGludGVuZGVkIGZvciBkcml2ZXJzIHRoYXQgZG8gbm90IHdhbnQgdG8g
aGF2ZSBBU1BNIAo+IGJlY2F1c2UgdGhlIGRldmljZXMgYXJlIGJyb2tlbiB3aXRoIGl0LiBTbyBs
ZWF2aW5nIGl0IGFzLWlzIGlzIG5vdCByZWFsbHkgCj4gYW4gb3B0aW9uIChhcyBkZW1vbnN0cmF0
ZWQgYnkgdGhlIGN1c3RvbSB3b3JrYXJvdW5kcykuCgpSaWdodC4KCj4gPiBDb25jZXB0dWFsbHkg
aXQgc2VlbXMgbGlrZSB0aGUgTE5LQ1RMIHVwZGF0ZXMgaGVyZSBzaG91bGQgYmUgdGhlIHNhbWUK
PiA+IHdoZXRoZXIgQ09ORklHX1BDSUVBU1BNIGlzIGVuYWJsZWQgb3Igbm90IChzdWJqZWN0IHRv
IHRoZSBxdWVzdGlvbgo+ID4gYWJvdmUpLgo+ID4gCj4gPiBXaGVuIENPTkZJR19QQ0lFQVNQTSBp
cyBlbmFibGVkLCB3ZSBtaWdodCBuZWVkIHRvIGRvIG1vcmUgc3R1ZmYsIGJ1dAo+ID4gaXQgc2Vl
bXMgbGlrZSB0aGUgY29yZSBzaG91bGQgYmUgdGhlIHNhbWUuCj4gCj4gU28geW91IHRoaW5rIGl0
J3Mgc2FmZXIgdG8gcGFydGlhbGx5IGRpc2FibGUgQVNQTSAoYXMgcGVyIGRyaXZlcidzIAo+IHJl
cXVlc3QpIHJhdGhlciB0aGFuIGRpc2FibGUgaXQgY29tcGxldGVseT8gSSBnb3QgdGhlIGltcHJl
c3Npb24gdGhhdCB0aGUgCj4gbGF0dGVyIG1pZ2h0IGJlIHNhZmVyIGZyb20gd2hhdCBSYWZhZWwg
c2FpZCBlYXJsaWVyIGJ1dCBJIHN1cHBvc2UgSSBtaWdodCAKPiBoYXZlIG1pc2ludGVycHJldGVk
IGhpbSBzaW5jZSBoZSBkaWRuJ3QgZXhhY3RseSBzYXkgdGhhdCBpdCBtaWdodCBiZSBzYWZlciAK
PiB0byBfY29tcGxldGVseV8gZGlzYWJsZSBpdC4KCk15IHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhl
IHN0YXRlIG9mIHRoZSBkZXZpY2Ugc2hvdWxkIGRlcGVuZCBvbgpDT05GSUdfUENJRUFTUE0uICBJ
ZiB0aGUgZHJpdmVyIGRvZXMgdGhpczoKCiAgcGNpX2Rpc2FibGVfbGlua19zdGF0ZShQQ0lFX0xJ
TktfU1RBVEVfTDBTKQoKZG8gd2Ugd2FudCB0byBsZWF2ZSBMMSBlbmFibGVkIHdoZW4gQ09ORklH
X1BDSUVBU1BNPXkgYnV0IGRpc2FibGUgTDEKd2hlbiBDT05GSUdfUENJRUFTUE0gaXMgdW5zZXQ/
CgpJIGNhbiBzZWUgYXJndW1lbnRzIGJvdGggd2F5cy4gIE15IHRob3VnaHQgd2FzIHRoYXQgaXQg
d291bGQgYmUgbmljZQp0byBlbmQgdXAgd2l0aCBhIHNpbmdsZSBpbXBsZW1lbnRhdGlvbiBvZiBw
Y2lfZGlzYWJsZV9saW5rX3N0YXRlKCkKd2l0aCBhbiAjaWZkZWYgYXJvdW5kIHRoZSBDT05GSUdf
UENJRUFTUE0tZW5hYmxlZCBzdHVmZiBiZWNhdXNlIGl0Cm1ha2VzIHRoZSBjb2RlIGVhc2llciB0
byByZWFkLgoKQmpvcm4KCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEyawo=
