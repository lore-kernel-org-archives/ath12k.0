Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B4CC6B01
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 03:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ri51iB5cXCkdkK8wdR2vo1E/J9EV+x74w3mmVibn3Jo=; b=w28uHniVQBKHpm
	UgxvKtqUAilN7ZDlm8LI9CIgPUKuZPRXpOnxqNAZJfj+MjUqsxwEPGf+5/XjKAc5KVcmWXp1xSSxi
	EdSXrZYfF94TYCjRZJxkAbw805xTMx6tvV+AohCwaQ6R+YcQ1giAnVR6KAsCv/FACjm2430gKbwuT
	lXo2wx4d2tmheU4NSKvDTMF+VYh+f1coqiP1cMA0JJfkFkVWaUksioC9llu++25cJY4xY8uAUs4Ay
	Lb89KJtLfJcmNEJ+OnJ3SsMDVFrdwXAharMMk6wHSVr2Lylha1tl5uqUPC6jgW+eElRwGRf3OU8dz
	iVRdu+E4rE1KWNas2P/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898S-0000000GggH-1Ukf;
	Thu, 02 Apr 2026 03:54:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898M-0000000GgfA-13VB
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 03:54:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Ulq3956631
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 03:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ri51iB5cXCkdkK8wdR2vo1
	E/J9EV+x74w3mmVibn3Jo=; b=iF0xJUpEvDHikaWs8n4gMtIdEJP8ySAMHgVEnC
	tqj/8zW9yOC0+VWjlM2AOLaYnNFASRIspQzijFjC8E4L9Avkg12xdmUpsnYLVvf9
	aPVGpf8uHHQdOYUOMcaYnMNXzeiRYRaY/JS5u5tUU0h3Qm3nAcIoj+SzugZ2uFDH
	RT9PHPjzfIjMo5WInv4flxF3giAI8fJlAl18TQFbTMeL841YDz+E46bFDQXMy7LU
	DTzWz948pZUOHlVxnPQzn8EjjcILx/xSzs3rn5gQ+EJ/AXvPCNdNKEyhkHQ/OXwO
	eJFHRQut/3XHh4I3n4ZDz6teE88TsDcISw0GqQmybj3OFLsg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5h647-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:54:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso666384a12.1
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102056; x=1775706856; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri51iB5cXCkdkK8wdR2vo1E/J9EV+x74w3mmVibn3Jo=;
        b=QAP82AzUr29/6XMxdyhozawo6ySgfmRGH/C5HpnOUxncFeZ4JeETd+tecguNIWelYk
         pJdrp9EGtvYoY5ebyJBCsLBh70oApD5JhV2GDYeI07SjlDr1O+bEg5i2EOk7suOWAhgg
         SnYARr7WeWR63tsvWj9Ufn0KM92XIE0Dm7zfXZaQCC2q1gWvAYkeV7HdxCBCil2F7q3C
         JXeWzb06M9NXGn8DB2DtRJcnE3erCT9/ZTzGTwhTyvBEGva4N6QoiQZXyFUElbKLkHQn
         EXuO7bdXFOot53sAP+d5kSCBTyV/ccg6U1ky+oWt/cXc4aZMFInFttei2hTN3yAQeel5
         PKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102056; x=1775706856;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri51iB5cXCkdkK8wdR2vo1E/J9EV+x74w3mmVibn3Jo=;
        b=tPNKP7+nF5VPJYaaXtaBtY1mmIzi7ka0fCJC1ttQhZ6CBvzqax715ehJPJ66nt4ddL
         e+RxlxBT02f3drhu51da77RdHGZXG16e45xWw6EpJWYK6dtHBtQk4fTm0vHZ7gm8ZQyC
         uET5tXdhW4rJ74UiJFtqqTt+/zMskhd3fD+yaxvSS0XkmhpYctpuAPT6OV80sAKTfFri
         VUTu/jQy+yix2s41ha9JrqQ60z5CTw0etEkpA7BRc8FGHsIE9XarzbvJW39Lz8bdlwsu
         1gMfw4+OG/nzBkHpr03DdTKTylId6Kn241/4pJ1p5eulLyZKW/P/uX8WEHOQ62zUbMoI
         4hCw==
X-Forwarded-Encrypted: i=1; AJvYcCUsDIpY6FGzqEvGq3YdVVyWwpeXnBp0R9/km38fseDvurSocl+rF9xaRuBHurpMltoyGx/2D+U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+0CT8nwo4CiYtSva8HG3paaClidbWCeMWPBY0aJ6k7ujavhXf
	bcxyjstoarXznIIYB/bZk/CyohQ/83BH/CijfK3jzJnQxYpqfsJpnSI2MWkpqmReSSJm1BRRsIF
	hpDyG1hz1vHVf2ci2icbEAuLw4KDGcft6LB3ZGTBxnFh6C2WCq1KeXJni486pFRYQ
X-Gm-Gg: ATEYQzyJJ0A0IaV9qyWMOfJZtkXRvjtBipJNoG5b/aWSQKuliw5kfRKEiFIXoBN6Zbt
	zsNMz4i9z3uvrZVN9WeVKOVj6K+WNFv1vLLR9vNXOfZmwd1a627pJXhLaGBpO+TdraIIOPk/eqF
	ivNMS9DcoWD/AjdxjOsyPV0Rwq44sQQg8/G6oYFMb1dK/kEvrLmF47GmIBqYcCSqEcV2kWTroID
	Yd2BqA9I4XSfp3qxP7YFQbpBFqE6eMEkIiVfg5gy7Oby9FmgOSYe0NzuMg/4o8k2BgdgOfnWoEf
	V6LQewpzOWa0ualjWW7bUOZ14Bb9QQEBtzFEp3U8dd4Eie6xuG7BItqE+EE1ccRNx/c6ah/wLi5
	PomNSnDGKWlY9Fsl/vq5EyZTLJ3h2c2xSH3f58pZCMNed7lRTyI6mYe0gOvR7SEf9NtH/PrIIA3
	7pGUAIkPt3uEddo0dTGpRd1Yb9i2w7q3NhsjEZV04=
X-Received: by 2002:a05:6a00:984:b0:829:86aa:e163 with SMTP id d2e1a72fcca58-82ce8931fb8mr7170788b3a.13.1775102055932;
        Wed, 01 Apr 2026 20:54:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:984:b0:829:86aa:e163 with SMTP id d2e1a72fcca58-82ce8931fb8mr7170424b3a.13.1775102045792;
        Wed, 01 Apr 2026 20:54:05 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:05 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH ath-next v4 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Date: Thu, 02 Apr 2026 09:23:58 +0530
Message-Id: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbozWkC/3WNQQ6CMBREr0L+2hJoCwZX3sOwKOUrVWmhvxAM4
 e4WXLuZZDJvZlYg9AYJLskKHmdDxtlo5CkB3Sn7QGba6IFnvMyEyJkKXc5fzAxjIblkum2bUih
 ZquoMsTR4vJvlGLxBZJnFJUD9S2hqnqjDvreznaHg/Of4nsXR+HczC5axXBZFU2mFvNJXR5SOk
 3pr1/dpFKi3bfsC2Mm8Cc8AAAA=
X-Change-ID: 20260331-ath12k-ipq5424-cddb63a46a97
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69cde868 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=hcgyll2ojUKJi-iaWUgA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 92MczE7OPGal6LBMchnE5SgoJW7EmfyT
X-Proofpoint-ORIG-GUID: 92MczE7OPGal6LBMchnE5SgoJW7EmfyT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX+VEvWNHmekjC
 bE7mkYRZYipJMWQRtgc9n+Bl0tIaFFhxyBSrCWJHU3pQjx89YEDMXSotIaEGb2aUbeDx8+xQ3k+
 KdalhqAPTnTNoVmr8zsyar6H93oSq0RBWxuVH4RhsolKhhfyDXJzXRosn0Fovjy/J+Mvtrs5Gpe
 tjUDYFFBI4Fbm5zc856FiRve/dbVeejo2DlS7JHo9Ukdjr1VdqpdTBk5CENdMdkbaHmiQ5cfKs3
 2SHlSxso8hJbgxEJWUabsBLu9Q54M33gbifdEm3TLwT6FjJW4QgjXfMYC0SD1UbafN/MTTDHDLr
 q91O317SwqYUQNZZh+wCEuYpjfA31+U8DrxCRLE7mhh7qC16m63PWgTrNOXRl6QT9AhhXY3xldQ
 fSVkg6irHKAj++SsVyg9VA3C3InctrlyOEXBQs6kqLcz5N3XGFF/rh9+0VWre314DtUyqjNDHFJ
 x1TZ7Hu654f2zrAu7zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_205418_413713_8AF03B3D 
X-CRM114-Status: GOOD (  11.56  )
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

Add support for the new ath12k AHB device IPQ5424, as currently, Ath12k
AHB only supports IPQ5332 WiFi devices.

The IPQ5424 is an IEEE 802.11be 2 GHz WiFi device, supporting 4x4
configurations. To enable the IPQ5424 device:
- Add the necessary hardware parameters for IPQ5424.
- Modify the boot-up sequence for ath12k AHB to accommodate the
  requirements of the IPQ5424 device.

---
Changes in v4:
- DT binding: dropped copyright update as per discussion in v3.
- DT binding: Used DT binding from v2 and retained Acked-by tag.
- Link to v3: https://patch.msgid.link/20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com

Changes in v3:
- DT binding: updated copyright.
- DT binding: Dropped Acked-by tag as copyright is updated.
- Rebased on latest ToT.
- Dropped ath12k_ahb_ops because qcom_mdt_load() and
  qcom_mdt_load_no_init() now have different number of arguments.
- Link to v2: https://lore.kernel.org/all/20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com/

Changes in v2:
- DT binding: Removed the redundant example for IPQ5424, as it is similar
  to IPQ5332.
- Added driver probe data structure to eliminate the redundant switch-case
  logic in the ath12k_ahb_probe() function.
- Validation completed, hence changed from RFC to PATCH.
- Link to v1: https://lore.kernel.org/all/20250130051838.1924079-1-quic_rajkbhag@quicinc.com/

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

---
Raj Kumar Bhagat (2):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 +++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.h             |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 93 +++++++++++++++++++++-
 11 files changed, 231 insertions(+), 21 deletions(-)
---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260331-ath12k-ipq5424-cddb63a46a97


