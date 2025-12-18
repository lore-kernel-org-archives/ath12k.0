Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD96FD68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=; b=TO/qToNcL3RynKutg9P+QDzxoY
	4MLlx0083rX3UPRS52Hfw1EnnGpYlPg/+EBTHtjBvBhw78Fx3rz0HcTDElErSUvyTNVg+aTNFkOIS
	DTORP1LuOj8wsWA8j00PDHAdW7z9Eu4nBIJ7b3FU2m+7krF36URocTA9XwOAvFyf0ke9JLFc2zBnA
	b94SeE9TMf7Bf3ZKLzWRHNcOqtuhD4xZoj6z8CAiezO8+uK/TKMgEn9oFlmb5XRrf41yjse/XzI0f
	3ll97apDuxmYRw5LWjwqAHqJAaeHfu5drUB1+BputpgIrn67rr5Ax1PvIz4RMGLvCm+rkxUIIyVv6
	L+ZdjrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ej-00000007fwC-26ld;
	Thu, 18 Dec 2025 01:55:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Eg-00000007fso-3jyu
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YZ9Z813774
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=; b=c62tDHhWTrl2fRBz
	3G0FRLtj5ebFOk8c0PfqfU/Y0zNHTr/lAigQvaYqE2y3QM2aSkb8qlozCT+yK3EJ
	9aCe+v30ltta2jS3z2PIfjTxmybLyFzvIlq+WVnh6pC/CHprxvMsRXNL5HevEFGG
	oHrUfCsTP73yKEN0BHot4a2Ku+TdL7cjCemdisepNqGfqb49+f6y91azvMLe2EPD
	OeEFl15Ij9FR5jakAkyMl9moPNWFYSGAL/nDkgBYsQL1FtoLmJ9s73aO5Z3IgYHo
	0b3jWw/4a30MS1pc8UHsVVblD4Y1KNYRJ+YRJ4oeGWha6qFcJBen/ad4rgnkGeKV
	vuRq6Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v796ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a4b748a0so3045295ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022921; x=1766627721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=;
        b=LdcWd49vSFJf2naYVRxeLFXacrN+vxJOyMhbTEa730K9g8w296HQCKN0/sXUvFKdRK
         ldTX9XVC3A1RukxR7lIoJWfGU3lQ9b1b7tDaXkTOtj3yEwGrvNSMsZd2/LMFXMqBq5ZM
         87wsJim4bCt1PYK8qVOBdsvHfq4gPvVNw5K54U9kAIX4+t76tlkRzB/1xQm0dDYJWcxe
         BqrSfd92pzIFNnkceKYXLHlh+qauoenbXsAtOgsvHF7HwGuMWVHInmITL3EaoXUxPOJ3
         okWjLeV0a6eTQt0vchfXv22+QP/Iy4A64U2AmRBgYbnAhvar1c5U/QxYzvkhiGcV9grZ
         eOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022921; x=1766627721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=;
        b=HciE099TXv51LfTXVIO963iLXUFvsqHgXLVaKUo7ITuTLjY8PIvLjQclreh8v/gYMU
         6WYn6s5vzQU5qFPOjX4dvERbq2pQC5dixgFH4oMZBZ7j2nypdBVU6S0o8LlI9bV1Laev
         tIb1eMpeTIg0Vc4DF9v/I/fB0BbKUkYO8Y+6TSvbXyNcOZHhYAC95gqbbClw4OeIz7nt
         pbvj++/GCCFcq0fQv6f3hUOOkM4xLPCgwOh14xfYAlZdZhoJH+nFEhpmFQuAECY/Tqo8
         iTEpMstZx+Q7QVT4OajwuS43jMwooF1zNVPc+Y/ayNoGuSJrnJGYro7jTelgXElC8PkB
         cKeg==
X-Forwarded-Encrypted: i=1; AJvYcCWz1igpwKfionEYsXgW43fAOQyD6+XyrQwI9igOgyETJeqb4FEni7qlQnGSuFFrGVa/3H+S4Ts=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwLjU3zSAFCxgylthfqPnm3MB2dODsQN2qDd0tP1/G9Pn1s/aX
	pPSkg28vHS0cw8urmeBS/zTqrVn3tO/AoYvuXf1RhlSlwS8b6AIEOVuGr8Gejcfk24ItfU2BOdF
	x17jTmRjZRRXd4Gy10TNhI+dczuYtKEnjy9eh4le+qJ5B48NFrl2TRsu4ogfENrp4WqhnS0WNa0
	0=
X-Gm-Gg: AY/fxX4LW1GjiREfYn40F6jw/ti6hgmOVi3thcsbb7Ak3lZTzOiQZeZakKsgzJwDKx+
	ripsVqHlGSMpOiadtW0Fb/67ICsXpEfVeFr5WKB0zfoah0v3qJCOh0uiB3kG4mYxD+Z6qg2fR6M
	xEstG4QTKFquaf0nqKYLU52AhBXv7oUcgwkyKr/2xFnH661r2sBJKgKYBqZQp1KxVpPAsZdu29L
	YnCZX/7Z1VYLaW2OMKu79rZxEa5flfpldHdreseaCnQDoz91v/IxKhJ3fCaVgP4+ujIsEE/F/tq
	f+XSYQccYgGEKuN5FNfg6cfBNxy4YhWUp6u/NDx9NM82E6/xAjkflvGOJirALHk1NJatEbialxd
	kE/hSdzvVgl9iqJAmcVhgMuNUY+UwQN+ZZ9mUKSpla08XVnNuyxjnX7mFYoZOfMs=
X-Received: by 2002:a17:902:d490:b0:2a2:bff6:42f2 with SMTP id d9443c01a7336-2a2bff64378mr24309805ad.6.1766022920583;
        Wed, 17 Dec 2025 17:55:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3Px8twSsRitxmjrtB7q5yOTMmb6O/jCsV7sNZHG4shQRn0KzCcUfsGQ8RGG+SR+686UdMeA==
X-Received: by 2002:a17:902:d490:b0:2a2:bff6:42f2 with SMTP id d9443c01a7336-2a2bff64378mr24309575ad.6.1766022920112;
        Wed, 17 Dec 2025 17:55:20 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:19 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:22 +0800
Subject: [PATCH ath-next 08/19] wifi: ath12k: add hardware parameters for
 QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-8-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: N2sRQ-Ww1xsPOrtFJ40_fkFAOd--jFLz
X-Proofpoint-GUID: N2sRQ-Ww1xsPOrtFJ40_fkFAOd--jFLz
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=69435f09 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yc6Qm1rWrO3FlAV6bLMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXxXwMvpvMs3kd
 1NaxgCqYE4SIA5C1VS5axDqkBLSBGld2gAhHZ1qHL+/AS9Rba5zJQWMPFyY3XsMAQO0YmvTfOxZ
 1R9mQzQI0yYzf/TWMOA1aS0Ziw55PsWuE6j1+ZSgGEQuQrNFgDxOoQIa3GSJu3G1M/gAuiVPfx0
 qINRG5LouYp7bSs4s0gUJpwnS7PJeWY/X2aOxqee5eUExE1YbuJe0eaAg0MtA6vDmEupVu9fBO+
 XEZrufECSn+0z3+NPtwo1OhbrSgCDq5Zj8pzvtuKaycgQHiKvRS4pp1XyK7gP2GMUFmKyg/06tE
 oIxke9SCBFa5DcosdomGqc0i2SaoJrwnLEM0qQcKvmwtI4GFS1Rmog+0mCDy9zfcsXCEIjoXmVG
 U+g4dZGnX1qvrtSJT6xI9YWtdNjW9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175523_071005_D0E36715 
X-CRM114-Status: GOOD (  12.18  )
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

Add hardware parameters for QCC2072, these parameters are directly taken
from WCN7850, with exceptions to hardware name, revision, firmware
directory, iova_mask and RFKILL parameter set.

Compared to WCN7850, QCC2072 doesn't require aligned IOVA when
transmitting packets, hence iova_mask is set to zero.

Besides, WCN7850 has a dedicated GPIO for RFKILL purpose, however QCC2072
has it coupled with WLAN_EN pin. For QCC2072, host is not allowed to send
any RFKILL configuration info to firmware, or firmware crashes. Hence
those parameters are all cleared to skip configuring command.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 85 ++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 1f5dda73230d..ef0a59f6339c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -652,6 +652,91 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = true,
 	},
+	{
+		.name = "qcc2072 hw1.0",
+		.hw_rev = ATH12K_HW_QCC2072_HW10,
+
+		.fw = {
+			.dir = "QCC2072/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 256 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_driver,
+		},
+
+		.max_radios = 1,
+		.single_pdev_only = true,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850,
+		.internal_sleep_clock = true,
+
+		.hw_ops = &wcn7850_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_wcn7850,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_wcn7850,
+		.ce_count = 9,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_wcn7850,
+		.target_ce_count = 9,
+		.svc_to_ce_map =
+			ath12k_wifi7_target_service_to_ce_map_wlan_wcn7850,
+		.svc_to_ce_map_len = 14,
+
+		.rxdma1_enable = false,
+		.num_rxdma_per_pdev = 2,
+		.num_rxdma_dst_ring = 1,
+		.rx_mac_buf_ring = true,
+		.vdev_start_delay = true,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_P2P_DEVICE) |
+				   BIT(NL80211_IFTYPE_P2P_CLIENT) |
+				   BIT(NL80211_IFTYPE_P2P_GO),
+		.supports_monitor = true,
+
+		.idle_ps = true,
+		.download_calib = false,
+		.supports_suspend = true,
+		.tcl_ring_retry = false,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = true,
+
+		.num_tcl_banks = 7,
+		.max_tx_ring = 3,
+
+		.mhi_config = &ath12k_wifi7_mhi_config_wcn7850,
+
+		.wmi_init = ath12k_wifi7_wmi_init_wcn7850,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01) |
+					   BIT(CNSS_PCIE_PERST_NO_PULL_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0x780000,
+
+		.def_num_link = 2,
+		.max_mlo_peer = 32,
+
+		.otp_board_id_register = 0,
+
+		.supports_sta_ps = true,
+
+		.acpi_guid = &wcn7850_uuid,
+		.supports_dynamic_smps_6ghz = false,
+
+		.iova_mask = 0,
+
+		.supports_aspm = true,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = true,
+
+		.dp_primary_link_only = false,
+	},
 };
 
 /* Note: called under rcu_read_lock() */

-- 
2.25.1


