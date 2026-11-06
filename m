Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168CC606D829
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 18:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XU1Jrke5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kw+Rgow6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Wpg3dgxbU3a7h4Sfeskvgtnlg7f89nB3QsPZeqlaybY=; b=XU1Jrke5CmGkOc7N2Cr/nEd535
	y0TlxigiVEwtFa3GEdiqrZZzoHY3mNXVNRKn8tZb7dcLTMOax94hJ5/cnpN9Vy/i5qCKIa9lab8/T
	wyxjolnaX01ivwd8gbtCw3pKlxuwzeXgnbXkwcnQcuTP0ke1CQ8sSdMv/PUwvRtxaNqgyYL0ytMsY
	srf7gjBRTw86MsOrZ/vLLjdkoV0G0DaSmWtwu7fjNIv2z7WphPI8RVaSiLyq64wHuRHShHXvtffxF
	qjBfZpi8EWDKvJTNKyinUwk1aT10uV63OTOLeYpvQOPVbW0rUKTBu4T4P28ostyUWMD1eDUQEUnwP
	Fi9+ggUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOzH-0000000DRae-3n6t;
	Fri, 06 Nov 2026 18:48:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOzG-0000000DRXj-1Q5s;
	Fri, 06 Nov 2026 18:48:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBA7A60213;
	Fri,  6 Nov 2026 18:48:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793990908;
	b=y+IogmuWLaPqhhPqI9B0utXxyKmpr/VVL6GHYtBGtGm5mTs7Nx6SjR9vM81n1mF4S1CM
	 ONfVnmRFx90GY9Mpygy9YmHSXi54YzZNi0tq19jmiHkuXby1YQSwNDLyqXu7ULlkskutc
	 LCga1WyWnsRQaKF5QB0tjEQMLzpKCzUdfhanXtHEEG1/n3d3VcivWZvAVNdP7lE/yuqA/
	 veEJnwnoieyRnQ/bwRAmY3bZO3zvO/IMBWA4+ZXKqPHf7pWay6P6sUMXEPjbB7NlmBHH1
	 6iKv0uLZSot6H1gNfFj1zUzJUSV5mILIa/H0EKqOvYIBrn0L/eYq3/XMtUKwftCopDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793990908;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Wpg3dgxbU3a7h4Sfeskvgtnlg7f89nB3QsPZeqlaybY=;
	b=vxgcE1wH9xt/SCqx+9LDzqupn0LXa8aADYX1bPUIqWQw4RJse/Fj9WRsU2LJU0waL9k2
	 z7RbI3eutEPzZbIks/QRPpBLW7o6g0Q7c9eSnBgHkXdojJej8BzxgV/Okq7fxDb2Zp8Sd
	 hcSb+BDSYOfWR/v0kpvcTVNSnw01g23Iz1MsKNbL21F3W0xyHwIXBLEqpFnR47rkje+wG
	 9JK5F0ppkd3Oowd26/GusJRFFVI1MNUJ1T0Jzdpyblc8EDmbpQeDHtcpUz3MzaWp2xW/M
	 LegKf91qz6IquCCGpZxYB0ojp8Uv/Ne0de5RO4CQpK5R2uxwhV5eNGOCQiBqD0d4FVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 706B81F0089F;
	Fri,  6 Nov 2026 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990908;
	bh=Wpg3dgxbU3a7h4Sfeskvgtnlg7f89nB3QsPZeqlaybY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kw+Rgow6TAmBOgFw4OkZObZp/+GLwafJF04M0Igdrg60hRihqPD9dlSeMwgmHU04a
	 GLEhO5wxyzfPks7/ZopehQCPyPLDVSn5UJha79mON7apb8U4RknogQ4t8fPlAJYJ8V
	 k+WWL9jNIV5jY87nbPsNbRWO3lTkLm3h3ySw1eDn2BYsG3BgZpYoxFq4QrVsZhD+2U
	 YxnCO97qRpFtmArHxmcNf76CdixMnLY+0LUff7xUjpC3FzrO8TODgEq6NsnNMz1v0Q
	 5LtnUiOwysUV0uCveYxXDEurUU6QPhB1x7C43avXEkt37GOznv4a/yf+zt5EujGbHl
	 McGeGFMGMf6dQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C61B347819;
	Fri,  6 Nov 2026 18:48:26 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Subject: [PATCH 0/2] wifi: ath: simplify copying a peer's PPE thresholds
Date: Fri, 06 Nov 2026 12:48:25 -0600
Message-Id: <20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkg7moC/yXMQQrCMBBG4auUWTvQBAziVcRFG3/NiDTDTBSh9
 O5GXX6L91ZymMDpOKxkeIlLXTrCbqBcpuUGlks3xTGmEMbEUyusgLEquBWD86NW5Yx9jnNEOiB
 Qr9VwlffvfDr/7c/5jty+O9q2Dx44q7l7AAAA
X-Change-ID: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793990906; l=1038;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=BZ5UT6GcKMGhEPdLdsmXEAyHHHroZPYfl6Q6xV+s1sk=;
 b=I6tQcvhYxaQai7bBUx4Hd+v1uXiA6kOGJUQgRMMpWBIRVkLVvt251Nq2uCFN4vH9ElbRhmOM8
 5QePBEhVxl3COlRvD5hSjzIlnM2C7oZ6fQS/vxMx3JlHAe6lXx9a2/W
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rameshkumar suggested this while reviewing the PPE threshold bit-order
fix [1]: the loop that copies a peer's PPE thresholds into the WMI
layout shifts each bit in from the top, where it can put it in place.
ath11k and ath12k carry the same loop, so one patch each. No functional
change; the patches don't depend on the bit-order series.

The patches, this letter and the equivalence test were written with
Claude, an AI coding assistant.

[1] https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/

---
Christopher Griffin (2):
      wifi: ath11k: simplify copying a peer's PPE thresholds
      wifi: ath12k: simplify copying a peer's PPE thresholds

 drivers/net/wireless/ath/ath11k/mac.c | 3 +--
 drivers/net/wireless/ath/ath12k/mac.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e
change-id: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



