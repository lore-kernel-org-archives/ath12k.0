Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFE2C4167B
	for <ath12k@archiver.kernel.org>; Tue,  7 Nov 2023 12:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBMoNxgnFmZZ3gZUYIdZ1xCupDMrnlhvY7hvxLAww0U=; b=e0mTZmQXf/8AzP
	o95QM0ysS9MI6E0baij0zTw/zK9X+8Fj1OWGG39Dhd1RNqMBnTuDXlQunxfltshGX3CvrVE8AzRkw
	bCX4LFebBuoCpfbXia7L71MyKkBCAD26CAaycof9t8NGjQjPajORZQ9/lD1LM7ISQEYsRSiEoAkld
	M8xirNtqS9yIdV91JzDKhbqEgdlNzXTuCLIyJotv88Vm9STKlPj3U2lotVo1Y98nL9+d05DTzeYZM
	LAM+AQQ/j4SE+QcUCpIUJ6+Dv79CzQx/8xcAJ0LruiWM3SDpAgHhyg2UC+OGQmN+XqWNU9OAzyvc1
	8kCZjqLBdQlX5LduVMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Kri-001POs-0W
	for ath12k@archiver.kernel.org;
	Tue, 07 Nov 2023 12:07:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Krf-001PNf-1y
	for ath12k@lists.infradead.org;
	Tue, 07 Nov 2023 12:07:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06A32611DE;
	Tue,  7 Nov 2023 12:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE930C433CD;
	Tue,  7 Nov 2023 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699358846;
	bh=P9rL5XMEPWqnbn1dV4tZ7tJMGhMfWOFZSH9upBdniI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pVBukNpYqZctptDD0NLCocq6C/clUij9cGN7WIj4iPEwv8OxwpXVQTUlFYWcGpmjz
	 rqmt4oxpadIw+xm1jH/4vudvvOMrxKey5ZdAPhzED3QlOREBsnvTSY2V0jdOCo8keE
	 0+2hSUYuy0oIs9IHa3wpec948BNqVSebHGOcW533qVPq7xwlHWQKQych2si+oLjqFu
	 B1nNruzV5aP/mA1MPiyuwbckpZ1pyDQwqAyLLA0w8ffWtvYQS9AaZ7M6ftEeQ+DxE7
	 C9cr/3qvQn/j0w+cMcta8D21rgf1UZ+5MK7l3cK2g6E/S2+Bmc7fBOJbIXQKl2SLux
	 0yVdIcpnq6a8g==
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
Subject: [PATCH AUTOSEL 6.6 10/31] wifi: ath12k: fix possible out-of-bound write in ath12k_wmi_ext_hal_reg_caps()
Date: Tue,  7 Nov 2023 07:05:57 -0500
Message-ID: <20231107120704.3756327-10-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120704.3756327-1-sashal@kernel.org>
References: <20231107120704.3756327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_040727_692315_3F05CF20 
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
index ef0f3cf35cfd1..bddf4571d50c1 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3876,6 +3876,12 @@ static int ath12k_wmi_ext_hal_reg_caps(struct ath12k_base *soc,
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
