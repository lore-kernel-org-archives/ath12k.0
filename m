Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C46C3DA7F
	for <ath12k@archiver.kernel.org>; Thu,  1 Aug 2024 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3Pv4vmn4ldyJgYku7EgcYm5pPhROUrmDl04ZAUvzcE=; b=GwC08EIs48RibmM6eIdZ2dy+kv
	gvHojvRx6rkDSm88DR1mjD1mSQmtIWRdxrxCQTok2sEpSn2CB/SFt2ymlfiSWEm1k5K7byNMtVrx1
	WyJd+/8jLDol2mxD2L5We39zCHMjELMsfJpe81MH/VN0zm9WwJw3dYVlEIRt7dRGD7sNZh4QfrMVs
	8e+1UDJb92n2iHijvqOraf9mWp5TYUS2+YYnMspwWPP2YAUrwXiJiKY3b9XBQFndkwlAPdKElBbLw
	01huBr7ZjLo/KKNV9iTvSSaZnAsqTcwkx8UMhXDyPvx2Qqh7ORCR0tFEC6szeu4J0sF01te9F6nq2
	kE/NTSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJUr-00000002wCp-3xT4
	for ath12k@archiver.kernel.org;
	Thu, 01 Aug 2024 00:16:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZJUp-00000002wBh-1PS1
	for ath12k@lists.infradead.org;
	Thu, 01 Aug 2024 00:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F74FCE0292;
	Thu,  1 Aug 2024 00:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51EAC32786;
	Thu,  1 Aug 2024 00:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471401;
	bh=UR3INt0/72J9XTSXmIIA4ENQUx98eBliSrcf4LK3lvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HqOfXuf2IFV3G5UD72AQ/tB5dCMoKZEfb5LUOQD8Bhj9sT0P1Bfo5GqYqtQqm+lWA
	 lh8lxNDCx4xWYl+1gs+gYkdQUWVa0Ow8OcBgFb73B3fXibz3v/Dxz01gskS/t7hdB9
	 T3NaQVms0s8wJbuJVXRlqXiwa1ypGrbTezDKfNaiVV6k4Bcj0lteK87hvMZEr98MEy
	 fmqBvenImhAL13Hd5rPt1fTeW5eFEdFx3uYOPw/JeYow4qYvu+LyiF9PHBlCjfmo4N
	 zrKKv3+aScigXnSQzUqxlETJ26cKXpxTwmAKvKPtVakgoz8ajqhIEPJSbHEO94YSGf
	 LH8EAvmtGBZaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ajith C <quic_ajithc@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 087/121] wifi: ath12k: fix firmware crash due to invalid peer nss
Date: Wed, 31 Jul 2024 20:00:25 -0400
Message-ID: <20240801000834.3930818-87-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_171643_577413_ECEE84D0 
X-CRM114-Status: GOOD (  11.14  )
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

From: Ajith C <quic_ajithc@quicinc.com>

[ Upstream commit db163a463bb93cd3e37e1e7b10b9726fb6f95857 ]

Currently, if the access point receives an association
request containing an Extended HE Capabilities Information
Element with an invalid MCS-NSS, it triggers a firmware
crash.

This issue arises when EHT-PHY capabilities shows support
for a bandwidth and MCS-NSS set for that particular
bandwidth is filled by zeros and due to this, driver obtains
peer_nss as 0 and sending this value to firmware causes
crash.

Address this issue by implementing a validation step for
the peer_nss value before passing it to the firmware. If
the value is greater than zero, proceed with forwarding
it to the firmware. However, if the value is invalid,
reject the association request to prevent potential
firmware crashes.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ajith C <quic_ajithc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://patch.msgid.link/20240613053528.2541645-1-quic_ajithc@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 678a08ab22f03..f328b650059ad 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3847,6 +3847,11 @@ static int ath12k_station_assoc(struct ath12k *ar,
 
 	ath12k_peer_assoc_prepare(ar, vif, sta, &peer_arg, reassoc);
 
+	if (peer_arg.peer_nss < 1) {
+		ath12k_warn(ar->ab,
+			    "invalid peer NSS %d\n", peer_arg.peer_nss);
+		return -EINVAL;
+	}
 	ret = ath12k_wmi_send_peer_assoc_cmd(ar, &peer_arg);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to run peer assoc for STA %pM vdev %i: %d\n",
-- 
2.43.0


