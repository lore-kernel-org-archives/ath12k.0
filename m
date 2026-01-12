Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015CFD25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=; b=FmcMgLmE2jv3AVXtrnXABuSUHp
	1F0yiPRDmtYhCBSbDmENRc5dGA8YfM3GUzh2mzzO3lKWGnK5kzCnuucmUGjKuKol/rGvMITXicREf
	29zBUkAtfzcQXd+C8urX8FBC0Tp5j8zMjbA1J/np7BsJWo1cqYK5GPHyPT3OiEPsJnI79qO5p8na4
	Pv7/w/6RC2IO1Vphnuw9pmTmc4a7tOgSkXfrvtrzF7Po6n05Hhoi1vbqs62lV4jivsL5oDBGUH9zx
	6hRmi+8L9pKXRN1UULqutcdkI579LcwPF1I17kZ9b9YDf4wSMuGovP2++2rxykGRfCo86k4kRFE1M
	5l2e16Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUE-00000004tVD-2vAs;
	Mon, 12 Jan 2026 07:37:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUB-00000004tQx-0omh
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7OjBc555467
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=; b=lBISCZY04BppSsaV
	mYDaaKPsr/zUVLXGmqzOzRwE7EJcj9xhlgA/847AVuN8JupeehWI7X+eD5aQa5x6
	iOR+mz4u22sAaTCfa0EGBsOETqhKOIq55LUxXehIlfekXy9baX7V61J0YvwW1RLd
	khNvOG6jL6v4WdwJPzJfdPp7YKCfc4cI4BZYdxkCVhy+XNh6XFWBF+XlsyATgB+h
	sNOe9pyY+xUVue4NAF/gVwegi9UQxUTrbwkLSD/TiHuk/D1fnAdWNxHZaab7tRpm
	yQ5q13QjmPtaiA7VYL1I3Qzdp+fPoF2Mfw/VvowUXw/ni5qyZ4ZdGGLtHwd9D7I9
	67dYmg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw015b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c37b8dc4fso11559570a91.2
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203430; x=1768808230; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=;
        b=NQ7kDAqtrpNiSGMmoI/NOfc4c9ZYDc8fb+b1b/6dB7W+ceTGIRLO71BLkxii4QgVxo
         T5odtibv1ql3J7nPEN/iwz4pNSFPgqIrQd4wzFOxncALZLihngyr1ff699rVF+rqGmsB
         UfKFmXLbPFOHr8eibGq2b6NMVgd6HMAx/Qis33Pqlmq0CmZorhuGgDyG606Nel2hGB6/
         yZZ6eZuhrTRHrkxRqHGCHRU28MD77KIcQBuSJ9buDVrzI1bco1K876c5OZHdQsdfp9hT
         KTBKtBIdgQ/7+/xHiSZ/R76CEwBCsyxWE6AD+XEiO8U6LNhjJA8+UbazCrFbWDjdf12o
         rWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203430; x=1768808230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JmwHcVmezRhrnG8yMV9bsbnLk3k9piD14PfETaftqNE=;
        b=NZwSzKBbQ96EtFLmc4/lklnQXGw8iAW/Lxk/H3SFKhwIx80mDhSX0nB64NBAirWugL
         fCtd8E0FKwbqO6clcgDYpTfj2X0i4jVvPV7SOnmoD0Kmc82ZB1mDmhmS/zPRf/CN3HNR
         98o3btYONcX8Eux9dJ8N7SXNUUCtBVaKachfNRJoW05LosxMLxy0GEdGH5kLCe87Qfp3
         93pjLmc70/EVV/gJMGyWfSKx/h688K612EUVkyvaPGLO6v/QfOCJLwJ+GVBHp+y2SLC2
         m9H8wrUTvapAwtN408aZr6uW5HwF6uV1p+lK5E0Ub4qTFPk7Vp2HEe9q0lVytO4dyKwJ
         q7ag==
X-Forwarded-Encrypted: i=1; AJvYcCU+4ng6DDYzRCYr4WIxa9I19V4qPtsLTw9+0wVGbzlqf2Sr1T0o4UQeoll6sAZHFKqozem24pU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmu7oLJS/jBYZyI27+CiMto+VAi3bk3ohGfpzHwmP7hA2z/OjW
	VrrHwDcdI4Lv8ULrQa2x/Ic3MIgZGLXx9bofXSvEXNsfxywE4ImsSqWnUViOjNDhoTbJ8peWDPd
	KE7EHSOScFLNoAfQdqHN63jjUtVA+MOHYwBrY++XTqbMTCkQuIZ4YH1RH0yI7RfPhFYtxurjSNX
	E=
X-Gm-Gg: AY/fxX657p/PIHeczmiLKK/V6OF5D80RG34wBQ3UCNvfciwdCIin0mzcRBBzRcVKZ+i
	wug+kFDkT3Wlyu2XX+5Zfs/2F1nKCxKIPdjH3VWjXW7ffVp5SEP9MOIdDKBxcLncNyGfeWzXOw5
	/H7ovB8f49vOTG1OBxBqw/6Z0Gkyot3lSxpfp/Z8g8QNkHLSuWbsUEknEtzcxuhlQHORB+4h6mf
	5v2n9QGJzDLufLtSiZjVOl6B/n7MfKgr2LOt/yf3d0aUQBqfXGIQ7/J1zGvopJLzK2QaBHkisLC
	PjT++ebmTMYp//bzDHlnlwx2WwZvWrjLM+eLsCLdNR6CM7DAOGs30kw5fihLfSJ2gAu7Zn2eyGN
	Y5YYHDOrU13u7j7zJ86Wf4oG4aJX1Lv5lRpnogrhxym4Cqa9Y9H9uXfBLI6taCiU=
X-Received: by 2002:a17:90a:fd0a:b0:34c:904a:d92 with SMTP id 98e67ed59e1d1-34f68d2314emr12688875a91.26.1768203429995;
        Sun, 11 Jan 2026 23:37:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5v59lQXUpgvcDxJQ7s0ilXzqeKdq6qxgtRAAvId3y1WNdyF264oT5Lybh58EhD5UBTpVnUQ==
X-Received: by 2002:a17:90a:fd0a:b0:34c:904a:d92 with SMTP id 98e67ed59e1d1-34f68d2314emr12688854a91.26.1768203429506;
        Sun, 11 Jan 2026 23:37:09 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:09 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:29 +0800
Subject: [PATCH ath-next v2 09/18] wifi: ath12k: support LPASS_SHARED
 target memory type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-9-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX6sVRVVBYnnJh
 csmWHZsAaUj/lT1L5xJgtd38aq8gbbZuiAf21guK32GsUrPGoMDRE2XbOgGA2vB8G+0eVTLzK0B
 bFLPU3ogevEH2TM6xaChWFQO2jWz0NpTXgXI23QlAI/YNuwZrl9anI8oN4kuIfowepu1JFsZ0HV
 ZHT0QAR3yDdRKngZJmCD0wObfZdERwqmQ7yvwzVkNVUOjAb7jq22aSrT97dClkZBMN3zwrKfS1e
 9/zR3l5Gp7byCxtyAs1DtCaQLmTdmAyeEqp0DiSegzvFQ60lMqPKOMFzmANRrsEbt0QEaZkeU4E
 6hKQLb0IUE6WOs2WtB2w0Q1+x4yIxFYYdRhjenbuxdHX07Or68Jys8txN3+akuvcUxAfLT/uQw3
 c822MSiNRNcGX5NB19ZR8ayn8CkO8ke3RETWxUsDIgwD02ijx3510H2Uk2ZBx8MwE0Ykm3KnzF0
 qQipN3MKyyqWN3Lc+IQ==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964a4a6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aY7nMJUTrloBAr6TJikA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 99ZbYaiJpGEX4K08Zukh-OqXQz1Js_vY
X-Proofpoint-ORIG-GUID: 99ZbYaiJpGEX4K08Zukh-OqXQz1Js_vY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233711_247627_55C9C2C1 
X-CRM114-Status: GOOD (  11.48  )
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

QCC2072 requires a new type of QMI target memory named LPASS_SHARED_V01,
add support for it.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 1 +
 drivers/net/wireless/ath/ath12k/qmi.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index b7c48b6706df..4966697f4e62 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2609,6 +2609,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 		case M3_DUMP_REGION_TYPE:
 		case PAGEABLE_MEM_REGION_TYPE:
 		case CALDB_MEM_REGION_TYPE:
+		case LPASS_SHARED_V01_REGION_TYPE:
 			ret = ath12k_qmi_alloc_chunk(ab, chunk);
 			if (ret)
 				goto err;
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 7a88268aa1e9..050dcaca1cb7 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -178,6 +178,7 @@ enum ath12k_qmi_target_mem {
 	CALDB_MEM_REGION_TYPE = 0x4,
 	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
 	PAGEABLE_MEM_REGION_TYPE = 0x9,
+	LPASS_SHARED_V01_REGION_TYPE = 0xb,
 };
 
 enum qmi_wlanfw_host_build_type {

-- 
2.25.1


