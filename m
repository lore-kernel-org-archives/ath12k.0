Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28791C4452B
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 06:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhuQSYRiVZbQ+/9xqPc3+t1f0i5a6sUx9rb2bdMhxQI=; b=n8iua0HRhXqBMWR0xNnUcn/7SS
	Qy+nbTVBp8YvbCd9IAmcOlz5OUolsZJoAi48A6QAq4CXvrjEzcbx1pV55F4chCweA6SPJcXCP+OOR
	cmhUMOXxG+ElFUlkuFBkpFq5igE72Mf2udpM2zFMZ6FNWuptuDMfs2HW8RcjpmoGydKs/yUbecbPs
	5+tkEZGX6CXx9hK0rOAYPnEYEeZCiFisYhI0qE6HIXeq+xBxpHnvdeJ4InEPjxXLYT0sauZxrJ4Y+
	YBWXstGeWHq5WvVXburO//F5QOOzML210aN0L02h5raZDq4L8QCj2FFSng7ZJODEUuW4qQMPpudJO
	rmzv5qSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4JX-00000008ZKF-3Saz;
	Tue, 21 Jul 2026 06:50:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4JU-00000008ZJA-1d3x
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 06:50:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6M1NQ4107152
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 06:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WhuQSYRiVZb
	Q+/9xqPc3+t1f0i5a6sUx9rb2bdMhxQI=; b=ANmWNI4L3hZwUW1lZSIqBaAx1Br
	jUbRob0SRV5GozkIwBVBfz7hx4zbw3V94YF/xP9QdHJCICvVX7xQDogV7feIPJmO
	AN0k2yv/ovVuUIG2t3/E9J5MH4+CSzXYpSg6zYOoVl6sV9fP2R3Gy3fiQOZvwBr9
	m2XpVWZijStSMBiafup0dmr9bhelvgjMiwxpoLcenD1dHeKTV+wpefRXVxVjCsKA
	Cotz0W4y/f+22nH0UNVLre6/0I1ejy1Qa+IDSblBBqthZoDzmyxHocMALYlPVA2D
	fmmbM7ebX5/WfLuVdsOhRCVfY82iCA6lDkav5pRvNxgLZ35WwtciuB0AAzw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9k89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 06:50:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486ffba174so18110277b3a.1
        for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 23:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784616647; x=1785221447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhuQSYRiVZbQ+/9xqPc3+t1f0i5a6sUx9rb2bdMhxQI=;
        b=ELNKoeCzkfdc12sHBY/TCJbmV4DuNWLJTRyniGfgWXuLQd1R2PTzL90jj5uIOx8W1h
         UwjZuN+FlVTeWekQyeWxc8CJNNg7D7zIpHwB3rQKwa4P9D65L5ZCtHroZ9jQKzsrfQ9u
         7z9UsxhyhyPRQzy0F24kNhhpr236YpjNzzsT/3ozIrotE+KHlMA0SVTNKgcI3tl+S1gp
         Pkesb10NkCVExwI6mFL/lJApvXayEG3+B3W3drc7kU+giu8EBd28ozwzt9wF2KtaOtPq
         PdsbE+Fzj7fSFnQ0yjTFI9ZduJxCNvwjAAg7AVOcyUtE0HJsNR7hPqs3JpE1Zl9ECp0j
         MvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616647; x=1785221447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhuQSYRiVZbQ+/9xqPc3+t1f0i5a6sUx9rb2bdMhxQI=;
        b=fFi9Y8ft11Ny7ZHag/asrAnob8Z1qynK9zOx8ftNeykti/xKAWzrauwn5aOBNqvelv
         NK2/HUmvOvglv8eh8pLQXMq5zJldhSd7cTNFTM601Yn5/6/cAwchEeR3LZw/wSQK+CWV
         bq4ZKqlvSwxQoKft8dnPfTL5QkOQemEgJQ94gsI2gJUDnZZKHJWs5D0Ic5x9L5OxZsJM
         p1oI8+RRinSnxeV35FIlTGjJT24DbFRrTYwes4dkh2nNlAp3ySX/NpAjT4/CQVEoWku3
         Hb5aQRQ+b2OOuw2pxoRZzSDNPoSrsQKSKzaUmvdATpeuwWmSB+ntqbY81Ac26NmAj1kY
         kI7A==
X-Gm-Message-State: AOJu0YzXaGOstesE+Yh6RR5b5pFjfu2VCVYjB9JcrRAMko6hnUFTmze7
	c7F67HRFsMc/1k374ni345eGB8iT+QSnJJ5FF9hOqrHkXylo/naX+7y6I0eAzO6Mm9/aJYINBHS
	bRHSGY20RkhprdD93ZsVvHcJQYiGsk1JtTb2qV0sMTBh8m/22ClESwOYkGBPl6G8ZonGyLcCC
X-Gm-Gg: AR+sD12v20UZ3HMHKi8B9LTeoKQ3slc/JhJs1Q7jufg9xyjAJSgCTYnK7Bwic2OISFA
	HNdwa85aJloivT2OG2tKr6dgxPtYdQZ0xIRm2doQ7/3z8h9viwXKzCdxKyaDtujLYFKo26vJszF
	0Ml0Y0K8goY8YDDz6aVF2EgihRUHw3wyhqOubnf4aGO3dGNCQygkKM/k3N0NKiYjCASJFTpBZzy
	ro2H8LVdKmB9i+05IgbnAiXs1RTZIuqyhy53P+Jdu/gvZ+7fHsDILp1WFOF1NrbgFaeEl4jTpR/
	RI8CS1P31JrLRtULXqqgX5peTY4UpJh5D+v7l8MWkJgRaqjnTProXyyo1fz+YwTvzU5cQE2TUvd
	MhViqbhJQKEyp7JOBP6vaTZyHgeQr86kyK+rOrVldG9itDo1OxmtE7lBrq7J3LJiMu7XXZMhQVt
	Lhm3wIYWW9HWYssBcYNe2zGTo=
X-Received: by 2002:aa7:8ec5:0:b0:847:82dc:452d with SMTP id d2e1a72fcca58-84c2931085bmr12358014b3a.29.1784616647055;
        Mon, 20 Jul 2026 23:50:47 -0700 (PDT)
X-Received: by 2002:aa7:8ec5:0:b0:847:82dc:452d with SMTP id d2e1a72fcca58-84c2931085bmr12357995b3a.29.1784616646463;
        Mon, 20 Jul 2026 23:50:46 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9ef6dsm6902392b3a.57.2026.07.20.23.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:50:45 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: add AHB platform descriptor support
Date: Tue, 21 Jul 2026 12:20:37 +0530
Message-Id: <20260721065038.126046-2-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260721065038.126046-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2OSBTYWx0ZWRfX1ShVumUxK1y0
 Ry63chr7HK/B4OlI4X2MuNfE47VlBrbe9cerbaA9wy70tY39gWsPDUmg4cPa2HseukNELeBi4nG
 Hp7rhPfCO7e2pCmo0Hfc/OTOIlXnGnsOjqPV8POoFIeVGTvNs4VH1CGlYKeoQA7h9PeQrEYDBOi
 XaGpq+MULeC7YSgzmrwkUlndnVfl1ENqs+ox+Na+018Eto5zKRtS1Rn8XKqxd2t46Vll9F//jk2
 Ay/WBz7+aiTFmWLLHLprCqxUR1LAUxxq5MH22kHpEo6hUKyHr4S6KpgSI0fLgH10BQZd/BYUzaR
 5/a8B/Sg9xiiK/d6EHJQ3rEMpoAwF/BYfYPo4+U31VpU86ldWyOa30jMls+IMU421UaoDSOQkdq
 0kvJWVTeRIiLkv0ABABsTNSR3Q2nHW1ooQb3svBo3tRvrDPsUKEVbA3muA7ITExEaa+iprB3Woy
 WBL8XlTTjoiy8GOqLgA==
X-Proofpoint-ORIG-GUID: VVVWLkjj9RuuDi8bXFOTxTNi7R4PxSoR
X-Proofpoint-GUID: VVVWLkjj9RuuDi8bXFOTxTNi7R4PxSoR
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f16c7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PkEvTfuCgjdrwZjYjIcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2OSBTYWx0ZWRfX2om30NudyN0x
 g4kg+Pn+sk/IhcQlouBEiWGxA4imGD8cCTy7bPVmeKCf3TlsTfpBmivAHhYHMnnc2jPnlmnow9y
 LGGrYCmJmyRLPT3bOCaBabsM47VMVnc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235048_431350_70AAA090 
X-CRM114-Status: GOOD (  27.94  )
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

AHB-based platforms associate each device with a userPD ID that determines
the firmware name and Peripheral Authentication Service ID (PASID) used
during firmware authentication.

Current implementation does not support platforms with multiple devices
sharing the same compatible string but using different userPD IDs.
As a result, the driver cannot uniquely identify each device for firmware
selection and authentication.

Add an AHB platform descriptor to store device-specific configuration.
Implement userPD ID resolution by matching device tree reg properties, with
node name matching as a fallback. Centralize platform configuration to
simplify the probe path by removing hardware-specific conditionals.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       |  4 +-
 drivers/net/wireless/ath/ath12k/ahb.h       | 19 +++++
 drivers/net/wireless/ath/ath12k/hw.h        |  1 -
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 90 +++++++++++++++++----
 4 files changed, 94 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 07bb83710b1f..14ee696960c7 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -704,7 +704,7 @@ static int ath12k_ahb_map_service_to_pipe(struct ath12k_base *ab, u16 service_id
 	return 0;
 }
 
-static const struct ath12k_hif_ops ath12k_ahb_hif_ops = {
+const struct ath12k_hif_ops ath12k_ahb_hif_ops = {
 	.start = ath12k_ahb_start,
 	.stop = ath12k_ahb_stop,
 	.read32 = ath12k_ahb_read32,
@@ -715,6 +715,7 @@ static const struct ath12k_hif_ops ath12k_ahb_hif_ops = {
 	.power_up = ath12k_ahb_power_up,
 	.power_down = ath12k_ahb_power_down,
 };
+EXPORT_SYMBOL(ath12k_ahb_hif_ops);
 
 static irqreturn_t ath12k_userpd_irq_handler(int irq, void *data)
 {
@@ -1038,7 +1039,6 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
 
 	ab_ahb = ath12k_ab_to_ahb(ab);
 	ab_ahb->ab = ab;
-	ab->hif.ops = &ath12k_ahb_hif_ops;
 	ab->pdev = pdev;
 	platform_set_drvdata(pdev, ab);
 
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index a153db6cf1d3..037347ccd21b 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -30,6 +30,24 @@
 #define ATH12K_USERPD_ID_MASK			GENMASK(10, 8)
 #define ATH12K_USERPD_FW_NAME_LEN		35
 
+enum ath12k_ahb_userpd_id {
+	ATH12K_AHB_USERPD_ID_0 = 1,
+	ATH12K_AHB_USERPD_ID_1,
+	ATH12K_AHB_USERPD_ID_2,
+};
+
+struct ath12k_ahb_userpd_map {
+	phys_addr_t io_start;
+	const char *node_name;
+	u32 upd_id;
+};
+
+struct ath12k_ahb_desc {
+	enum ath12k_hw_rev hw_rev;
+	bool auth_enabled;
+	const struct ath12k_hif_ops *ops;
+};
+
 enum ath12k_ahb_smp2p_msg_id {
 	ATH12K_AHB_POWER_SAVE_ENTER = 1,
 	ATH12K_AHB_POWER_SAVE_EXIT,
@@ -43,6 +61,7 @@ enum ath12k_ahb_userpd_irq {
 };
 
 struct ath12k_base;
+extern const struct ath12k_hif_ops ath12k_ahb_hif_ops;
 
 struct ath12k_ahb_device_family_ops {
 	int (*probe)(struct platform_device *pdev);
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 49cfd5dfc70a..3ed38f8f2b48 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -100,7 +100,6 @@ struct ieee80211_rx_status;
 #define ATH12K_REGDB_FILE_NAME		"regdb.bin"
 
 #define ATH12K_PCIE_MAX_PAYLOAD_SIZE	128
-#define ATH12K_IPQ5332_USERPD_ID	1
 
 enum ath12k_hw_rate_cck {
 	ATH12K_HW_RATE_CCK_LP_11M = 0,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 6a8b8b2a56f9..98a6606ffd76 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -15,44 +15,100 @@
 #include "dp.h"
 #include "core.h"
 
+/*
+ * Node name to UserPD ID mapping
+ *
+ * The io_start field is used for additional validation when the reg
+ * property is present in the device tree. If io_start is 0, only
+ * node_name matching is performed.
+ *
+ * For platforms where not all WiFi nodes have a 'reg' property, set
+ * io_start to 0 for those entries. The driver will match purely by
+ * node name in such cases.
+ */
+static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
+	{ .io_start = 0x0c000000, .node_name = "wifi", .upd_id = ATH12K_AHB_USERPD_ID_0 },
+};
+
+static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
+	[ATH12K_HW_IPQ5332_HW10] = {
+		.hw_rev = ATH12K_HW_IPQ5332_HW10,
+		.auth_enabled = true,
+		.ops = &ath12k_ahb_hif_ops,
+	},
+	[ATH12K_HW_IPQ5424_HW10] = {
+		.hw_rev = ATH12K_HW_IPQ5424_HW10,
+		.auth_enabled = false,
+		.ops = &ath12k_ahb_hif_ops,
+	},
+};
+
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5332-wifi",
-	  .data = (void *)ATH12K_HW_IPQ5332_HW10,
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5332_HW10],
 	},
 	{ .compatible = "qcom,ipq5424-wifi",
-	  .data = (void *)ATH12K_HW_IPQ5424_HW10,
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5424_HW10],
 	},
 	{ }
 };
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
+/*
+ * ath12k_wifi7_ahb_get_userpd_id - Resolve UserPD ID from DT properties
+ * @ab: ath12k base structure
+ *
+ * Returns: UserPD ID (1-based) on success, 0 on failure
+ *
+ * Resolution logic:
+ * 1. If reg property exist in DT, get userpd_id from io_start
+ * 2. If reg property is absent, get userpd_id from DT node name
+ * 3. Return 0 if no match found (probe will fail)
+ */
+static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
+{
+	const struct ath12k_ahb_userpd_map *map;
+	struct resource *res;
+	size_t i;
+
+	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
+		map = &ath12k_wifi7_ahb_userpd_map[i];
+
+		if (res) {
+			if (map->io_start && map->io_start == res->start)
+				return map->upd_id;
+		} else if (map->node_name &&
+			   of_node_name_eq(ab->dev->of_node, map->node_name)) {
+			return map->upd_id;
+		}
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
+	const struct ath12k_ahb_desc *desc;
 	struct ath12k_ahb *ab_ahb;
-	enum ath12k_hw_rev hw_rev;
 	struct ath12k_base *ab;
 	int ret;
 
 	ab = platform_get_drvdata(pdev);
 	ab_ahb = ath12k_ab_to_ahb(ab);
-
-	hw_rev = (enum ath12k_hw_rev)(kernel_ulong_t)of_device_get_match_data(&pdev->dev);
-	switch (hw_rev) {
-	case ATH12K_HW_IPQ5332_HW10:
-		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
-		ab_ahb->scm_auth_enabled = true;
-		break;
-	case ATH12K_HW_IPQ5424_HW10:
-		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
-		ab_ahb->scm_auth_enabled = false;
-		break;
-	default:
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
 		return -EOPNOTSUPP;
-	}
 
 	ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
-	ab->hw_rev = hw_rev;
+	ab->hw_rev = desc->hw_rev;
+	ab->hif.ops = desc->ops;
+	ab_ahb->scm_auth_enabled = desc->auth_enabled;
+	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
+	if (!ab_ahb->userpd_id)
+		return -EOPNOTSUPP;
 
 	ret = ath12k_wifi7_hw_init(ab);
 	if (ret) {
-- 
2.34.1


