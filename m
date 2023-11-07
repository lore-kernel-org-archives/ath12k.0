Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BFFC4167D
	for <ath12k@archiver.kernel.org>; Tue,  7 Nov 2023 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gJguUJLgc80KufW13i5zJ0wybq0Ozl9dIzIJaY/tD0=; b=ie15m3VsL9Iq9h
	H3rWBDVRxg7gX/DoQMz6Im1EfYsfBn7g4tFOq/adRl9ov0bFIupfukdekU3607dk4J/rmpj44Ys4B
	kiNVgdMrGCPuWkAskiAmGSSnXpbnu7ZjVsNi0IRtJ+iPqdTRpSSuPod4jaZMtUJOCMHDOlSNerpUG
	K2NlL7MkgCqpzkfvKhtQjnxrtzUxi5lFfej3VrRGv7BIvogBpfGArc7SEK4wBIXfC5dVJPyjIrnZn
	7X/Vu7+MRKYP3UAd2KUl25NLy1KQnm4ISoUN5vmK107uiwmDDNbkxFNLQrkpUeUfJeBs3MViISn1f
	pZLYMhrKGK98SOjH52Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Kty-001Q8R-0N
	for ath12k@archiver.kernel.org;
	Tue, 07 Nov 2023 12:09:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Ktu-001Q5x-1B
	for ath12k@lists.infradead.org;
	Tue, 07 Nov 2023 12:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D1253B815F2;
	Tue,  7 Nov 2023 12:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499DAC433C8;
	Tue,  7 Nov 2023 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358984;
	bh=ED9jN/0/Mt6n022JLzSXrZj1RIbYmo+/SGoE/4zE9iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SrP8q0hh17h6cu4nOtPIDcPyr8Q32aNYioCwI3FDxEKIrrQ27Ps3Pg/nBh1p+dS+j
	 D6KF3i7iqNmS+J7VMYmTWpucvNYUz8LyMFTBUpGyAwadXWrY+0rp4BjdV9qGFzOLPY
	 ff3fga1KsGKzapn/NscdmmKVsMGxQk8r7fANqepZe217GDDcVj5nQCwJ/LEMV/CuZ2
	 RBafO/9hgbJtxpuHwNchuYq47+yd96clqTFvPsPvjmDUoNgR0f1xLh7Qgon2VzsB+m
	 fV2N+2Knn0Q91OFvIqoLsOTNaxrqmoZ1A1a57XmssIkbd4ygzq/k4/TGdPyi9XTlCM
	 6lPvpxsXpw27A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 10/30] wifi: ath12k: fix possible out-of-bound write in ath12k_wmi_ext_hal_reg_caps()
Date: Tue,  7 Nov 2023 07:08:25 -0500
Message-ID: <20231107120922.3757126-10-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120922.3757126-1-sashal@kernel.org>
References: <20231107120922.3757126-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040946_552122_C3B2AC01 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit b302dce3d9edea5b93d1902a541684a967f3c63c ]

reg_cap.phy_id is extracted from WMI event and could be an unexpected value
in case some errors happen. As a result out-of-bound write may occur to
soc->hal_reg_cap. Fix it by validating reg_cap.phy_id before using it.

This is found during code review.

Compile tested only.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20230830020716.5420-1-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index eebc5a65ce3b4..416b22fa53ebf 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3799,6 +3799,12 @@ static int ath12k_wmi_ext_hal_reg_caps(struct ath12k_base *soc,
 			ath12k_warn(soc, "failed to extract reg cap %d\n", i);
 			return ret;
 		}
+
+		if (reg_cap.phy_id >= MAX_RADIOS) {
+			ath12k_warn(soc, "unexpected phy id %u\n", reg_cap.phy_id);
+			return -EINVAL;
+		}
+
 		soc->hal_reg_cap[reg_cap.phy_id] = reg_cap;
 	}
 	return 0;
-- 
2.42.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
