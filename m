Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C3ECD5BB0
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 10:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iuCxH5D+n2gNFhyOX5Y2of7w5Zcuoea+gH2Rlo6K2Go=; b=jvU5RfCyANgp4r
	SwgCEH7XYVRwDUooqb7j6+EzkOW6olMd77dVnvGOx7vGaU1ejiJvd1vNrK2e6+3Cgn4cWVG5n7LYj
	Q4iQFCyuljPqecgzK4UXTy0MzWnCgN0ZZxMv882usgp3F/aigWcUzPogs9mnFmKMz7Mdg2OvcLm6H
	F5R0o2ltFnvg8khPkv79P9+GRdBxfHC6JKZwibLT90udQLPKTHYpKhHYMS2kIJ3y2aG/5qxS1t2ee
	2q0G9QaUhZJ8e1I9A6BvVxDmGAeGJ1BH574G2oPHoJd75mFaNS3u/EqmHIMuGVp9tG0KuQoM8RLNY
	oTuRg04qDvjd9yGssr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgX-0000000AOvO-39cY;
	Fri, 22 May 2026 10:00:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgV-0000000AOuT-0z2c
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 10:00:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8sCaR2765182
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 10:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iuCxH5D+n2gNFhyOX5Y2of
	7w5Zcuoea+gH2Rlo6K2Go=; b=l/ENIXqkelqIqqwXddP6me3HQDLOS3HeQ6XeQX
	LwNoPTpsDBSv5zrl2ik0fG6gITJ4e+6ClFp+6iaJWWX4u6U4ii/68Z2rW9B7WZ22
	DFV/3IE1SXnSCUPZr3wiPDyH6bTDoVwEP7BjuW9mvpDpX8eLVcQ0ea/75QxDWDyn
	y19PwfJPx3RnVZvQxlxqFVCmDKC8VyrwzrytSsASaY+XKk7VtX8m6VjM1/lLT9rp
	c0pRLs7bh7cboj4U11RSyJOAIzkKgsD+x5KmXnN3deEvJkr7+5ZiNC8/L+R/nLlZ
	Uksb8TOeK7tqFoBFRRjmEs6rgmX5aNIiu3Jo+2/oKV+ddFbg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7veaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 10:00:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f85179263so9264433b3a.3
        for <ath12k@lists.infradead.org>; Fri, 22 May 2026 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444049; x=1780048849; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuCxH5D+n2gNFhyOX5Y2of7w5Zcuoea+gH2Rlo6K2Go=;
        b=EFzRPl3oXFit5fS8R9mFIjsoa1ivXlHMsJvj5pcWn+LOZ8Kgu4UtKCNsXL+MsDn/BQ
         wHCYb47Oec7m7qBakSxkuIeyzd8mmNgTaUGAidFwaBa/LyQh6yN+uBOi36c6hKnfBwYf
         fU79DGl7AfA02Y7o5X+m1ZLx6cilNurRocTbNtFr4D/p+Y4GEd6htHPd37ufZ7lK0ngF
         lZK+i1upZO5Ad+wCuedcroK1IYwIUEqwPZgTkx8TOaDiGuPST63RQy7+oVTD5L5QdtRR
         kLgyFEyf/k9aOFAvdresNiA5R0X6HpzetGdB+cHQ6YdbtqpyeH1zoO1YUgbLM0qW/lWx
         KtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444049; x=1780048849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuCxH5D+n2gNFhyOX5Y2of7w5Zcuoea+gH2Rlo6K2Go=;
        b=Ut/MawHH8Wo7ghE+DHYuVaHc0w0Y/AQt3ElcLVnSzvAVH4pzW2qIKzVI3Fa7t0hsJU
         xBo9KfaJvK3QTMTpYy1XCm2G6MkR0rvcnyE6mvZMs3OK6MnykTpgRwY1QUvc24tEMYW0
         5KHUX4Ur5aIW5cuSBfBrFkiDDg2smWR6dEkUkopqAJZgPXgHOenuLSD0Tfj1bVrWxvJ/
         7Pc7m1U3C36P/FXbwKFfg8bd2hpcPI+hFp1L6aPqjbCho+2WZdDPWVZXyKhQBV8YkPaj
         6AC1K0p5pNtQ/F8SDTH7xZnrBpdhvizsgBHIaITtV7ZGS0Xz2q0OFhSiU6HmLUQ7hr3v
         M9ng==
X-Forwarded-Encrypted: i=1; AFNElJ8xEizQ0ys5sOSg7fn35UsglHLveUKK6gNPPYqxmvjGM+lIVjJETW1pbEmB/Njj9Ec7BQg2hMQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtUSjwXgI1l+iFafFMR14/X9pU8gimGJozvUiFXihVfYx6e8Tz
	HfNuh51yBwKNLDtWZkDXm/p+8xiGS20DZtYC0Q442uRdSSU2a9bBWBIwmHefN90xMyhXKLs6vka
	lxidJNrdqZ6GZze6+ne1ATlQsuZjQxGb9pBakAnWlHDSfl0mmX1+XsOBAY4qDi+gk
X-Gm-Gg: Acq92OFhnuKdwFMV65CwQQThCuMGf2QPzNJ8mEOAOL8FPv6OMNi9Aa6f1eMjGXxwG+h
	+Szx53EPm2qC+j6+W4CF4YJZp1o80cMshqqCyJoztLFusoR5H9kXltsxy//3INNSkX4oo97prAe
	kzaDxhUORgtsSufa2R0NIObCeGIXHYXI1k0LGv2nABiMBKnP2xt/3Y12Hj3IB+Uo56qKvNfnTsM
	EsL9g6C6uz09EaPD1jQjEloN/Y5StYIo6rF6Yr/0uxHxGKxlGMwqq1TLcS54HkRlaxB5iXOgTUj
	DXKkNP8Rj6gAWbEqexT9mhbMs/QNZFY34HNL7Lz+xEG76PvQ+itqcwOsFElYlXqzsbsguEnR/Zx
	6dNxldd6MBB08t7ckBLVZH170zkZ5zyHTTsO/aA2HduLUmOdqGof8cKzp
X-Received: by 2002:a05:6a00:3e01:b0:82f:1369:7268 with SMTP id d2e1a72fcca58-8415f5dcf42mr2983255b3a.30.1779444048705;
        Fri, 22 May 2026 03:00:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e01:b0:82f:1369:7268 with SMTP id d2e1a72fcca58-8415f5dcf42mr2983208b3a.30.1779444048116;
        Fri, 22 May 2026 03:00:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/6] bus: mhi: Fix broken runtime PM design
Date: Fri, 22 May 2026 15:30:31 +0530
Message-Id: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD8pEGoC/13MQQ7CIBCF4as0s5YGUFJx5T1MY5BOZRKBCm2ja
 Xp3se7cTPJP8r4FMibCDKdqgYQzZYqhhNxVYJ0Jd2TUlQbJpRJCHpl3dE1TGMnj4FnfGOyUtFa
 pBspmSNjTa/MubWlHeYzpvfGz+H5/kuTiT5oF46w3N33Ya21No84x5/o5mYeN3tflQLuu6wcpq
 3SisQAAAA==
X-Change-ID: 20251128-mhi_runtimepm-f7aed52cc557
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=3236;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+1xqvOBtTjhR467f4KD24eV71y2gTMox1bK7uo2F8/c=;
 b=iacSYbanGsCgJO+FPf6WYlX9gd+HwgLu3fqlbeWGrFLEf8k83HR9i9JLXwUGXl1VNyUq9NpK0
 IN5Dw8Qus9yCJf1P0rKQA7/BzSTy5rzWWcg3vO/q5CYIoLB3Wz41hRb
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a102952 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KH93JrovTcJc50lypuwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tYP1g2DnvYvPkprUmm0YZUkCxwlNROnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfXwmS9fX1+GRlZ
 EqHWCZo258oeDGY3m0FP33B4LR/+qxcFXcWno/c0bRLCevpO4XE4aR0YcmnLn6WqWNCigMmL7Yh
 FoeGeD2SmHPCm6bbXe8C2cCDQSju/DYiLy8WBvI9NFTy8jBbPui9foKvh3d//whXIe8gGeBmQFI
 3nzHRzcXf0qlHwBlkSMkPfLoNaqx+AMiuPJ080a1nsbOnAH0qTXKYsVLlvlHBGXwLZA3B7Fxj9x
 ews6YCQDGy051fJMkrC4jSG7r3HkmFTUgde8UiDZOOCAVSNW9xetlUQn1NDd/yhp6y8G2GUpKSk
 jf8IHZ/lIAph1H1H2O7OOepXIebU35oliP9cz2AkqC/XoYZQcy3OoO0IRrYmN4oLWN71KNuxcWN
 dI9dTEKBbDpv/i7MB2DKY6j5tY34C7SIplWb/Ua1D7oSaJ3vtizDA2zh3+gas1seQbiEe6jVa8a
 E2hx4TcERHZD4Lwd/zA==
X-Proofpoint-ORIG-GUID: tYP1g2DnvYvPkprUmm0YZUkCxwlNROnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030051_402067_2EB227C9 
X-CRM114-Status: GOOD (  13.87  )
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

The current MHI runtime PM design is flawed, as the MHI core attempts to
manage power references internally via mhi_queue() and related paths.
This is problematic because the controller drivers do not have the
knowledge of the client PM status due to the broken PM topology. So when
they runtime suspend the controller, the client drivers could no longer
function.

To address this, in the new design, the client drivers reports their own
runtime PM status now and the PM framework makes sure that the parent
(controller driver) and other components up in the chain remain active.
This leverages the standard parent-child PM relationship.

Since MHI creates a mhi_dev device without an associated driver, we
explicitly enable runtime PM on it and mark it with
pm_runtime_no_callbacks() to indicate the PM core that no callbacks
exist for this device. This is only needed for MHI controller, since
the controller driver uses the bus device just like PCI device.

NOTE: As we have dependecies with other subsystems, Mani can you take
these series through MHI tree if other maintainers give a ack for this
series. To all the maintainers please ack to this series after reviewing
so that Mani can take this through MHI branch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Rewrite commit messages (Bjorn Andersson)
- Remove autosuspend and use normal runtime get/put API's as there is
  already autosuspend in controller driver which waits significant time.
- Add pm_runtime_get()/get_sync() error handling.
- Add rumtime pm for wwan and qrtr.
- Link to v1: https://lore.kernel.org/r/20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com

---
Krishna Chaitanya Chundru (6):
      bus: mhi: Replace controller runtime_get/put callbacks with direct PM runtime APIs
      bus: mhi: Drop controller runtime PM callback indirection
      net: mhi_net: Hold runtime PM during active data path operations
      net: qrtr: Hold runtime PM during active data path operations
      net: wwan: Hold runtime PM during active data path operations
      bus: mhi: host: Fix runtime PM ownership between clients and controller

 drivers/accel/qaic/mhi_controller.c   | 11 -------
 drivers/bus/mhi/host/init.c           |  4 ++-
 drivers/bus/mhi/host/internal.h       |  7 ++--
 drivers/bus/mhi/host/main.c           | 21 ++----------
 drivers/bus/mhi/host/pci_generic.c    | 24 ++------------
 drivers/bus/mhi/host/pm.c             | 18 +++++------
 drivers/net/mhi_net.c                 | 39 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -------
 drivers/net/wwan/mhi_wwan_ctrl.c      | 60 ++++++++++++++++++++++++++++++++++-
 drivers/net/wwan/mhi_wwan_mbim.c      | 44 ++++++++++++++++++++++++-
 include/linux/mhi.h                   |  4 ---
 net/qrtr/mhi.c                        | 57 +++++++++++++++++++++++++++++++--
 13 files changed, 216 insertions(+), 94 deletions(-)
---
base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
change-id: 20251128-mhi_runtimepm-f7aed52cc557

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


