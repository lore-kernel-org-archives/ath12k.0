Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2FED68BCA
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30aA6gD1tuQbNqYfFrlJb+qmjCTZS+zgVkUUAhS3NGc=; b=q3Nhq73JsVFda4TFUUu+WoP1BK
	06tRDAitITkTbmihBSLY/DsGHesNLHd+i4xs/LGmS+ZAhjo/oS84pWBUhiuHeolzwbPL66xmsFeAw
	r3LHX9rx0a2UnF4vLoVcjvEQJ4SIf7RuTeKdqdg5f9mStRNHRWiVq+SO9eYrP5mhnFr+8neiVXzA5
	/ZY2A7nnRT7f53VfrmHQ2FlWjOxDzu5ItiG2GaZIVLbclm4mMvIV7NscvBNrrq15OoaLRXKQRI9c8
	LhMzZiiX61xu5Q/AhCRtn6sZOEFboGDHh8u77/Tk6fnAVndwXxDQno0j9JinyhmDhfFKrqSmX+RKh
	ekSf3Zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3El-00000007fyF-0k24;
	Thu, 18 Dec 2025 01:55:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Eh-00000007fuX-3QHK
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Zjp82016408
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30aA6gD1tuQbNqYfFrlJb+qmjCTZS+zgVkUUAhS3NGc=; b=k8BSgiN3XYZf/OYv
	E7UeaQ0XWFD8st7tgEz74S75wITSVGCLRxmIa8OfiYeaMV/As7EIBNrGntVxSFEn
	a4xxhn8raxT1TeYv/esWzLFoWPjasOfKUNqJtOltYOagUJGTU+Lmq5raxwdHgf6w
	7fv0sbEbTlTFRufifkmcjPoDetNdV26J2FO/3Lp2sEwcXR9dbu9ty02Asr01HyNx
	+peI3LyEhrM5ejdkfD+JZEMVN0+NqsNbv74QYbIeJu2ZfSGTimbzgJgDxcFxJULR
	HX09htaW28hNHzNTkaJVPU56ZPaPBukYLLDK8K3y57y7B8X521FLMtX9a1Y0jl8V
	tN9CEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e2p6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f177f4d02so2842515ad.2
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022922; x=1766627722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30aA6gD1tuQbNqYfFrlJb+qmjCTZS+zgVkUUAhS3NGc=;
        b=dSV/WAXqb6MeAIfDRxVaGR1QEYVXqy8L0kUesKTZedrgoKBc4h6Jdo+RLYS2n0B36M
         efhrO/W64tWIrPnzJzklKOY9Gl6Y7449JfeM2Dq8CXm2Mbj8+T2CQLN6JZcItnLk5gsm
         ovqnBGT2hCJv5a51VmigVXAY0MoDG9WLJdDoA06tHayT3DKYWlS/jblpi2CfYOC23Yiw
         /SeBdZeoAKms24OI7J8hf2+PqSYfZMxhYV0iw7yjCZRgvOWydi4qiaJfOGgIlePTx4Mu
         1UKGMm3I00TMGLT+0r0UZokIUiKcSLOEu7O+sGGzTACwV0KKa7FXu7MYk6019/8DHr+v
         Km5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022922; x=1766627722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=30aA6gD1tuQbNqYfFrlJb+qmjCTZS+zgVkUUAhS3NGc=;
        b=Y37cfKQSG5uVbn/7OTjlwIRjqnobNsb6PhVbJWZqEgAwCcPKSEn8ImFqH8FOyw6hhc
         brgdaxxX6qo7JWcamH2HdCAOreWe283HkjKCBx7zMW0a3YERm1iDcMo+E+wwS79K97HK
         mOzb0wbCe1JqNroKKtbcXKC60huf0pQFDgL1SXHCrfUAoX/fg24GWyd7czKas2KH35sk
         lvjM1tH542O5oEI5spLIi1YzLWSO1PwccN5ROlCrXOVSKGIs0OROMpXmGUa1Ecl9cULn
         2dVk6+22RtDcAXxLdmfyU1jmvIUkyX0ZWSHUv4UD0Srca7wRl25W9crjcwqZmaR5mrvL
         noxA==
X-Forwarded-Encrypted: i=1; AJvYcCXfTWROeHyE2DWI9PBUhz7HMVgZPOYO3pApKSNobg52DtALD4+/WVIlqFSr0li8jfqHgOpfNX4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsrRU+F5rjW8h8jWq+iiA7gL8S5NSclrqXfcf/Ts/U1ZPiEaiE
	jEgnG9cgTLdKBPyblIHWOUWxaOUezjXuIbh/SEIjSdAOJU+oLDNg7Snmx42+NH13NsM/Nu+mplE
	Fhl2Pe4Xpu1N/e4HMAhouTuRW2A1gcA67b+sa0x3+tdoQtY5pgPdDV7H4cwry+d88IOGr2MkPAq
	s=
X-Gm-Gg: AY/fxX4RKSGSPt+fDFeJzGjh0TC4DGQ8pue3z9LDFtN/SbZ7rbIo3fQHbzLWQ4nsrSk
	Icsr4PN3pw+/r7mhfqAYuWKi8l0TeTFL9eGb0ch0bNXJs8L9/egiYpFMSonxm+2ejWcLfelRqx2
	+x/UDIo/OxYE3rt9tTWTtDJnMvYvsDAPIyWyPIscMlGkCKE2n4qiKuXbBpZadDSwq3yzcmF5Frn
	HM4HG61Qvc2CoJIHX/FJet3qKwp3DrNUjr73X6PGOOgETRajxMTEpEq+H+KYTvAFF1Hy+29M8oH
	D9nQYyNWB+Yqp6IxhfvpJ0d8cbjod9N6qjv+hVEp+beMvF1VEhoCh6rXUfoZN1+XjDGvViX3lfx
	bc88OqyDFlxJupPB6sTGb3s8juO98LZiJtgTtgaMWQPYoMpIU0QwRCagZd2oH/dY=
X-Received: by 2002:a17:902:cf0a:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a09d0fb39dmr138647665ad.24.1766022922504;
        Wed, 17 Dec 2025 17:55:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCee2zl5DoStsriVI7/UW4iY/jxtKTEXgSwVamDJ+ZWgIohTcQcllIDeLRhEWaLiC9llh5rw==
X-Received: by 2002:a17:902:cf0a:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a09d0fb39dmr138647395ad.24.1766022922017;
        Wed, 17 Dec 2025 17:55:22 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:21 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:23 +0800
Subject: [PATCH ath-next 09/19] wifi: ath12k: advertise standard ELF image
 format for QCC2072
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-9-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfXzROci+t5NC2n
 0rsfYm9NZdFl9iKbW8jPlRW1aSNOFxrRvZN1iNQR6DhZiBP9B2SPqLBh1hNWUyd+gi6G6iOPemd
 4BewAiGU3yswLevZ1tDtCgU3EC6D6t/deRQuQ3XDA8tBh7/F+NAXctACTs0CL3PCrsMNUhKzlJW
 tKMqoYxJcc85DXuvTULXWr83ox5e3op3SleciQc4i4Qs9YgqYa7JICZZzuF8r3tDRlk4IvVvpM/
 KjXJSR3np8/b4XMTijruI0R2o8j2LvYveQpn9FACNvD7jzb0AaVoxfgaqGTuT/XRHqBO6HlQO83
 5te8xIrXv7LvTX2vCoJKg257oz9Mabf7t+MP/UgcVlq1Ywx3XMD1z1RSKbOGRsrtCRDbrbZVU11
 clg+5E76RY4Y3yxF1XXi+X9Er/H/uw==
X-Proofpoint-GUID: rthwchay-z5M-wpSMQkKYWPd__yrXx0G
X-Proofpoint-ORIG-GUID: rthwchay-z5M-wpSMQkKYWPd__yrXx0G
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69435f0b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RlVu0IYx6P6Gi_hgVqUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175523_887959_7114CA57 
X-CRM114-Status: GOOD (  15.03  )
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

Firmware (amss.bin) of QCC2072 is a standard ELF image, however those of
other chips are not. MHI subsystem supports both format, but by default
takes it as non-standard.

Flag this to MHI subsystem to avoid firmware loading failure.

Also refine hardware parameter dereferencing by defining a new local
pointer.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c      | 10 ++++++----
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  5 +++++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 655753d0413a..85da4e43cf61 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -142,6 +142,7 @@ struct ath12k_hw_params {
 		size_t board_size;
 		size_t cal_offset;
 		enum ath12k_m3_fw_loaders m3_loader;
+		bool std_elf_img:1;
 	} fw;
 
 	u8 max_radios;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index 45c0f66dcc5e..7698a098c088 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -187,6 +187,7 @@ static void ath12k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 {
 	struct ath12k_base *ab = ab_pci->ab;
+	const struct ath12k_hw_params *hw_params = ab->hw_params;
 	struct mhi_controller *mhi_ctrl;
 	unsigned int board_id;
 	int ret;
@@ -201,11 +202,12 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->cntrl_dev = ab->dev;
 	mhi_ctrl->regs = ab->mem;
 	mhi_ctrl->reg_len = ab->mem_len;
-	mhi_ctrl->rddm_size = ab->hw_params->rddm_size;
+	mhi_ctrl->rddm_size = hw_params->rddm_size;
+	mhi_ctrl->standard_elf_image = hw_params->fw.std_elf_img;
 
-	if (ab->hw_params->otp_board_id_register) {
+	if (hw_params->otp_board_id_register) {
 		board_id =
-			ath12k_pci_read32(ab, ab->hw_params->otp_board_id_register);
+			ath12k_pci_read32(ab, hw_params->otp_board_id_register);
 		board_id = u32_get_bits(board_id, OTP_BOARD_ID_MASK);
 
 		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
@@ -262,7 +264,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
 
-	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
+	ret = mhi_register_controller(mhi_ctrl, hw_params->mhi_config);
 	if (ret) {
 		ath12k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
 		goto free_controller;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index ef0a59f6339c..bfa111968676 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -339,6 +339,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.std_elf_img = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -421,6 +422,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.std_elf_img = false,
 		},
 
 		.max_radios = 1,
@@ -505,6 +507,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.std_elf_img = false,
 		},
 		.max_radios = 2,
 		.single_pdev_only = false,
@@ -586,6 +589,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 128 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.std_elf_img = false,
 		},
 		.max_radios = 1,
 		.single_pdev_only = false,
@@ -661,6 +665,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.board_size = 256 * 1024,
 			.cal_offset = 256 * 1024,
 			.m3_loader = ath12k_m3_fw_loader_driver,
+			.std_elf_img = true,
 		},
 
 		.max_radios = 1,

-- 
2.25.1


