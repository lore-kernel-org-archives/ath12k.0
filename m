Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAC606D82B
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 18:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mcZ+ecIU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFRbO1oH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U1ghvGqDFbKTrmIF7onDouZwLDQJDwhRabuEo9ArjOc=; b=mcZ+ecIUKe122hu6eeVMwvBD5C
	DNhcVkyIZWXwR8ZV08ggdIyXSVZDkdHjRXdHf1wEo7TyIlZSa0VfDgh5c5tMw0CG7Rhz2oe1MNgpi
	kDdgjTxuJCkYrsWKxB6v8ZtIra8P8DLNMDT9yrt1avemX0SjSyUIaEZkFZFtJHPSjOmrGS2wRx2YD
	vTW8A4ZxMzIvtOUaXGI1aeON25QBjPW4dNbtVZPxjunUfA4fmbLs19ivROCbH1npm7HQPQuN5KuUB
	bHhf7C+qjvyNSRL2YBirWWeYZkZemyXmNOr3BAMs6jIdmj7Z1Z7dyrACvGDEF+39n4NenJiIbgQZk
	V9YQoQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOzG-0000000DRYH-1t5q;
	Fri, 06 Nov 2026 18:48:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOzF-0000000DRXh-0Ix1;
	Fri, 06 Nov 2026 18:48:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7216F417E8;
	Fri,  6 Nov 2026 18:48:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793990908;
	b=F+Sel2B+qS2PTRLN6Zj70KbDfN1PAlNi2jh9P7IYZkrwf2KB081oiVzp4K/bgVUYJCwE
	 bfZyqjyVmpiW/0ypTSq+E8ocMnGHbEpMu3L0REVvriNdsjbUn0VbYr2ilfGcb3kz1ooaz
	 1cxZCSGJrbu78dns7QA5SptoqvJk3KHl41Eai2Frma2YLDvttIYE4+gaYFke5c3deybHP
	 ajdWGlF/GjOQlu1q/8Zanwbtz9PwmMvbzIonL8jxV6KKC3eFZ/xZguj8DMbOHeElsO3Yz
	 R8lW+dLi5GX/DKAa9fJx6+nHSkv4kx3Ft/zjAFjIswkBmkKxozxBlcWdasIDi3wn6sQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793990908;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=U1ghvGqDFbKTrmIF7onDouZwLDQJDwhRabuEo9ArjOc=;
	b=g01H/Wk4wuYUG7b40GpPQEHIMU5FncynG1yzMD1g0l6UZdrQgZXWwlvGTyW+I1rSlVoK
	 2Rh1v8mtM5DESQaf1OHjE0ijOnomqDuk16PTmvKc4i+veeNb1IaGufaqZKDGuOzfc1AFK
	 0pNwG6H1RRh0RrVhf6LndjjPcD2/Ryk5PlEXlQAHA8HY6oB/Ytt8a37xxEit81qhR+/+e
	 nvR0Hmm9+NRjgr4x1FXlKZ1TQFUEP2xVNG8ThYWtLjyQ6dmnchIYyhxGUE/+2rZWiM7r7
	 DIjR44KpxFf5K2rD6ezWoM8LuzGGr8N9I8sxIKQfAlfqlPJ07xt/cnhWfyeNBDxzmaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 708481F008A3;
	Fri,  6 Nov 2026 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990908;
	bh=U1ghvGqDFbKTrmIF7onDouZwLDQJDwhRabuEo9ArjOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lFRbO1oHxCOUwtlBH47XhhWGe4xyA7hXOR5Ik3uf9Dl6P72o9B5ENTiHRzhqlqwGT
	 Mzezj4XH05UUVtXdG/cB4Fhsd7suxcipOVCF/GXK13aWN3IzvXqZ8m+E/saY+XnNP7
	 kDfOGKB+E5I/Kg/tPRO/rWNupyhLH7sA3KACiQ7L+aCUmF1HQlkcLnq/dLvioSmcmo
	 UmLfP2KqMuAjeC0JbXpbFu7+zj+zWeo30vmOgAfGqgJ3zBnMHZRHtYhLkD26Xj4NFX
	 L2GnLEqkvxYv0XHyA+HuYvJOeOs+PmTJM0FMfrQxxKD/Pl7eNW5dVVB3JqY5xLPXq5
	 tRQT4XY06Fhtw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB84847831;
	Fri,  6 Nov 2026 18:48:26 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Fri, 06 Nov 2026 12:48:26 -0600
Subject: [PATCH 1/2] wifi: ath11k: simplify copying a peer's PPE thresholds
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-ath-peer-ppe-thres-loop-v1-1-f6bb5fe9ffb3@gmail.com>
References: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
In-Reply-To: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793990906; l=1559;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=Fx0MoPhTsHoV7Mqo4RpE2ktBUJ4V6dxFpUHZthPxLf8=;
 b=B/Qqm/yjFtcACrMbciWL+jekNjj58CDkS6g0yK1GLR5WdeOX3Kej/ZhtjmYFeWPgJERADPfXt
 mRkrX/x5dL3BRbSL7RsY8bI+x5yD9sUhdtDRU2p5cD6I4+c7crQj6cb
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
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
Reply-To: christophergriffin05@gmail.com
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_peer_assoc_h_he() copies each 6-bit PPE threshold of a peer's HE
capabilities into the WMI layout one bit at a time, shifting it in from
the top: val >>= 1, then the new bit at bit 5, six times over. After the
sixth bit, bit i of the field sits at bit i of val, so put it there
directly.

No functional change: a userspace copy of both loops gives the same
ppet16_ppet8_ru3_ru0 for every 6-bit value in every RU slot and for 2.5
million random threshold fields. Compile-tested with W=1.

The change, this message and the test were written with Claude, an AI
coding assistant.

Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Link: https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..d7ae9e8747233 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2496,9 +2496,8 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 				if ((arg->peer_ppet.ru_bit_mask & BIT(ru)) == 0)
 					continue;
 				for (i = 0; i < 6; i++) {
-					val >>= 1;
 					val |= ((he_cap->ppe_thres[bit / 8] >>
-						 (bit % 8)) & 0x1) << 5;
+						 (bit % 8)) & 0x1) << i;
 					bit++;
 				}
 				arg->peer_ppet.ppet16_ppet8_ru3_ru0[nss] |=

-- 
2.43.0



