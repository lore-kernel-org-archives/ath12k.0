Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E410CC6B2D
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=kt75xSORoyF4wwsuVAWbK17xIH
	Io6FTN2++1dQynHVkblz3wxXwkS6ADgIFFuMS4p84YeIWY0p3E8jM/I2r/UT5/C75RE+f/7hLnnii
	Iug3o1SXsoSk3lzKirWvok91Yn7G977uD5PX2/GNp4rEYXEaInINEo5E/7i2bdpxXj+qhF9cb6QG3
	21WCDQ8fc/iZ+zUL8kysOL0uwFrCyxgbBbseLKNURrGXxDheYlA6/6mAutn9PBiQHkDMz8+I9Gpaq
	jfU1dlUh7ePjwog++MNnYbOwIeBJdvTdPC5OMiy8vPZVN3zqnUkpZ9OCgA614VTiWy4lDGnllvlFP
	fo0BSGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWO-00000001pRW-1GHD;
	Fri, 16 Oct 2026 03:22:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWL-00000001pPn-3GT8
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G0cP3n1596384
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=QlWPOELU34KqE/h4
	P8WYzgtlApk3V49VeVe/Ri+7OqNmG92EyV0+9McsJVhZB7SlDzemu9iaLMpj5anT
	9NNA6PNn3QSiFlEdqqL7fg7+ZaVO36gmm0QsM+dvJOqgJNwjF4L+AB/XxmW5TEjB
	BJmFtuGhVstuaTkm4vgEMYQZdRl+DwOFhCNOGcwLzZ9rmuROriGoSw5CjRhk+GYz
	NVqSu+O2dwVqzDXLvrkfc5nIA9SAQSdQqADC4QSNklionLjntOD8Zv4c5wx0/7vq
	9Y0K2nwcEpFOCF+E0CRqgqQVL8FQ3mEboMivwu9JAeTrvhPmfzU21Cmh40qkFf6D
	IHzFkg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2vbjmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so549664eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120933; x=1792725733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=c3stJQC7DuEoU4AGj3O5hiR1SZ+1KUuCFs+HtHQwe31tMFSbTQEHgUBBttjkdPScVL
         dnHb8GZPbK9RIWT5rOypFw9/V/urtEzPmGCPui6fWXedlN9pxfdlq2OXvwCMrwU+M2UX
         I8b32IvBLHVE1S6qlOt9FxnJU3R7rgBca3JT2NQLOQQR5wLUdH5ehEB/jPEatOHUppbn
         LVGced474oFI7GXx12noht1pUnfRHZS+ahaY8G2CxH6wYayUx5y4QbRWsvo5PCv20hbm
         0osvWrb6lODnIEqoz5T8XKnxYq8wVcw0WWoLLWQJVNcAiazeHAPbdF0ShTFQkGaxvncw
         o4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120933; x=1792725733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=pavSz6SQi42e7Yl68UL0FuJAgS869ntxIyM0hlZ1rbt0YN3slXLazrKGtLZT4OrT3F
         lF6XBGJIEBJlLYi0oxKGvzmSqzKsgw6h5DRLNlK+hC7e6VMMdcEBirOrXmmpOaRiKTD7
         6xtygwc8YmIeP9aV0ddcRaPdk9y9RlO7N8VTuDuDBdm1Bwuxupjcdozw1EE+PSSNGK3v
         BRjSqMA1tmb4pC1MjakmLThEU3qHPYdgObk2hw+v4xpuh+3fMU1oqgEfXeJ+9shxMkTJ
         G3azKdOT7UlNfG06ILgS9I2ynFA1NgVtzmJWf3B/luSdOJqVZ7Jnekvo9SHvCQ7Abal8
         aCzQ==
X-Forwarded-Encrypted: i=1; AKwUvByHlYsLoa0LvPxojrYthcBhD+M/EkDw40SdRcy+zs9lo7SlctnDY9bjHyCaFvUNK8WaU2NpGhY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJqdJ4g0oxOC4tbS2hhEL/pNyrZxOCuqCh9egIznwrAttbbfYN8
	S69BiB2tiwFeQ0OS2BmgFWaLBzs+5ilfnrPLrvKyQrQJw/h5KNGgvqZMDqDmNKFDo1T2VjPubkI
	13WrGgopwfNQTAqtkwx3mJ2HzpvJmtTbQOhKBKhYm6N5+FJ7WooTbCLBGWQUiHvH6
X-Gm-Gg: AYBFou1hbZFhZ6Maw+cyTa01rJv3eEtJKmsCvYlVGgzLK5R672LSEclccB2Gwg6Cj7g
	dM2EjlCMzGU2TIukxjE2CShshvlQBH08vcieDIex9bSlpjdIAXP1KWDTi5h2Vn7JL7ouQVPzojd
	mpUqWTABWA9FTreZPYidT5bvT+HCiZaL3mmSy0SS7HOHFO2REZV88Kih4GPES/uAFzISOB4V1vy
	KKA/ar3uC4X1V1xaAvolBEQ7aaQroudrgBFlfcXH+Vs8ZkTHjdo9ABtdsXtDTJkKJUAw5tjf8Mi
	xKrSRjbmusCtFGOLXiSPdMzsJ/lfQtxohTWiQFGHjIyv/cmxE3qL6hTmuzjDimEBj+PaMAn+b2G
	9V+DbTmoGtPWm1vOQfPnfifi2/amVGk296TylbtZ1/f0FXfXhb6IK94jAX+Zoj+evp7AC0MLo6W
	THl3yyI18wtc3n9Ll0s5u5tQ==
X-Received: by 2002:a05:7301:6198:b0:35a:e354:643f with SMTP id 5a478bee46e88-3602a780f07mr2413101eec.4.1792120932432;
        Thu, 15 Oct 2026 20:22:12 -0700 (PDT)
X-Received: by 2002:a05:7301:6198:b0:35a:e354:643f with SMTP id 5a478bee46e88-3602a780f07mr2413070eec.4.1792120931904;
        Thu, 15 Oct 2026 20:22:11 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:11 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:42 +0530
Subject: [PATCH ath-next v2 05/17] wifi: ath12k: add hardware registers for
 QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-5-f510c33bfcf5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX5gmm8a2Xn8l5
 QZx0wUfe3GO0pfK/hy5upC9ms7XpcbIoe/2hr30Se52TbHYRs2qQSZpxd8dqeQiR7/IRzQK19cb
 A7Pn5zgniL7v0YGTbsUEG0w/RyiysCFF2VYUrvq3pXxHhV2Tc5R5Jb549wwMekomEBxgE98c0S/
 pjQ8LEi+thNBqIxpVLYKkdo3Llfcgw6i8zm9eIuduATd4LbAw0Q5ltH7aDrUfSTYAeDcFN2czuK
 H6rxSces64Ll+v3Gwg/iFqrrDktASUwWq1bXxOoYiWdPB54E6q3NkiwJ2QYm1/a1/gDp4DMXTuc
 VBbtQe7XxQYWaTZ//5s5JZy+d+tTqq5In8GS5B90lA/dqjwOvFnMZLTsdgVLMR3GbRUgBNayA13
 O3D7FOeYBEzuPD24+d/X3L5XPcmhZA4604vy8Mv/kxvTOZEppg0PyCi0SJRjlFzoVlB/XX+mPWc
 Pm8jYugsjh3Mtwo26ag==
X-Proofpoint-ORIG-GUID: SHMRmDd2dTfIeIjtoBytJtF8TMq8wEqc
X-Proofpoint-GUID: SHMRmDd2dTfIeIjtoBytJtF8TMq8wEqc
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad19865 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4ETC605TzGOYwJmJ72kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXwYBJs1OnLMcR
 CMQFKgH3kCqmzu4vrfCVBQGW18SAzRDYJOGjgf3nM8jFxe6Cbir1Njz2o8u3FPcRr/FZkJZOVuD
 SXVu7jtOAl0tJu779IGXgtD8cUeTtjE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_202213_834946_E9B45E44 
X-CRM114-Status: GOOD (  12.08  )
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

Add hardware registers and populate the hw_regs field in
ath12k_wifi7_hw_ver_map for QCN6432.

Also populate the HAL operations, HAL descriptor size, and HAL parameters
using the same values as QCN9274.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 85 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index a0a1902fb491..7c468159085f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -57,6 +57,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_ipq5332,
 		.hw_regs = &ipq5424_regs,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = &qcn6432_regs,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 052b59265af8..34f6be922479 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -572,6 +572,91 @@ const struct ath12k_hw_regs ipq5424_regs = {
 		HAL_IPQ5424_CE_WFSS_REG_BASE,
 };
 
+const struct ath12k_hw_regs qcn6432_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00000918,
+	.tcl1_ring_misc = 0x00000920,
+	.tcl1_ring_tp_addr_lsb = 0x0000092c,
+	.tcl1_ring_tp_addr_msb = 0x00000930,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x00000940,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00000944,
+	.tcl1_ring_msi1_base_lsb = 0x00000958,
+	.tcl1_ring_msi1_base_msb = 0x0000095c,
+	.tcl1_ring_base_lsb = 0x00000910,
+	.tcl1_ring_base_msb = 0x00000914,
+	.tcl1_ring_msi1_data = 0x00000960,
+	.tcl2_ring_base_lsb = 0x00000988,
+	.tcl_ring_base_lsb = 0x00000b68,
+
+	/* TCL STATUS ring address */
+	.tcl_status_ring_base_lsb = 0x00000d48,
+
+	/* REO DEST ring address */
+	.reo2_ring_base = 0x00000578,
+	.reo1_misc_ctrl_addr = 0x00000b9c,
+	.reo1_sw_cookie_cfg0 = 0x0000006c,
+	.reo1_sw_cookie_cfg1 = 0x00000070,
+	.reo1_qdesc_lut_base0 = 0x00000074,
+	.reo1_qdesc_lut_base1 = 0x00000078,
+	.reo1_ring_base_lsb = 0x00000500,
+	.reo1_ring_base_msb = 0x00000504,
+	.reo1_ring_id = 0x00000508,
+	.reo1_ring_misc = 0x00000510,
+	.reo1_ring_hp_addr_lsb = 0x00000514,
+	.reo1_ring_hp_addr_msb = 0x00000518,
+	.reo1_ring_producer_int_setup = 0x00000524,
+	.reo1_ring_msi1_base_lsb = 0x00000548,
+	.reo1_ring_msi1_base_msb = 0x0000054c,
+	.reo1_ring_msi1_data = 0x00000550,
+	.reo1_aging_thres_ix0 = 0x00000b28,
+	.reo1_aging_thres_ix1 = 0x00000b2c,
+	.reo1_aging_thres_ix2 = 0x00000b30,
+	.reo1_aging_thres_ix3 = 0x00000b34,
+
+	/* REO Exception ring address */
+	.reo2_sw0_ring_base = 0x000008c0,
+
+	/* REO Reinject ring address */
+	.sw2reo_ring_base = 0x00000320,
+	.sw2reo1_ring_base = 0x00000398,
+
+	/* REO cmd ring address */
+	.reo_cmd_ring_base = 0x000002a8,
+
+	/* REO status ring address */
+	.reo_status_ring_base = 0x00000aa0,
+
+	/* WBM idle link ring address */
+	.wbm_idle_ring_base_lsb = 0x00000d3c,
+	.wbm_idle_ring_misc_addr = 0x00000d4c,
+	.wbm_r0_idle_list_cntl_addr = 0x00000240,
+	.wbm_r0_idle_list_size_addr = 0x00000244,
+	.wbm_scattered_ring_base_lsb = 0x00000250,
+	.wbm_scattered_ring_base_msb = 0x00000254,
+	.wbm_scattered_desc_head_info_ix0 = 0x00000260,
+	.wbm_scattered_desc_head_info_ix1 = 0x00000264,
+	.wbm_scattered_desc_tail_info_ix0 = 0x00000270,
+	.wbm_scattered_desc_tail_info_ix1 = 0x00000274,
+	.wbm_scattered_desc_ptr_hp_addr = 0x0000027c,
+
+	/* SW2WBM release ring address */
+	.wbm_sw_release_ring_base_lsb = 0x0000037c,
+
+	/* WBM2SW release ring address */
+	.wbm0_release_ring_base_lsb = 0x00000e08,
+	.wbm1_release_ring_base_lsb = 0x00000e80,
+
+	/* PCIe base address */
+	.pcie_qserdes_sysclk_en_sel = 0x01e0c0a8,
+	.pcie_pcs_osc_dtct_config_base = 0x01e0d45c,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+};
+
 static inline
 bool ath12k_hal_rx_desc_get_first_msdu_qcn9274(struct hal_rx_desc *desc)
 {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 03cf3792d523..5c593773109d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -18,6 +18,7 @@ extern const struct ath12k_hw_regs qcn9274_v1_regs;
 extern const struct ath12k_hw_regs qcn9274_v2_regs;
 extern const struct ath12k_hw_regs ipq5332_regs;
 extern const struct ath12k_hw_regs ipq5424_regs;
+extern const struct ath12k_hw_regs qcn6432_regs;
 extern const struct ath12k_hal_tcl_to_wbm_rbm_map
 ath12k_hal_tcl_to_wbm_rbm_map_qcn9274[DP_TCL_NUM_RING_MAX];
 extern const struct ath12k_hw_hal_params ath12k_hw_hal_params_qcn9274;

-- 
2.34.1


