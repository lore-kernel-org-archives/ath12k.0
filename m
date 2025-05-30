Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDB1C5AD49
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pMgpQ5I/JuIl38FrXwUCHv0ZOaXjPFo3NZHkRCWxWwo=; b=bB5XfuWRrsA9RspE4kI9iyAuOE
	SNRGOsgHpEv+LK9VLi5S1TAXJ15r51ElKAIbyral71KJzirY6oD/OogimTinWIAOAByQOTjwdeY3g
	DWqdoaOJP0cR5rh1jk9UYtQLLsQLIfU/S8HTeLEeiIarWB6DCWHCtcApYE8Wgytk0Y/4DIj2N6DWi
	ZYp1vABlGzy7wONHPRGR1okMyRUFjceVGy4R8RqVuoRc5Zp2KzFvXgOGc34OZMnoJBhgbQoaaqqO3
	Zm31ZAtw9IWbOwOALlP4T2akEc8cyNoYyI0GNuCvYuDQnYx5/34OH53OymeAct8F1hXUS/Dn+Mbnq
	xnZqDR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44L-00000001Tpx-3Lxy;
	Fri, 30 May 2025 18:03:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL44J-00000001TpF-3V8s
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 18:03:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UADSir013816
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=pMgpQ5I/JuIl
	38FrXwUCHv0ZOaXjPFo3NZHkRCWxWwo=; b=SlFMtC/ddsxad82sVsZYhTbMi1Mv
	IZb3EjrpvihYixx3eK6kKaC5gUdDUalayAqgSZf4xH4fAqLOhVslVEoCutf8qS76
	26mB0bbRvN05Lr+kTkQMpaxL4UD7HKqMuqZ4GUvCp8+kvFdou1FihG5AChGmgq2/
	ku66u3RCRk/EUbRdcBs1D5GaGbv39DjlGXB+0fEGdMdZkQPnKSKuxCJDRWtmPU3i
	IGzsuiAz2hGEavVp1zCnmaImp2+AAn7zL7eHfJkHb2tQ/vYYyVvGiZY6/+5F4vFs
	hHxJIaCCRvTr2Q8qwn5CK0PUodxV64DPPCArjqo3/KvGg+qYBklkbHGRgw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm40cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 18:02:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23546e35567so4855235ad.1
        for <ath12k@lists.infradead.org>; Fri, 30 May 2025 11:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748628177; x=1749232977;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMgpQ5I/JuIl38FrXwUCHv0ZOaXjPFo3NZHkRCWxWwo=;
        b=HbH1m2QaX4lMQf4IvnuT1xljiTDiYaBzXjoZXJTlttRGmT4J/ewtpyx0Uub+1pUSM3
         wg2lKKrJbICmRIlXG6je6XX1PLuPu4z0zrGsFAuiDsgAC5jUde8f/h9hirCKKBdVrrLd
         TZNIq1qqRO53MYvzRf19RSwM9/9NH5vN3o9VYJzXcwp2wlBTP2EFIcyMHEM4/dNOIP+9
         WC2P/fTjnc50Z72r0c60ZenNKoW+ZlYJMOZrx3JlHk/K8ULv/e+LwwiUoJLO/b7MI8iX
         Miei988xdpvIx4SqoTr6yt51YCIqCYA199G2gGZx9qo0MSlIzFRNwAAsGLOOA6woaqj1
         ebow==
X-Gm-Message-State: AOJu0Yz/QEajOZnVBtr/C1Q6YOLSBbulRZ4JS8SVbChjnhQwry1VZRvF
	LDiIsqvsu+xWSvL+iHi8u3JLZBcCIayvhit/7RJBPvXaSOKYM2yRrexvxvzBWjGjiBu+Ok2dF7v
	litfBX6PpcLsCMumJ9kzz5WIqS0NndNFXPWRAM7r6HqXMMiDOBEXjCg60AAOp5SnUdf6qH0/8
X-Gm-Gg: ASbGnct8xSdrVqrO/v9yKrdZJ7+ZKQVdbeNqn2DujLx20xSoyk65HFdv/uUhT/lgBxp
	yNGqAwYydi50fk/NTePActuE0sWoiXJBH2DTwWS8Z5flicZxRSSjuD3bcGHkCzezogS3PV1rjnr
	TenIDk+LKWcSEbkPRSwaKhEdIddkjz+rsvjbOAHHVL+bfP+Vdb2PJIj9OSXYNFAJEuYDusiQ+iC
	gA9JtOccPPKq2fp6zR1/rJ4OthFO0NgWIu1XNbOnKpSj5TqeZec7WYQ7u1m1fX9QmbT53Aq8VnF
	hU/+vU3zV+U8qOcnhsTD6SDbXunzJ6o464mKpAlQ4ijQG9m8bVnwRVvgniUE7p8K+NvI8KnHTSd
	xFBfVURSt0+JDeIEkXdCIB8IQgpLqqrdsLlS9gOjLZuTWigfdpyocquad
X-Received: by 2002:a17:902:ba85:b0:234:909b:3da9 with SMTP id d9443c01a7336-235395b1dcbmr31263965ad.27.1748628176633;
        Fri, 30 May 2025 11:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2CNxtpL3ryZAd8ovOBU8Wo+dW31fe5Jzn9KzO9hcp+EEC66gPHoxUl/hDKNDR2xLfs5HQtw==
X-Received: by 2002:a17:902:ba85:b0:234:909b:3da9 with SMTP id d9443c01a7336-235395b1dcbmr31263685ad.27.1748628176239;
        Fri, 30 May 2025 11:02:56 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc868asm31374435ad.31.2025.05.30.11.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 11:02:55 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: Add 802.11 encap/decap offload support 
Date: Fri, 30 May 2025 23:32:44 +0530
Message-Id: <20250530180247.424349-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: fUNKOQnWph8YdlIZuoClLQ7rxzkJIWW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1OSBTYWx0ZWRfX1yp6J8BrrEXo
 LohBI/qtHjeW55RK9AzwuwUtY3PLyJEfXB2qlvGfwBVlfq4GOlECAQJZJptYnGeenZNIwdcb2Cu
 AbloxGFVus/4+XYlfFP4YLVxf32mETrsz+lBRiOwDw+kcjKODCAyfbkv0YS1VhzNlbUw5XmIiV8
 t9Sm4WnoadUV7mMpTFDYBKRjYVw9PC0rFhLLWprpd4uCIUGl/T51EBYgsN8caI0Zw1xOV2z1J52
 O3wQzZbXV9ULiILhV80hoQE4XvvZxRqaDzdsxgPJ53wcwBJB3LjhLsRZEPwAmCKShR5pghfnEqy
 xUppEzXtL8d1gTs87KfXYdcTU1hyoKgWp3KZdWko6HQ/Qaz9cZyJ+mktvQcKTc70eu0cLqXw/Rh
 U6wtPJEY41lioLVxjo2jhLfoqVxvzv7Wj3uhwk+veRByp0YY8/FyPOWLXuOWwxaT6pCK9M6F
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839f2d1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=OjkgN9cAhSkzZ7XfgKUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: fUNKOQnWph8YdlIZuoClLQ7rxzkJIWW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=925 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_110259_876995_34DEBE61 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

Currently, the mac80211 layer handles construction and parsing
of 802.11 headers during packet transmission and reception.
Offloading encapsulation and decapsulation to hardware can
significantly enhance performance. This can be achieved by
having the driver advertise hardware support to mac80211 to
bypass 802.11 header processing

Nithyanantham Paramasivam (3):
  wifi: ath12k: Fix the handling of TX packets in Ethernet mode
  wifi: ath12k: Fix TX status reporting to mac80211 when offload is
    enabled
  wifi: ath12k: Advertise encapsulation/decapsulation offload support to
    mac80211

 drivers/net/wireless/ath/ath12k/dp_tx.c | 101 +++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mac.c   |   3 +
 2 files changed, 93 insertions(+), 11 deletions(-)


base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
-- 
2.17.1


