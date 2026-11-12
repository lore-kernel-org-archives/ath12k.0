Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72086606B275
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yX+ysIjN;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWriODnm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHmmzsAC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=yX+ysIjNxf7mNq
	qG+l1gpr1Ux7pS4rjeDrpilf06QS7Yo+x5XC/yLjK8d3sHn8Q35jr1MtZjev+GyLsPSojKkmM71cz
	PwJlojcV5V55ntjNZmgKj1/bmmuCo5kttDX56fh0ljZHjhEyH/Pr6TjMoCFyzUwW9r+eaZ+mCIBww
	3PZ4k8yQyl+3r3kGb0XTJBbqiRLSQr1xMfI/qMYFCkyFBosMLp05+5v38SRthdAH1RukXMGMbWTIp
	vllJqxt7f3ERtos01Y+KS0h6DuI2w4YOihp+50RP5aLOYay/2TafRNC5tyjmgx1ApkMspJaIasDTN
	sEUkdp5rzZt+Ituvqu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQL1-00000009BI2-1Pb5;
	Thu, 12 Nov 2026 08:39:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQFU-000000098bq-1Ar5
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:34:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zbwb903615
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=SWriODnmPpc/SBBi
	0q6R/aCwq/KQ2bAtKHOgUHD4F81ZtbBCe/1K8PSBm6gtQoOebum03cNuH0DXtNX4
	f5/ATLZ+MmMCYJZgtUn2FWwQ3enjBvucPWgQq4c/eqjNoec0QHrclkcx98GrmCIb
	jtpDFLfKC8CmkalpgileOhawn9axF+crHcwcRwOOSJTfuMHeeG2gMS4ooj/KnErM
	TtSxsxgIAQY0q8J2dFQBDdYMZCjjgMLdIjhScdAoU9FxUeZzaRnPt9qlXEnMH/PU
	7eVa7a5EaFthpT14BwLQoQoWU4A5B9WICjbl4S4HG65n7Kp3OVOthMNZTSujrh78
	10LFnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1ubr6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:33:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e954d87b48so61711135ad.2
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472415; x=1795077215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=NHmmzsACwDmVnG+BKv9VsfybnJmzhYK7q7IHK0hsg1R3vKeBoX4cFE+4Y6JZ29Qe0r
         +33gSpdvz212Oe18dhjqUkiXW+wWLcw0UFdYuTwnac0+7Lc00e9THzxeMsGoBWXZBbkY
         USaHM+4Ai3vfO19GC6tKOsFzK6o8wZUgI+P6TtwdhSY2TQA2E6DjVykvuSzQ2NndHZZ3
         XtpCQAva4GkWQVRklp70sKkyW40137bpcQ4gHR+v8MiVaWtTSE+VmjtkAsx85rvFSl6p
         OsDsZGh73/TTDewP1Ofw7Yl15HLZMYEoZkIcOXTba+I2yJjaabfGdq5aFOBraZg7Luor
         1hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472415; x=1795077215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=s519OD4OJQDTSS5Nqp1ZNwg9ctPvFQqqj26l1cfGHdyBVQj/47Vfbx0BZOLnCE/feg
         ZLR2AoKmEJjqE3P2baUiqTMZikR5WEhcaySUXMdj8ZYAhmW20PSs3zQEXEXEPgd0yS8w
         dNc/lak2SSxbNqLKRqo3aQ1Y5vbi2v1QGNSBT6bXThkWEkkDTu2h1NTc26kUH36dOlB7
         MyTLRMnP/SyWZUYb7aCX4rg39edZg1dV4WCbtpXEw4fxYu4s9iufs46cpAsI4DYcStkv
         gPqOQ6ZeWtg5BBcxvuvM8koh4Y++Oiqkz76eqRFASWg/8KxcFB/RjeMDhlUc8Wvz44Jy
         12jA==
X-Forwarded-Encrypted: i=1; AL+hErEE7BN/KuL0cDn3z2ksux9/bhOipCHRp6ipewV75a75royUp/z0tqMDPn2J+DPQzq/FPFWnPEo=@lists.infradead.org
X-Gm-Message-State: APuU4Z9mlodfIuZjrfiapO0l53jf0SV9KdnKpv6dOXKG4iBty/LF32XJ
	Se1TvwpG8d+lBbdg12YY1Hp4c2fPvvsLai13+Xsia7nsQUzvHuq+PPiFwx6iu14A0mcne/4V67i
	Dd4hNf7W9CkOiaQaEtIe7sJTNfK57taIjqifV3NA1L+eEd8PM58kFNM48rzgYCQeb
X-Gm-Gg: AYBFou0qdrM0bvovdc1f+T9L6RyjFk8eqyTfhULU945jhfI2HQ2tTz6BCAOW88UA6JP
	x8si9a7lmdopVzyybwYj0BihC0HU7wp3pgaF1+fN92jhDY1RBLP3yuQWesYLYuZVUmR6e+vkzfK
	DWosYp6iLL/4zyHz4s9hns11xPVna3ahoZCOUYPAvlBh7+ZxqIVnLgSYJPYKJNfpoAr4dIoGL1X
	Nu8MHm7MnXjX94NzYAP/6V8TOLqJEfvmzDJiGJ24BZ4FXoGL8z7ONLwySSkhzQ0dR+BcKUnKDek
	9jQii0pBVx/MuaMretlgQDawIMSmvg7GNqsbxulCcl7Xjp5ZS3DMjl1y4MGRznnuRUG2v9Gr1xP
	R3nin4ze1ulf3+xfRzVspbNnep1Cxzky2YDDLqUzTlvfTjKxIQSeKPkPco32kuuV3VwlUFUUeB5
	MzclaQ7XPccd/0oztDtM6M9xoB4WBVJiRe1AIrA2CK1h55jUM2I4JIKR5/pT8MB4HSPGrTNdtVA
	Q==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554122a91.43.1794472414876;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4554086a91.43.1794472414096;
        Thu, 12 Nov 2026 00:33:34 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:33 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:27 +0530
Subject: [PATCH ath-next 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-13-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+jUSnnnACxYq
 QpEXxuTxrtNu+M566ZqezqiPM/7NIggG7h8+M0rp5ZWkNjUiMpYgS8uUDxVpRC8LdkYCLLdclBB
 i4MV0sQLSzNTBLQVb2jJhIDyGPki9hk=
X-Proofpoint-GUID: CKfEJ-qEqQN3jvH7jeg9o03ueb2M-rLi
X-Proofpoint-ORIG-GUID: CKfEJ-qEqQN3jvH7jeg9o03ueb2M-rLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX5smTPf61SvMC
 efiPgvJ6FoHU/QyLiBSujJf6+fMQ63A5+OuxyJQI+aY2JnybX0KpyIn8jqm/HE2gMyC+/BtAqs0
 yXum6f1Ie58IBtI6A7p790NtR1MH7+wsfVlY/RPq4fdPU3eSbJ5VO+Ckit+fUeOYLLEIKK9vsWI
 TNEwkSsWA2ff2JoWQ+0rqJh8v6HL6yogM808qnQBliT5vSosgTUqXEdpHV7K4bTzlKB3pZkk5oa
 B7IAtv6bGnqu7ovXvgbuUqYDnzdD6csCNWdfqhNRZHM86TiO2LDWpRb5rilX8ENBru7uESbxHvl
 S6fd5sJn4ms/vSudquj77cwt7tTeckoLssXSEQqYKtY97H/39w+MqrnzgYcLd/014mqUItrV++6
 QspMTSAYvspKfUYT/vKqAJSW3AEHcLVwWop4gjqf0d+fG5AfGc/wAAX1LUs6l7/5CA+HfFGE3+T
 04Ncyeu49pvvJTDwShw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af579df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_003336_958411_771FCBCE 
X-CRM114-Status: GOOD (  13.97  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1


