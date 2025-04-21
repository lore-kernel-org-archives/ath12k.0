Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D1C369D5
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yfl978/6DVAzdrvKcsOLE0Dq28H4fccwkP87PFt/Ov4=; b=djen4PQNN94i4/41wd5r7xE+XS
	44GzAV9AoY+135uJAET1fz0knnsPF7IEP3f29JGtGxyWlgbDAa1+PPF0a55UjCTD+a9vtA2eV4o/o
	+3aXpBcCiv4mgR8ZpRKm8P9x1Wa45M/giZwOS+j2ZiPAGRdKjhvAbK3AeS5PEfhGkr6qP9h3nbwFC
	OmFONQnKcmG9ysMFFz6ZoValbrVknYMwk5WBEPW9P9W6XOn5q1ZMEZSSyCod05+YrpT0qIxOJaAPS
	b7y0UUMl4DpodaGp+8tLRYsBgbymLjZ+meYX+SQyM9trxw66X06HkXwcjPTK1c2B1CNO9D422TF4J
	Rxub3Clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0T-00000003S8c-2Uqd;
	Mon, 21 Apr 2025 02:35:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0Q-00000003S5u-1tRV
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L0EKwD030287
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yfl978/6DVA
	zdrvKcsOLE0Dq28H4fccwkP87PFt/Ov4=; b=EvDEmt6oUkzko+S1fMV3gzZktTX
	a3AwTarE3VioM6083GmPUVafCqzJ8njkBrR1qpVn80GzI2rtJ+DQXM8pjbcNkPud
	f+POAiwAZB7Lq51Mx7JfzlxzX0/lOKPVofdhiMGFzx/qzZavh1qoVLapTP4315xd
	jbv18FnTWw8h9UE8XpAQf1XdMwsD0tbXPwzQFcKLJEgL7Yfwd2duVuy7Lf7+/Kg5
	bGpcmJ4yVOMhL0MMUkJvWeny+Inakh0yzt9+IOmU8bBehv9ZdK+w+e9L8nHpnxYq
	9QxP1aKVMnZc93a6KEUd+MOyg2uP1cHCT46ekRxVYRY7KduL9Nc/JiJNatA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qtxuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so2446648a91.3
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202932; x=1745807732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yfl978/6DVAzdrvKcsOLE0Dq28H4fccwkP87PFt/Ov4=;
        b=lyEP+NMQ5JwsQQD2Aj7H14/EuYJTzDxxYQINMzX1C5AT2Ayv3zK13DES+D4k6zE6Bs
         EANK7JKJJXlp0UlGOXrNWB580evZEAR0JjNWUFhQlzj5QXOP4J7Mi24ndCtWoQV9r5s+
         vGB+E3sSAYK+4PfLgxXahuQB2rhIkBX8kzbTPaKC4R0H2nEEGRSMTvnPVxnxFHZzXaCz
         fntCmdJixRrcvWVVcEc2wt2qJV21ZvQntbqEXS8TSDH3U87JyJB00bxK1w8W/N9BNxff
         RGfn93ghmHPYXo+iW5KTAwaKvEA84i1Qx6GNRNawXqWciUrx0RMT6CXFGG9Ip99knU8C
         z1ww==
X-Gm-Message-State: AOJu0Yy/zCFXobOLG4x8U5Arccx4eTmiwr/o2yR/uOygThMpvzqv6QG/
	38lZ/K+P6LAydKY4Si4Wi4BxphYO5/TOZMOSIF+SszEdG+Q6yWE8D3cPECMWi/1BzwbuDHMmweq
	24OYqfxreO50vVlBnnjxtVdhpdFqklRj6Tal1fXIpLvEmAXYRd2UnCesmQo3xD6sh7yZzZn8=
X-Gm-Gg: ASbGnctLo2WmKb6Rk+227iACaurdRzsHmb503pEwRVcdcO1PRJCt6syC8MES9c5KXDu
	ZrXp5MlYLLWXC2BRBpqE0V6m65s0MIazqSDGWBAbmnQieQTTklzkr9Dvynr41ONOS23Fu0dYaog
	7ckmqTEcgu7xL2rgjQChMdKf2AMRuxjokkOsR8wWM58Bov8FMMYkITUWJn+3MVtskpnfakb2yrE
	A/U+SBGTb0dO2dfjgibyJYQ5gpniU/+j5g58mKOhNHHJbAV1Tf4+J7awjjfALmX+NnxJwHJ6cYE
	c3O2Bg5m7EXMTWPCW4OqS4aR6Sl7hHehK+YKxA1x1u9HLdhNOtA0hPe7umuqd0EWJU2zEr7EDT9
	tcb7zqGkSzTQ=
X-Received: by 2002:a17:90a:fc44:b0:2ff:5a9d:9390 with SMTP id 98e67ed59e1d1-3087bb4763bmr14940765a91.8.1745202932103;
        Sun, 20 Apr 2025 19:35:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJWr31nrrw0P6zwG32PyGdkDtAxQr1SHu7NB4egaaypIx3/fAo+01+CCetoDxkqeJo7ekzaA==
X-Received: by 2002:a17:90a:fc44:b0:2ff:5a9d:9390 with SMTP id 98e67ed59e1d1-3087bb4763bmr14940748a91.8.1745202931688;
        Sun, 20 Apr 2025 19:35:31 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:31 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 08/13] wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
Date: Mon, 21 Apr 2025 10:34:39 +0800
Message-Id: <20250421023444.1778-9-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6805aef5 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=kP4Qih6RMaO1GLBjTmAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Y5O1gj07aFQler2fkMewhrCA_q_BDL-a
X-Proofpoint-ORIG-GUID: Y5O1gj07aFQler2fkMewhrCA_q_BDL-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=847 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193534_611343_B6D91422 
X-CRM114-Status: GOOD (  12.10  )
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

Currently, HAL_RX_MSDU_PKT_LENGTH_GET uses u32_get_bits to obtain the
MSDU length from the MSDU description.

This is not right. Because all halphy descriptions are little endian.

So use le32_get_bits for HAL_RX_MSDU_PKT_LENGTH_GET.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hal_desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 49eededbfa9d..c7a8b26d38a7 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -707,7 +707,7 @@ enum hal_rx_msdu_desc_reo_dest_ind {
 #define RX_MSDU_DESC_INFO0_DECAP_FORMAT		GENMASK(30, 29)
 
 #define HAL_RX_MSDU_PKT_LENGTH_GET(val)		\
-	(u32_get_bits((val), RX_MSDU_DESC_INFO0_MSDU_LENGTH))
+	(le32_get_bits((val), RX_MSDU_DESC_INFO0_MSDU_LENGTH))
 
 struct rx_msdu_desc {
 	__le32 info0;
-- 
2.34.1


