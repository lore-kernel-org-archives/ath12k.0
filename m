Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A08CD3427
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5bPePzNucDjdPMychNM1WStY4oN0F7dq2lKTbjPXGpQ=; b=yWe43nvidiU2TkJNgdUqRBNaSu
	1MOK8s6eOUQhA92vsnqTgJyqRoW/QyZjYySMi3sK11NsN4f5l5EHTFkHTknN/QWijEVnwHIrZl6/O
	8B8q9avuAAAythzrgdTsmm4yBn7/x/rhZvKRR/VH0vOG5eEKEIDXsKEGRhXLsMpCAAGuhrjy6kkFs
	qOdQBjeKBi7av7+IVTzv5jeC2XY8k9WFkqgQ6IIV1ek/PF+9VU5pj0EiWN4UDzyYLMp5FcYUd14wG
	2GpD5ZentduNp7A5JLZ2Y0nJuxxTf1IM2AQkh4RvwEu5UsgCn5PG2nuKPzGb15DdQkXkFnvopXaFs
	WUdDAd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGvP-0000000GXHP-3o4z;
	Tue, 05 May 2026 14:39:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGvM-0000000GXGl-2Edc
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 14:39:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VTaO2859227
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 14:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5bPePzNucDjdPMychNM1WStY4oN0F7dq2lK
	TbjPXGpQ=; b=VkJxyHVHahpwW7RsyfD231UhPTzJ+FRXfqvRTfOn7wse0GlkB/D
	xxsPlTXSixaLSEMoJKS/yh7fnzoNvsJyuS8JCAolANLKCH34/eUXgv9Ld8YQoJO1
	3VVJTPbgt4I50u8vc6np03NRdc6Kl58m5GpUTht3CouiGwP5uVPjNoRT9W7S/tUK
	bIhBukoptMk9QbHlcu6h6oRnFqm3qhAJ55FwauBr9onRND0m50Hdd/g4+Xshaed4
	4/j/NKoPWYmK5LgTH6oD0N1GqE0aD16+PAIPO6rnek5LgjaGl6BVfGTPElddvxzD
	xPyfmI+Yio8T2K9jBkfjD89M0A3gcQvyTWQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ah7xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 14:38:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so12548701a91.1
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777991938; x=1778596738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bPePzNucDjdPMychNM1WStY4oN0F7dq2lKTbjPXGpQ=;
        b=GCm0nWXrcHroAHf1t1qMsPwYgfy4KYcrRGVN6gty2d4+/OmfoafEKwwbh+McamYOpe
         1sANvGvORRdHLIgW+b3EoQzlYTT0yKiqPnKjstb2tUP4y3QKFr/JXau+J4+rCUMUVkPw
         cTqQCibVGcJ1qeBWAgUDYXeG8WV4J9YnKUDT8+vVbx6+FAKVubQ60PVMgOmnqtO8bddQ
         mp6gjOYbTjUriTm2II/xLK4B+dAfO68+xzVCegvqXZiVLTnNoMXWb2cYTtI18pbMT2DO
         iu0rZjsHhsyELyP980kEULOYLo3b+eiTeTKk0DIgwidTT8GRckl7bcnhIoAGfVmwCFSQ
         HFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991938; x=1778596738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bPePzNucDjdPMychNM1WStY4oN0F7dq2lKTbjPXGpQ=;
        b=ipZmVOWsFZ3wjnvk8AStHO160gdBK8ohvC+IUCNvSvFbB2lsDNtEuzcwIXpWolA9oR
         q0167ST12x+pls0E2azNGxuRVxBMMvk7fb/KjKO/E6EQfWOU7ge15aJL1Qwu1RWE+Ffz
         spi75OfnOGtlfMEiekURvN8Sm5a8nqhJZbf9RYm6+UaQL8xDLIpb8gdvp7kzHIWGykVu
         ppZMr5JD/UgTnuG+Le9RKosBHAKfhfLK6g4alNgiuHwnA1nUsVB7y0JGYpe0Z/WV+Y3I
         zuo63CIa2CCEXFf0IcokDGoW6/jO05enc/O+XYF8qMHeY6L47rZbl/5R/qkWbtHhxs8W
         Sq2A==
X-Gm-Message-State: AOJu0Ywi6QvitnpKqkPwwE0iX5EtRKbSo4Mw2SbY+5E5PunPVenY2STW
	pWDwhpdnk1doX66k2cIIa8GfjOgn+lTvxVFJgoBR6acU8Hv+3Vbj17iuEqqiPSKwPrlKHm77bjY
	kY6LlMH0a9/cx+16uAGoZJnrI7XjBSiCNh/LWhL2KA/lU7y8naDJQqDoxYIOW4K/SdvSE3x+a
X-Gm-Gg: AeBDieuy4sKP4jZBxeoMmnq1H/FdRmo46gvN1wriNxrEtBBSyw/XJfvu2G2mal2R6+Y
	JPNGknmH9VhGWYeBMr4q4IblOELHBZa+vyYC7BJo3JuYYYVBr/9190B8Lfchha6WtjjzmcNMsi7
	KuedZND7J4DT7izzhxCsWDYIfX9AFGDGKLM35acxa3RHQWn/IwQpTwEkd28MuNUdGaDjuVKu2v9
	rViXOsYigJSM84z0CPwIum2cZJ9ID11nf9tiOStiBuV+bRdJ+/XNEKBK/tFIpgAx7S9ch8hIqAc
	C466AZC04WYpgqRWVnl7TKhctw8Tp/E8j1RNUN63HvkbgnkgKRyvgWUwmtVY2CLZn7k8npsYtJW
	eNUFOvrTDAj22YXjfP2FOuEJhg4NU/+/IaknSUabDamZ+E/5iwUZhm3WCBTomo4rOurY51RJCtr
	N6upGQDHAdF6fBpoZ00HPrsu0K16Tlru4TENwlP26fxvq9tg==
X-Received: by 2002:a17:90b:3b4f:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-3650cdbaa39mr14417116a91.7.1777991937412;
        Tue, 05 May 2026 07:38:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4f:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-3650cdbaa39mr14417081a91.7.1777991936845;
        Tue, 05 May 2026 07:38:56 -0700 (PDT)
Received: from hu-amitajit-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36578259e7fsm2831030a91.2.2026.05.05.07.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:38:56 -0700 (PDT)
From: Amith A <amith.a@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, amith.a@oss.qualcomm.com
Subject: [PATCH ath-next 0/2] wifi: ath12k: Add support for handling incumbent signal interference in 6 GHz 
Date: Tue,  5 May 2026 20:08:51 +0530
Message-Id: <20260505143853.295368-1-amith.a@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE0MCBTYWx0ZWRfX1FyhWpJsQm3r
 x7wxLLY4D1vfDw7yHCksRRnHUhV8Jm3Nt+Ns8Z3WBhann6Nh1459GO2ns7jmbCkqZk2/UF1RCWu
 rLVVh87ZBoxGEdqulntiTCY31zxK0c1VJ5hQN3FYwXL5WMdD0R9jUX7aCzsqcXU8pYNP/hts3eC
 LWHV63mSVT+59AuzmavGOIy/9YJUURi9Gp+U3imyA/KsGQ6O+z7ooQ0ghP+hw/ifZKFGx22INyV
 dOZ4BwUcO0Am3edy6+ccnRgdbzz2Hijn74LP7hd+5+0UTneOSo+FaM4itp2hUc2CIp4UW/303tn
 ob13FmiLfdDDTDDQeaXTcWHVTboHiYbwZ4e4UPYvbHgRsLlFLd0egN0raNZdJVvmpZmGXIAp4+c
 /y+oUVOpnSEaEheP45XgSf+4oUy7lArY97hOdKXVy5rSks7RLK5qyaPmgtscDEO+1he/zwrusKB
 W+tKMIitP9bhC8LknJg==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69fa0102 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Qv-E1znO2Y0tXsqnBgEA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: k9J8Xac9vrCrHaHg41gwaE-igcCzd6Ez
X-Proofpoint-ORIG-GUID: k9J8Xac9vrCrHaHg41gwaE-igcCzd6Ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_073900_688759_9FCAB88E 
X-CRM114-Status: GOOD (  12.34  )
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

This patch series adds the implementation of handling of interferences
due to incumbent signals in 6 GHz channels. When an interference is
detected, the firmware indicates it to the host using the
WMI_DCS_INTERFERENCE_EVENT.

The driver is expected to parse the new WMI event to retrieve the
interference information, validate the interference detected channel and
bitmap, and indicate the interference to mac80211, which then notifies
this interference to the userspace.

Aishwarya R (2):
  wifi: ath12k: Add support for handling incumbent signal interference
    in 6 GHz
  wifi: ath12k: Add debugfs support to simulate incumbent signal
    interference

 drivers/net/wireless/ath/ath12k/core.h    |   8 +
 drivers/net/wireless/ath/ath12k/debugfs.c |  46 +++
 drivers/net/wireless/ath/ath12k/mac.c     |  46 +++
 drivers/net/wireless/ath/ath12k/wmi.c     | 418 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  72 +++-
 5 files changed, 589 insertions(+), 1 deletion(-)


base-commit: e12d2d3983acb150fd987d19ec6a2a530da110df
-- 
2.34.1


