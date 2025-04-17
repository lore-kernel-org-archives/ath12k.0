Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C4FC369BD
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 02:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ASYzim3p5yrHHmTbnyWG7PX18Zybk55cIImGoC+1/+E=; b=1VRJf0XAmRBEJAiFrZjE6SlUti
	7buyjT2HAR20mzzcBdJvJ644zmyXDV42QWNaoChqCvDp/JU2CVqOhCZHVO1v+tCVZ/I60DLmkrQMd
	IB4bscynmGSWBZwfOAjto3ajaouz5bR6SA5zHJBtsjLIxLpxDCAH698ts9cGH+qNPUh/Tlayn5HKF
	S0F8tqc6wvi6kOwXGGTZLFSHCsN960mDQnaOIQFESe+f4e8hFi+upv5dEuJUV8GskfH5AcBUj7cgI
	QVlT7B+zqDs+O60wSH127FnfoL2MUfxFev3cVIIFlQ2JkXSaMuFe07NzBYWlomkEfZiWJ+Wz8W8ue
	dsxzXtIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5FDA-0000000BY8s-3YDP;
	Thu, 17 Apr 2025 02:42:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5FD7-0000000BY8K-2XaI
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 02:42:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLe4ST005948
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 02:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ASYzim3p5yrHHmTbnyWG7PX18Zybk55cIIm
	GoC+1/+E=; b=NSzJjRkE0LVVHcgMUYXtBgJ2om/sRQ1I0oAbd6QwAwQw75GYxQd
	xZQw8jQ8Q8k/XO/M/OvYndVTS0wl+JOefLlj/JgcphsYi6M6ufdsVHgV7AzKGxyg
	bkt62YqD+lcFHg1UQrJ8UO1whMB2+/7yRoroNv7ylIFMy+i7+RWBjSkbjeKnkK48
	TXUE15YOPzoabL9adozNzq09FiKuHTg6eSpRTtLV2DAGrCae9lE6apZI/SwyzQSp
	MFlJYm8dGSswV8RQDO3wlTnMmYzUe9WTnv2WA/tw99Nmf/+mNVBgmYy0em9re1Ot
	G02oqUkYWvAtAzwN8c0GrK4i84KOvDlzUlA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqdn15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 02:42:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73c2f5c284cso288717b3a.3
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 19:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744857757; x=1745462557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASYzim3p5yrHHmTbnyWG7PX18Zybk55cIImGoC+1/+E=;
        b=VDgV2RVbv8oGkRgS1lh8CRUFGCWFs/WxWRxJ1XPWv6xWRrvZzjFKNEqPgd5OxC3v+E
         C742Gl6NDsRxzZDZtF5PqTFZ6usJCfnGoR/Fl+6h9WlUKHdC1piavbgR+geLMS3uGE38
         j9Hr2myakmskvEePYsupD2BhZ5ifyjTMnCHIir+S3vUj98l+rtOhqJJ8o1QR8ubMbrIu
         HKtdU2GkSR6i0dj3xgpZO/VlN8xOysVzz6afrJUOxc1LCOSkAL+PlpwN3juq1JGTit76
         48OcjhpqtoQ6BRD70RjtDDH2u7+s/g1dUM0NYeHozRrRc49a6Tnk2qWJj6Y2X3aMdtBG
         OtGg==
X-Gm-Message-State: AOJu0YxCJcVmRf3nvJ2Zx9cOFyoYH5Mgl/+g2o6gUc0TkmJOvOF6FvQB
	sAi+NH0EPAFCW//bVLVts9m7JrxwdFMQezEbyNqlzJv1+UhgcZmNpsc+bqSU2oddZSCG7yIQNZQ
	7buIxMnOI2oZPf1Q4n52b7TI3X6We9yGCAQwQKaokQwfnBx7tCMJWLdLMj93VN79U714T
X-Gm-Gg: ASbGncsmgr5qo92SXANtLdXN7USyLhFjdIBsLoZ6jRNRSd/spDExX+sCVs3wNbPS6XQ
	IVpClQTBnlgWIYySlXDUaDrRIq9FUQ1/jOFX/vzCiByjw0Nb6AXZRGzzxXIu5hNfKbVTeTvlG1M
	Jh5/XCPAioNLAsuTbpD4kq9sedZq1aB+YrabF60xnMxgIWcK7pnbagxOv9/mrYW0w8XGqpu6Cht
	vHkPMv0YAiK10jD6fnouYQPJKcHIlNI/Zq9pmsG3rRHfzxLwNx/ZtOERArQR9HcH6eZqNcsLJ+M
	sA9M+Vo5EXw0EUhQY6eNczd6NfjhY8sOaUbMHITweaLmflpdUDtvdxtBYCT96V9DcIuskrji/S2
	bYsOCuW9bTds=
X-Received: by 2002:a05:6a00:9a3:b0:736:ff65:3fd0 with SMTP id d2e1a72fcca58-73c267d216cmr5556378b3a.16.1744857757284;
        Wed, 16 Apr 2025 19:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG87CM+UZg61WXhoib693PD+ztU6wM16QU3CaKwJqrC0dPa0iRB6bWTRZ0iXosgFCNj56NMKw==
X-Received: by 2002:a05:6a00:9a3:b0:736:ff65:3fd0 with SMTP id d2e1a72fcca58-73c267d216cmr5556343b3a.16.1744857756781;
        Wed, 16 Apr 2025 19:42:36 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm11235324b3a.38.2025.04.16.19.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 19:42:36 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
Subject: [PATCH ath-next v5] wifi: ath12k: read country code from SMBIOS for WCN7850
Date: Thu, 17 Apr 2025 10:42:27 +0800
Message-Id: <20250417024227.1712-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 15viC7Csm5Nf_WiM2M5WT4akdvpLC1lH
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68006a9e cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=c2OH02f2B1J9eqCLxTwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 15viC7Csm5Nf_WiM2M5WT4akdvpLC1lH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_194241_780885_864AE558 
X-CRM114-Status: GOOD (  17.64  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Read the country code from SMBIOS and send it to the firmware. The
firmware will then indicate the regulatory domain information for
the country code, which ath12k will use.

dmesg:
[ 1242.637253] ath12k_pci 0000:02:00.0: worldwide regdomain setting from SMBIOS
[ 1242.637259] ath12k_pci 0000:02:00.0: bdf variant name not found.
[ 1242.637261] ath12k_pci 0000:02:00.0: SMBIOS bdf variant name not set.
[ 1242.927543] ath12k_pci 0000:02:00.0: set current country pdev id 0 alpha2 00

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-02582-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---

Note: This patch is an old patch in public review written by
Wen Gong. Just resend it for him.
Link: https://lore.kernel.org/linux-wireless/20230913105156.17618-1-quic_wgong@quicinc.com/

v5:
    1. fix "From" header.
    2. rebase on tag: ath/main(ath-202504141512).
    3. change quic email to oss email.
v4:
    1. fix assignment error for case ATH12K_SMBIOS_CC_ISO.
    2. rebase on tag: ath/main(ath-202503251458).
v3:
    1. rebase on tag: ath-202503172347.
    2. add branch tag.
    3. add descripition for Wen Gong.
v2:
    1. rebase on tag: ath/main(ath-202502181756).
    2. rewrite commit message.

---
 drivers/net/wireless/ath/ath12k/core.c | 26 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/core.h | 27 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.c  | 11 +++++++++++
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 9b23329f1bf2..b5ade9c7530d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -697,7 +697,7 @@ static void ath12k_core_stop(struct ath12k_base *ab)
 	/* De-Init of components as needed */
 }
 
-static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
+static void ath12k_core_check_cc_code_bdfext(const struct dmi_header *hdr, void *data)
 {
 	struct ath12k_base *ab = data;
 	const char *magic = ATH12K_SMBIOS_BDF_EXT_MAGIC;
@@ -719,6 +719,28 @@ static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
 		return;
 	}
 
+	spin_lock_bh(&ab->base_lock);
+
+	switch (smbios->country_code_flag) {
+	case ATH12K_SMBIOS_CC_ISO:
+		ab->new_alpha2[0] = u16_get_bits(smbios->cc_code >> 8, 0xff);
+		ab->new_alpha2[1] = u16_get_bits(smbios->cc_code, 0xff);
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot smbios cc_code %c%c\n",
+			   ab->new_alpha2[0], ab->new_alpha2[1]);
+		break;
+	case ATH12K_SMBIOS_CC_WW:
+		ab->new_alpha2[0] = '0';
+		ab->new_alpha2[1] = '0';
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot smbios worldwide regdomain\n");
+		break;
+	default:
+		ath12k_dbg(ab, ATH12K_DBG_BOOT, "boot ignore smbios country code setting %d\n",
+			   smbios->country_code_flag);
+		break;
+	}
+
+	spin_unlock_bh(&ab->base_lock);
+
 	if (!smbios->bdf_enabled) {
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "bdf variant name not found.\n");
 		return;
@@ -758,7 +780,7 @@ static void ath12k_core_check_bdfext(const struct dmi_header *hdr, void *data)
 int ath12k_core_check_smbios(struct ath12k_base *ab)
 {
 	ab->qmi.target.bdf_ext[0] = '\0';
-	dmi_walk(ath12k_core_check_bdfext, ab);
+	dmi_walk(ath12k_core_check_cc_code_bdfext, ab);
 
 	if (ab->qmi.target.bdf_ext[0] == '\0')
 		return -ENODATA;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 44e02ebb1071..3f9fcd4d6f20 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -175,9 +175,34 @@ struct ath12k_ext_irq_grp {
 	struct net_device *napi_ndev;
 };
 
+enum ath12k_smbios_cc_type {
+	/* disable country code setting from SMBIOS */
+	ATH12K_SMBIOS_CC_DISABLE = 0,
+
+	/* set country code by ANSI country name, based on ISO3166-1 alpha2 */
+	ATH12K_SMBIOS_CC_ISO = 1,
+
+	/* worldwide regdomain */
+	ATH12K_SMBIOS_CC_WW = 2,
+};
+
 struct ath12k_smbios_bdf {
 	struct dmi_header hdr;
-	u32 padding;
+	u8 features_disabled;
+
+	/* enum ath12k_smbios_cc_type */
+	u8 country_code_flag;
+
+	/* To set specific country, you need to set country code
+	 * flag=ATH12K_SMBIOS_CC_ISO first, then if country is United
+	 * States, then country code value = 0x5553 ("US",'U' = 0x55, 'S'=
+	 * 0x53). To set country to INDONESIA, then country code value =
+	 * 0x4944 ("IN", 'I'=0x49, 'D'=0x44). If country code flag =
+	 * ATH12K_SMBIOS_CC_WW, then you can use worldwide regulatory
+	 * setting.
+	 */
+	u16 cc_code;
+
 	u8 bdf_enabled;
 	u8 bdf_ext[];
 } __packed;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7af12733a1ff..aee3080a934c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11550,6 +11550,17 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 			goto err_unregister_hw;
 		}
 
+		if (ar->ab->hw_params->current_cc_support && ab->new_alpha2[0]) {
+			struct wmi_set_current_country_arg current_cc = {};
+
+			memcpy(&current_cc.alpha2, ab->new_alpha2, 2);
+			memcpy(&ar->alpha2, ab->new_alpha2, 2);
+			ret = ath12k_wmi_send_set_current_country_cmd(ar, &current_cc);
+			if (ret)
+				ath12k_warn(ar->ab,
+					    "failed set cc code for mac register: %d\n", ret);
+		}
+
 		ath12k_fw_stats_init(ar);
 		ath12k_debugfs_register(ar);
 	}

base-commit: b80c52642c1159c2596776b39b06eb1c2e36baff
-- 
2.34.1


