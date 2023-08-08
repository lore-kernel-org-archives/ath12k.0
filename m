Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C37C001DF
	for <ath12k@archiver.kernel.org>; Tue,  8 Aug 2023 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vo6REpDMOrxgs432P3Kpj0IpQ9VP48KotsWCDwYxDhk=; b=wJZtJWC6xUYjtg
	Q3aYMxVuL46VpVUeKiycCI4GQf5LIGYw6EqPtpC/IbRN3pvl4CiW/3C3+WaEeYeQfThG8xPv7pZIf
	y4BF/28pwiUbwlfJ2tLM3vdY4+nfC+zbDEz6lG+dOyvymzCvLt+qRxUCDSZ633wkud0Oc+wJ5yh4f
	jITjFBoPKkEzDGSqxB2Qug0ILpZWCI4+pZP8sYpH/jQ7J0lT27GWlsuCmyLKt06Mjz46DW/j22u98
	DXk97UYfT+9b3xhrRTr0jcrbdWDPlhGMOryBOOsT2c5oHtwlzSZyXoxadgDdwg2y9Di17zY37Tm70
	NEDx4wjwMUhHroLXtsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKNU-002Q59-1I
	for ath12k@archiver.kernel.org;
	Tue, 08 Aug 2023 10:55:52 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKNR-002Q4H-0H
	for ath12k@lists.infradead.org;
	Tue, 08 Aug 2023 10:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8YfCtcbe4WPmkqSYcWXFF4mhHo97h/r2CF3qRV1YvRU=;
	t=1691492146; x=1692701746; b=mhQmfg9LupClbG3gO82/eJeF4MHYIRSOorbcUREcWLxD3fV
	aUGFeJImudm3ntybCj/zMqitVOHNkdNoRmT82m0U3GdDdgaArExgGA/XbLqKs5TaTe3C6b6qtw0nf
	8yhyYxzR+0sQ5RCSS/AjTCBJpg7rPifeq1EDSgpKtiRL4p5oTrW9qYSeuqs7V1fbFATuFRG+E4UpS
	z6Ar547Us4meAkYOTpbpqPY1/AcaGgAzmS4ecm3DvOabpQihQCSGbTQkQN8w7echfBYwZVT03qtK8
	VpvEiP8/48ian+3UAJgy6psgYKBpxqv95l73GKgofMJ64GAKRxbsig5pSST764Qw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qTKNL-00CZrr-22;
	Tue, 08 Aug 2023 12:55:43 +0200
Message-ID: <6ccf4549011f0efa67523d1c171b23694122ec6c.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow when scanning with
 extraie
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 08 Aug 2023 12:55:42 +0200
In-Reply-To: <20230807030806.9345-1-quic_wgong@quicinc.com>
References: <20230807030806.9345-1-quic_wgong@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_035549_329072_48278203 
X-CRM114-Status: GOOD (  18.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi,

Since I'm covering for Kalle right now ...

On Sun, 2023-08-06 at 23:08 -0400, Wen Gong wrote:
> If cfg80211 is providing extraie's for a scanning process then ath12k will
> copy that over to the firmware. The extraie.len is a 32 bit value in struct
> element_info and describes the amount of bytes for the vendor information
> elements.
> 
> The WMI_TLV packet is having a special WMI_TAG_ARRAY_BYTE section. This
> section can have a (payload) length up to 65535 bytes because the
> WMI_TLV_LEN can store up to 16 bits. The code was missing such a check and
> could have created a scan request which cannot be parsed correctly by the
> firmware.
> 
> But the bigger problem was the allocation of the buffer. It has to align
> the TLV sections by 4 bytes. But the code was using an u8 to store the
> newly calculated length of this section (with alignment). And the new
> calculated length was then used to allocate the skbuff. But the actual code
> to copy in the data is using the extraie.len and not the calculated
> "aligned" length.
> 
> The length of extraie with IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS enabled
> was 264 bytes during tests with a wifi card. But it only allocated 8
> bytes (264 bytes % 256) for it. As consequence, the code to memcpy the
> extraie into the skb was then just overwriting data after skb->end. Things
> like shinfo were therefore corrupted. This could usually be seen by a crash
> in skb_zcopy_clear which tried to call a ubuf_info callback (using a bogus
> address).

I feel these are two separate issues. Having a large enough TLV that the
firmware cannot parse it is highly unlikely to happen, and not really an
issue here.

Please split this into two patches, and fix *just* the buffer overflow
in a patch titled "Fix buffer overflow". I believe simply changing the
variable type is sufficient for this, as the code is otherwise
equivalent. That's a patch I'd take to wireless at this stage (rc5), but
probably not the entire bigger change.

johannes


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
