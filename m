Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB940CA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AxR0pOAsOnpdhKn+bF/B85mpSQ3JMl+/gElRNNM7YSI=; b=aFn1A61rE1kEYc
	cy2zaD5w0pXjVvz1VnJjRKQBTLeCJRrnt16dizlJg74e21Sk7j0s8LAolZy+NXA9bomSjAkvks5Kt
	fi6txxI6Dk7YswyPKJQE4LYom4b4JT1yEWqgC5eANUiOGMwjwqnAci2phBU1ePly171ng6cS8wHT0
	i+f0YR46ht9YMYy0K70kti0Nx8+NqPml4tby6Jo9jEi0A4G+V5DUpLVhD9CZAa+pNAEp0Du8DPK5v
	8dsHvmAnLeIv+IB2PC1dKjo0mg9L7U2reLFYJKpKOcJ+aw+G/TDRBioveckC89YTND43lwHQpxauP
	sSlmE5ZdyCU+0GGJ6pvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIH-0000000461n-40Tu;
	Thu, 08 Oct 2026 10:24:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIF-0000000460C-2kqn
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KANW2560103
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AxR0pOAsOnpdhKn+bF/B85
	mpSQ3JMl+/gElRNNM7YSI=; b=lDT5mI2fFVQYm9SYj0ZlX9BFHL37Lply3mxRzl
	jhNOx5G6UAQaBYAHYxtzoGx/hYz1caaczkZDOVp+EMDUMgm9POqCdzKFudhJPke/
	EVZA8h2X/u8ov+3B1AZon6zshJa6ov68H7Khx/URx5Lq/phRjzEeIi0jJH8iqDjB
	dyakN8Pj9ErbLgJGbV0lD3531YXczfih1dev97x2L3nJU7BA/Y9O8FuQFyv0cmNE
	/GW8IALJSkYeboWgPrJo6hwrfImqY7Yh8dCnZoZ3bDvX9kLWM8U6FADrAW/zeJZz
	Km5zVRaYtcrgeupj2QVAGR1ctAMZxuZRTLmFRkROcxoVNgGA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82cnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so61948575ad.2
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455045; x=1792059845; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AxR0pOAsOnpdhKn+bF/B85mpSQ3JMl+/gElRNNM7YSI=;
        b=EJ/rlQXLnUrsuRK+m4XPiV8Y/10ZXk6tJXdDMhCTg57ZiSOGTzAI2TwZCYzc21FTb4
         8AbG4MmVcTT16/RWTa7WlgHg4KmZRSEpmc/uj5B9fUO0iLcubLKgxKMo2SzUos0nBFuq
         qEHSSZglsmaG3qAcMdWNS1qd//0U+BCgNmO7v8+2ToqmQUAvt+t6oH2K16yIef38Yd+S
         opGWr8fYLBOcjVWK9QgorDih4j8YrMUoHMDKRpotmncEVI4zpJBrYnGNCG1RhFsjewz6
         5ZgwbBRr+t2x6iBXJK+DRnlxyLcSODPa01aMUrX16Qc8EB7/IHtFGQ0vVnz/1odWWlc+
         +jAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455045; x=1792059845;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AxR0pOAsOnpdhKn+bF/B85mpSQ3JMl+/gElRNNM7YSI=;
        b=eKPTCCdS7iSIuPrBTDMOlvyvXXjsNH72ILe/mj+IDKLIsy2DkJUCHDasPS1oofJxJM
         rdM62654xNLHbrsGCCctokUoSU74QjtAvOlxzHmKGqfr2dsTAqZHCwV0herNwv9WNLti
         XeRVUTScSQoIcDxMBbn28nI93OcrS8P7RiuSKy+qWJCCVXyd1FyDanb0eVh1fgUzVmXj
         0xVNL2hb2gUTu9AuLCeEe1hVj2LfKyuHNTosCNcIyzr+KSPqwiNaGcsETxLDPtF8otXD
         0UmsxfkiIX/DOkYxn8Bk4wSCyIL/+u0haHqGcqxoPRQKMTdCYVNoVmOU0JmcEGvY7T3l
         4WRg==
X-Forwarded-Encrypted: i=1; AKwUvBw5G0Aeckf4cg+ItbKtm1D4q7FetQnIV+eq7xjU6HCH1xA0iZTIpPY2VzOn3McwDQJ1cYo+CM4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ20g3tsBWcukPS74wtNMIApaIoRkbHJgnXbzkn8ohMdBj9j5c5
	Cr9OH20hOOTem5dMLvkSDax2hj/Db0Rzb9DC/fqas4qPzlz5F3yPNMtnGXxoRdA8qD5n32SwIqw
	cmntSDQvAn/Xf1uOsdyd89A4jvOfNxi0e+y4EamHK1Aufrr4uMBv/D+/GOf+5CTFE
X-Gm-Gg: AYBFou0yX58/Oz6KJ24XacQL0JfaVWxXJ9hzI0RXMOCtoj52r3ZvoeMuJ6YMyUwMjGW
	HOOraxRraPQnKySMuRn+POD90/4yD1Y7Ju4cuOv8rLDhJcr9u2AYbjTsb5v/JM16c7CdxPN4h4k
	iy8De9b3AJSFubSzueuY3Y4DGW9P33lkqOMFYQueejKBzu0Fx6dNg+UfTVBnAzl9XIZ1xRXKPKO
	ngRJ2pXiYVWUsXKZToiRQ6mTqqIgTnWxbv0UjL9j9iDKtSz3dJM3RKaldgUYq+BaYV2nGfNywMB
	f8Lvbe6pn8Nvqm7TK9RjNAYEib8OAGuzTYwnNCIJUKIHd+n2DkKI72cv8R85AqZg4eEnN+WGe76
	Awi/a/v92K8s+D98X7XmTC2Xj3gQUMzVLdIZTDpRJ8Tuce3U5L5lrGT0jCQetcm6SqvvuJOSSxM
	CZn/LjaY0K/SaHuDXTWXMWYg==
X-Received: by 2002:a17:903:320a:b0:2df:9bc4:e6fd with SMTP id d9443c01a7336-2e6003b697bmr43567845ad.19.1791455045089;
        Thu, 08 Oct 2026 03:24:05 -0700 (PDT)
X-Received: by 2002:a17:903:320a:b0:2df:9bc4:e6fd with SMTP id d9443c01a7336-2e6003b697bmr43567655ad.19.1791455044626;
        Thu, 08 Oct 2026 03:24:04 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:03 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 00/17] wifi: ath12k: Add support for QCN6432
Date: Thu, 08 Oct 2026 15:53:56 +0530
Message-Id: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADxvx2oC/yWM0QqEIBQFfyXO8wrqQ0m/Estidasb5IpaBNG/Z
 /U4DDMHIgWmiLo4EGjjyH+XQX0KdJN1IwnuM0NLXSopjVi8/7WB3bh6QVYrU/VKWm2QCx9o4P2
 5NbBpEo72hO9r4trO1KV7hvO8AKO5Y1t5AAAA
X-Change-ID: 20261008-mpp_bringup-ea2187d10a28
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX42akIK0vhFpK
 ZnQr7kv3szcM6ymHLuD9BxgFqUTLMpE+A+1T4F7AXl7EZBbFhXVgGA4KSRXPANZRjpmrAyrNmHG
 KYDzAsOnySy/LBfUXBjBYPyeXmVJz/pNqrwpgYk88jdU4e9uRF4NM/yVzvd/0yq6v9Hb+RwpoJm
 cE7t/hYFNqL4iwz83p7E2y0GD7+hoeA2Kbt2HrSpIz1WNFMm4tBOsves7In6N5z2cCL6OeSYsMs
 x8aMgq9DciS5bEG5gc9+laT4YhVMXVb710Kv9xfM85y9bHQvY8A4thn85y+I1ZpYc9Er27c+X0B
 iqOB/hHCP+2epa3x/mFIxNoTY3nvNLPynHfHVbphqPP/ggqqPmJPcCnSKeS0f40Kx+tRB6Yedw7
 498GC4EaQzFPwsEeV7cM0fQgK7d32pa2aMhd7Kqcbvr7OPb+i8If7/BxWmvyBfF/5ZIMz8f8A+V
 fvuFyRMVeWEqnOyvxRQ==
X-Proofpoint-GUID: jmMrWpG9nyP58d4bSO3awWJWx4ndcnTs
X-Proofpoint-ORIG-GUID: jmMrWpG9nyP58d4bSO3awWJWx4ndcnTs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXwCloNjYpBzHO
 HNCrtgTWT9dPQsTjLz56JNz90IvMQiJ4fpEEnw6jViwUJ+fuTxfPnKkv1tmITE2RFQsJV6O0AYS
 j3OMgBd/JRYWKK7jLlVvkFoESJqjeqM=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac76f46 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j9mdO8TpxRXb4I9anNkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_032407_821238_68416885 
X-CRM114-Status: GOOD (  15.25  )
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

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
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
 drivers/net/wireless/ath/ath12k/ahb.c              |  51 ++-
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
 drivers/net/wireless/ath/ath12k/pcic.c             | 434 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
 drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 141 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
 25 files changed, 1213 insertions(+), 104 deletions(-)
---
base-commit: 17e4b9ea527b6c9491bed60f646bb2eff7d8db7b
change-id: 20261008-mpp_bringup-ea2187d10a28


