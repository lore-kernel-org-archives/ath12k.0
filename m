Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302CCFB5190
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 05:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=esLugqp0oA5GjPWw3xFHpZetDg4cY8K0pJ/wq0+XVWo=; b=0bypjg4FhjqPAD
	ng+vKw+v0n8Gi4pu7qM3R6cYYLrovDyp+eGrFTXQ6gJ1t2s+Gl4NKn3abzUGh2lyTx9zECCI//Vn7
	H5PmP1vk+98XkTJQz+p8C/3DucrPRKsjfr/uafy9JlnknaSiLRxjOWfoeiV9PwKeN/e+Qbz4WCalh
	HrfR/HLJrP2VnhF/PqY9LcTty+Sbo4wSyYVG4A91HtEo4ZffjUzgMJAZLdRdXHHrl+1lz0nG6fcyc
	6jecL8/Z/hO31BMRCYcrKqlRJRrRqysGQg9k3ERkoOYoa4rn+Kz8sbIGts84G8h8vzQ0R1CxETDzx
	Km1oyOYLd60+OvOmKBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxU-00000005upD-3tkN;
	Tue, 07 Apr 2026 05:26:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxR-00000005uor-33XU
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 05:26:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQk4g4009149
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 05:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=esLugqp0oA5GjPWw3xFHpZ
	etDg4cY8K0pJ/wq0+XVWo=; b=eq0E3dbY8hqt/QPi0q4G35Rqgx4SqRebqpmWOF
	unH+6k6AkTY9qD5vWzIZP0Jcqo7afk7Un/4OUMChPQLG3KGOGuwilj1k6Fgi9TBQ
	8FwKS3pctbSVG7Wc7lOkKvJKrLcPqbAf8eaWnHGX9MFQ+lslvZEjsCnJi3VunCaf
	bx2kRDvhr7JUqHFBXdFtjta8cWrrooT/+vb09Uf6eswIjNrc0lYvPa6FLRjJnY2t
	WrXZS9xHFAnqLX1+3nFLjkF2XrwXMG5UbF8j1kaGDihPojEtd//Y+tut4Fbtc4s8
	gLLuYzeeObXGZBWF+WuKh7vThA8GL9Aez8oJUrkTg7Zx3aVA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrks55j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 05:26:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76fe944e6fso301638a12.3
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539596; x=1776144396; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esLugqp0oA5GjPWw3xFHpZetDg4cY8K0pJ/wq0+XVWo=;
        b=aH/0RFn5mj5nzDkT4VsPSF2FHxI5si6vvici6LV0dHstm547GUVQ8/6LpL/LENdAuK
         BCm8kn7L9z1zZqeavMzbUPLaz8ORXvYUnuHxXqAe7P4fZ0z+cuTMyehooRI3KwxOsoI0
         t4mygTOsG3PIRn3vbBbaU7mGFZ6tluMW1H3nNPG2kArBXVvfWuGF0ozugAFTvyEze+oq
         /Sh/p2/2jNvC1ttDjZsi6jYeo8OvUWo+bWM4ypfaP3eBnHoWkSG4KjbSNYxdrsf4LNKC
         FxjBSwloqjTU8V58qWARBQtPU8WPsXkLIGugLHBeJu8ZL+agyB/siCcpvR+1EdZKdQ52
         oaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539596; x=1776144396;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esLugqp0oA5GjPWw3xFHpZetDg4cY8K0pJ/wq0+XVWo=;
        b=Q/p+XugQSpA56e1rDfqPOaFSQBeEhSKZFr/V+X1WwWIH0PffIKn6nemtgHdaxBXKf6
         UexZJkqZ00vKPxIotc2rX8zdwaM0YmIOORUlL9pKWXCLhO94PgFwYgJNuzF6RzxlSPns
         147mtGsDcVx3V67IfXtNUJe3kHPOZNGASZ6AdQDxsSsCh6EPKBxD5oEOxW8nlO4WJ7me
         UJWxtiSIBMNFhyWvU7tqxJMeQCWQ+jKuyrQlZZ+2kDXdRv6NL/j3W7irEQmxRELiw+ap
         YyRkH0LHf5Kd/2wVeDqTfFYb3MoJRe9Mz0/PqU+tutVnC1wmyd8wzO5cR76PoRjTe/Yp
         PJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCV+HkAKtZrcJS2J+42ep+5GX1TcNisUofaX1yPUlClUxFkI25kv1CBBhkG0PXyt+o8jOvdOJzI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrNij35eo1dUdnwCrdT+m05o1RKCHfVkFh7F7ImwxjPeCdVTGY
	d7fwj72bh1KuIgAcqc4Fv1SEHTiPrzFEhQnGe/orEH85iYfNCBO5EXHI/YgMv4Cyt6ML5ORLurf
	Vd1bUAtUK1gd/xr2tk0bMKpnQUSWLwd1o2dsb9zVZGfmyNMnk6QHIL4C/LCMabEIX
X-Gm-Gg: AeBDieus0ghehgzoMY4SsjNjyp0exuyAJD2fTN9mNS1sAgBIhO44hDR+mdSNW6VGfGc
	gkLUMIosF8fS52nOP3i9YQZURq1H3/LJwhd2EMf8tmirO1AaOQ1mAn6XBj63c4+8caQjVjFQuNO
	wdg3npx7rf1m6/WpUWptJb/X6MDqdbdExjTR3MNeXhLodlYfUEHgdQxS4I5ZJuGnwrc4qekiYin
	DNf9ebtlbz9jJ4iAcYCpaBVa5q6H3JCvenfr5vk5s+Af1wiFQonj/7AcObfLrbdal9KpXDeTnJG
	5O/1QbDw3YImIrIW88wyePwou0zaTjQPy5FctG5Teia4GMg+mKaqZq7YbvFdRMccp/S4oBqFXYC
	y57U7a8lNfhNgsG/sfzjQ9+DrjlyHvtlZXEaKDWm2fNLL4WRwT0sYKDLQvKQ2fMnhghprgCA3QE
	kuEjuaozfdgj/b+iCbnS7XXadiPp77ua+KLqQNW/0=
X-Received: by 2002:a05:6a00:301f:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-82d0da90c83mr15364886b3a.20.1775539595608;
        Mon, 06 Apr 2026 22:26:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:301f:b0:81f:3fa0:8c38 with SMTP id d2e1a72fcca58-82d0da90c83mr15364841b3a.20.1775539595098;
        Mon, 06 Apr 2026 22:26:35 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:34 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH ath-next v5 0/6] wifi: ath12k: Enable IPQ5424 AHB WiFi
 device
Date: Tue, 07 Apr 2026 10:56:27 +0530
Message-Id: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOV1GkC/3WNyw6CMBBFf8V0bUlfVHDlfxgXpR2kKhQoEAzh3
 y114ULdTHIz956zIA+9BY+OuwX1MFlvXRNCut8hXanmCtiakBEjTBLOKVZDRdkd27ZLBRNYG1N
 IroRU+QGFUdtDaecIPKPQxQ3MA7q8P34sbqCHjbd1K+sH1z+je+Jx8U8zcUwwFWla5FoBy/XJe
 Z90o3poV9dJONExiQ9FEPZFEYGiDQVSEiV1lv2grOv6Ahj87LgVAQAA
X-Change-ID: 20260331-ath12k-ipq5424-cddb63a46a97
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4958c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8
 a=hfZH_8odhG_REILTePMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EoTB_jYQVcIY9d4CaZk1CEGl6W6p4WjH
X-Proofpoint-GUID: EoTB_jYQVcIY9d4CaZk1CEGl6W6p4WjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfX4FNkOaaA+xep
 PsB0lV1PlIhH/j6r6+hn11PQTjKeX2cmZzBqKQCjlALyXgG9KXQDRmi9TZCC6PDRsOZbceHPz6S
 llDrEm4+99b/Dqs6EJpQzua2oVxNdboWMmz3KxoheMaR4rpwDFUP/hRIaSNeJZPisETo2G82lr5
 NMPsCXTKeXQw4DJCVvRsKVqo+ecuy/iSYZcBgIGb73d9N+Gxz6gNlNeC1zlkRByC6hbbVoTPe3N
 0dGJvqZsqIEuCXzbMy0KPXE1u2iDZJWNVOShmb+HFMEwKwqj07MjLntg1IiFFi1b1vdV1b4gQNl
 VLhvHeyEdi6T9++UW5k4H9VIrULytGOIcgh6CY4ukYtao6h2t7PE/2vjeBMWa2bfOINhv51t2uC
 ZfKGe8Srkw1b7naL5qa8hF88n45RUluz49nYRgKo3yIR6Npgw5CIjrMfBnkJgX5opd6DdtZsDQ2
 2PY2mlL48Wm/ucB/lAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222637_925817_A01032AB 
X-CRM114-Status: GOOD (  11.80  )
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
Changes in v5:
- The mhi_config and current_cc_support hardware parameters are explicitly
  initialized to default values.
- Link to v4: https://lore.kernel.org/r/20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com

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
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 ++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.h             |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 97 +++++++++++++++++++++-
 11 files changed, 235 insertions(+), 21 deletions(-)
---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260331-ath12k-ipq5424-cddb63a46a97


