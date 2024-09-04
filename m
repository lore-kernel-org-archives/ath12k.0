Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E0CCD4857
	for <ath12k@archiver.kernel.org>; Wed,  4 Sep 2024 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eMWXCSeOCLjgy0t+LNn8nucOaaYn4CILWQwMJ3utEWs=; b=fzvn4qOhwLmflKCHTyqPICIsCG
	tXewAkf7KhhFQ5UzU1hIvjsMgDiJVeU/2fQRhiatHMFVevMt0zNDNb/nriMAYnU8r2ppvPX92vOqq
	GobmJrzdU6QyZWJ73Svc3A2799nclU8wP+EFkfFDaSxCshXv44boX+djy13OCuGoXZJXg1TnWmwnd
	LdKSzYdgqKKEplFCcRUadV6OikQFeXdQeS5kXxO0mleMSfciIOGKnF2lkb9iYzoswlMEktu/uwFiQ
	slqM7n4dWLBGn1alcpZSodhM7aPQ5q4Fuo8EBsNyHHR0pBJEYxPbMUZZBBGPfH5R8IvmkVDGyzui3
	aCkp3B8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sluIk-00000005XpI-33Zo
	for ath12k@archiver.kernel.org;
	Wed, 04 Sep 2024 18:00:18 +0000
Received: from e3i110.smtp2go.com ([158.120.84.110])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sluIh-00000005XlF-1paB
	for ath12k@lists.infradead.org;
	Wed, 04 Sep 2024 18:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1725472800; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=eMWXCSeOCLjgy0t+LNn8nucOaaYn4CILWQwMJ3utEWs=;
 b=CXXOiaPaPk+GKV90t4FTlEpMEsu1uS/5GRcq4UjTz2p/WTHG+vUNWNJVcrJzm1GYNlkVH
 7yszzTgQ6TaRJTsyZ5ASu733fFKq8W98OV9FgbgzG1u1V4KpRlOQDZFHantBi5j4BrEcZ+g
 7cwzBqNhchfZ/yZIP9Q3Dl4u0ASsLhhZekznPwntZ6QN7MImquyXMV7GU6bRNJ1HXccncTA
 MWpFcTFlOVmoGI5OfoUP3EgtrUg0gOa/b2C7yBZXXCzZi40gt+uChgyQweDKn0gZ1e+6r0q
 +jPisENDSiXlnmBToYfG34c50Po9C+oC8Ggv8mK2R005nexWB9qyQVYs8WaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1725472800; h=from : subject
 : to : message-id : date;
 bh=eMWXCSeOCLjgy0t+LNn8nucOaaYn4CILWQwMJ3utEWs=;
 b=aC3eBs6m6Ap9Hvx5qVEUtFCwV4iOCtLOoV6jWmVX/+zrj+6Hl2LcpomMAY0ygjUlsvJAj
 zhZSoN4ugbFSnuZepqXgpEWDId0YwP5INKVeKILlMdXv+SdfzE6+noSgh/YGhXDFP6HCteF
 PAcSDkwRb9T8bKAnbS7G0xkySoEnb85OBEE+5h2pGg6N3GfAzcXEo+xDQDvTdNcPZwMu+1R
 FAiWh3n5SF0ESLUenmae4fzd2Zwj1gnR4OjiI6aygWwzFs+0rmGGth902S6Jgx7+P07yljM
 gr2IvqeeSo9aMop9H/YrwsQmrnhV4+oMgmK7O8wZiwtGxp5Z+P6UxzrWeJmg==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1sluIQ-4o5NDgriP9H-piG2;
	Wed, 04 Sep 2024 17:59:58 +0000
Date: Wed, 4 Sep 2024 20:01:50 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: ath12k@lists.infradead.org
Cc: Nicolas Escande <nico.escande@gmail.com>
Subject: Allocating more RX descriptors that can fit in their related rings
Message-ID: <ZtigjqSbAWZYU_KQ@pilgrim>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sqT9xN3mpt
X-smtpcorp-track: CGrlBvufGBbq.UlIoV3ke7DOH.04BEeAdtjO4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_110016_077501_E98D2EBF 
X-CRM114-Status: GOOD (  11.38  )
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

Hello,

As far as I understand a bunch (ATH12K_RX_DESC_COUNT) of rx descriptors
gets allocated, then CMEM is configured for those descriptors cookie
conversion and is kept available in dp->rx_desc_free_list pool.

Those descriptors seem to be used to fed two different rings, the
rx_refill_buf_ring ring via ath12k_dp_rx_bufs_replenish() and the
reo_reinject_ring one with ath12k_dp_rx_h_defrag_reo_reinject(). While
the former is kept fully used if possible the latter is only used on
demand (i.e. reinjection of defragmented MPDU).

It seems that the number of RX descriptors ATH12K_RX_DESC_COUNT (12288)
is higher than what those two rings can fit (DP_REO_REINJECT_RING_SIZE +
DP_RXDMA_BUF_RING_SIZE = 4096 + 32 = 4128).

My question is why are we allocating that much (12288) buffer if only a
small part (4128) can be used in worst case ?

Wouldn't it be ok to only allocate just enough RX descriptors to fill
both ring (with proper 512 alignment to ease CMEM configuration) as
below ?

 #define ATH12K_RX_DESC_COUNT   ALIGN(DP_REO_REINJECT_RING_SIZE + \
                                      DP_RXDMA_BUF_RING_SIZE, \
                                      ATH12K_MAX_SPT_ENTRIES)

Or am I missing something and this is going to impact performances ?

Thanks

-- 
Remi

