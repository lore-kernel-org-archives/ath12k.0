Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08CBC3DA61
	for <ath12k@archiver.kernel.org>; Sun, 28 Jul 2024 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPHcMUxvhSe/WVkZ8RbStVMmyv1Bof3bMvDa+kHJtEI=; b=RvVoJ3O8Xh0yOGNWqpAhcZihGP
	5aaZ96cY86nngRNdYZQx2El+ZnjlBj5uYZ6BzZYGUEn0Yx9aQR/o9EyCRyb64f7FkomA+NuosxJfv
	u9Zb55lYfY9sIl2VPNuQw2WdAkdCGmXF0Xtc4Yel1BAvUe2ZDMIx4tEKB0xDnCorF7kRlTcIAMVuA
	Jn6rmximhvXH0mlr/HhcIAc+9w0ZjuTH7xjarDJMWLwsIlgK5mv1+OdB6Ap5oZBlaPLIM6T7qjsZt
	jsxrvS1m+lwchRuHxIOJLeWEB7SGJUs+JaQv2CDMEBA8P3ae3EisvnSGW7eA/4hjlXiU56/jAvXoQ
	N3d3gxbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXsAS-00000007acu-1dDy
	for ath12k@archiver.kernel.org;
	Sun, 28 Jul 2024 00:53:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXsAP-00000007abJ-3R35
	for ath12k@lists.infradead.org;
	Sun, 28 Jul 2024 00:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 02A2CCE01B6;
	Sun, 28 Jul 2024 00:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164ABC4AF09;
	Sun, 28 Jul 2024 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722128019;
	bh=zjyyy8tHQjp/HACAEfML/utyS/QhvggQtox4+hC48Zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kW33Y/cmcjrbEDGT++wrASjBznpfczvcOoT3j7K8075lYQlceMNLVDVgU6Kj0sFft
	 0A1Ho+DljW5eMZf8EHTYr/SaJYQoGu9BzMO9NMOq2ckAi+AcRBeQ/MDPv0nubQ3mfX
	 0DMb3y/o7sOKN64N/rGz+gIKKgFP3qTxSLE4SP327jLNgVAnOCd6Qwau7hnXpTbRBr
	 oq4p0LmZElk/37WGl3OFr0lDzPkXQhl5pZYBKExPsy1cgtNoEXQCgX+Td3o1vRYoNO
	 eigKgvnGDKJkN3Gp62yFf8Kh8orFaB0hkUI24K2DRlNfKwzVBwKXetFrKjRgOwd0Y9
	 Sk+W6q5YFxRXg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 05/27] wifi: ath12k: fix memory leak in ath12k_dp_rx_peer_frag_setup()
Date: Sat, 27 Jul 2024 20:52:48 -0400
Message-ID: <20240728005329.1723272-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728005329.1723272-1-sashal@kernel.org>
References: <20240728005329.1723272-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_175342_060815_DF2E6F5E 
X-CRM114-Status: UNSURE (   7.31  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit 3d60041543189438cd1b03a1fa40ff6681c77970 ]

Currently the resource allocated by crypto_alloc_shash() is not
freed in case ath12k_peer_find() fails, resulting in memory leak.

Add crypto_free_shash() to fix it.

This is found during code review, compile tested only.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240526124226.24661-1-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 75df622f25d85..f05c45c8732e7 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2762,6 +2762,7 @@ int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev
 	peer = ath12k_peer_find(ab, vdev_id, peer_mac);
 	if (!peer) {
 		spin_unlock_bh(&ab->base_lock);
+		crypto_free_shash(tfm);
 		ath12k_warn(ab, "failed to find the peer to set up fragment info\n");
 		return -ENOENT;
 	}
-- 
2.43.0


