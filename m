Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24415C433FE
	for <ath12k@archiver.kernel.org>; Tue, 18 Oct 2022 09:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2oy7/ge4mBGyCK1TzIWICLA/lH8Y/sG7l6bXDRiFwA=; b=dBV8TV+1CuqHkC
	gJYd2ilPTGTvpXr311Z2QQDG6dr9lES2ps/b0Bt9W7JxiNDrzeAyRZyTDSFjyCG66y0EIopHHVrzK
	Zyt423cb80lCpPbSphpF2c5PjmQCBoVbSfgi+vGIbNw5miPkZh3MsfE91/NJR09NgLcAfw5HACY0s
	8oZzVfFlFQiahy0ulLh3wVHcaQd4sZSxlsNb1LDsmSGwwzAC2ZT8zoLco5U0IguO2kR0YeSx/K5Ev
	wmtkM1Ha/WrNOXRBD6I8wHfiCfj61dSLcuK4AQ0FfiDBAJZ3keUmXZiXK3epL/DX4mIkSfT1304eP
	+qe+YeNf6GtGm6w0KdjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjGZ-005J6m-Hz
	for ath12k@archiver.kernel.org; Tue, 18 Oct 2022 09:52:07 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjGW-005ItG-Q8; Tue, 18 Oct 2022 09:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=3wbT9fC4VXzzYQ3W/AWIk9fua5zDcBDlenKizE7+J/k=;
	t=1666086722; x=1667296322; b=iMzgvqrAc5/XyzTR79o339ldqCdlosCPHG3C54st9PB1fil
	upNkZmxKoSRlIkvUZfQZ426olzEifao9+VNCeFBqUhIyBwWckMr+sFzpb3sYeRY1R3m/GqBKH1pn5
	qLyNV6+b7ZJerFvC8EAZGrHQVgE002exUUZ7AjIa7713LaQ1KSTEFWQPDQdGE9CWxO98T8Nq+TxVe
	d+G7Ewbm0z5U6UHrs59zRoBC5cQkd9VJA16glJGpN+S9EVViuE457f2LCTBe2qaeSO2veHF/TfclT
	2y7bMuPMzXSa5GkW88TcL6o1HEoZTUybCa59bzk4gZE4qS4DMWmqIr7j8hTPUimg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1okjGO-00A7HN-2M;
	Tue, 18 Oct 2022 11:51:56 +0200
Message-ID: <f210cf2a6e3f62156ae6a9d6c7de20e16bd4d6e6.camel@sipsolutions.net>
Subject: Re: [PATCH 01/15] mac80211: split bss_info_changed method
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Tue, 18 Oct 2022 11:51:55 +0200
In-Reply-To: <7e72034a-497a-000c-d7bf-3ec974af9e1c@quicinc.com>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
	 <20220601093922.347d47c279fe.I15937cfe8405999084f164ddf57390f8b8d2bc61@changeid>
	 <c38b4da8-488b-2d09-631a-1bb6c07440a6@quicinc.com>
	 <3483d05c1d5a39b9243b54d9f28450344a897655.camel@sipsolutions.net>
	 <bd6545a8-57a3-5849-52d5-c1a449ab1712@quicinc.com>
	 <d0994456d3a9ea00b5cc472df7822d53d189399e.camel@sipsolutions.net>
	 <7e72034a-497a-000c-d7bf-3ec974af9e1c@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025204_867488_747D8F13 
X-CRM114-Status: UNSURE (   6.65  )
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

T24gVHVlLCAyMDIyLTEwLTE4IGF0IDE3OjUwICswODAwLCBXZW4gR29uZyB3cm90ZToKPiA+IAo+
ID4gaHR0cHM6Ly9wLnNpcHNvbHV0aW9ucy5uZXQvMDY1MmJiYmJlMzUwYjEyNi50eHQKPiAKPiBD
b25mbGljdCBoYXBwZW5lZCB3aGlsZSBydW4gImdpdCBhbSIgdGhlIHBhdGNoLgo+IAo+IEJlY2F1
c2UgbWlzc2luZyB0aGXCoCAiY2hhbmdlZCB8PSBCU1NfQ0hBTkdFRF9FSFRfUFVOQ1RVUklORzsi
IGluIG15IAo+IGxvY2FsIGNvZGUsCj4gCj4gYWxzbyBpdCBpcyBtaXNzaW5nIGluIAo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3dpcmVsZXNzL3dpcmVs
ZXNzLW5leHQuZ2l0L3RyZWUvbmV0L21hYzgwMjExL3V0aWwuYwo+IAo+IE1heWJlICJjaGFuZ2Vk
IHw9IEJTU19DSEFOR0VEX0VIVF9QVU5DVFVSSU5HOyIgaXMgb25seSBleGlzdGVkIGluIHlvdXIg
Cj4gbG9jYWwgY29kZT8KPiAKCkFoIHllcywgd2UgZGlkbid0IHVwc3RyZWFtIHRoYXQgYmVjYXVz
ZSB0aGVyZSdzIHN0aWxsIHRoaXMgZGlzY3Vzc2lvbgphYm91dCBoYW5kbGluZyBwdW5jdHVyaW5n
LiBCdXQgeW91IGNhbiBwcm9iYWJseSBhcHBseSBhcm91bmQgdGhhdC4KCmpvaGFubmVzCgotLSAK
YXRoMTJrIG1haWxpbmcgbGlzdAphdGgxMmtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwczovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMmsK
