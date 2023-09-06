Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A86EB8FD5
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2Rb4jJrXXV1CSTbciGA526HsyjiqipKEFqD0UKwriQ=; b=lVN9ag6f6q7XDy
	Ktz97EK3q0+TLH/UKYmN2AxCzBxeOwuKUPE3RqimVWnWvo7gl9Nye2lFr4qVJXIAN2mzi9d2f4tP9
	r96fIO9ePOzsP58Pumvc/m9l6GKnLR18Y8Y+6ca8XXe6+FdHLxJpA7wuc7xK1psRD87Cn6PBtJCTS
	JzvDbYg2OG2wbK+D7eBarbN309DoVZUSJxMSZw4u33aO4vJMfAS4fwxQcPxCor6PYiHxI1RtlY+hW
	zrJeomXxLWZWzef+OTXDvgFlOiIzufyuTe3YdJNeNFB8JCXwClzay2lyTt0ibRGz8IaV2+VJu+mri
	LUu9V10OYpM79J1oAJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdt8g-00AAJ2-20
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 14:04:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdt8e-00AAIa-2a
	for ath12k@bombadil.infradead.org;
	Wed, 06 Sep 2023 14:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4BUGEKyHEDHhYD8mn2uDgzJrEi1Ev7Lx4zxbjDrZ3HA=; b=kQYMut0xgGm9Jbhea5xDUHis0N
	LzWjgLK4KzRKVKAiy6Hxnf/xtL4Dx/PFko/IJMxf61VZQob+ZB9N8TsSgvur1Yz9WV4BsZ3TnkQrG
	Q2Zkf2UsRrJASvi2roVanr48KxrwB4otI9EuEb+SqQJxYwZm9t3Wi637RLVdzN7zhEVZjfBQUdIgv
	eGN4Ax2ld0P7w4R53tm9be145lwbhi8RHjxxuUqsOfXv8PuskDm3fiqPDi5j/x/LwM2VruPf0DURp
	I4pL6aTOKibM34h55ysd5PfO+RjHKMmQYWE7RlnF3Mw/NyzwHDHJSoUyZIdWAhNTslihhRbd5YkFA
	1pALRqfw==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdt8Y-0018Oa-2N
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 14:04:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C801BB81AC6;
	Wed,  6 Sep 2023 14:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94CFC433C7;
	Wed,  6 Sep 2023 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694009045;
	bh=UJQG+KIiBkrrTD4Kn778GnWoYcw21vRQxo5QXRLr95k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LKxk0jMb/5feztuCZIr/U+ua7xeFHovb/P4pmAuoziArFcuxBwN+E1RA83RxfBLTJ
	 cnGXmCYC1HswDtw+I3Y5jvOi6zkWR0gIguz5K6zArxQ34td9+sqJO0lvNiIRsVGBUX
	 Wx2EZEWqF1MrhIk/p+0u1N/6mcgPPf+yF5go216qRoBGoR27WUTYAbKT09s5ku6tXW
	 M4J9olOhjVFftrncOhfFEGeL0kgndNqR+OXmj7XGgx0IM5WqH3eI0JHN+mZQpvNo9n
	 RF/b9HbZsQ9yQCfe6zh3mkYGSlpZbJ865TUH50/3+A4hS1bwLg1DBbWO6NrhDBlG0r
	 rIf7T0gWhKpXA==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>
Subject: ath12k-check warnings
References: <20230824025432.19406-1-quic_wgong@quicinc.com>
	<169295002356.1753110.7150166655358699685.kvalo@kernel.org>
	<5376cd01-ab3e-416f-ea73-649c82e3bc40@quicinc.com>
Date: Wed, 06 Sep 2023 17:04:02 +0300
In-Reply-To: <5376cd01-ab3e-416f-ea73-649c82e3bc40@quicinc.com> (Wen Gong's
	message of "Mon, 28 Aug 2023 14:09:48 +0800")
Message-ID: <87cyyve6ul.fsf_-_@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_150408_642246_A34B5788 
X-CRM114-Status: GOOD (  18.38  )
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

KGRyb3BwaW5nIGxpbnV4LXdpcmVsZXNzIGFuZCBjaGFuZ2luZyB0aGUgdGl0bGUpCgpXZW4gR29u
ZyA8cXVpY193Z29uZ0BxdWljaW5jLmNvbT4gd3JpdGVzOgoKPiBPbiA4LzI1LzIwMjMgMzo1MyBQ
TSwgS2FsbGUgVmFsbyB3cm90ZToKPgo+PiBOZXcgd2FybmluZzoKPj4KPj4gZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEyay93bWkuYzo0MTk5OjY5OiB3YXJuaW5nOiByZXN0cmljdGVkCj4+
IF9fbGUzMiBkZWdyYWRlcyB0byBpbnRlZ2VyCj4+Cj4+IFJlbWVtYmVyIHRvIEFMV0FZUyBydW4g
YXRoMTJrLWNoZWNrLgo+Pgo+PiBQYXRjaCBzZXQgdG8gQ2hhbmdlcyBSZXF1ZXN0ZWQuCj4KPiBJ
IGZvdW5kIGF0aDEyay1jaGVjayBvdXRwdXQgbWFueSBsb2dzLCBhYm91dCA1MDAwIGxpbmVzLgo+
Cj4gQW5kIGF0aDEyay1jaGVjayBvbmx5IGhhcyBvbmUgaXRlbSBpbiBDSEVDS1BBVENIX0lHTk9S
RSwgaXQgZG9lcyBub3QgCj4gaGF2ZSB0aGUgb3RoZXIgaXRlbXMgd2hpY2gKPgo+IGV4aXN0ZWQg
aW4gYXRoMTBrLWNoZWNrL2F0aDExay1jaGVjaywgc28gYXRoMTJrLWNoZWNrIG91dHB1dCBtYW55
IGluZm8KPgo+ICJzdHJ1Y3TCoCBzaG91bGQgbm9ybWFsbHkgYmUgY29uc3QiLyJuZXR3b3JraW5n
IGJsb2NrIGNvbW1lbnRzIGRvbid0IHVzZSAKPiBhbiBlbXB0eSAvKiBsaW5lLCB1c2UgLyogQ29t
bWVudC4uLiIvLgo+Cj4gQWxzbyBpdCBwcmludCBtYW55ICJub3RlOiBpbiBpbmNsdWRlZCBmaWxl
IC4uLiIgYnkgc3BhcnNlLgo+Cj4KPiBNYXkgSSBjaGFuZ2UgYXRoMTJrLWNoZWNrIHdpdGggZGlm
ZiBiZWxvdyBhbmQgdXNlICJhdGgxMmstY2hlY2sgfCBncmVwIAo+IC12ICJub3RlOiBpbiBpbmNs
dWRlZCBmaWxlIiIgZm9yIHRoZSBwYXRjaCBjaGVjaz8KPgo+IHdnb25nQHdnb25nLUxhdGl0dWRl
LUU2NDMwOn4vb3BlbnNvdXJjZS9rZXJuZWwvYXRoJCAuL2F0aDEyay1jaGVjayAtLXZlcnNpb24K
PiAvaG9tZS93Z29uZy9vcGVuc291cmNlL2tlcm5lbC9hdGgvLi9hdGgxMmstY2hlY2s6MzI6IERl
cHJlY2F0aW9uV2FybmluZzogCj4gVGhlIGRpc3R1dGlscyBwYWNrYWdlIGlzIGRlcHJlY2F0ZWQg
YW5kIHNsYXRlZCBmb3IgcmVtb3ZhbCBpbiBQeXRob24gCj4gMy4xMi4gVXNlIHNldHVwdG9vbHMg
b3IgY2hlY2sgUEVQIDYzMiBmb3IgcG90ZW50aWFsIGFsdGVybmF0aXZlcwo+ICDCoCBpbXBvcnQg
ZGlzdHV0aWxzLnNwYXduCj4gYXRoMTJrLWNoZWNrIChtZDVzdW0gMTk0YzZkNmM0YmFkNDdmOTc4
MGZlMjI1NDFmMmY2OGMpCj4KPiBnY2M6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnY2MgKFVidW50
dSAxMS40LjAtMXVidW50dTF+MjIuMDQpIDExLjQuMAo+IHNwYXJzZTrCoMKgwqDCoMKgwqDCoMKg
IDAuNi40IChVYnVudHU6IDAuNi40LTIpCj4gY2hlY2twYXRjaC5wbDrCoCBWZXJzaW9uOiAwLjMy
IChtZDVzdW0gYjE2OWRjYjQ1YTdmMzJiZDE5YjEyOGUwODI4OGU5Y2MpCj4gZ3RhZ3M6wqDCoMKg
wqDCoMKgwqDCoMKgIGd0YWdzIChHbG9iYWwpIDYuNi43CgpJIGFzc3VtZSB0aGlzIGlzIGJlY2F1
c2UgeW91IGFyZSB1c2luZyBhbiBvbGQgdmVyc2lvbiBvZiBjaGVja3BhdGNoLnBsLgpJIGZvcmdv
dCB0byB1cGRhdGUgdGhlIGNvbW1pdCBpZCBpbiBhdGgxP2stY2hlY2sgc2NyaXB0cyBidXQgSSBm
aXhlZCBpdApub3c6CgpodHRwczovL2dpdGh1Yi5jb20vcWNhL3FjYS1zd2lzcy1hcm15LWtuaWZl
L2NvbW1pdC8yN2Q5NTc0Y2U2NzBkNzU5NjgxYjY2MmUzODBhODI2Y2E2MTA2ZTQ4CgpUaGlzIGlz
IHRoZSBjb3JyZWN0IHZlcnNpb24gb2YgY2hlY2twYXRjaC5wbCB5b3Ugc2hvdWxkIGJlIHVzaW5n
IChhbHNvCnByaW50ZWQgaW4gLS1oZWxwKToKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9wbGFpbi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGw/aWQ9MzYyMTczNTcyYTQwMThlOWM4ZTM5YzYxNjgyMzE4OWM0MWQzOWQ0MQoKRGlkIHRo
YXQgZml4IHRoZSBpc3N1ZT8KCkkgYWxzbyBhZGRlZCBhIGNoZWNrIHRvIG1ha2Ugc3VyZSB0aGF0
IEkgZG9uJ3QgZm9yZ2V0IHRvIHVwZGF0ZSB0aGUKY29tbWl0IGlkIGluIHRoZSBmdXR1cmU6Cgpo
dHRwczovL2dpdGh1Yi5jb20vcWNhL3FjYS1zd2lzcy1hcm15LWtuaWZlL2NvbW1pdC9jODgwMzE0
YWRiYjEwMDYxODQyNjVmMDAyMDE2ZWMzZjg3YmVmNDBkCgpQbGVhc2UgYWx3YXlzIHJlcG9ydCBh
bnkgaXNzdWVzIHlvdSBoYXZlIHdpdGggYXRoMTJrLWNoZWNrLiBZb3Ugc2hvdWxkCnNlZSBubyB3
YXJuaW5ncyBpbiBvdXRwdXQsIG90aGVyd2lzZSBzb21ldGhpbmcgaXMgd3JvbmcuCgotLSAKaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpo
dHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRp
b24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMmsgbWFpbGluZyBsaXN0CmF0aDEya0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2F0aDEyawo=
