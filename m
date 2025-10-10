Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20056CCA476
	for <ath12k@archiver.kernel.org>; Fri, 10 Oct 2025 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UQLk3w6GkzbTjYg8BRnJ/qGfyc3WiUkLopNUoNxwb40=; b=h14HCrI/McFQiGNcpMuokYoPsN
	q3DWQgJlSe88Pd0qaJ7NiIFIkgjndBanW4oK7jDTch+6wDhUdAbNDaowZ8ukot0WKohAI4V4p78jJ
	OmU/kW0nTJsG+yEnKHm3ixWJS+W9cR6fLU7CEw2k8CJhK+iS2CMKCxJOSKK6W33cp3En1njFgqcgX
	wO0B4/kYNt0YBLtVDLSA4kOR7EIv39XjZydK4WFPktJrOpvi4S8J4GX9odb8vvxEPsZxJ/C7876cu
	S8hef2ydb8DgpcVdwzi8JenmTBb/NoVvrkXTJScyKaxZiUlssmOrrjzZj46ba8bdeVihVnbKtiifv
	1bsVHOog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GHl-00000008zRs-3eKc;
	Fri, 10 Oct 2025 16:48:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GHi-00000008zRW-2njo
	for ath12k@lists.infradead.org;
	Fri, 10 Oct 2025 16:48:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFVD4G018532
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 16:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UQLk3w6GkzbTjYg8BRnJ/q
	Gfyc3WiUkLopNUoNxwb40=; b=DrGT3VFlgdhd9K3OcybKLdW6BRpq0+qcbchkUX
	gGvfC2mS3q0Fqc6cgHd90JSkFJ8o0PmFQ3uQau4EMIW6nJCBZDwqbHufMtQDCRFR
	Oh/GIb8bRCqO/6HAZJ2Rlla3SC0VArbN/C3NPDfGoGVQ3YTZBGyqZaMPjraiZ5L6
	T0NUdbPz8KcU08DXytl1av3BhZ/zDjya6XFXGyKYuSMxk+8XRu8V8zrHILhrk06U
	hQH0V52py846P99vdBEUNtqlP5DlrMPRxj0+VGdR+vtFWcKn9PlSMuXKWPH0Rmri
	c4P5rfzLhvV0pSq64EyFxn9faE9gMgSVtETK1WY9gTM6Okiw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m74ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 16:48:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e8112143fso57166755ad.2
        for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 09:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760114881; x=1760719681;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQLk3w6GkzbTjYg8BRnJ/qGfyc3WiUkLopNUoNxwb40=;
        b=ciQTVyEAsZRwxWT7myS/UTJ4z2tr2ikqNSDqWNARG7bAN/GBexobws9CxP5h+oV0Np
         pPHOyhSqyJAG4bUzGD/NCdc4w8WKXGGWGXq/0P4PxOtkGz75b4mDkfl5oYuXGo9v4k4r
         L7vtTyyOj1bimD+akpDiRYBrmPdvHv4YMR9YydpP2LRaRxy2m7F4YWPPRgQH1x9s/cKF
         dCiWZibVml3pelQLh0yJlwflrW2Hf4khNO25boh/1kQmFPD0yON7wiW/474URnZ0HR6k
         +adoDGyRwpsjRlpic87Iwa3sW0Dg/L54y18cHI8IsISfX5g5HT1Q3cf4PHYT0hqDhWqT
         aTaA==
X-Forwarded-Encrypted: i=1; AJvYcCUQD5UtpGumX+pMbINUih8ZYXePk8OspALxPXo3uLcLsuxB6DMgcNb/2z7TZnNQbhAE+c0Ck74=@lists.infradead.org
X-Gm-Message-State: AOJu0Yym7Pze4w2dHnh/1Ze4gIyzHs1XgXozREUF5V++KVRsTC5OhRQ0
	SgZJ+/Y43LW1AcRtyfvucIaY4naOX0XpZPSAkQKHfkwvs92lFu5afFnkzNR8qU8PxRx60ylfvaw
	/BT7ZqkbsydZnije7lV3AY6KHoS+JQo48Wbf8+Ddzn+5rC/rCJ0f5v+7GmP0Mgu45Lz37Yz52
X-Gm-Gg: ASbGncvc5B1Ea64uMKyp3TLz5ZtDgfJwgwi7oH22qHqv6ZGSb6NV7ChAgTVEY9g4pFl
	C3VGs7REtCdwPqeP4kt0Mx6ReLW3pwxzmWuEqHn+WXmEwmVEUYLF1CXOtUfvdgXRPmR/mW2XrHM
	HUyNioNyYjbT4AYM1PgeMTqxNIeeqrsN8HpEDLNwRunYLCp5J9NGL14pWa7Pz9wEZq+6tfWoZVb
	XEMqsXygFuoVzjr4D2DNBncSySs9jvbQWkM16EZrVRReHkxDdgVtlg+RsO/dwduyiuHnAcjKYdG
	zkvNqmLEcOoIHddgK3Um5bXlHufMpQmpMbN0BVRDhwlTpeLk1uJcWsmKmBJ8w0hjYaW4MjUSGa6
	K
X-Received: by 2002:a17:903:2343:b0:28e:7f50:5d80 with SMTP id d9443c01a7336-2902721336cmr169496575ad.7.1760114881096;
        Fri, 10 Oct 2025 09:48:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPCbDu/FieQ+1h3nbSJfYEKgWjo1fZ5p8ESMMN+g7cvnCdHW+SRo5D4/i2QdXk4gTd+gR+0w==
X-Received: by 2002:a17:903:2343:b0:28e:7f50:5d80 with SMTP id d9443c01a7336-2902721336cmr169496125ad.7.1760114880618;
        Fri, 10 Oct 2025 09:48:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc53sm61760885ad.46.2025.10.10.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:48:00 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 09:47:58 -0700
Subject: [PATCH ath-next] wifi: ath12k: Remove struct
 wmi_bcn_send_from_host_cmd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-ath12k-nuke-wmi_bcn_send_from_host_cmd-v1-1-6f1172b77848@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL046WgC/52PywrCMBBFf0WyNiWZvqgr/0MkpMnUhppEk7ZWS
 v/d0LUb3QxcLpxzZyURg8FIToeVBJxNNN6lwI8HonrpbkiNTpkAg5Iz1lA59hwG6qYB6csa0So
 nIjotuuCt6H0chbKaFjWrGtm0ICskCfYI2JllF11IYlCHy0iuqelNHH147wtmvve/ymZOOYW8z
 kuUMgcJZx9j9pzkXXlrs3R20wz/0SHRWXoIykp1qIsv9G3bPibN5rRLAQAA
X-Change-ID: 20251009-ath12k-nuke-wmi_bcn_send_from_host_cmd-47069a9b2a6e
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7xvKofahgRMa
 hAh4Z1esG3AgMrvKH0ZIy5FAWArQd5SW70UGVpAKtcAmtJvUHA8q6aLCx190EVfZyXAC/XgGxtn
 uKop4nMNglkgUnQ2WsP1b7sAJN4+9oKgDL6Z32QK4R9SjbXf2W0fk6XFvI6ElcIGi+fEoaDWOIz
 1/zrjlWcgF+RKT52ZHnb8+ZTI4TGWc2ndrBlA+Riim7USnh2pnUzdlsn/xePO7qPjZGmqq4NKeX
 +ODEEi8e6EhdRGir54Tthx8n1akkdk26OXbvaA8LQM7YYsNZkIKcL0lHnUWcZqK1z8J2Gg2qV1p
 CX80hNmN/tDb7xbEMGiL9Gla1gVGfUPdBt+NTI29V56iDJmTb53rFkHC++sbkcEr17E1yJCQKHL
 jaEYbxn6aemn1vXNJb7DLgzNpLOqPw==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e938c2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=kmflYwvQEMg1wVHhIzQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 2XmZDNRs6d2a3HiQJeIfqmo9hD4wuYmt
X-Proofpoint-ORIG-GUID: 2XmZDNRs6d2a3HiQJeIfqmo9hD4wuYmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_094802_713023_178972C6 
X-CRM114-Status: GOOD (  12.01  )
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

struct wmi_bcn_send_from_host_cmd is unused, so remove it.

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index a8c3190e8ad9..d9fd6a6b708d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_WMI_H
@@ -3609,20 +3609,6 @@ struct ath12k_wmi_scan_cancel_arg {
 	u32 pdev_id;
 };
 
-struct wmi_bcn_send_from_host_cmd {
-	__le32 tlv_header;
-	__le32 vdev_id;
-	__le32 data_len;
-	union {
-		__le32 frag_ptr;
-		__le32 frag_ptr_lo;
-	};
-	__le32 frame_ctrl;
-	__le32 dtim_flag;
-	__le32 bcn_antenna;
-	__le32 frag_ptr_hi;
-};
-
 #define WMI_CHAN_INFO_MODE		GENMASK(5, 0)
 #define WMI_CHAN_INFO_HT40_PLUS		BIT(6)
 #define WMI_CHAN_INFO_PASSIVE		BIT(7)

---
base-commit: de7674ee69a0023a2dd1c6f0cb66f3cbbba89923
change-id: 20251009-ath12k-nuke-wmi_bcn_send_from_host_cmd-47069a9b2a6e


