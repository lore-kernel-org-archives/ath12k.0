Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC07DC9830E
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7psNfPfob9qJuUpihyZUAkUqDU0vENMc3d9Em+1xjFc=; b=OzKNDrbpHuBQH5zK2NCg3S+VqM
	fCGnfVlTF+UPX4ddC+1XeRYKUc5+aewjOeSmOj9MjIAyQlDV8fZQoiNYAeSfab5xA5jZOvxwiHJiW
	9odoNAFc3g7gGFnLU19I4XAbfS6Y4G+ZemYxL555k19YFeBBB87Sns4h2+qv10ewqSUVcuuTBAwwi
	sKYNVgiUc+lRpmiqK51OW7WBvRzAH/5sDajs6MU3d09wzyHqWrOM4ObkNqn77NRYBh+jv0MQs3up0
	CJSeU/cbt07o/JpNGpy430gl3Pjsm9L3yBond/8uGxjtLbdzfKxPnb6j9fcmtCTKdxCA2p/s/wDQt
	FSiDvZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4sM-0000000DIgW-0Jni;
	Fri, 25 Sep 2026 12:18:02 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA4sJ-0000000DIf0-15Lw
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 12:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7p
	sNfPfob9qJuUpihyZUAkUqDU0vENMc3d9Em+1xjFc=; b=dbtjwEhls+ve5axcIp
	FuoVyyBc+lrsLNGhQC3+jDHxe6vCCf0RWvrS5xh9EOSjSWfJjQ+oiQIr5WC1CGrf
	b4QtFYtCerz2DkXGHMOLcKaH56hghGvMOvfolBy2oaan/7I7Tp7hzPocILT1muvv
	N4m/WDm/Ga1GVHc99JW0FSo9k=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3t0hkZrZqGDz4Ag--.50028S2;
	Fri, 25 Sep 2026 20:17:41 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath12k: validate MAC/PHY capability count before saving
Date: Fri, 25 Sep 2026 20:17:39 +0800
Message-Id: <20260925121739.2061979-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3t0hkZrZqGDz4Ag--.50028S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur1DZF1rtryDXrWrJr4Dtwb_yoW5Wry3pr
	43ur9IvFWrJF43Grs8Jw4UJ3sYvws5Kr4fKr17Ka4SgF15ArsFq3WFqFW7Aryrtwn5Gr17
	Kr4Iya48CFWYkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEqjgnUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgX6NWq2ZmX-uQAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_051759_654896_DEBDE83F 
X-CRM114-Status: GOOD (  10.73  )
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

Firmware supplies the hardware mode count and the PHY bitmap for each
mode in the service-ready event.  ath12k_wmi_save_all_mac_phy_info()
uses those bitmaps to advance through svc_ext_info->mac_phy_info, but the
destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.

If the total number of advertised PHY entries exceeds that limit, the
loop writes beyond mac_phy_info and corrupts adjacent memory.  A mismatch
between the advertised total and the number of parsed capability TLVs can
also make the source pointer advance beyond its allocation.

Validate both counts before writing any entries and propagate the error to
the service-ready parser.

Fixes: 062ade23991e ("wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d5160af60e00..59ac17f0d48d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5004,7 +5004,7 @@ ath12k_wmi_save_mac_phy_info(struct ath12k_base *ab,
 					__le32_to_cpu(mac_phy_cap->high_5ghz_chan_freq);
 }
 
-static void
+static int
 ath12k_wmi_save_all_mac_phy_info(struct ath12k_base *ab,
 				 struct ath12k_wmi_svc_rdy_ext_parse *svc_rdy_ext)
 {
@@ -5015,6 +5015,20 @@ ath12k_wmi_save_all_mac_phy_info(struct ath12k_base *ab,
 	u32 hw_mode_id, phy_bit_map;
 	u8 hw_idx;
 
+	if (svc_rdy_ext->tot_phy_id > ARRAY_SIZE(svc_ext_info->mac_phy_info)) {
+		ath12k_warn(ab, "too many PHY entries %u (max %zu)\n",
+			    svc_rdy_ext->tot_phy_id,
+			    ARRAY_SIZE(svc_ext_info->mac_phy_info));
+		return -EINVAL;
+	}
+
+	if (svc_rdy_ext->n_mac_phy_caps != svc_rdy_ext->tot_phy_id) {
+		ath12k_warn(ab, "invalid number of MAC/PHY caps %u, expected %u\n",
+			    svc_rdy_ext->n_mac_phy_caps,
+			    svc_rdy_ext->tot_phy_id);
+		return -EINVAL;
+	}
+
 	mac_phy_info = &svc_ext_info->mac_phy_info[0];
 	mac_phy_cap = svc_rdy_ext->mac_phy_caps;
 
@@ -5044,6 +5058,8 @@ ath12k_wmi_save_all_mac_phy_info(struct ath12k_base *ab,
 			phy_bit_map >>= 1;
 		}
 	}
+
+	return 0;
 }
 
 static int ath12k_wmi_svc_rdy_ext_parse(struct ath12k_base *ab,
@@ -5094,7 +5110,9 @@ static int ath12k_wmi_svc_rdy_ext_parse(struct ath12k_base *ab,
 				return ret;
 			}
 
-			ath12k_wmi_save_all_mac_phy_info(ab, svc_rdy_ext);
+			ret = ath12k_wmi_save_all_mac_phy_info(ab, svc_rdy_ext);
+			if (ret)
+				return ret;
 
 			svc_rdy_ext->mac_phy_done = true;
 		} else if (!svc_rdy_ext->ext_hal_reg_done) {
-- 
2.34.1


