Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF3FF60C8
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 04:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jRrcy+J6cPpHqZ3Vyyipw5B80AzMdJH3CJVClohJ1z0=; b=Kf4NJ4nYg6I4xonUEnaKL/sGWI
	bvjyYRnyhX3h/HZV9RhgM0GiUBmZrAzY6e7n4NuGarVeViKHgJ82cckSXkzdsclv4kSeYdO4uArTZ
	ilyGZOtFbfbvvt0yErSI0w9SHwGteC0I8AkK2crVru+qGLeaZnWsO/euKHIvMlhzNU+M+vduVb0kW
	Muhd4h/6YI7jOPeprhEm1rxyOyt+0biAGbgPGn+xDi+NE1l3h7ZdYiWa8PcTx6Rp2HiUFAvYAh2Kf
	H0aC7yu0Om4s6/OT2vwPh/g3oI+9eoZY665i8vxZgq/kdm8Y0cxAMnz0gsmvWqUx6d8W3SaPahb7C
	lbwnwlXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RBj-0000000CI6f-3nu9;
	Tue, 31 Mar 2026 04:58:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7RBh-0000000CI6F-2mmi
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 04:58:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UL4Gsh1842632
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 04:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jRrcy+J6cPpHqZ3Vyyipw5B80AzMdJH3CJV
	ClohJ1z0=; b=WHcBOVFDtwVVTfH8uvblUxUD9jW95iyqTsDjFJYPPThRuQpBiz3
	cBehW6FJw0xZlBVwZMAfRTt3MN5qhHGQew6ZwVyhOmMt5t+EdehbLob6c7RloJq8
	hgvX79GeV1rr5EPaBDUVm8vkSkzbqmfcGmGVBJFsivdkqdcphYrzfrxcMI8/oqju
	q8oHn81sv/FpV+J/WV+AOGfNYNIkGOiGHy25ArviwvfTH9vnEsvNuZL9umeH6NHo
	RtrDwOZPWB1FJoD7rRsbfnu+yvJdwDV+mEuKjaQszzocI36RXgV8bTHVltZydiGr
	+rcDepP6XvQ0P4wE74rIQTNWOd76g7BzWAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsh9vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 04:58:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b7ed8964so4871682b3a.2
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 21:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774933127; x=1775537927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRrcy+J6cPpHqZ3Vyyipw5B80AzMdJH3CJVClohJ1z0=;
        b=j85Mdrq9IcUH8sXH6Uxu/UF41kory+6ecK99BfaBcLcqPSUNWG2hfGGMC0vOCPpy9R
         qnimLYiyKCIvYMNmbFLpP8PZ9TTdmAmRYV4bZTDVxHoJC8mZqpkonv1WCIg1C0n+0x1V
         O6M9zPtu3DeKJXGF7xhZ3HWPIwK/iXpSZIjQt88LB9zKlRdL1t8JcW7sSv10H50eMNod
         z8Sd+FH0czVlDt3z5pAEfMX1DdCKaIA7EK31s1yfSvvUwyegOF1AI/7A3u/uOUi7M5i5
         aUKIWeEf/HqrGmCNaUMhp+1xnNtiOq0fiyRseU8pA3JU5bRhkbTEfkEtDHB+CUIbysJT
         t+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933127; x=1775537927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRrcy+J6cPpHqZ3Vyyipw5B80AzMdJH3CJVClohJ1z0=;
        b=ZWp1QPIeiCPP5O18U+mFjg7if1XTMafr78bMHsfEybn/JPUlQW53nbVIUO3N4SojRx
         jQySSctghLburEprd5K5+dSVGFc+Z9CzgqQ7MvvlDM9FI6BeUz2D5s1AZBLtFI/CwOB7
         f8mkXwTqLDPJNsNQgeBdJXG8k6BOQrASb6IYkmE559IH0lFLUnEAesDJAEWiy/HNp9RG
         DB/mpHvyShMEYQeDoPU72LlPDziSLYiylttQwlplTLeW2TKGqcwgH3w2qjkLJFGr/y8E
         LAeF12Kfl2T0Xe1GwrvYDQMhvwNSnDzrIGKJozzSVQr+rwdmlH21HtJicN7SpFcIHCry
         DVcQ==
X-Gm-Message-State: AOJu0YzMsTVHZ+czss1DqXt2+CqGRNPaQhRYI4Wb1S+d1DByVAxZVgZT
	NnH9Itd3vEryA5W4hNGHYXy8IDHYbsK7q8VQyRCD+uyTIdHfTte3BdzNaCrW5jmelimGWSJCfi4
	Q5gIZ7FuNI5npErCZX3EYAR/UDRcXYPr3QO593GkyKEZnvim7j2e8tp/OUwv5JlVmbUedArWZ
X-Gm-Gg: ATEYQzzYW904xuIFJ8Y128ciHKpj18LQx1z+JvY1mdyqVG7sS6wgWkDet2A0gJl0II9
	pRo0Gp/q9TR4XggtcxPg5kAFA2XVzQ4itf9Pmaa9PSrq4vwZv03j3jRKuJ9vZfCKs0XRb1hDCH2
	Gpglv69WKuqaWLxdRUhpo4qidU1GEPwYNp9SRdJ5Ixjklp0//iCjUlu/Vvj/Ide2oo9u6/YPTuS
	UszZzH6XFmnVkumtwdGUdBXNi7EMGkggShRPYPMj251903I2jc2iP7eq7sOLbZUQHmSuUVDuvhk
	n8YbbJGVUFJzQDGBuuP5IbZleva4vb3cC09ti9ALLnDaL7tJxjGli03Pck6yhbNHoTwvvOtiHeZ
	15y7iFoP59qH1Lhtm8hSvb7CF+iknFi8HU9q1sM6eWc/hCo6zwBkB1KNDw5S+O76xXaSGQ+O4rQ
	RVKpjQvmDfsXyqSiCaBJOO5iJviMT/g1GpsbtIfj3x+4rrD3EL
X-Received: by 2002:a05:6a00:94ed:b0:82c:24a6:2e41 with SMTP id d2e1a72fcca58-82c95eba78emr15039967b3a.21.1774933127086;
        Mon, 30 Mar 2026 21:58:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:94ed:b0:82c:24a6:2e41 with SMTP id d2e1a72fcca58-82c95eba78emr15039941b3a.21.1774933126501;
        Mon, 30 Mar 2026 21:58:46 -0700 (PDT)
Received: from hu-rdevanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8625269sm10437635b3a.53.2026.03.30.21.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:58:46 -0700 (PDT)
From: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Rename hw_link_id to radio_idx in ath12k_ah_to_ar()
Date: Tue, 31 Mar 2026 10:28:34 +0530
Message-Id: <20260331045834.1181924-1-roopni.devanathan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LuVOUGDaE4P23VwMyXKjVycnG4ENWqKq
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb5488 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=s4PFe5N8Pvec04coFb0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: LuVOUGDaE4P23VwMyXKjVycnG4ENWqKq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0NSBTYWx0ZWRfX9CXfJ2a0bvLp
 UbRWbtChkauu86BfcyVGLqxY9TkYIMLIIaoUzny1c5OjcaPfOwQFTm4XOCsyYbdPyML6OW0xqDK
 GkMLHdcPxLkTNqIL5ffkZ3/xoWdQrv0pE9eXdXmGIbkfuHk2dex2YkRkOqjWqCYDT3sPNSpitYS
 njNnIN87mb5wqjmrv9S1JImxYXpBygVLnK4VHrCSQ0sy0ANOnn0q6cIvuMMQLL9zvBwANacgRMW
 5MgCrjyg4rq3Fbu/W2pRhV2m1Qdza83mHMcsMOt5jCuf6CmqRtyveC8RMwESQwZ9jAmRZoIk8T2
 KmzCkiEHIu9e9EJ26hB9G9PI6Frjex3+fKbVEZ/0BHqgVGqSuJ/UGPrDmaOfRM/IGvnAKA3xDBD
 vh/GIY0VFfENpsrZtJ6O+WZK9bdtTkxqDfxX2TPfyU+AHxuH6AQ6C3oTh1EXXdlShsBsgkGi6Su
 tM3UC3WYd9u6XR2DiKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_215849_821719_C0BDBE01 
X-CRM114-Status: GOOD (  13.58  )
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

ath12k_ah_to_ar() is returning radio from the given hardware based on the
radio index passed. But, the variable that radio index is received at is
wrongly named 'hw_link_id', which points to the hardware link index that
comes from the firmware. This affects readability.

Resolve this by renaming 'hw_link_id' to 'radio_idx'.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 59c193b24764..5eff86827e9c 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1366,13 +1366,13 @@ static inline struct ath12k_hw *ath12k_hw_to_ah(struct ieee80211_hw  *hw)
 	return hw->priv;
 }
 
-static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 hw_link_id)
+static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 radio_idx)
 {
-	if (WARN(hw_link_id >= ah->num_radio,
-		 "bad hw link id %d, so switch to default link\n", hw_link_id))
-		hw_link_id = 0;
+	if (WARN(radio_idx >= ah->num_radio,
+		 "bad radio index %d, use default radio\n", radio_idx))
+		radio_idx = 0;
 
-	return &ah->radio[hw_link_id];
+	return &ah->radio[radio_idx];
 }
 
 static inline struct ath12k_hw *ath12k_ar_to_ah(struct ath12k *ar)

base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
-- 
2.43.0


