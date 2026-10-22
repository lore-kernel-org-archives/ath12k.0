Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1916606A320
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XKb27EKW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0LM9dH3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/flEiTmGLficv+5MmLLk4wXKjultVTWKnMpX+Cttak=; b=XKb27EKWkQzFLM
	sks8h+5zi+y53+UvtrIF0MfafAM061DYwEkHrlI2RWYFZ/xG1QUppJx2z2Yh7l4d3ZCFK3RYUIJBf
	hoSyfNVIEAMMXqbCaPtePZ92ULiJBTo7Owc9EqioSFubhpxu7dVZsYbwm16wtq6030+fmHUzDecEM
	RnUITRNKGAJicJMkDS/iryg4Ii012e8phBDIU0vODbgS0lZw3/trkL4xt3Os+z5dFjzaquc0x9j+/
	iYgu8dv82I/PIJHRtHBc3P66ZGSJkeFlLWyLCdpMwqgUQ2e4KW3wQMBwziBHpe/oAEuleT6KWmPJ/
	i/wQnDdBCMGXxeHis3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmVe-0000000DUTD-2TEP;
	Thu, 22 Oct 2026 06:42:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmVd-0000000DUSe-3jAu;
	Thu, 22 Oct 2026 06:42:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AD6F43D40;
	Thu, 22 Oct 2026 06:42:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792651361;
	b=etiYGrinhqmkiFPWeF5ahK0A8opN9iE/0pd8TjIYkr9DedN3a+d8fTywa6Ad6IQ4T4+m
	 q6vIahuBNn3gH2AGl2fyv/DVw5k2aB64y/iYNEs7iL+AkLGEkm8Xx/rDQ6ay2n1DyFFuS
	 EqLcrbFHi4U9g0/waQyJMl2iFu4Q18r8xcW6cQcwUzmziULnqkB1m6UwFmSHpGPQ23D6R
	 AbmcbHB+uWiVOReqp8tNqKXRK8mNefVtW2Gn7+FBXw60IwDskj+uoZIbo035xTOhfzcGX
	 EzKLeqOx8vu4SmdwxM0eISoldp9dl8iarM/cR74U8qagTLeWRIgeUht7Za72DVt3rHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792651361;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J/flEiTmGLficv+5MmLLk4wXKjultVTWKnMpX+Cttak=;
	b=L97++srPQurkOkrhmwOfSwEvN1hMxqA7sr5Us+OmD7Qy9VN64k6me67ShZRp8f6J4s7M
	 UHGMrpQy/YJptX/DF+vAOE3wuLC+N57mIzxhhaQKG2PtSyJudECVgtUowXCPRO+Ph9hu+
	 m0arpVEpgLbPLZLWFJWtyYEM6UWiqhXdeW6Y6L7pgbwUbxcqZ/WTwGZUw7NeqtPr7PDOf
	 nK+5dXx6T6X9i1S1H75FI6cDvAKnVIfoCtJG2chA1s/W+6QcrjNje619Gv+CQIxZdcoJE
	 0kdgHXgcXQcNAAuPPSp/3D6SUJdATKgO4ex9zAZIiALlKBJqOr7RiCVXTxyWjp4OOYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D3AC1F000C2;
	Thu, 22 Oct 2026 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651361;
	bh=J/flEiTmGLficv+5MmLLk4wXKjultVTWKnMpX+Cttak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B0LM9dH322ZXuiEXTgWzPvolOmrHeulPTFzf2ash7Z6HaBZ2Eq9YyGcKtAGxVUl77
	 feb+pwOr+nzrbxycPDGSVDDTzljAQ8CH8YUr4eNDblY6j7xLIeAmLxkXQADdAy1d3n
	 ODuA1R1+s7r+0kyg0SlRDG4xc7O475pUM9UVvBWx5J2AcOvqedEsLU//4rSmYictjg
	 178N+urpjJ3m9pNyMGJvZTIiGvwrZrafj7I1q5fsqNO1gUtTDtj7P30weZ43FogI7X
	 n0Og0Ewk+Dw2RymB4MoxHLxB1tp4Dyga2VOwPtSzItrUToi1pDA21IYIWXtwrOvdZf
	 QhmxqPmbRBQyg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C2B924351A;
	Thu, 22 Oct 2026 06:42:39 +0000 (UTC)
From: John Macias via B4 Relay <devnull+dencity7.gmail.com@kernel.org>
Date: Wed, 21 Oct 2026 23:42:37 -0700
Subject: [PATCH ath-next v2 1/2] wifi: ath11k: bound READY MAC address
 array reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-rdy-mac-array-bounds-v2-1-cf7f45f868dd@gmail.com>
References: <20261021-rdy-mac-array-bounds-v2-0-cf7f45f868dd@gmail.com>
In-Reply-To: <20261021-rdy-mac-array-bounds-v2-0-cf7f45f868dd@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, 
 John Macias <dencity7@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792651359; l=2463;
 i=dencity7@gmail.com; s=20261015; h=from:subject:message-id;
 bh=Fqs87XxAhySy9Ng8R56w4xVx0qjiqfm2ePiFbvNvI0Y=;
 b=1rbPMf1BSr/GGfj65eUpIJF4yZRe3hLo3DA3U+vzKR3WDcbWXpQY9t3TZ8elaMNfkv4yepyYd
 lFF8gZuF23zAyAOAqk4W+O+tuDj1WP4STFq19BtPLc4uNM6z0yIq6dY
X-Developer-Key: i=dencity7@gmail.com; a=ed25519;
 pk=z7cMHA0B6NULvJzsST/bbOOegMB6xCo9+/ytQure7B8=
X-Endpoint-Received: by B4 Relay for dencity7@gmail.com/20261015 with
 auth_id=1198
X-Original-From: John Macias <dencity7@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Reply-To: dencity7@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: John Macias <dencity7@gmail.com>

The READY event carries a fixed record whose num_extra_mac_addr field
advertises how many per-radio MAC addresses follow, and a separate
WMI_TAG_ARRAY_FIXED_STRUCT TLV holding that array. The TLV iterator
only ensures that the array TLV fits inside the event;
ath11k_wmi_tlv_rdy_parse() then copies one address per radio without
checking that the array really holds num_radios entries.

If firmware advertises at least num_radios extra addresses but sends a
shorter array, for example two radios with an eight-byte array, the second
ether_addr_copy() reads past the end of the TLV value.

Check the array length against num_radios before copying. When it is too
short, warn and leave pdevs_macaddr_valid unset, so the driver falls back
to deriving the per-radio addresses as it does when no array is provided,
instead of failing READY processing.

Found by code review while bringing up a device with older firmware; a
userspace harness that includes the unmodified parser reports a 6-byte
heap-buffer-overflow read under AddressSanitizer for this input, and
the fixed parser passes. Compile tested on ath-next (W=1). The same
change has also run on an IPQ8074 hw1.0 board (with out-of-tree
enablement patches) on every boot since 16 Oct 2026; that firmware
sends a well-formed array, so this exercises only the normal path,
which still assigns both per-radio addresses and prints no warning.

Tested-on: IPQ8074 hw1.0 AHB WLAN.HK.2.0-01792-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed..6ae4e881f8 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7330,6 +7330,12 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
 		if (!(ab->num_radios > 1 && num_mac_addr >= ab->num_radios))
 			break;
 
+		if (len < ab->num_radios * sizeof(*addr_list)) {
+			ath11k_warn(ab, "ready event mac address array too short: %u bytes for %d radios\n",
+				    len, ab->num_radios);
+			break;
+		}
+
 		for (i = 0; i < ab->num_radios; i++) {
 			pdev = &ab->pdevs[i];
 			ether_addr_copy(pdev->mac_addr, addr_list[i].addr);

-- 
2.47.3



