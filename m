Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA9FC88E77
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DcY7HrNKpuW/oPnpYSwA2JrQ2wfWf7lfynFfW4JODuc=; b=TjtUApeEdrpKxIjUdd0/Fz2toj
	66qG9ayr0TVXE3mLenHvqW5Fp+UalAaFfsGCHdoPeRKeMJJmF1ghwl7iO7kFPyh2ad0gwH065hHHL
	VOnMYEmcwU8tNtQp1OKztIxEByKj4b63P9XD176EZNYS53xgYWytH7P8QgJHuCPuQEd8uIIvF1xXy
	83KCkME2jfAkKLZepLgiQbW0VLw4eDt2tIzYmPQiENS0uZKhble4NVaJwjSOwdO/+2Pp5AQAdRed2
	SFhIeU2CXC6vOhhqIylwPMcua06JGb08IdlbZ9yQ8UK/O/UMKV0WhqhdfeS8ySXGUZc2qkmw4AbFj
	LbN5k+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikg-00000008RZN-3OhI;
	Wed, 16 Sep 2026 06:04:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikd-00000008RYg-3C7e
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:04:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5sgNp225745
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DcY7HrNKpuW/oPnpYSwA2JrQ2wfWf7lfynF
	fW4JODuc=; b=CuqpJo4Q34LWejQcrWokvGnC5Va4CEViLGkDuwioEE1rWLPxF4N
	bOGUFIU4qQ0TXi1es3li1PMkLHQHuord3qazv4GDKGcX8NJgIZIfWq/ogVVzcSHr
	vSKE4u0JgYA0fj+5X3cwl6ddM5Bxat+KRko926iv3DTqALwzu4dFs+isXG2IS+6t
	b4zbk4EzUuZuoqKjFgC60DKB6LRFDHmCzxWfkkRZAe/5vp8xoxxos/rsd6oF71xh
	OBA0AsrTC+exZj9nPuNrTzM612Ir6kI7kGnsu4QwhDGSBaRPpJTsXA0Cg8vbSwM+
	ck70lWzpEl8rasZQ+CougfOqmjhGHGOH2IA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnj8gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so9315595a91.1
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538650; x=1790143450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcY7HrNKpuW/oPnpYSwA2JrQ2wfWf7lfynFfW4JODuc=;
        b=UQj/S0fUBNO6Cou78JRFnAzHtOZb2t02jtWxsO+h6sHr+xG2638HVrL07gIZkCQHJG
         7jGYIT1VYewQKmCji+P36S9qFm44iaybWGBcfUHA5Y4r7/+MaZaavfivaWNqGO7HdmkW
         VLg/s9pwc+Y6B1DXFKieLs3X42rceGJy3EkiewD3Luim02FxlEFRJJNhHZf7PK2ihhO4
         8LQDONhC2st82B4yxrYzkAcO9+YOTiXdE4aIen0XfQHABZ53VOAK+k5OdT++cD+Ofe+U
         HNRndEtMU5e1KiGM+8iml5EI+LsZd1fenO7Zwn2hWJTQR/aABDNg/JkxIs+xx7qRoctc
         F1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538650; x=1790143450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcY7HrNKpuW/oPnpYSwA2JrQ2wfWf7lfynFfW4JODuc=;
        b=uJyMRQ5H3+nB9OH38WJn5qO53t6kAHOtIlxWpySKWutv/NZuCoigUKwQKjJaoOZuNQ
         KRwipR7ATs/jEU8ci+tfkeo7fdmbSSBgVCaR4RGPE7bGIhLSJ678GmNKpIZJVVz7dS+Y
         yxb6RgsnTeUWFTDnujdqzy3m7rPEEkqVsSSXRFnmujfYZW6WZNHs3iD6h877zZMa0h2Y
         AEO7Lqg40rXtEOiDRqQTeps00yLh/R3uimtk+JjNZZrs8NsZQIzzqkIwqrhDXZZiUr3r
         VOurtb6Ak0zmdx5ThY/jlsrHZdH5rezfZA9ocSiZhQ4Rn1s9MIN4g3CmXlYlasA/q74K
         V19A==
X-Gm-Message-State: AFuF++noTHir3MBCt3y0840zejdszs8YVCrZ7zp8uZFIyknWhyxIUmq9
	F26Bcxstc5XcVTGGaWyK0G2IxELd68bjH77HLXTDNealMFUVg2YgY0aYvzsDGYhzZI2leFesXPw
	4tdL4d60iSpAbUwBmksv5X3DQDK9OdkSabl+voE9G2QYsOw8rZ+6ZL7MgPWWiT2lAnw/xF/zO
X-Gm-Gg: AYBFou3WFuXDw/mI/TfCQbe+Nn2kkWbS/27qpXpYVol+tOo/5OIF8rFO0UL74akfKA9
	X24yIESOccSmVHh31IYLmHmB+ui9hzKvyfLlA6KHgIWzo4Uxzh4LlKs6Uidt3VvWBsW7q/RevI9
	UmkKPzEhvKXlw55X4U1N4ewJegGPOzxro1RwPLW8IEv3E2vVtzr7GMuISIL5KpE2Jgu9MpB71+d
	YQmpWBQxGzafSRz1MzpSN0YYQJ7Slb7FXJ/3jnDwasEKKUUAVWlD0JvSCNHUErF+QM5h1piu6D7
	gcCqlR5SdO5Qcb237x7mEaBhaG9jcXr0Ad3yJBexrXac/U/wm9rdwMbQhWwXojZOJk6aFmqEkyO
	uoQ/evYhd1FzVK5VFb64nXwEValgIN7h1ReKxLpXDenCrZt9w45k1kJexBjfyuwRu0WZEmi30fh
	vLKfToikdu3/OjEg==
X-Received: by 2002:a17:90a:e18e:b0:39e:ac:b776 with SMTP id 98e67ed59e1d1-39e1e5187b4mr2918493a91.25.1789538650044;
        Tue, 15 Sep 2026 23:04:10 -0700 (PDT)
X-Received: by 2002:a17:90a:e18e:b0:39e:ac:b776 with SMTP id 98e67ed59e1d1-39e1e5187b4mr2918437a91.25.1789538649597;
        Tue, 15 Sep 2026 23:04:09 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a7a1csm2661491a91.15.2026.09.15.23.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:09 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 0/6] wifi: ath12k: fix monitor RX buffer lifecycle issues
Date: Wed, 16 Sep 2026 14:03:19 +0800
Message-ID: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa315a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=cAceGTCcrxCDDuk2mPYA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX3gmvtlW84Ly3
 9zWJMdOPSmHjHXWrash/2cbcQlqGf2y8s5jgx3vvB0KFtsgqFp/IjswfjVei32R7sO3LhYaojz4
 cnVC2KK5vXSM5GdJ6NaiMPx4LMqU/1G/XL39hk1dC2C0Cv3yWPGm1yp4QLQ+WkMd6uQqETxqpeD
 831ZHwqAHnOFg8m4rGpgDbjkcWbIBkjspfudpHTJJ8+qdCjkyJvy8scA6ytQJsDecHXqW1g5kmX
 8+2JKdHF1DH1CYdB4a1HMBkRY2H1spjmhX81PQmk5m41Jhl+XJyr1VPUpSL8KiW8j8+MbnK/t9n
 WdKnmY85VyttkTDQYzl0c6+andXquXaRRV1jttqpJlmlsD5sVPG0YHkEuhQHJfq2IDqGxK0hAY3
 XJOQECO6jSixy9mO793/oeCszM9CNIEWTA1khoa4TuaUg5Me8nSboNGqX7r4mozpyrtj84z+ejV
 AZr7fDRz8MPVB8W6NAg==
X-Proofpoint-GUID: 3VLe4h9RaNkpGvCR2mkyzCx2a15Pm5XP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX+ZI37VgAUM1X
 bt10Ve8bi9Tn3CrN7RrlP1QAYS/hLAo6E8Hq45Co9VaaUsq5Drjb0L5DWf17atMyVVgCNsM9+r9
 RNiAVmReQu6g6xCGJartWQU+M5lqbWA=
X-Proofpoint-ORIG-GUID: 3VLe4h9RaNkpGvCR2mkyzCx2a15Pm5XP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_230411_806060_3C18DE7D 
X-CRM114-Status: UNSURE (   8.57  )
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

This series fixes several monitor RX buffer management bugs in the
monitor destination path.

The fixes address leaked skb buffers, stale monitor descriptor state,
object lifetime issues, and incorrect DMA unmap handling observed in
various error and corner cases.

Kang Yang (6):
  wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
  wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
  wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
  wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
  wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
  wifi: ath12k: avoid double DMA unmap of held monitor RX buffers

 drivers/net/wireless/ath/ath12k/dp.c          |  9 +++----
 drivers/net/wireless/ath/ath12k/dp_mon.c      | 15 ++++++------
 drivers/net/wireless/ath/ath12k/dp_mon.h      |  2 +-
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 24 +++++++++----------
 4 files changed, 24 insertions(+), 26 deletions(-)


base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c
-- 
2.34.1


