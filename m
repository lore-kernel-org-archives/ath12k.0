Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E75CCF2DB
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRtR6Rf0lOjFcqMZnmsJM6N8yaS8cB3caDn96Mim3r8=; b=QTP+PgL9EUto8Zx5+gDFPzuRq5
	D7by4Cig5X72hlrPRDDCMXV5hXGQi3cNGQX2iQBcApNGfRgWBMC7gxLqwWj5y8SQeqM2aLESdKN0E
	xzsizMvf4CuexScWg4WOb2A+GtaimHtDi45wPnBPJ2NjqN0QTLY6D4GKh6KUb9t3wV3AzID9jdgPS
	QqjAD2Yg3osKbCKyvb5wxpfMr6PD3h+bTbVJqf5qynLj34ICUahKaQ3dbzdWrXPK9l/mNBYLwYqPg
	REwN/yfVtDFuj/d4DqeuSvNvk6TjdvD4ImgSKOXRbyc9Y01tqYxy2wb7i5pdUDHR7NS/1PFa56p0p
	FcLt1mLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAh-0000000758M-3koB;
	Mon, 19 Oct 2026 10:00:47 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkAd-0000000756k-0zf2
	for ath12k@lists.infradead.org;
	Mon, 19 Oct 2026 10:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sR
	tR6Rf0lOjFcqMZnmsJM6N8yaS8cB3caDn96Mim3r8=; b=bOG+PieI1bi0QPuw2w
	9hgw/ShsaJ8M8VvC6mM0zSZzYMGehiilboy+pyIYxEI8TCtI/1HPaJU90peCw8nV
	FxlRua90hXF0XujrCZGdkbzc1GlfPXOKi/ryGYeCkPqfc3xXmZoy+tCPbS7xoDWt
	Hlnz/O8oWVCt13/AqwM4q8Vd8=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC3E3g+6tVqofy8Ag--.62619S4;
	Mon, 19 Oct 2026 18:00:34 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <jiale.yao@example.com>
Subject: [PATCH 2/4] wifi: ath12k: validate extended regulatory capability count
Date: Mon, 19 Oct 2026 18:00:27 +0800
Message-Id: <20261019100029.1908660-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019100029.1908660-1-yaojiale02@163.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgC3E3g+6tVqofy8Ag--.62619S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr17JFWkAF1rWw1xKFy3Jwb_yoW8GF17pr
	4Y9Fy2kF98JF47C3yUAF4xJa45Za1DJw43Kr15Kas3u3WxAr4Yv3WYgFy5Zr4rt3yrJF1a
	9F40q34xCF98taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jz89NUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQLaFWrV6kI7mgAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_030044_771476_95E633D9 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Jiale Yao <jiale.yao@example.com>

Firmware reports the number of PHYs separately from the array of
extended regulatory capabilities. The TLV parser rejects excess array
entries, but accepts an array with fewer entries than the reported PHY
count. The subsequent loop uses the reported count and reads beyond the
supplied array.

Reject mismatched counts before indexing the capability array.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Jiale Yao <jiale.yao@example.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d5160af60e00..66e39672dcda 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4824,6 +4824,13 @@ static int ath12k_wmi_ext_hal_reg_caps(struct ath12k_base *soc,
 		return ret;
 	}
 
+	if (svc_rdy_ext->n_ext_hal_reg_caps != svc_rdy_ext->arg.num_phy) {
+		ath12k_warn(soc, "invalid number of reg caps %u, expected %u\n",
+			    svc_rdy_ext->n_ext_hal_reg_caps,
+			    svc_rdy_ext->arg.num_phy);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < svc_rdy_ext->arg.num_phy; i++) {
 		ret = ath12k_pull_reg_cap_svc_rdy_ext(wmi_handle,
 						      svc_rdy_ext->soc_hal_reg_caps,
-- 
2.34.1


