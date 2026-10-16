Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FFECCA466
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFutmOhm6NeNyUgq6NlpBDGor1rLlHRNYCp+sYPk9iM=; b=YSLOxTLascJoJtWNXX0P2l5aa4
	3qC0WbFSC7+VZ8yczGCMtKKZCpwdocGFzeWqzT9t9n8YxsiNlsLboLWD9lzHKdoPNpjF0O+d+yEhE
	bO1HGMI4WQlFkJQ1Q1iIij1o1lnqzCFafK/WJv3DqubZwz4kQfF4wMLeDcZvrOslQMKiZC4ngZaMz
	Mb6bfRiCB9xoWilhYWRcozJl9InqcH87DoBwf/A/OiDXHHY3N2/y+5M168XgQ0D5j7p8g7tCHAa4E
	jChnkIw+C2yrm9QZIpLYMk4OBQo15A+lirAo0JTsBxV87kpLDHZpOVFmSaLcdRTBr+IUtMdqALt6Y
	lM5lRyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWE-00000001pLY-3xF9;
	Fri, 16 Oct 2026 03:22:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWC-00000001pK2-2a8g
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1BwJ41890489
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFutmOhm6NeNyUgq6NlpBDGor1rLlHRNYCp+sYPk9iM=; b=LnOGGb44De/DYDCp
	3oRVyw+HfcsLpXL/Maxs3b/bbBetd/G8MhjqDjdPe18i9MFYCVp2PpG8rpohIJtk
	LMBKnDKiM/J4Q6Sw3jgGlmtKhEz6rmEqB9lpZlxt1DeKbZyUo8HqlBODgwNGdabn
	PhKKR15xX3jcokEVquuH8yCkuBzV3ocuYu4kAhc84Pn+rW+DoI1im4rKsefQX36w
	U3K7MmRacZzy7HsgabZ09xizvh+f5KNUZtthXJaaSORl2758yM0HuXAfxPm0TDy7
	DjMriN5hQUvuitBFQa/jrccLcBr1nMLTBRAkGmGOth51KCQCAUXOA+gMCge9ElRe
	4MSG4A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba260bw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so8210308eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120923; x=1792725723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFutmOhm6NeNyUgq6NlpBDGor1rLlHRNYCp+sYPk9iM=;
        b=JAr0fZdSVwEd2zQRYF3hAUrp+rPNGq1j7NizXSGdtAAe8yhE/RAhjHIdg7uQ4wmX/W
         9dO3QYF5ZwuF++C6yMVC6evNhgsbPWAx3iPooQMrUomHgFDbAWMn53N/0LLgX7EXIQ7a
         k2x/wZbq7/nLX63QfMMD4wuWA5z0Ss7MWm5peCkVD7rmLXL5BrG+Y8BeXKVSy+mykmQs
         J46KiXAUVE8hiC5zvsiNGz63cDW/ucsnaNa5jzrZlJN9KVuKKesv0J5R7ThTiktJJiz1
         ynApe+LDzodPwnQDVpo8/Y/DZ8HNhODfjruTv4JHO+V/0rhwtpaGYh5aOgxl/KPJVzHA
         GCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120923; x=1792725723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFutmOhm6NeNyUgq6NlpBDGor1rLlHRNYCp+sYPk9iM=;
        b=CRWjb0ylPYvY8LCtZ3jQdyOpYURg7YBWenNu6JIHQnWo/Zdq9NycjlpDVmTZOeBVPE
         7mumLPTZOTd7pU2g6l0fuE3yGcSy3r4tu+1FP7uBJzhrwyQjllZDvSUmGXQITxmECvk5
         jnvvlri2YckM3O1SknE8iV0Z+MtQzuHxndJL4EqKNGuhXwpYZUqJXC3/OwWjBiyPhq/Q
         u6Og6AKjQztKmiKDNPfjmbtsZsiHCHtV6ng35JXNIbCVBAQ7h0OWk9cLrMlhiOOBZUBP
         AyA920NOmpNNJRJTRC+2Gy76UHgXShh9dMOoDYWbOmGk70n0NcG0bCPX5dJuRAWGb7KZ
         TeGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPBmRAsxUp8Z1xaP2wQL5JiRcHuSpUTuOEeSqX4CSeZ0AgHfUDUTedTbJ4dR0zI8pZnGa7sa0=@lists.infradead.org
X-Gm-Message-State: AFq9FYJU/TDmLycUhhTikvZnFHclzPl98F9iI7F8xKs5xHkaekKynrRs
	2ucnsZ+ZKTDM4BFN+56Mp9l8nFOlp7aoBY5SGhr+/LVKZk6siFo5+o+ZwJL22ObirPBtbY2TQe5
	z2HTC9AVh5QXs9rDjqNtSm9/Umy/itkiqrQ7PQgHhPYQjf+BjfaojNcZZ3ulzCcsR
X-Gm-Gg: AYBFou22V21EMloIFdfUqjOiPAaFoLDfKs3uRwia98DooU4J7142JL12p3y2tri1fTt
	tztXK12SvhCQB3PpCgk7+jQmrgqrPKPVgND5N6JG+POK/Fw12Em59ajqeCP4SIHf8CF89MVVYvv
	40fNGF2Ck8sh5ZKSq3iARVY/IRUPCFBA9jyFpRuTOiRB5+QNAYOs2JauCQxrLzia1cyo63fFXZs
	C3EhT1ty9bVB1slpNa+kvrqN1JvYKGhF77EdCEOShUYH5e3z9vJ6tLwoS/2CZIiBeA/f2UhJLdX
	mbeLlnQvTgSiQWTYXS6KMEpLzl3xz0pgQOeg/BAVSquz2BDNSQyDoVhIiZIAYs7ZbJhdUHTtUVs
	TB5RizVr+1nr2ra0Rl2dms3OK9nyizb6NlW53jCMUckoyWHz5AzOcGquCNR/HUnpwStqG8jE6fX
	GrQGKSI9dpajrFKcpm9ln/cA==
X-Received: by 2002:a05:693c:400f:b0:360:1637:3f1 with SMTP id 5a478bee46e88-36016370a3fmr2885300eec.40.1792120923447;
        Thu, 15 Oct 2026 20:22:03 -0700 (PDT)
X-Received: by 2002:a05:693c:400f:b0:360:1637:3f1 with SMTP id 5a478bee46e88-36016370a3fmr2885261eec.40.1792120922701;
        Thu, 15 Oct 2026 20:22:02 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:02 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:40 +0530
Subject: [PATCH ath-next v2 03/17] wifi: ath12k: Add hardware parameter for
 QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-3-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1985c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IkfkkYc7qEKKYK4gSbYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX7+6POAXJs35F
 ZBOOtABCT2SluppajCHSjWNw5iguoaFTobJA545zH8g4IkY0cphItvVLRlDiWx/14bBswKLyWb8
 ziBmzHs80/vsgTW4DgQ5cBYvpbLaeWhON6Gc3in5/FG2ABu1oh9Ukmichm/cLGBYjtnc7xT0qBk
 tZFz1iAktiev86sve5Y9NCwOBGGxqRWlaSLFlMzClWzDkbsJCapvT+B3oaKnySDITO5nUhERY6q
 /e0JnxteuAX0piSD12UHGiZEAb1XgPebuclKX8FPLCggn9B70kbvqokKug+TKgmQ8Di2hvRpAVt
 UnYVsgSY4NrvjqeyQGqpoxzsOciBa3wjxAg9TaLIXuc5DWpKmMLq2fxvNGfm21cjxUCGbYnaAh+
 gAfUdQKomAgZmDY4g+lyZqQEL/l57Q/FYB00w27hCkaLgtfQMf1K4/wx6dDq52Ic1nTL4iPyGJr
 pSV7d27dBBLts/8hlbg==
X-Proofpoint-ORIG-GUID: K-gIgTI3E2P-LqZNKVMEpRlNobqEJQ80
X-Proofpoint-GUID: K-gIgTI3E2P-LqZNKVMEpRlNobqEJQ80
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX3gAmGDHkuQvY
 PAd8Wz36aE9Qye6+iWDDgr3jlk6thB9nKqCP5N0zbY20C8hFfLCjIIQO0SoihYVPJjrrz4hPAJ9
 PoV6MSV++ueRShuERBFn89XFc+/cFBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_202204_672536_4119C0A0 
X-CRM114-Status: GOOD (  13.47  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware parameter (ath12k_hw_params) for WiFi device QCN6432.

Some hardware parameters, such as host_ce_config, target_ce_config,
and svc_to_ce_map, are identical between the QCN6432 and IPQ5332
devices. Therefore, use the same parameters for the QCN6432.

Additionally, certain hardware parameters like wmi_init and hw_ops
are the same between the QCN6432 and QCN9274 devices. So, use the
same parameters for the QCN6432.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/qmi.h      |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 85 ++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 993aa3f350aa..d87c59f68c12 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -158,6 +158,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_IPQ5332_HW10,
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
+	ATH12K_HW_QCN6432_HW10,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..60d5811b1c87 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -20,6 +20,7 @@
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH12K_QMI_RESP_LEN_MAX			8192
 #define ATH12K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index b1c17cc197df..494c7b3ae1ac 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -906,6 +906,91 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs_sbs = 128,
 		},
 
+		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
+	},
+	{
+		.name = "qcn6432 hw1.0",
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.fw = {
+			.dir = "QCN6432/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432,
+		.internal_sleep_clock = false,
+
+		.hw_ops = &qcn9274_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
+		.ce_count = 12,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
+		.target_ce_count = 12,
+		.svc_to_ce_map = ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
+		.svc_to_ce_map_len = 18,
+
+		.rxdma1_enable = true,
+		.num_rxdma_per_pdev = 1,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_MESH_POINT) |
+				   BIT(NL80211_IFTYPE_AP_VLAN),
+		.supports_monitor = true,
+		.supports_cong_ctrl_max_msdus = true,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = true,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 48,
+		.max_tx_ring = 4,
+		.mhi_config = NULL,
+		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = 0,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = false,
+		.iova_mask = 0,
+		.supports_aspm = false,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 256,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
+
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 	},

-- 
2.34.1


