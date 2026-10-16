Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE502CC6B2D
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=egCdW1LXWuBj/OhNtABuXA0BSDpsR1633mpKJv0DbUE=; b=i03lJVMCQ6Vc7w
	829UH8Oko8pXTKYrh1MiAMZ0i9Vbhul53XDdoG93gFZmcpTeGDm/Y1XYf3/GcV0U54khX4+EzVbYe
	pylLmMb1bsDNtY5T46iZPYkYjA6wRrexemJ5H7R/8qX8iEYXNJ/kmaUFYhPQQxQYSpNLC3zuFpaTG
	ZOtKgP4wghr7H1gtTfP9jo+FbQkeBmB/dN96vAbSYn/rIDSbjKnbj+/7DwaF0bfB6YSfJVcTfV+By
	Fnt08fZzWIif/zFgTDC6ufgsYuzAWbcRg7W/QjmTu5Bf3RBK1/bovkApWZOWjZN8KEKJy+45e19m9
	QcOhLNHhUDHUrHdik/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYW3-00000001pGg-1t2w;
	Fri, 16 Oct 2026 03:21:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYW0-00000001pFp-22gH
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:21:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1Z4NE3202286
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=egCdW1LXWuBj/OhNtABuXA
	0BSDpsR1633mpKJv0DbUE=; b=IqwJvzVjMXe9Ds0rE/8j/PAj0+ZIvehFztaZDA
	HOMD1hOwChVdr9waHxi6yXNW16sXN7/jWVsDXbBgLNxpYxrytm1cbFsgEJNReoxA
	FvQqWf9ah+j1oy5VBlkCzlYjlz/CCJbKxuTjU8LXNZyjlkRgTJa1Ln6m/M+0CIz3
	ChjPTNpvO24g9CLKOXE2jOLU3ihYn951Plvetl8t/c0s6HSQjNRnV2PS2Sg0J/d7
	HKuvOfv4Djo2lafoPyCaQJnA0Y58n0qfwvlhB9mModcrXgNeNYVgZ63N6HaKGnaQ
	6ewWGO3zGGKJNIgoM0d+dvAMtvz+B7xmlzmBMv/MaEzuYnnw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39twk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:21:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so572074eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120910; x=1792725710; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=egCdW1LXWuBj/OhNtABuXA0BSDpsR1633mpKJv0DbUE=;
        b=Z4Zs933/1q7+KA+nq/Z3AdmwogcUlWomi3vGzrW/+TIAe24wq5yagvWD/PSpGJ2yj4
         GUXeAr1u7Ka3onhtC22TVmD/pdt++wtv6g/rXzbyxXw7TPJLPMluJnObb435fYv1JjPo
         A19w4Dk6X3apgD9H7woAYC0VtjYE+mAKLMMbm7FH8LGp2taV2v64QHHtxHGX5reOlTSO
         73/q6Nl/2607sadAy2CvMt/y1WbyVVxcl1Rk3EPn+Tqu9dLqt0Uv0npUDr6VoSnW6GIR
         T2zbOqwHlzYS3sTzOOZphZOF+BfUH8UlG7+ADaAvJNgBnzMqFl1RdwWKL0p7iHllOKLu
         CnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120910; x=1792725710;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=egCdW1LXWuBj/OhNtABuXA0BSDpsR1633mpKJv0DbUE=;
        b=FJdMDMOMmQPCu0AGHXfW4cEUkzNLPL5i/5MgnyiJUPzBSVF165s6WmwdCB1Ykzq6JE
         C0eCBBxHhW/evyLVthg3TucksioBioKwmL2eLdk06hbd02SoB5jKXv7Pj1LT/41lM/fS
         5IHEiDCbnfJEJi1oKGLRHGJt0CLWf9L4GOG2QoIa0uZc1d7L+EfL7eF15mrlOjAVXPaH
         L2C4nwUf/UEupQQeQqgCYPFVbgS1YbV0bkXj0OSdgCLhQPTrxFXIzWAmm06tdzDjwlIY
         GKRMvP+ChdWG3R+0DVZHctWLzm9Do83c2WfbQGtBYHJVk2TLg26bMvJsSw/QOi9YQGTB
         7F5g==
X-Forwarded-Encrypted: i=1; AKwUvBx4zd8l6fen1450/T/jF7hNSnEczdnuDm6qYjpyeTdeFyOY+JDYAQJrvU+PlMBDPnj+gkHbjSM=@lists.infradead.org
X-Gm-Message-State: AFq9FYK9id3EFqsNU8gTMmVmQjszyzYY9l5Hb87s6UtpLlHiTR7iTjCX
	0or05tjLFaOGRis1vurYJyW3X9VFgU214u6XLZRZtP92e6TZxvB4EPlWAtH8QyD0rquBXubDJmS
	xUYPkX5Mn1G64x14G2KzycTHN6Bx0pc4AdmEVCfNApOrndZs5/y4lsVtoKhpyog3r
X-Gm-Gg: AYBFou3yMgxH/M3LF06gRM+dep2j0IOmIsjpYsukHJtz7Nelc99RYQ56UbRU5KUYpo+
	bEcNBIVAzu6VO1Eobs606q8V4zL3DwVSfy373dgk7M1mabXwrzQOFbK5NaX0TzdLyZ95CqPWUZm
	DIpttTnMJhQqGkj+wMnhn4gH6gCaYl2d+uZ1Lw/X9k4valjUi7Hp5oHmaMtoZTKNU6H67kQLME5
	6WYiH3agoilLhbMgFP3moKSSyHNVikDDwAkNj/ZofAfpUy6oXjaNY+pSziT8Mcl5ZHWpExGvx3z
	GEq/aOvNlT30570Pwbp94bLVnEzbax2uKZqyrRUgAPnGTdGa4CaSiOuguQqDuhHjY2mMtla+j8E
	KiWLakTXdGciQRj5Y7j/tEFSkNOiI3xOmgGRhESQhNA68MPkUAkh5SZr0sl7MkpXWRNDECXikFp
	bQTLge2UkkUrYNjNJR+MfrDg==
X-Received: by 2002:a05:693c:88d1:20b0:353:ba38:789d with SMTP id 5a478bee46e88-36027340d18mr2367630eec.0.1792120909950;
        Thu, 15 Oct 2026 20:21:49 -0700 (PDT)
X-Received: by 2002:a05:693c:88d1:20b0:353:ba38:789d with SMTP id 5a478bee46e88-36027340d18mr2367593eec.0.1792120909218;
        Thu, 15 Oct 2026 20:21:49 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:21:48 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v2 00/17] wifi: ath12k: Add support for QCN6432
Date: Fri, 16 Oct 2026 08:51:37 +0530
Message-Id: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGY0WoC/yWMQQrCMBQFr1Le2g9tMFa8irho6kv7BWNIUimU3
 t2oy2GY2ZCZlBmXZkPiW7O+QgVzaDDOQ5goeq8M05pT13ZWnjGKSxqmJUpv/dH2jv5MohYx0ev
 6u10xlFkC14Lb3+TFPTiW7wz7/gEUCFUHeQAAAA==
X-Change-ID: 20261015-mpp-bringup-75f457bef8ee
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX2cu2J08NF18F
 sx7ENqYULT59JGNXAFt07XHGV/gl/yy3foHi1CVCy2oazTERlKona7WeEIcs99s9uZ4Qm2g89X9
 VDAmeRDjHd8mgCNlEeXziPOl4JjjaRZVfO2WloZIJz1B3To35ZEwINC4aKcTkhEjsFT0cTqBbvj
 VUO+X6BfVi4zYzAzsUwkn7pCTGhPJ6wNOLlnvWuPX6EcIN3u5Flgo5vR762VW9+o7O78z2+N0Lg
 du2y9U9eUqAB9tigoOnntc9TEkD3MWFMPyCWctJgbvre8EQSQr/Yipi5gpe5Kpqs7q8y5Yg5t30
 Kx5ROQWUDQQlkczsSIjKzj/JXm0kdBPV9lLnY+pZA7nlSIyVayGbdIsmCop1hZw6v5Fyv44zniw
 V7goF42OkCVpBv1LGyNlrNSJNayjzUwVMPzpW5zB9NV7QMgkFqBfIhxfei8hh6HwMYjyNXcawz9
 FtyqQBP6FJM9i7t1hPg==
X-Proofpoint-GUID: ZFTulc-hE75QLsCFDtIGpFbldVTB_PSq
X-Proofpoint-ORIG-GUID: ZFTulc-hE75QLsCFDtIGpFbldVTB_PSq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8s0Bx5u2mxV5
 vAHPuOB0XpCvS9iTcvCbpDAETaBdBL1g2ib7Rm1MpXZ/5x4LKEz0+/mh92y5iqBJJP/dRAbTsEn
 sGmP8fsjuKLUPDOgGn94Oh/JYVXBWPQ=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1984e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j9mdO8TpxRXb4I9anNkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_202152_540196_01D53BA0 
X-CRM114-Status: GOOD (  16.31  )
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

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
registered as a platform device (AHB), and remoteproc APIs are used to
boot and shut down the device, similar to other AHB-based devices such
as IPQ5332.

However, PCI APIs are used for device setup and register access. Since
QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
AHB/PCI approach is implemented.

Overview:
  - Patch [1/17] adds DT binding documentation for QCN6432.
  - Patch [2/17] refactors PCI operations and MSI config structure to
    support different MSI configurations.
  - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
    for QCN6432.
  - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
  - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
    QCN6432.
  - Patch [9/17] adds support for unified data-region memory allocation.
  - Patch [10/17] moves MSI config to pcic for better abstraction.
  - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
    specific to QCN6432.
  - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
  - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
  - Patch [15/17] derives QMI service instance ID per protection domain.
  - Patch [16/17] add userpd ID mapping per device.
  - Patch [17/17] adds support for QCN6432 in the driver.

Changes in v2:
- patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
- patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
- patch 16/17: Move the NULL check before the loop.
- Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/

---
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432 device tree binding documentation
      wifi: ath12k: Refactor PCI operations and MSI config structure
      wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
      wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
      wifi: ath12k: add support for unified data-region memory allocation
      wifi: ath12k: move MSI config to pci.c
      wifi: ath12k: Add platform MSI support for CE
      wifi: ath12k: use CMEM write for PPT on hybrid bus devices
      wifi: ath12k: Resolve userPD ID per device
      wifi: ath12k: Add QCN6432 AHB support

Sowmiya Sree Elavalagan (7):
      wifi: ath12k: Add hardware parameter for QCN6432
      wifi: ath12k: Add hardware ring mask for QCN6432
      wifi: ath12k: add hardware registers for QCN6432
      wifi: ath12k: Add hif operation support for QCN6432
      wifi: ath12k: Enable MSI interrupt support for DP interrupt
      wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
      wifi: ath12k: Derive QMI service instance ID per protection domain
 
 .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++
 drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
 drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
 drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
 drivers/net/wireless/ath/ath12k/ce.h               |   6 +
 drivers/net/wireless/ath/ath12k/core.c             |  10 +-
 drivers/net/wireless/ath/ath12k/core.h             |  24 ++
 drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
 drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
 drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
 drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
 drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
 drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 142 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
 25 files changed, 1213 insertions(+), 109 deletions(-)
---
base-commit: 2d57db8fbf72b1872e7411e917166bd12ed5bc98
change-id: 20261015-mpp-bringup-75f457bef8ee


