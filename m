Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C90C43458
	for <ath12k@archiver.kernel.org>; Sat,  4 Jul 2026 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sd4tDbffrjX8xEUiZAJ2XIY7OGUcvOCHExaGfoHg8G0=; b=rOUmhNT1qtFnUI5EjK8MzJzqQm
	rRuNoYrnNyujbZZZfX4qnNI40uD9GIfbHKGfIxW33Kg3iEKbLZkS32zNswllsPtAHMXnwG5FJLjEx
	W+1iZs/RQnza+LuHZQlKmJBYYMlsZgsjZaifT1SQxlLezag7et74P0b/fAHG2B5+nOUtv0mUwl11p
	pHh+cK/iMZSjI4QQxoaWlF73hK8N7QIbPDtoeAuGBNMrlPEwGWJemnmu08WPCnisIZvkdzfO3NOm1
	SKY21K7ZNui5ENZQr2N5+gQAt5bDVfZwRbR2tfyDeGzBCxDqcqTbSsjAfuuMY1KfadDM9Jaeb9+i0
	0jb1C3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfupI-00000008G03-1osV;
	Sat, 04 Jul 2026 07:30:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfupG-00000008FzW-0Rhv
	for ath12k@lists.infradead.org;
	Sat, 04 Jul 2026 07:30:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6646hmpb2281621
	for <ath12k@lists.infradead.org>; Sat, 4 Jul 2026 07:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sd4tDbffrjX8xEUiZAJ2XIY7OGUcvOCHExa
	GfoHg8G0=; b=MuSf2XYRb087TlmU/WqCcJ2eqakQtYPSeuTw85/9/CrLeq7JjFg
	y3+M4tFfAgiN38mdZ9HgNAif5IAnQgxQVEcDypC4zOGWML72tIO3wzKrXvjC+xsF
	H2nZNnWCLGEYHhg5qhOCdrz6kZEoEWiUkYTp6LjjMGQ/4yyesFmkrsJDdXjYTE0n
	Z7BqO5V8DhFGqeuppOnhIF6GrMBCiAop6fZzKcTjN7dFsCPN6LMc8Na+6WDzj9TJ
	SyZIV0AWJqUHEix0YYgdTK18EDrj2kTpig723doZF/0a61CqTH2HFxDn+SOEx91W
	OVjoUGz6y3ZXJaZDvMtsCrKrT2827dsp6Ug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgrph8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 04 Jul 2026 07:30:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so1075437a12.0
        for <ath12k@lists.infradead.org>; Sat, 04 Jul 2026 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783150208; x=1783755008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sd4tDbffrjX8xEUiZAJ2XIY7OGUcvOCHExaGfoHg8G0=;
        b=DPqe+opZf7+4H72cjaAfh/eg6gOJg/VJvCU9FC9ke4JFqp2ihgUGfgdP1wv6JgT9BH
         OZITT+Ng4P1sBD0owQ+Bzw8pSK57eCqLW+gqGAwmqRneAEjIELYuiFq5m42xpyF5RWeB
         sgrKM1vUnyL4zSbihfAjLY9JR9aA+emX1G9eVqrnU9GFPLysWhdWhcGQUmxfd4qskO+9
         HZSHyZ2ahazOX5q0FdJ4A3VkAI9edwnvlDww2stTzHyWaB60N7NCBB4xETY2CQnEBlOI
         fBKOgg1Iqn7XdTV64KtBZI1PY00Vd0YN4HONfMxUBGGe8FNJajDAdSqbssp1fyLRNWF8
         waaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150208; x=1783755008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sd4tDbffrjX8xEUiZAJ2XIY7OGUcvOCHExaGfoHg8G0=;
        b=jHp++kWs1LyWAF82s2eNnM+Q9w31edPQKXYm+p6yD6ebASWSYbh1H0bNdWI5QWeUIJ
         P2gSbK39hPUZDSQWUEqMf6hIAIpVm4TLUEgmsdVo7Pfpe9VzZ8h43fKQ4Uiy1myS07QS
         l1OTICuJ13r2Ou82z2D/yXfAXKMTqk4+vD57ITXOiE5Z7OBsHUaiaUWzy+3UqOnc2FX+
         HSN4IeOeX9bgZ13yHL3/Lf6IqLRCLn1Ome0WWRhvp6UvHSknQLU/TCV9K3DZOAG97n/G
         xBCdduWcYe0ufpwT6MNQd919CJJOh7teTLprcr4veMQTucHzdD5MKp3pwplPUekXSGqO
         TsZQ==
X-Gm-Message-State: AOJu0YzDrRER80kAmZbMxu/uWqTekBBwFe2aRyYBhTcnKghPg0U6jK3p
	1yJhMgmKlBjkL5+lc7/jzEdT4hvWVBJ9HUHvhAerZv4El8qpomJBZLARU9i4dAdzE4InSm9zR5Y
	IBtGUgCxo5JR/Iz+HQ3NPC0bNJIvf/TQSvx7ibv9fw4HN0MOhAnp44zI8hyDDaQy7
X-Gm-Gg: AfdE7cmXpczqgl7rzIPjwa/tHJA7sWW3Nr09WRdd1nGYB+LQzCMl2dy4MiyoMv3QE+n
	iGgu0umwWmjKiJ6PB7Hhi9d+rr/uJqHvCQQIKN0OZm8wleSDdtFU33XDMNCmoRS97uknIYV4I/2
	MNwJS3T2gwCgZ76I6zavr/Mus5ReDx8veDM7pLxfStquMdRq473NBaZ2lDqbRE0QYwNRKfpxt7P
	RO59m6MRRbwbEz6rF99HqCjL+g6kGnZL2nFBys1WsAbVDTYoAjKyWDKNMib6r18qfoCnurgbTUq
	jN9GwfSALioO46tZVU9rxJKQplGFd4ndn3B1gNsm0WGIoI1p7BxHgJOgGy1U4xJrn9TsUU8uM+K
	OpBUihTO9Lg+wyoVl/hfb0vR+AMpveqZu0t9q7kqBG1TrkhsquxS5OiabejtHXrgKrVeTNw==
X-Received: by 2002:a17:903:2f8a:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2cbb9f37e5amr21183745ad.47.1783150208317;
        Sat, 04 Jul 2026 00:30:08 -0700 (PDT)
X-Received: by 2002:a17:903:2f8a:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2cbb9f37e5amr21183285ad.47.1783150207772;
        Sat, 04 Jul 2026 00:30:07 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm20046425ad.3.2026.07.04.00.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:30:06 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: fix ML-STA authentication timeout on QCC2072
Date: Sat,  4 Jul 2026 15:30:00 +0800
Message-Id: <20260704073000.3300099-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a48b681 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=K4Y5m-lB56W0GsPaBK8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: NRkkUFjVL2_j1CiAhEciyOfJO0jmasAA
X-Proofpoint-GUID: NRkkUFjVL2_j1CiAhEciyOfJO0jmasAA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDA3MSBTYWx0ZWRfX6YYYL3yhdNq8
 maAufB43Z3bq6squ2tZV9Gj9jegvhNH93Mmw7RuxnxhPA42wIxnXZwzxJTpuwahVj9ZxzP3WuZv
 IbUM98iqS8n2QlgADFoDbZjKABivS5o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDA3MSBTYWx0ZWRfXzSKmdyFuszlR
 GKksy3n067/oPxB5hNO3sNB4bWAosMVRZr5+oZ6hf9Z9xPbUsk4wLVj5Fz63Nxh3mkhd2XWqpLU
 6ZFLdLHUMEJikGIM+ylveoNM/33Ui5tGXx4hNLLumbGl7VrGItJwZWblka1O/lG7Fhm9Ahs7QA0
 GxGkW2PK2B9ghs1MhIekgHocADj6l3YFHXBQHRlz1z/oOT6KtnlKGm6FP2EMEisVKETap5AjdqW
 huiJUdRm8orXgwFpY/KSFxoOuzaSKV07kP5u1f0HLSTzt2Hw3oQbBa4ZNZUZFpgxcm7ndZQa2w6
 USPELbrZsw8IDG66WfXLeFeSLI2BNVEvn0G1d4ymMs6pKrFAcJfOX+gPRJvvnxQSpKED66b7wlA
 KG/W1WCqvjw7me0FfrgLZjocS4jMRez234FvgMQyKGaf9bLm45afqfIP5uXEp+bHQqDIWNDz9Zp
 +tOrSAbW/o9VbluX02A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_003010_187295_F93DA4EA 
X-CRM114-Status: GOOD (  15.31  )
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

QCC2072 firmware interprets the MLO_LINK_ADD and MLO_START_AS_ACTIVE
flags to control the link state during MLO vdev start. MLO_LINK_ADD
indicates that a link is being added, while MLO_START_AS_ACTIVE specifies
that the link should become active during the start.

When an association link is added without setting MLO_START_AS_ACTIVE,
the firmware may transition the link into a suspended state. In this
case, authentication frames transmitted by the host can be dropped,
leading to repeated authentication retries and eventual timeout,
for example:
  wlp1s0: send auth to <AP> (try 1/3)
  wlp1s0: send auth to <AP> (try 2/3)
  wlp1s0: send auth to <AP> (try 3/3)
  wlp1s0: authentication with <AP> timed out

Avoid triggering this behavior by setting the MLO_START_AS_ACTIVE flag
when MLO_ASSOC_LINK is set, which tells the firmware that the current
vdev must not enter suspend mode

Note that this change relies on firmware behavior observed on the QCC2072
platform. The firmware on WCN7850 and QCN9274 does not use the
MLO_START_AS_ACTIVE flag, so this change is effectively a no-op on those
platforms

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: d8e1f4a19310 ("wifi: ath12k: enable QCC2072 support")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 ++
 drivers/net/wireless/ath/ath12k/wmi.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ad739bffcf88..800fa753021b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -1229,6 +1229,8 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
 						    ATH12K_WMI_FLAG_MLO_MCAST_VDEV) |
 				   le32_encode_bits(arg->ml.link_add,
 						    ATH12K_WMI_FLAG_MLO_LINK_ADD) |
+				   le32_encode_bits(arg->ml.assoc_link,
+						    ATH12K_WMI_FLAG_MLO_START_AS_ACTIVE) |
 				   cpu_to_le32(ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID);
 
 		ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 51f3426e1fcd..20e3939e8820 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2954,6 +2954,7 @@ struct wmi_vdev_create_mlo_params {
 #define ATH12K_WMI_FLAG_MLO_EMLSR_SUPPORT		BIT(6)
 #define ATH12K_WMI_FLAG_MLO_FORCED_INACTIVE		BIT(7)
 #define ATH12K_WMI_FLAG_MLO_LINK_ADD			BIT(8)
+#define ATH12K_WMI_FLAG_MLO_START_AS_ACTIVE		BIT(17)
 #define ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID		BIT(18)
 #define ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER	BIT(19)
 

base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
-- 
2.34.1


