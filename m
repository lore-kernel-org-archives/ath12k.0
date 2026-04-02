Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B235CC6B01
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=; b=26dF2HooM0T32Ti7UlJlr34MJm
	Htl5me0OsXPd4Z113W2fWXGq6pPutNSk1fCosZNnYwPJWJ0hWOwPOWR409GVZarkP97KuY09FcRyl
	3KTW0M0t4zV2jY+v6vuFZR2mXBZbHdueZC4ZS3k16YXgU+7zbDCVJ3vQkpTL+bgBh7MNpMsjj+s5f
	wycQdGuQpqRFW7euyV+gGyS7Jmlk92uY/DoBZ+5hlIbzzRFQF2xkcDzVtSVrp8mvkVFZyGn/Hw5eo
	FDz6S3dQPEeL7J9vf6TQGfmcMCYM7/J2odfW9xzDlYigEwML+t1ZD9M2qKw2PD6tm5AH68yIhkjHH
	AiVuzlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898W-0000000Ggi6-45VU;
	Thu, 02 Apr 2026 03:54:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898U-0000000Ggh1-3ZVn
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 03:54:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M47l74009504
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 03:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=; b=S1/LWTYZx34EFLTN
	mfJ5G7UhneHFIpJMFnnhJiEeQ3FEr/IdP3dMxPgayt5wqFC3LDTUTng25t2VetLN
	psNKVNLzAFpiCGug5XjyRuM0vvxqswEBPdQluXEcWdNaOHGaCz1pNOLJnhDb0oEG
	8OYh5m0ZRmGxwPTHQ+ltptDYGEYiUoNnMY4XUk2h4S5w9fk+/ya+UiNtoHcl5RPE
	K+oHh8Kpkbfi00eGrReqZBgiBzBkJd2QWnvwZ4KXgTaIf3avjKlwPpD+Hup3I2TI
	Tg79ug51SP6YDAX0hdPYNkxkzu7yjuyl5zAUrXAGjNsVpusOnJuqswJt1NEAL5Kf
	bihCpw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e01xc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:54:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso313719b3a.0
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 20:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102066; x=1775706866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=;
        b=SEh1cm8p0j2ANc51XALXjMEsf1f45yIdQuKKnVb2o43oqQv0l/6X81Hj7wSAJLU9wo
         3BKbTY6XboEASTh702/mSr46gUGQM8BvNRBC3mt2T1gZbUwH7sqwyKILf2nRsymo1l+h
         grnw64iAVlVlQzRzGWZqxN6KJ/yUsLzOiS/UuzmuBYqTiOZJi1CikvLntSW+72X38fBd
         Hu9/27VZlfcPH1yjv7R8g15KQkT3LRbcms06k98FZJO1ueGbXK7GTRjInfJMC2Ht96hM
         5yhtLSTnEnUgGLTiot9Zi0Dk5fcbNWFw+ArMyk7Qm0xVfrFCxK/qBzyJUgOL1AucdLtY
         eR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102066; x=1775706866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=;
        b=StfinS2lMcAN3MwyBSyByu+0KRbfWFaxrvyst8CwORBnNjd1S0K8hxvihiPdYwi2U1
         LHpjhUGGn1mW0lz6GIwb0xglqAZcOoouJqp1crEmTX3XtOxdgm/YoC6eCadYndWpPWLC
         4uSEEJ13mcxPSK2tWqh9XNvUe8fCmF7+Wex8plrORHlS536GaseMgyEs+YD3M4aZQZ77
         SW3UGajylSrDfynUObSrgYHMmW6JXaEw0KoNAziGZxUm7irnkFmzvg+CLlc2D/RdBOHI
         3Cmda/rQSwoCGGiAXhqknSTQNhpSoZ/+i6kOSpxaZsm9D/mP4kFL5YfhrCmnzpuTD4de
         TVRg==
X-Forwarded-Encrypted: i=1; AJvYcCWlLS/VrwenHivSjpSQHkzFuNf64E7ySIQ8bKRtxV0ENx/KBPw4Bxvdul8v6xrwwNSKN1nvGJQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5WGBACMzDlf9p9HnDxMfH/oIe/W/uYmyN3f45M4DAwIkuzWwb
	cRHFE8PT5Q4b2122fnlPyS/916Xm08xpiEUA1tPwlpBkc6mhIKH1FP0lq9ROwhEZdFshaF4rLEK
	KX/m238iRKpdhtoXRAhXTPxzYukowzffQLIyfFXkEV6jLxB+34hFUi4ChzT7Q/9FG
X-Gm-Gg: ATEYQzy+sWzMb2dURHNWg3GIJAcHfwmgvOSrTlprgbJWFceFAlw3/OqQZfoZ8xyFQti
	3L/t0S8w3FldaU2mOPYG8pEMpa8kUSyJX0dzBGnEzKGKIrNYipo+UtZgj4DndEzzLlBBBwIPj8K
	PSkb5INXcKlcUAd6KVQ6wNVgip9aYxE4kYYwGQhiuvbTHcfwIf/bcpY0z9sNrpTC6um9KC0tMzb
	dvCfPeBeMuXWlE70fwENuWugucgG7A9dkKilhMT2pKXItQ9+hCnlZn3jiJRgQ4Y33wo3zdm5zPi
	o3d3XdTy26DKz5euIoTVR6WfiwEYb6y2phKcdpylM3JswUuCBto4myr5dVUvKmWzDuecfU64I2D
	NKA9A54wj+wihQUmtMblUMYylDTfafBoiPHb4EUIZpBdOXYq/QOT00OMuoFmsHrDPAsUKkWGhAW
	QFrrr+GAqrUQD+RU5085bh31FxhPc48hfpDMqH4mM=
X-Received: by 2002:a05:6a00:6c86:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82ce8b05a2dmr5616471b3a.47.1775102064880;
        Wed, 01 Apr 2026 20:54:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c86:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-82ce8b05a2dmr5616413b3a.47.1775102063385;
        Wed, 01 Apr 2026 20:54:23 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:23 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:24:00 +0530
Subject: [PATCH ath-next v4 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-2-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69cde872 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vBmMNsOPyRzkxF6eNBIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 21dERFDpNI5agCHcM-UfZrkmjuoHXpmn
X-Proofpoint-GUID: 21dERFDpNI5agCHcM-UfZrkmjuoHXpmn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX5j8B6oMo8LPd
 Y88ldwexPVbPjlqRTN8E1DvsANcv7ceco1Tuy2vV36WsmwZttQTW6ZfgPz112kKPW6DYK5UNby9
 LobLLvLHCaISiNqG6HIH1LZu+mE/HlM+yb9suCdkiHYw79VGTmFOv35kkyFKBAR6dFgKHVfgk5W
 klQqMUVD/Dj8QJD2DkDcWXq4jMmWPgwf5OjFhAmIh37CaHJPiHZyxHHqSIYR84OYMizdL8THfsz
 Opj5Q5kYdakWw3Xv3q8jMesHeKyDO3yWivBE7f1PSKFxS43vca5XvAJjFCsbgS+WXeaIiWwAPtP
 uECK4tXT2l97HllFjbpKplEpEJo4zi4/xAiy2rORHXMdToiY6hlABPAimsEQT+EG6QZ6FEKxyn+
 QWX86ydJ2fTCI619wvo9IgDKhnrfodzgM10InQFg0+VdjCNxZr6WDoY1rKFPGwIIIP88xDTrthR
 jyDcx1zNbNe75b8Bsuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_205426_890217_1D45ED1A 
X-CRM114-Status: GOOD (  12.70  )
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

From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>

Add ath12k_hw_params for the ath12k AHB-based WiFi 7 device IPQ5424.
The WiFi device IPQ5424 is similar to IPQ5332. Most of the hardware
parameters like hw_ops, wmi_init, ring_mask, etc., are the same between
IPQ5424 and IPQ5332, hence use these same parameters for IPQ5424.
Some parameters are specific to IPQ5424; initially set these to
0 or NULL, and populate them in subsequent patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 75 ++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 59c193b24764..68453594eba8 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -157,6 +157,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_WCN7850_HW20,
 	ATH12K_HW_IPQ5332_HW10,
 	ATH12K_HW_QCC2072_HW10,
+	ATH12K_HW_IPQ5424_HW10,
 };
 
 enum ath12k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index ec6dba96640b..9b9ca06a9f45 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -753,6 +753,81 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = false,
 	},
+	{
+		.name = "ipq5424 hw1.0",
+		.hw_rev = ATH12K_HW_IPQ5424_HW10,
+		.fw = {
+			.dir = "IPQ5424/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
+		.internal_sleep_clock = false,
+
+		.hw_ops = &qcn9274_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
+		.ce_count = 12,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
+		.target_ce_count = 12,
+		.svc_to_ce_map =
+			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
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
+				   BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = true,
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
+
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
+		.bdf_addr_offset = 0x940000,
+
+		.dp_primary_link_only = true,
+	},
 };
 
 /* Note: called under rcu_read_lock() */

-- 
2.34.1


