Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A0AC5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 23:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5guak/l5UyDzlzPmHmh7n4osKYDtyW2ixRiNRrlsVf4=; b=RQ+5NdZfHzTErTFUpnE/t50R2m
	VMcv9V1mBg1u6McETw5vDk9wpE6H+tPK9F1dZAcHRX8W/tXnkegubZ4VGVtO9Kv3Ws66BPc27e5GF
	tI04c2Md9jDN27bAnFP/Y04U0uV55W+kggPwcUkmUTYKsKph/6qvOdXy+azW7fPhSnujyNnzLPlw7
	9In3MCLkbgl+Zy5OjWnhEkF7x+DF5+tR21hC89g2W+htKnZE2MbNfQ8n0gWzZZN0i2Y36nvlbnRwd
	x+H9DLwhHSaFy4o6xvbV/PdzbSCi1bNDuzfNw8+K5ja+3QoXBu1/5vOaVT/tm2Mt+gmufO4D+46ve
	3FSKo3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxC0H-0000000CKMK-0tE3;
	Thu, 20 Aug 2026 23:16:57 +0000
Received: from out-100.mta1.migadu.com ([2001:41d0:203:375::64] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxC0E-0000000CKLf-2dKw
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 23:16:56 +0000
X-Envelope-To: ath12k@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5guak/l5UyDzlzPmHmh7n4osKYDtyW2ixRiNRrlsVf4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787267810; v=1; x=1787872610;
 b=Std8W8DMAuz/RwYj3n6pc3fKQo5N/Lu4h2NN+EnbDcfx2ng01Bimkl04DxK3iPuaoRfI6jdW
 JqBt8ViDTFQrsYsEtJ+umn7CotuTNjLl6jtEl8nm2jAryVE61sRnu/u0wiujN95iskSZ+6gIxgU
 Y7cdCTBb+uz7XZlLJBqCBAAigJ+kLmztRLPXj1HwTwUzQnUkPj+qtihLkg9725WH4AkcrxnG4M/
 GnNy9SSq6EDrPCN3C6+b4u4bRSrT5M+Y1XYF35lBtxA7HQgyjTkMMlUJbz5VsKQRWucYVx4gI9Q
 h9ALGwDJJxqyi20Lgc7C+HL3b1QiUYNEXSX+i2IibctBg==
X-Envelope-To: ath12k@lists.infradead.org
Received: from fedora (187.15.154.68)
	by smtp.migadu.com with ESMTPS id c467778d2f607571;
	Thu, 20 Aug 2026 23:16:50 +0000
X-Mizu-Trace-ID: c467778d2f607571
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Benjamin Berg <benjamin@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Benjamin Berg <benjamin.berg@intel.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH wireless-next v3 2/8] wifi: mac80211: change public RX API to use link stations
Date: Thu, 20 Aug 2026 16:15:04 -0700
Message-ID: <20260820231504.137503-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1bdf4b7d-2f05-4ae3-8304-60697d2c849d@oss.qualcomm.com>
References: <20260819135703.4072215-10-benjamin@sipsolutions.net> <20260819155703.af6d319e6b61.I4a2d45609e94b52654b10ec572e59a45d09c41f4@changeid> <1bdf4b7d-2f05-4ae3-8304-60697d2c849d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_161655_236478_53A12EF7 
X-CRM114-Status: UNSURE (   7.81  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2026 at 10:56:14AM -0700, Jeff Johnson wrote:
> The fix is trivially `= NULL`.

That does fix the first frame in a batch, but it cannot fix the ones after
it. The initialiser runs once, at entry, and mt76_rx_complete() reuses the
same variable for every frame and again in the A-MSDU loop. So once a frame
with a wcid has written a station into it, the next frame without one keeps
that station rather than reading NULL.

That is the case I measured on an MT7922. Sixteen frames out of roughly
4000 were handed a leftover station, and every one had a wcid-bearing frame
ahead of it in the same batch, so an initialiser would not have caught any
of them.

Clearing it on the no-wcid path inside mt76_rx_convert() covers both.

Devin

