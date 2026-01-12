Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6848D25040
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qx/mJjNNeLOmXa/8FvgCro5atgbkDDhm94Fz120NVbo=; b=jiVqaGVZsTI4jN
	y9NtOc9FPK0fuG7BxRTkuAGsbbcjIVfiLgOLXZQ9TdGlVpiKToKBfmd0TlATP+oB549xAbPZ130gs
	+a9JUFuovJuQGaDDpqA4623ltirgMswff0nPItfDEOyzvEIj8v+rp14FsU51O+SEvVH6lSjITvN+E
	MlYp+gyzM5B24rm6fdbX4WAst0uST3jWF5HGrld0Oc8qFOVxg/W1Yk8ZFvUfGeLXbr21V/nu9vpQi
	efMO7l8NCxw7LRuFBHoXvD+I1PMG8P/s0qkPSxjsFgGYQfNp4gk2ZcqVKs8UiRQMEmsaCMyg5s9f2
	89tV6rmuFvxa9Mccozew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCTx-00000004tI0-2Nds;
	Mon, 12 Jan 2026 07:36:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCTu-00000004tHD-0uRE
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:36:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7EFGZ526784
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qx/mJjNNeLOmXa/8FvgCro
	5atgbkDDhm94Fz120NVbo=; b=QiMsgO5OpnPJQQrfuGzJCwwLJmC3yn7VxP8p03
	Dy2aHkdfh2Rd5+/ig55x47bjl6eiuGekO7A6EPR2YtckUibKbvESVqhl7Bs71vZa
	tote/mXQlcPgfL7MqSow+JqLMM4TOu/GlHKlol17k8xUYuaqa2RpxCpWTkItYpRq
	wNNc9ZI80T7IYMhYHvNKk8/gAcxqLqCaSznKCNSNPfGNZbaSt0h+b07ceQvqIrCg
	17yacSwEX5Yz17T3iScangsYhZnxRiP7RosOQTTlVQV25eVCrl6gM067HNXKO8/B
	kO+74L2KrGF5HthTOE1IUhsxNJZJoHAP/b5SuBSkYwpxKMwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfuwnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:36:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so1229096a91.1
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203412; x=1768808212; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qx/mJjNNeLOmXa/8FvgCro5atgbkDDhm94Fz120NVbo=;
        b=cBww8kekFMXOblrzoFAxJX2O+nKTAqpTNWj3xjjAW29hVI0Gynv0XOvt/tt62W3bde
         1jdmbPXFuhHkBAYH3y6ilMJfLxYQoK7a3AaC2EefPzRTgM/HXmxYhthIL7N5X1SzH02y
         xnWnDhG/X6p4eDTG8smvV/5FYD5DYVtsaGcx5NfyOA46M/IVo9SZ9tYcBou9VVkg7/mn
         65efS3deW/1JX+RR5Mmi3se3TEZb77lm9aOAGifpKMvr3ORklJKlZAhWwfUge9P13NKi
         dHHU/VWA/HalK2DHI4BR1vpQaCBHsnMjDziCn/Bj+vibDMsACugnH4I+1L15k43va0J0
         PVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203412; x=1768808212;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx/mJjNNeLOmXa/8FvgCro5atgbkDDhm94Fz120NVbo=;
        b=SGiiIghXiK0Y/U+81KaFvcC5iWE54AgczEyfaP21W6/Y+4mTL8WfVYG0Qf9/M8abb+
         SXNBowd3nuSJjiI1avyFcaYqKV/HQwdgO76/uToPIxmWlChtKUfLAuKrHWXqpSMZVDjG
         EwJPOBgqLYloUi3O5PEAY4PnzGLoNR1gAeptaafY/imlcnOZsaxgoHbCytoIxRL3TEBy
         6+U61BytslTW1uAerN1cl6s3lv3NSIDsYc5XdK7v0Gx9iBpT5UWePJb0PZRb4rIsBzsI
         BHm/1XoQDNj3Wgwh1zZyfkqO4TOEaq+jTDq2vvY/4SgpvmBozzf1KI/wMDhu3myYEbBi
         VngA==
X-Forwarded-Encrypted: i=1; AJvYcCW+kSvpZp0vq6dHT86FSoZkx6RTS/5VAdgxomjQVa+EeW4bqpc06SDKbQS7bbGHedKMBGmb0B0=@lists.infradead.org
X-Gm-Message-State: AOJu0YydOPIRHZ7u8MbmVn9pqO0kZqoxQnjx5c2fd+AG1MwF5hbaEvD6
	oVgw+KSdzlL76pm8TS5xGKLdimnYKGTwCqJe9FMprH0S3kxh5MNpr7F1XpF5a1ulSouu8HwUTie
	g3ejdbwvbQpZKeAR7A0lKsRm5xBPi5MBStpyot8lF1hRYh+6eAbBxXVF5f2wazfPfU9wk+UoHcX
	U=
X-Gm-Gg: AY/fxX6WbYMmzoTjH3b8aWoa0G4cLT2NhXtdxbjhGp3NUa021UygXuIBxGs0+Tsb1qm
	4aOb6u6lOLqE1v0R25Q6tmG95fPFxTc8XrTL5Y60gpIcafrP0u3IFOXn0Lnb4JtHmsP59RZUghm
	TEc+Q/R0OQ9hv9jPVyTbvuUIZXmAR5IGuRKYDi47hBiMRAk2/9dfBAc4pfTzXdNEJCgNd/daK50
	4JOYDZBGQ/fYQE1Im77tWuknvNF9Kjdf0AmxfVh/h+ixzuuedylaMcskk6YFlFklK7rERT59bjx
	jftmj0iCNWjr+x5Wfkl51Fq2JjatXE+ResVU32v3AFj6eL/SC0ijCLixWykJHT6aLkKM37qHZ0E
	4sLrZ9rxZpVUSM4Y8U1qEpmyYCDvkh3MQfXb1EDFUKhVN8FRhLNHyYsinsySX5fM=
X-Received: by 2002:a17:902:ce87:b0:2a0:9411:e8bb with SMTP id d9443c01a7336-2a3ee4c45d9mr138368175ad.60.1768203412324;
        Sun, 11 Jan 2026 23:36:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+fKPR/h6lQXVB0VxBEXoa/BO/EGtnYfpxxYnr2TC6bjXxea3SFrZmy7GX3BG/tXrqNTjs8A==
X-Received: by 2002:a17:902:ce87:b0:2a0:9411:e8bb with SMTP id d9443c01a7336-2a3ee4c45d9mr138368025ad.60.1768203411845;
        Sun, 11 Jan 2026 23:36:51 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:36:51 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v2 00/18] wifi: ath12k: add support for QCC2072
Date: Mon, 12 Jan 2026 15:36:20 +0800
Message-Id: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWkZGkC/43Qy27DIBAF0F+JWJcIMA87q/5H1QXgoUZt/ADbS
 hX53zt1FvWiqN0gDaN7LuJOMqQImVxOd5JgjTkOPQ7i6UR8Z/s3oLHFmQgmFOdMUzt3XLzTvIz
 jkGY6eS+YETRUTAOXyjkXCIbHBCHedviFYIb2cJvJ62OTYFqwaX6svy+7mOchfe7PWMUe+qtxF
 ZRRLR1XwRsFij8POZ+nxX744Xo947HXrdWPJlhd1CrUfAtV7Y2xzPiCJg8aV0VNotZaDw6YlB5
 CQVNHzRQ1hZrQNW+ka7XhUND0/zSNmm2CEbWvtOSioPGjVv43jlptGsRCDUqaX7Rt274AzOyJa
 mgCAAA=
X-Change-ID: 20251106-ath12k-support-qcc2072-f306e145bbbf
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ymA2SZ22D8srfUietaS5mezFobE3zIx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX0NBA3ogKPebN
 Tcje/eczlvC/ufGH0Sx1URKmmvTtZ90Fuc8lLiRKjboZ8jl/hgDi8lK9fgC7/A+d7lJyAMr5eNm
 KeAbV37TMbgy4qOxcFU7VioZ2rM2KmFG17RUFbWK1g6Ywjwt2wkDgWkc5IqKNlFcjs+sh/iSwJy
 6dradqogNSPiA35Q/Wq28z/OnDfU7wS8WwlZqDkfjs5mVjGGfMOkUkfU9OwGNAqIN3gsD7Cb6Vk
 8WB/OtsXO1wvb8S/ujDXpLJUQJMd8sJtyDHqSY47dmfRRvU3KYsZrXrmgf/X++Rck7tpxie7SWt
 evro6xXXe72Q5loEKc8w83edkfX3004KxawzTfx1dhrBm9/Wvq2bS5CcIgUecaG7K3crRQguRBo
 iRyYeXSuHNUrkMX4HwsJO7c49+cjpFdcR3NvR+PWu/lEWQHXZtFcmFXcOPbsdRL3UGzsHBGDc7d
 JOlXe5CXha4daatmYEg==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964a495 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4yKLGjra7TlDbw-xlBwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ymA2SZ22D8srfUietaS5mezFobE3zIx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233654_269867_0CEE158F 
X-CRM114-Status: GOOD (  15.99  )
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

QCC2072 is a PCI based device that is very much like WCN7850, the major
difference is that QCC2072 has only one phy hence does not support DBS.
Due to such similarity, lots of existing WCN7850 code can be leveraged.
While to handle the difference, separate operation is added, necessary
configuration is changed.

Overview:
- The first 6 patches refactor/fix current code base to prepare for QCC2072
  support.
- Patches [7,8/18] add hardware registers and parameters for QCC2072.
- Patches [9,10/18] add support for new QMI memory type, new firmware
  download etc, these are specific to QCC2072 hence necessary configs are
  added to make sure other chips are not affected.
- Patches [11,12/18] add new callbacks for QCC2072. These callbacks are
  actually taken from WCN7850, with modifications due to the different
  HAL descriptors.
- Patches [13,14/18] add 32 bits variants for QCC2072 REO CMD/status ring
  handling, as existing 64 bits functions don't work with QCC2072.
- Patches [15,16/18] contains changes required by QCC2072, but those
  changes are made common to all chips. They are not expected to cause
  any regression.
- Patch [17/18] add QRTR node id register such that QCC2072 can work when
  firmware-2.bin image is used.
- The last patch enables QCC2072 support.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Changes in v2:
- drop MHI dependency as it is not needed any more.
- drop '[PATCH ath-next 09/19] wifi: ath12k: advertise standard ELF image format for QCC2072' as
  current MHI implementation supports detecting firmware format by itself.
- Link to v1: https://lore.kernel.org/r/20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com

---
Baochen Qiang (17):
      wifi: ath12k: refactor PCI window register access
      wifi: ath12k: refactor REO CMD ring handling
      wifi: ath12k: refactor REO status ring handling
      wifi: ath12k: fix preferred hardware mode calculation
      wifi: ath12k: refactor 320 MHz bandwidth support parsing
      wifi: ath12k: fix mac phy capability parsing
      wifi: ath12k: add hardware registers for QCC2072
      wifi: ath12k: add hardware parameters for QCC2072
      wifi: ath12k: support LPASS_SHARED target memory type
      wifi: ath12k: support downloading auxiliary ucode image for QCC2072
      wifi: ath12k: add HAL descriptor and ops for QCC2072
      wifi: ath12k: add hardware ops support for QCC2072
      wifi: ath12k: handle REO CMD ring for QCC2072
      wifi: ath12k: handle REO status ring for QCC2072
      wifi: ath12k: limit number of channels per WMI command
      wifi: ath12k: send peer meta data version to firmware
      wifi: ath12k: enable QCC2072 support

Miaoqing Pan (1):
      wifi: ath12k: fix PCIE_LOCAL_REG_QRTR_NODE_ID definition for QCC2072

 drivers/net/wireless/ath/ath12k/core.h             |   3 +
 drivers/net/wireless/ath/ath12k/fw.c               |  10 +-
 drivers/net/wireless/ath/ath12k/fw.h               |   3 +-
 drivers/net/wireless/ath/ath12k/hal.c              |  46 ++
 drivers/net/wireless/ath/ath12k/hal.h              |  34 ++
 drivers/net/wireless/ath/ath12k/hw.h               |   2 +
 drivers/net/wireless/ath/ath12k/pci.c              |  17 +-
 drivers/net/wireless/ath/ath12k/pci.h              |   7 +
 drivers/net/wireless/ath/ath12k/qmi.c              | 180 +++++++-
 drivers/net/wireless/ath/ath12k/qmi.h              |  16 +
 drivers/net/wireless/ath/ath12k/wifi7/Makefile     |   3 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  62 ++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   8 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   3 -
 drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h   |  33 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 503 +++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.h    |  13 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |   8 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c     |  97 ++--
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h     |  30 +-
 .../net/wireless/ath/ath12k/wifi7/hal_rx_desc.h    |  17 +
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |   8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 101 +++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  26 +-
 drivers/net/wireless/ath/ath12k/wifi7/wmi.c        |   5 +
 drivers/net/wireless/ath/ath12k/wmi.c              |  54 ++-
 drivers/net/wireless/ath/ath12k/wmi.h              |   7 +
 29 files changed, 1162 insertions(+), 136 deletions(-)
---
base-commit: 87e9e52b4bfedea84f941c48907e0de0d70c0a7f
change-id: 20251106-ath12k-support-qcc2072-f306e145bbbf

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


