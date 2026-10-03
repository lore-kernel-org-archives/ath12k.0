Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EF1CA5FDD
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HXZZg6hcOZR13yuP5Pno2uBQWWVd5X5M6BD9+YK7sug=; b=YcVkFHPcpVf0DB2gqra7a0+3+d
	CeAozVu90j0MbGkRKdJor4TX/WYmQHuoE5uXPsWGGCwsymaRhm/D+Z3Jcfoy+LM9+n4e/jJgPOyCa
	P53kHnJn+1666lJllxaAVbJROxeZV1BYeXRcIAy/Qi98Zthu8hTFtFeSZvaJk1+Ec5SmPqGAyRofh
	SCntH4sCDsLoRyS5FHrZiDLHOOnVBwN9g7Uh5gJ80xFpBMWnsZ6wHbeIT5GK3as+ZcZUABYWCDjVl
	fy3SWaB5RGgJxeLbh1ppOvtCnmVnpG5v3sA6UCyRKEPeSz3E0NmtZWQOhYv+UnjU3fj2quZmKGDFJ
	7l3xbalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwqX-0000000DLw5-353X;
	Sat, 03 Oct 2026 10:20:01 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwqU-0000000DLv8-0MXY
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 10:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HX
	ZZg6hcOZR13yuP5Pno2uBQWWVd5X5M6BD9+YK7sug=; b=pWfHVPKVqagQoYVFFt
	3gsspefLzKQAfAughoECQZiPujV91ViV+LRHEZMLT+hvq80PRGl1Q8T370wsED1n
	Z/hWADTi7VVfN/1JsRMXyOpY55hsBCMXCUIpM0j8gEykpQ/3hvl9O23lYmnq3vhT
	OsocvjP5HZiJ1xwRxc2hyftdc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3f8bC1sBqnrifCA--.20254S2;
	Sat, 03 Oct 2026 18:19:47 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: validate MAC/PHY capability count before saving
Date: Sat,  3 Oct 2026 18:19:43 +0800
Message-Id: <20261003101944.596546-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f8bC1sBqnrifCA--.20254S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAry7WF47Gr18uF1xJw1DJrb_yoW5GFyxpF
	43ZrnrtFWrJF47Ww4DJw4UJa4Fvws5Kw4fKFy7Ka4rW3Z5ArnrX3WFvFWjyFyrKws5WF1U
	Kr4Iv3y0kFW5tFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEubyLUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wOw6mrA1sPNzQAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_031958_539034_58296D05 
X-CRM114-Status: UNSURE (   9.08  )
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

Firmware supplies the hardware mode count and the PHY bitmap for each
mode in the service-ready-ext event. ath12k_wmi_save_all_mac_phy_info()
uses those bitmaps to populate svc_ext_info->mac_phy_info, but the
destination is a fixed array of ATH12K_MAX_MAC_PHY_CAP elements.

If the total number of advertised PHY entries exceeds that limit, the
loop writes beyond mac_phy_info and corrupts adjacent memory.

ath12k_wmi_mac_phy_caps_parse() allocates the source array for
tot_phy_id entries and rejects excess capability TLVs. However, if the
event contains fewer capability TLVs than advertised, the remaining
allocated entries stay zeroed and are saved as invalid PHY information.

After parsing the MAC/PHY capability TLVs, validate the destination
capacity and reject an incomplete capability list before saving any
entries.

Fixes: 062ade23991e ("wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>

---

Changes in v2:
- Refer to the service-ready-ext event.
- Describe a short capability list as a correctness issue instead of a
  source-buffer overrun.
- Move the checks after MAC/PHY capability parsing and use '<' for the
  reachable count mismatch.

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d5160af60e00..3e812c79a649 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5050,6 +5050,7 @@ static int ath12k_wmi_svc_rdy_ext_parse(struct ath12k_base *ab,
 					u16 tag, u16 len,
 					const void *ptr, void *data)
 {
+	struct ath12k_svc_ext_info *svc_ext_info = &ab->wmi_ab.svc_ext_info;
 	struct ath12k_wmi_pdev *wmi_handle = &ab->wmi_ab.wmi[0];
 	struct ath12k_wmi_svc_rdy_ext_parse *svc_rdy_ext = data;
 	int ret;
@@ -5094,6 +5095,22 @@ static int ath12k_wmi_svc_rdy_ext_parse(struct ath12k_base *ab,
 				return ret;
 			}
 
+			if (svc_rdy_ext->tot_phy_id >
+			    ARRAY_SIZE(svc_ext_info->mac_phy_info)) {
+				ath12k_warn(ab, "too many PHY entries %u (max %zu)\n",
+					    svc_rdy_ext->tot_phy_id,
+					    ARRAY_SIZE(svc_ext_info->mac_phy_info));
+				return -EINVAL;
+			}
+
+			if (svc_rdy_ext->n_mac_phy_caps < svc_rdy_ext->tot_phy_id) {
+				ath12k_warn(ab,
+					    "not enough MAC/PHY caps %u, expected %u\n",
+					    svc_rdy_ext->n_mac_phy_caps,
+					    svc_rdy_ext->tot_phy_id);
+				return -EINVAL;
+			}
+
 			ath12k_wmi_save_all_mac_phy_info(ab, svc_rdy_ext);
 
 			svc_rdy_ext->mac_phy_done = true;
-- 
2.34.1


