Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1074D68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=56+P8TT/sBZjFdakJ5P8iKzWiVSHZkQF3LbiBlms2v4=; b=QpQxr9Aycu3rbT
	QBjYgmOgbnwo2gD5QMtIewskTYAlPhuPLkwee5xJ+YwUXZ7dCv7GPwQ4NRiWx1vSH90GdLNPmBpXV
	pPoDPVh/KWD0mQqbnR4BYINZkyNH03qeCdI4kFQXcHiqxIcusHVUb/i5Q/k+I2hZEhJXJDiJTnIeo
	VlhpIRARa3L2I/rq5bmtnCyFVzf0cflFjP+D5ICYoSxIG7b/gRB2lwW0Gv6TaoWFAPxEiGGF+g4YP
	BWmb+WL6ixYO1QBGp6JIhaxJ1zw5FGwPvb6K7aiebu3iJx5SHPgeNvpFJ6l8uJdH3n8yOqQkq382D
	vBWw6N0zdVLiQkYYAZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3ET-00000007fkq-1Cvo;
	Thu, 18 Dec 2025 01:55:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3ER-00000007fkG-15JS
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YZ9U813774
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=56+P8TT/sBZjFdakJ5P8iK
	zWiVSHZkQF3LbiBlms2v4=; b=XkSSbHII1Mb1MwFmlob+2oVBsiw1qo5La9gyeq
	N0aCcBWpCpR6MVyv0LwtT6BRouwv1GuGe6uuZLeoPFDvcjHEdyScSNzddlhnauow
	TD4rfAJZ4AU785g/AqTShBQ9BQPocGV4+CtrkT/sXP3A96qMifBOjtK1lHUMhAiW
	SsYf73keMX+lbC5DrJzmo2R2EQsbrEtIboL8sYnRH3COAX8ZqKUQaFze9hc1n9V7
	l04uzJs0L8wrjhfy9YmV6H4dC10BZgYk1uCitkET+Q+pYEKN4Q7Tjk0DvtDfzNt/
	Ardfud8Hy9LKNt0XW5urmjWEe3U3bwh87jGgSOJ3MBi4n8eA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v796tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29e6b269686so3299835ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022904; x=1766627704; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56+P8TT/sBZjFdakJ5P8iKzWiVSHZkQF3LbiBlms2v4=;
        b=kgWH3M0WpB5Hv291hr2F6nJAeuUSThiYSMiaHO30luDQzwkt63jZi3Qr41NTJK5hwM
         J9SoW7P7l5JGSbRpN0QpAZBRpZ6yhDEu2beZPcmA/gUM694mgnjvdYj8CmYHMGLogV2U
         v6gW5AZLq/IvW8CNg7SwTbSJqvJMwmrF6ZFoByXJ7xOGVCG5EZGSRhFiMcHn4t5bPYWG
         6zVBXD7aPlblFmnoimOgo2teUN7wf2QtdaxPbgKqCOSSgnu6Xuqrc8Xb/RlDeq7oEo26
         f4SwaUl9gQJUbSw4EbQ4+78HdTVmPkj0rpN9asDwmtwvD9adceNQwE+OxFsWQ784vzNb
         ABNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022904; x=1766627704;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56+P8TT/sBZjFdakJ5P8iKzWiVSHZkQF3LbiBlms2v4=;
        b=hb5vzIuGCIjSg/yNx5l3yYDu0+xqlucBTZTCh8h5+gUwDDI6VlvHPvl/iItT1xkzbj
         coBBMLP1pE2snPs58m0n6pRm/hbzlMGXjV7AVbT3YcogwSbuaQXXziKeLOhIuPMq05iQ
         4WdNpKyV/6WR62qelfO3KFvaPp31zH4p5ZXEw+5hhuty/8qMvcGY4AH7OKMUqHUsmYRP
         mJst8nBV7nHBZARvaG0hXkdaG3ioPnzgk1djat4AaOBPdkA4p8QahBEVcQABE0tXkqZF
         UtQUVk8anLWL3LvNPIU98TISgbJRS6SqHwvX8WaQGiyJnxZwk53BhK0hiWxwscrxj7I1
         6jFg==
X-Forwarded-Encrypted: i=1; AJvYcCVu6bsoMq7l1S04vV9UHaHlOtXjxZ3m4N7IYnJ1AAeIq9dN1xm1IeYFyJjA/zkA78jmDz9OkJM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjnOsIK1U+++FdquEM0sxRPFE6Q3OwRn0afs5iqg19DSvGfW5S
	uM7n2c5GlYZrSwjmkwoc5oPrC8nEfozetbLhOPtmOY0nvXLeXXos4MbzXxQbtOuBuOUBTMz8m+t
	kMrLb0iO2GSBcLAHC319A5o4ZFTjQbycN2a0ezrAne+OH5yjCLZ7IINW22HMj38hfcruD7kgurV
	I=
X-Gm-Gg: AY/fxX56FluzbwbhchUGuYq5QYEMuz9HjQA9fUlkJiXxxsNE4fDOYkjLPD0EbONEHPD
	P7jW/kSvSx2jwhsg+QCivlH1obMkpSSUFrSK2IJdhlCCc5RXb7scOwmfj6M+SBaeYmMse/iFfCP
	3NkMlH2+avUtkQobl/l7ztjHwK2rwMuwakgePI9uB+VahCE7CRVVStnDeZJ6SoHDcSc7SvomoJr
	MHeKjKPbn3n0h1dJgUeuQXzQo7vbkXELenuWgBd9bmESMBInPNOxdMVapXnoHIcoyEplZ2my96x
	pcS2BmxykhEeunG7lvSP9pNIjlD/QKw/yQ7kDBTqDHPKMhyPuSC5mebkZwGOGG2AtUcTjr20wUQ
	qqz69Q0UmGpyXtME0xM6XWxt0f6xhZMuxzAF25SK5hPqKBg2kuZPL3gOSmaNT4Pk=
X-Received: by 2002:a17:902:f70a:b0:2a0:9d01:c3c1 with SMTP id d9443c01a7336-2a09d01d4a9mr144258615ad.1.1766022903901;
        Wed, 17 Dec 2025 17:55:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKnYFo7nzNiGaFBO1ovUKSxvb/HPdgXi09iy3bNpOGLudh+RHcD0KFDvEu7VzUuwmb+O5uMg==
X-Received: by 2002:a17:902:f70a:b0:2a0:9d01:c3c1 with SMTP id d9443c01a7336-2a09d01d4a9mr144258405ad.1.1766022903376;
        Wed, 17 Dec 2025 17:55:03 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:03 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 00/19] wifi: ath12k: add support for QCC2072
Date: Thu, 18 Dec 2025 09:54:14 +0800
Message-Id: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMdeQ2kC/43P207DMAwG4FeZck2mOOftivdAqEpSh0WshzVdG
 Zr27qQFiUlQwU0k2/L3O1eScUiYyX5zJQNOKaeuLQU8bEg4uPYFaapLTTjjCoBp6sYD8Feaz33
 fDSM9hcCZ4TQKphGk8t5HUpb7AWO6LPATKTu0xctInj8nA57OJWn8GjeYs1uS9pslhzOgb0fXV
 qkp/erYubrKr6mv1Bw9CQrUY+2V3FmnrHvsct6ezu4YuqbZlmc+wLuMdG6ksagqWiFijBbq5Yh
 DymM3vC/fnvhyxV8/nDhlVEsPKgajUMHP2FmexLfGmV3VRNFCjcIGYxwzYUWTdxqoVU0WrXYBP
 TIpA8YVTd1rZlVTRePawk76WhvAFU3/T9NFc7touA1CS+C/aLfb7QMSFMeMigIAAA==
X-Change-ID: 20251106-ath12k-support-qcc2072-f306e145bbbf
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: z7DQll7EbnPXhcjlKUnvU2yjzvcXQvEB
X-Proofpoint-GUID: z7DQll7EbnPXhcjlKUnvU2yjzvcXQvEB
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=69435ef9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=55-7P0Cx6h0GZh4B0BcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX2OdRrLLHYwQv
 0mg1GfcDDINPlFLi0JcPRE2PkSxKm3CH/50EP1Fz4PZnTRNrd0FWlmjJFho2r8JGy3NS4ZU8hpo
 Ly3L4t4IcnMUrOaJRTZ32ILFnCcgxSXL74esVoQ5yVSgH4GEYk0u1akTnNiXV6vjv/Q8Djlf853
 IL9Rum35EEX5Wo3uSt/TvDRbQ4wG1G26MLB66EVuM4sJnmdKl/DtstDiyZked2Qtw0pYoOx8nfm
 lHg3zf6Iq/QoeNd3g+WamOquEk6DvtikkYSKuwTyAY3KRqjclO/PCcqmVmAQcHSR7A00jfPKag1
 qWb5yavytv4XSumqYeQlDVqA2kWk5n58IKb3hs1yP5GsmrX4GiIHFWE3XAY1vAzjRFB2nvsbZ3O
 eaBB5zfQJTeDez/augq7VLAAlUjfVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175507_437968_EE79DD02 
X-CRM114-Status: GOOD (  14.99  )
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
- Patches [7,8/19] add hardware registers and parameters for QCC2072.
- Patches [9,10,11/19] add support for new QMI memory type, new firmware
  download etc, these are specific to QCC2072 hence necessary configs are
  added to make sure other chips are not affected.
- Patches [12,13/19] add new callbacks for QCC2072. These callbacks are
  actually taken from WCN7850, with modifications due to the different
  HAL descriptors.
- Patches [14,15/19] add 32 bits variants for QCC2072 REO CMD/status ring
  handling, as existing 64 bits functions don't work with QCC2072.
- Patches [16,17/19] contains changes required by QCC2072, but those
  changes are made common to all chips. They are not expected to cause
  any regression.
- Patch [18/19] add QRTR node id register such that QCC2072 can work when
  firmware-2.bin image is used.
- The last patch enables QCC2072 support.

Depends-on: 20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Baochen Qiang (18):
      wifi: ath12k: refactor PCI window register access
      wifi: ath12k: refactor REO CMD ring handling
      wifi: ath12k: refactor REO status ring handling
      wifi: ath12k: fix preferred hardware mode calculation
      wifi: ath12k: refactor 320 MHz bandwidth support parsing
      wifi: ath12k: fix mac phy capability parsing
      wifi: ath12k: add hardware registers for QCC2072
      wifi: ath12k: add hardware parameters for QCC2072
      wifi: ath12k: advertise standard ELF image format for QCC2072
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
 drivers/net/wireless/ath/ath12k/hw.h               |   3 +
 drivers/net/wireless/ath/ath12k/mhi.c              |  10 +-
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
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 106 +++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  26 +-
 drivers/net/wireless/ath/ath12k/wifi7/wmi.c        |   5 +
 drivers/net/wireless/ath/ath12k/wmi.c              |  54 ++-
 drivers/net/wireless/ath/ath12k/wmi.h              |   7 +
 30 files changed, 1174 insertions(+), 140 deletions(-)
---
base-commit: 25f833fff81de4fbb9b5382806860b63768567e8
change-id: 20251106-ath12k-support-qcc2072-f306e145bbbf
prerequisite-message-id: 20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com
prerequisite-patch-id: d5a84e00e749b9332179b8ed7d2736b42d33fde2

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


