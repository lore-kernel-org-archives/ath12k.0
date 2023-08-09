Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8307C001B0
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xq5ahnfzKtN9tGZ3SZlNGVGN6/VxQZGqSdUTxkSQnxM=; b=0f6REL2e85BW6Y
	4vJvYMkoz4YuhZK0paOhOapYBpsSpLUpnSqwKpTXV1h9H1RIgrKb3YrJuaxRxTu0KczYO+i4BI7Ir
	svOEbvko37zKp3YGmqZ8JQBEO2w107IuxgEVSVLyhybhVDZNAWUmxm5eJ6qb/NHlo+8MMFcs1jx8+
	W4JRcWgWLBZD62Dv6nsQZsBXlOUn2vcrjxPVI8OIGpt7k68TtnUJYN0jrd0/KAcut1pBW7kp74/rB
	u4jkQEYu39e7aDwcTeKpt6hi8ycD9jaYhnVZZQSRKHge9m1QcVZMU4AyVCHPOHUu4CATwFatuFXU5
	F291aYhs5DGbkzZF+kwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTi7k-004sJl-1I
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 12:17:12 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTi7h-004sJR-2I
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 12:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MGGpzWy7VBccB+8l3MXRUdWJN8M9OwEXxLhwnlMbWNQ=;
	t=1691583426; x=1692793026; b=njNy1WQxP/qBvUROUl+OJW5foSDz6GPsevNK2ulbmrQq2hN
	iKLCSNULAbpG441ZS8NdtXmpIUg8jl5zAOCdRL6dMf9MdZpiYY8qZkSlVlAbrfo+VsDrXqxNXuAcp
	E4PnkdIAxzaz+FKZ7h7AvafHb9vC9LczQxGy0xoRUvuTCR3lReOWmwdpPY9UXNgxHLh4ozpS95eP/
	A0Oew7MEMe38tums/Bxi/upvMIKrfidDe2rXU6dvZu3oLBfI5NKTAFQEvXztjzoC5drrEqpOE0BBZ
	pBXKnKTkqlic13elJJxHHISS/o1UXFhpTs1FVHt0WgOgmVYeGVlQHjfxGZDNfAFg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qTi7b-00EcXr-1I;
	Wed, 09 Aug 2023 14:17:03 +0200
Message-ID: <5cabcc57acd781e90c35fcc9b3c6a8aa8fbaa581.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] wifi: ath12k: fix undefined behavior with __fls in
 dp
From: Johannes Berg <johannes@sipsolutions.net>
To: Harshitha Prem <quic_hprem@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 09 Aug 2023 14:17:01 +0200
In-Reply-To: <20230809042738.13394-3-quic_hprem@quicinc.com>
References: <20230809042738.13394-1-quic_hprem@quicinc.com>
	 <20230809042738.13394-3-quic_hprem@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_051709_957051_1F395B2E 
X-CRM114-Status: UNSURE (   8.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Wed, 2023-08-09 at 09:57 +0530, Harshitha Prem wrote:
> 
> During the crash, the fragment id of that packet was 0 and
> __fls returned a junk value. Hence, it was identified that "__fls"
> would have an undefined behavior if the argument is passed as "0".
> Therefore, add changes to handle the same.

Umm. That makes it sound like you are surprised by this behaviour of
__fls() and expected something else?! Please go read the documentation,
and then rewrite the commit message. You really shouldn't be surprised
by this.

johannes

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
