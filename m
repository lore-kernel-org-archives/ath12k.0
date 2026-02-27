Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8291CFD9E34
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 04:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amuOUMcKObHl4pIGcl7k3LNmJEs92Q3SErVEh7dTn+Q=; b=ReCD5RBVIp7lsTdmHhDcGm1Y2e
	mWlPscASBoOkeRs9vfHfMkNJWV6VfvaulmD40MD7nIFp+/TMbPi/un1/Lx2iSe4i2ZjTqVkUMsGNZ
	S9A2Bb7B/BYinJY/AHDm9CkaS9cN8rLYe0IxSu3RkAK0pYYpUMumOG+kVLLNEYiXcXNchRNZzIIcD
	xFp5vtD7zjb2DKBz1iDKPvaQMgEqoBfY5IvU5/4XL7/5GwV1/oTLiQIqxVDmxWjEsnR05P54ENMaP
	OP6FqiErkFHyXq+m3zzo0z5epYjhtAnDeNuJ1sct8mFDDecy/QAsCS+lT7a0Uuw5+dPrFn5o2R3An
	6VqxPUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpCc-00000007cw3-0X45;
	Fri, 27 Feb 2026 04:11:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpCZ-00000007cvg-2V0U
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 04:11:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KCOR2982597
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 04:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=amuOUMcKObHl4pIGcl7k3LNmJEs92Q3SErV
	Eh7dTn+Q=; b=EQhoSO/d9VrDywNaDsjJGZpC52dC/5CYheZLAiM0CGcTgrafOYE
	wsg+7nh5cF73YF45FW9B0XKgh9NIrn6Cwx7+iF5mA9obkpY1JFO7Fu1sD4zoY0jP
	YZbXLAixO4uRsSIHEwJBwFi+5d0sYkB+5IT18IQxeTwVnl+orspM3w2Q49GlPP6R
	LPf70E4PXTwEWmEv+ZcaiPGHu9Iwftbm1dK9pl8g6RsprJEIHMHWOO8TTMeM07yN
	ohZUgL9ELZrqxYSTUZhEsVX+TaKDnC6UdfVIB1IncPmqkQLJa3xX6Ti6clCY7v+s
	yipac/JIaXuztowgKerMHaXFjHC/VSX271w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v3m26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 04:11:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82749675f88so2270032b3a.3
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 20:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772165502; x=1772770302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amuOUMcKObHl4pIGcl7k3LNmJEs92Q3SErVEh7dTn+Q=;
        b=XlnXs5GBjGZR9q+MVCdC+6TqzDyMqTLOr8l+9BxBy/kPAxvyu37v5iPccPlqQCu0qo
         I+LNXk4ZajeqHmqECNGNEwizQbzOQ37d0eerdY98Vzgq1kejZF5zgTAKvaX6qkh2bwFT
         4d/puDCx8F5uR5MpvnabgOQPYKLj/pOrZOAUEadYp+xKMwXYIY87SzS7AabkFE6vjmEA
         mbjOVWd1nvbEcNi+KsZs0+dbSaA2b8KTGBRe9eYyDwBUJ1c7ELGjGyX0UWR+SSP12Kxp
         IHjuSNnPQ5nnPKdZyNQqlj6D2e4zMabBZRViDHRGPe2U3xXa0CDBFWhEQcOUFcKJQg3u
         PunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772165502; x=1772770302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amuOUMcKObHl4pIGcl7k3LNmJEs92Q3SErVEh7dTn+Q=;
        b=lQXafGd9yoDYcOesUUalkOSeIKqbJOhSvpmpoL5wkdvaD0fCrHEtL6k4ivlWThY3MC
         81om6BjBQDsK9/iFCscY4KJtInUfGCY+wrb61/pFWwVQ4Z5+ZNtQ/q2N3QOd9QXoTpK9
         4i1No4z45acKJ9l626jZ8CXd1CykrAcFVGhPULF3Rf8DEjyWehMnB1+xyJebIbY0+m5l
         XqFHUMP9suGdVy53CNM92OJ9k29RDAne0eaMdAKdedZN80y2QkI5+d4f0RTPhbQzuESw
         B5mZujctPzPF4sDYD3mo2wn32d+WTsghLmfSkDMS3DqBHC9M4hr0e7a6l3ic3HPrWwrg
         zxOA==
X-Gm-Message-State: AOJu0Yxiz3du1ONjv13mc446pXXspEwJc/ymF79M+vg9kaMJkjNg7VII
	uTqGmQ62Ice0oG0SvYEEbrZ+jmvPBaXfHcf6ic2b6fHc5PHHWmBLneUAmOBHAabiIoosyy+JOv+
	RN8Lb4DenPFWHy3wYUGGKQA6ZYbNZcV2AO/DkBgJYDQqeG45TE4xXK5Ji270hEv/svR4YmDrc
X-Gm-Gg: ATEYQzzi3qYVe+lHvvfrj9nJa6PZ1m21fdrfXSKJO+geTKewCVSRiUzmfR4tbvrncBB
	pEgJ1vQw/YIljf+ITHU+XeyFteu84GDlozgdmCSqSHPvi40nzwOgAnZilZnjWUMcLRvkc7L09m8
	zOQUTssswE9Tnw2YE6d17CdUfjpqUeUWnjhoCOxcuBejxgrfTNJlRuiV4DGjEDlmos2uyCY10mx
	TG8xCuocGjqLlyWU/RR6/i8ttAZ+IahtYQD4dM4mIq3Din9WhCNMtdQTJDTb4Q6qm7dwdtbn7xr
	aIgrirKhRXiScq9S5ppkUmedu7qWXP08p5IzADcpD4wKzLkF03LOclOMSKTjuDViO/IRze3AURH
	oafud8gHO7DX7eBFuMrtuB1bzw2FylFJqgeL3tsMMz2ItPSjQvoj1+dsamUaIjf4NQ37Wb3xykB
	ngTjAAoK2nKkT8CctPiLuD9/XKjSuPSbo19FGeJxz2/4uZeqwi
X-Received: by 2002:a05:6a00:4296:b0:81f:3a83:9756 with SMTP id d2e1a72fcca58-8274d9d9937mr1281318b3a.30.1772165501882;
        Thu, 26 Feb 2026 20:11:41 -0800 (PST)
X-Received: by 2002:a05:6a00:4296:b0:81f:3a83:9756 with SMTP id d2e1a72fcca58-8274d9d9937mr1281301b3a.30.1772165501400;
        Thu, 26 Feb 2026 20:11:41 -0800 (PST)
Received: from hu-rdevanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db3ab8sm3666811b3a.27.2026.02.26.20.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:11:40 -0800 (PST)
From: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Set up MLO after SSR
Date: Fri, 27 Feb 2026 09:41:27 +0530
Message-Id: <20260227041127.3265879-1-roopni.devanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8mioHpdrRvfUVRSCcDAnaZYMvK7bNvlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOSBTYWx0ZWRfX3+HOl2LjQ8Xy
 5iNANx/QdyypxZGnJOTLJoGp9KNScawvMPu35ubDvjrhi8/Ngt/4fYuBVlMv8BbL9bbuXKsnIxV
 RPSVoiACi7/CZnSyG6EItVV21Xykqr2IVwYcdMuDyMlffP/fA3fNZW4/xinATB09JBe68fvz0wW
 pzPknHnYYg+UqPJTV/MIoK8w6ae6bluHz8sCPYZfyhthxGHPpWi0lKukz+2jDkkSfaZifRmr1+7
 UtOeNURJCLT+MaNgKzXDwckoyWTZKCOLZI7FVKYck71yHaNXHtjfsoe1Pa3QNcniUEBgt15HX3u
 MMGKemcQokKJPoIENFJp/VJpSx144f4kLX+z7kyr/N4yrHJXZDeSifMM0Z1OOwU88b1yGLINe79
 4D4aOcCd22kUmy5mrsFmy+gNBP0ZF/oxrer/tiT6VTGJaDi+cCuJoYnynZHRQcBkImlMZQCG0MY
 KoRbW/JCvEF0Nzrr5mg==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a1197e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=p7LCZwjNATuEJ2GLxp4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 8mioHpdrRvfUVRSCcDAnaZYMvK7bNvlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_201143_666669_1E958B08 
X-CRM114-Status: GOOD (  14.82  )
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

From: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>

During recovery of an MLO setup from a core reset,
ATH12K_GROUP_FLAG_REGISTERED is set because ath12k_mac_unregister is not
called during core reset. So, when an MLO setup is recovering from a core
reset, ath12k_core_mlo_setup() is skipped. Hence, the firmware will not
have information about partner links. This makes MLO association fail
after recovery.

To resolve this, call ath12k_core_mlo_setup() during recovery, to set up
MLO. Also, if MLO setup fails during recovery, call
ath12k_mac_unregister() and ath12k_mac_destroy() to unregister mac and
then tear down the mac structures.

Also, initiate MLO teardown in the hardware group stop sequence to align
with the hardware group start sequence.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 9dca1a0af73e..218c0a0c9699 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1017,6 +1017,8 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 
 	ath12k_mac_unregister(ag);
 
+	ath12k_mac_mlo_teardown(ag);
+
 	for (i = ag->num_devices - 1; i >= 0; i--) {
 		ab = ag->ab[i];
 		if (!ab)
@@ -1134,8 +1136,14 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 
 	lockdep_assert_held(&ag->mutex);
 
-	if (test_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags))
+	if (test_bit(ATH12K_GROUP_FLAG_REGISTERED, &ag->flags)) {
+		ret = ath12k_core_mlo_setup(ag);
+		if (WARN_ON(ret)) {
+			ath12k_mac_unregister(ag);
+			goto err_mac_destroy;
+		}
 		goto core_pdev_create;
+	}
 
 	ret = ath12k_mac_allocate(ag);
 	if (WARN_ON(ret))

base-commit: 20ad0d58517073b3b683ff786c65dd3142321707
-- 
2.43.0


