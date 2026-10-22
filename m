Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407FC606A322
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uuimhw3O;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iiVh0ko0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Lo8K72+x+3BIcLLPGxgUbde81XtXZI0ot8cn4aPlxc=; b=uuimhw3OvBBoV7
	AQW5pHeIwGg8Hnc9OewEHoOPwutP1YP0LtcOb/gbnARsmKLrjCIzdEfuHzmixxU3UpmoCD8WXTFaA
	MwbGSUT1q3F4DeHhfKYFTGjdHGrmSaT/KOr0xoFHoGN4JvNvNj2HhKmeJ3sy13+Jq1iFkcDq+/ZIN
	R0+PxurfbqC3FOmH5e2jMgxECFPrmNjRj/CPZsjpHOkCGtIQAbDSNXrKKo1NhAlnx/hJi+y8gM4rm
	AMv02KQY11KVSwDt1IgQ39amQL792D3BSw0dWGpIH6MK2aNGpjJCt+TJOhdcU3gqOCiMRprHXeF95
	3xtrPNRT/qaKPw+3bnUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmVh-0000000DUUv-46Zm;
	Thu, 22 Oct 2026 06:42:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmVe-0000000DUSf-0VFr;
	Thu, 22 Oct 2026 06:42:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FE3560210;
	Thu, 22 Oct 2026 06:42:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792651361;
	b=C4pfUa6sCV2y+QV9oPm2hIvfecuDRFVwH0YyjTCejFRMiGnAt/1W2OIOBBiTufWMS8W0
	 8WDPZSExBZnf851Z/PGtFgTsdxKlIIiyCPYPGCYIjS9Lrtv0Df8Vdkgdl+QEDHvHNQ5aU
	 KcOp/OoxTlzqXFa1UDrNY9Em0RN1NaNHKqT21UYcQ2kV4zVOxyihruPK4ycB7+1MxZfD1
	 hhqqQwsa6tZIRH2xLc8kx+cPVylz5H/zTstPqjrSMMQtIWy2BEv098DjOHbdK/iTqybkK
	 JAfhcX+9ZVhpXQr5uHgntCoR9h0ACIBRrqmeM9KmkB92cfazu53x0QsFYROBGEPhXhw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792651361;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7Lo8K72+x+3BIcLLPGxgUbde81XtXZI0ot8cn4aPlxc=;
	b=MMwS3PftW6CEVP9d0GHoHSIh310z5Vkp1nrStziBQA3syJ/9OxKq8H+Nj2qnoyiJHXsi
	 9iT+xcsj27rR4oMTOtgAFnlDr5rhdcX8iDgEt/Hk7V7+d6CmXusiIhiQyLehMTegUbhQ7
	 /qPHV09haKrH5OWFGwKjomO+QEjbYbL6MXPt8RCHikAGwTpWXn3TLx5IxREQs0O7vG+Ml
	 Y8UNAQlANFmXFWWoWZ6Bcawm/iFhB//GCqvqwXmSeeZZ1fGc5abvgU+86zqp8hGQo3Oib
	 MlX3hQEn7SBbK/Sfk8uw3j+8ZMBC0MgLAMEkqN0rP+c2/gq5kBAN8jfsSu0tj1QgHow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43AA31F000C3;
	Thu, 22 Oct 2026 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651361;
	bh=7Lo8K72+x+3BIcLLPGxgUbde81XtXZI0ot8cn4aPlxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iiVh0ko00ZABYm9K6MadoQZ+VYkoxRvhUOUvXRKURTQwL+4m364+VQu2GX3O3Cbqs
	 uLijuIQPRSlHoX2Mb+gcVwf0tjvoaP8FAoY3FSwSWx39JBr7vA1qX3jl5bn37SoGik
	 C3GHaDMCqB5RTxCtfS6LjD4iuvIfmOmDUeNe2GrCgDq2oiQS4tFermvF0aOc/K0ZKI
	 O7tfjQD4ZATOzx3CLOvEU17CTWpqwFZBv1hz2Z4M2PU+e2gpMcIU/BFMH5HqYWEAVM
	 RqwLZLwTU+j4BeXd5dDnW4hP5hQHVBDAcCVhmmKF5QcF+Lg9GHQ9RS8VY2+mDbLUAH
	 shmtzRo1WUEKA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C992043527;
	Thu, 22 Oct 2026 06:42:39 +0000 (UTC)
From: John Macias via B4 Relay <devnull+dencity7.gmail.com@kernel.org>
Date: Wed, 21 Oct 2026 23:42:38 -0700
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: bound READY MAC address
 array reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-rdy-mac-array-bounds-v2-2-cf7f45f868dd@gmail.com>
References: <20261021-rdy-mac-array-bounds-v2-0-cf7f45f868dd@gmail.com>
In-Reply-To: <20261021-rdy-mac-array-bounds-v2-0-cf7f45f868dd@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, ath12k@lists.infradead.org, 
 John Macias <dencity7@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792651359; l=1848;
 i=dencity7@gmail.com; s=20261015; h=from:subject:message-id;
 bh=Q7bR+qmBnYByCGbR1Dt5w8wYWTuypEv1iCd0orMgbPU=;
 b=iszuxz1/FBi89e2XnAoX0xyM5ZS1WT29ZYeAuY7KlQQiVQdr4s5xAI1f8R0Y2fUZ18SmHXrC1
 z7yvZPmE6i+AQEXadz7ju3C8X5cNlYyrxkHy25tJCQOt2cZ6Y3APOJB
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

ath12k_wmi_rdy_parse() has the same pattern as ath11k: after checking
that the READY fixed record advertises at least num_radios extra MAC
addresses, it copies one address per radio from the
WMI_TAG_ARRAY_FIXED_STRUCT TLV without checking that the TLV actually
holds num_radios entries.

With two radios and an array shorter than two 8-byte entries, the second
ether_addr_copy() reads past the end of the TLV value.

Check the array length against num_radios before copying. When it is too
short, warn and leave pdevs_macaddr_valid unset, so the driver keeps its
default per-radio addresses instead of failing READY processing.

A userspace harness that includes the unmodified parser reports a 6-byte
heap-buffer-overflow read under AddressSanitizer for 8- and 12-byte
arrays with two radios, and the fixed parser passes. Compile tested only
(ath-next, W=1).

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 75b259990c..ef070ace08 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7099,6 +7099,12 @@ static int ath12k_wmi_rdy_parse(struct ath12k_base *ab, u16 tag, u16 len,
 		if (!(ab->num_radios > 1 && num_mac_addr >= ab->num_radios))
 			break;
 
+		if (len < ab->num_radios * sizeof(*addr_list)) {
+			ath12k_warn(ab, "ready event mac address array too short: %u bytes for %d radios\n",
+				    len, ab->num_radios);
+			break;
+		}
+
 		for (i = 0; i < ab->num_radios; i++) {
 			pdev = &ab->pdevs[i];
 			ether_addr_copy(pdev->mac_addr, addr_list[i].addr);

-- 
2.47.3



