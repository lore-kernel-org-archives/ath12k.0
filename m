Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAA1D25042
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=; b=kok8wKbr9m0m6l6xFD+WkQPYLX
	53Q4Wem0u00f1SXrkeggedB2L07Z4H/VNutIK6/QVhTG5exSuiHHsSWQhcgCZtZQzuUKpRibDZLkd
	+MinkGKPdEn+MNGgwGMwD06M4j395kAzTVCOVHdJ5Il996z2/1f9QALlebV1JiD8Dv29myIJ1kvSS
	LyxTHGld/KErscg0zB4jzWxFyEGZITCtBYNg7Sc8qA3i3Jfps5+/LiGSXUFPmNdvuEJv5KaKzGQ/q
	By/RmikrJ68PhD75snj72Gce5InxbfHS5yNtKg3d4l70nBNWku2vvfBlQ+1aWrg65M10WlwivNmNP
	AYoCCDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUF-00000004tVa-09W2;
	Mon, 12 Jan 2026 07:37:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUB-00000004tR0-1FEb
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BLU2tq3038593
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=; b=g3JLkI/wXvEkGnBv
	4eaZrNvTyWcKWE9lQYvZX2fj86r7ZFyyYXM0/rmWuH674+3D/YnfseRrI3IC3ce8
	rQdrPklT870FvDiw2583WkoVJfpH2xYckflwuLWI9+NXGBMAUOnq1U/wvUVqIRPG
	xd8V3Jql6YoY4jKM0NaHizO7mzTbT62O0ayuLgT3vSAVJsfI80An2r2p+UP49gHj
	JlYP+6y98XxzAdsh8zdPjY9tpOYeGTdu4TxX2HW+5XKpRPra8WB4GmG4669kZcxd
	iHC0VXDWMmv/Vwm2SK5YbtIL39k5Hrma+uGr9+rBRCK09xs447OiLzBRZ+PQZ+gn
	ngeN2A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukdd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c37b8dc4fso11559536a91.2
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203428; x=1768808228; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=;
        b=fu04HDYOpMpmkwjqx//J6lEl02pLefsKKN+CRJYBERTh9lKnUhqbAeV6UuuyJL5q0q
         18r7krFPMBIWfldS7PcAjj2x3q8S+DA7jPbfXQtiVdKE6ePpSneNzpM4NEKXIwTqEsJI
         vRcYHxlLynDiXeZdPu0cBvFQT5bp43k+mqWhXkFGFK57jf1ICbcb0+/yoUp77sRkMHdL
         VLsE0hzu5Jgcp0v7HgaVCoHBl1w8eFNi7YpUugf9zVAcv1E19xIbUFVtRkk7w8Z8Qzab
         CxFZMWI2O3WKQ3ux6Xvpe52ZjetAgzpFFUfiyUvHpNUwWRjqpxDMdJPERkNraLh9QQCS
         1nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203428; x=1768808228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oyZx8sGXc/TDrKQgwByArrdL9wJQD6lqgZ5uNXttzY=;
        b=eVD2wnJ/gCS2brgjfSgunuExOrDM0S3ilrgOvxx0UeCrYJBiZ4CGOP34UCg1kSpGWA
         4dg5FQYZLpAUGWjanYIGH7VE/k/0I6hPTCWexTIzOw9BbJEGkbadMR2WnDtqwPk8JP6N
         kZhM3c2ddTVqZwlujd881FLGsWxEDeUrTzwWfmVdHOnQ8MF/RU9Q5hVwWRWM9UwJdz2F
         JpHIHIzrGMVSsGEfZRb8NBc9gF+9bm0PX9VYIWsvjmQUsVp1hFCOG2/LWAHXXYjrO+pX
         CPNrsYx06rWLcf3tmPdWGMfKU8uCzVpqSZVgV3I+aadBT6tlFHelDzmmNciWpXDzf84u
         ee1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3GUCcWQlDYBjw/Tr2NcafAN4UBYhIr4tmnHU5dCchVVlhRqHp1oyUnmf5HHsnAT7Zxchx92c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwF9uK/fx6RS9WvLM6YIanB99Uz/H9TshK1OvSfATCY7Dcv6Qyx
	Cuxm0/tzBDn76fmZ7z7TQYmmPT/7seBEYVBahh79KI9CagMWsqusgAwIqy+FHfwsTwsvi1MqnAH
	AWB82A0W5qKU1NrgkeWHoOBZwlGYFYWqaN1czt2JwPIpiLXsvePCUGpAKyqq2+gAoVG/Xb0tasX
	4=
X-Gm-Gg: AY/fxX5fyAR4q3EeROj75N3MIQSq2XLJZajHqzMQqp/SauJXcijyLpgUZwS1SSCguBC
	h43TXC3ZXlm8ttJYDxf96kfbwjI9E0unmlzH2FX39stxzQ8hCB8Hgbi1Bu69py4OibFTpf/I0WX
	yfziM5ic3pr+1eNZCQxJjGYEJ5PP80HsvwUImqEF2hP0zFumHCE+87RQxQJdao8DCLiRdHVsHL+
	OhRoSwtblr+rTF+aO61ULtVEOFjWVbkHCfMT3e5GdPLG16+RecDnVGHotUvjzjhgeRYGCDTO+zL
	jIrXlwrfYU2v4P+trzTnGiq1ZUpGxqSCbgZ7cWQ349W6mF9cAa5uSc7ERoKvCa2s6MLEP1ukb6W
	z0PEs9Uwh6/iMqmkKdYSYGPnFy0msazfwuWrvZ6PWszxrD6rZ/WikkS9hpey/rtU=
X-Received: by 2002:a05:6a20:430e:b0:34e:e0ba:7ab with SMTP id adf61e73a8af0-3898f990453mr17785281637.40.1768203428263;
        Sun, 11 Jan 2026 23:37:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFObpRy3i0YiC0P/7viEWWS7gfgZYygI1YzssxqK9ri5qKv3Vs/+PR4QVSrlDhotLJvg2jr6g==
X-Received: by 2002:a05:6a20:430e:b0:34e:e0ba:7ab with SMTP id adf61e73a8af0-3898f990453mr17785267637.40.1768203427807;
        Sun, 11 Jan 2026 23:37:07 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:07 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:28 +0800
Subject: [PATCH ath-next v2 08/18] wifi: ath12k: add hardware parameters
 for QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-8-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX9kC0Cr/io+0k
 k2piYbDoeSNNfF70RU/zydOkwKomC57ku2OwZK3xxS2xda8cLpk7bMJ53JfXFfTCX3fQ1KZolhY
 5tEMRUxTxxXQQtCBEB2Vp7IzoE+PJnGckFSshMU0rhRlKXyYbt2/I3DOiU1aV8F8tQGbi5cP3sC
 e6ws9zxR35r7XHJQznEhilPNG0mkj30xOWeZsyNBDLnIhoIvGK53aaAyTr7bMRFv5rfa8cbMDz6
 CqB7rE18BLhcgFQI4SyNpsK/N5aWoV3slQfw6GljpOt6c+KBOrelzxkarOeqO/zYUzwADUtSV1r
 Bla0IF+V/LhpxkIsdTnvI8bR5sfFHtZHFFTke6z+0P9dfaMDYbe11YkEGMYp1qEpuX/e4QvPDwJ
 UQfo03NVm+C8dV1Wu0ckRwXQStAv4ZU7YOsz+i/gzkNr73nKuHfUDIwSMABC91/rDG85DgQorqE
 DX5GeHi/JxnYaZ84JLA==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964a4a6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yc6Qm1rWrO3FlAV6bLMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: cce70K1ucritP_Xc0nPGGP9A-S_0XznJ
X-Proofpoint-GUID: cce70K1ucritP_Xc0nPGGP9A-S_0XznJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233712_083915_823239F0 
X-CRM114-Status: GOOD (  13.04  )
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


