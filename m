Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A94CC5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 06:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WTMQHAvus3eQqbOqBL9T+Z7tOwb5b+iMEY6repzLcMY=; b=UMGD1QKCOHfGVqT65GEWvr8N7z
	04MG6Wcm9JHzmhZBIAOYOh1XSfcNK5XvyqSKMOMO2vnho2N8TxNU1njOS6VTpXxaiou9CWk2HC6Uj
	QT4IAEigXgidDJA+YnqFgxfsPCNCFq6PrRtH9D+22OFpOxe0qcCjeiAxf/ZHNQj3wuNaBxH2QrT7t
	+1yi7wm9EIARK9jDt/MYGrOVr+KmgLKiM5dUcTD/KlYba9mT0R1bESAItW1LkvVIVAn1TGquVFOc5
	CN28xVgdK/WQSZoOTyEUZLHUcvpp/6aiRCl1iPrRq95Aq5vXva6dF9Sg+tp9Pj3uN6E1ksH7887Xb
	eXM1mWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaCG-000000098Os-47Dy;
	Wed, 19 Aug 2026 06:54:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaCC-000000098NL-08O5
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 06:54:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZCHx3671311
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 06:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WTMQHAvus3eQqbOqBL9T+Z7tOwb5b+iMEY6
	repzLcMY=; b=Tk5VPhlJ156DFonkvdJDqsjyyxgKDxppJrFIgTVMeiidllrOOUU
	VJzSsIaXe+TgmVF7BwpQSlKgA5IeMOFVipa42OQlG48FEt22o05iYSrKkQJfsdz0
	wqu0fEgJaivgg5G/8/f/1Xddyy6a3YkRz0vidfRaSmSznRJPHDfPWWXzr68IFa7o
	S2GTURlsncZB/arHSp8N1utn8a/vzmhaPAEXnyQ8vDxG+H4pEeYu1DVnQAHie7Io
	nlFJEVjDCvjzGGK66kS43N+pB5ZDuUrlYr+5Y/KpISPUY6mBD/vyxsvA8CMbAdMk
	2L8/93I8BJ+MYrsE0PnpXowIZt2j5jQuvUw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftstrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 06:54:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso1071995a91.2
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 23:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787122482; x=1787727282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTMQHAvus3eQqbOqBL9T+Z7tOwb5b+iMEY6repzLcMY=;
        b=AtojI9wTCKxKZZXf1KMbfxz6qdK+K1YPkFDGE949Q61L5Sdbk8+H0zq20OMO/V3QhW
         v5ZgU77ZYLyPzX5yuXdwOkTaWFSzzIMCOtT5Qd6nX47Pkh9aHCSQRfq4Nafa1HBkHH4e
         ltBn3utud1gt8QXl8m0hsxUqp1wbyvimz8LhXB6yF1WIUcWd7+8YBRlAfbrWFNig4ewF
         FeGpRAPe8R3KOKmzsnwq8FwHm6oL5u6G5Wzx2+BE/cmByJSvuzONOSxgBsCn4TVX0HQI
         IZY+GBRTE2vNG6p7liFqYKLtJMuttn00qFRV+93Ij0vyhzmSNgj1HP9cqtnIF7TqDtyp
         t3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122482; x=1787727282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTMQHAvus3eQqbOqBL9T+Z7tOwb5b+iMEY6repzLcMY=;
        b=lvrje8iRoQzIHQjxdpepoP3q7LV2MTyRA5GKnFOVVjb1WpFvaJg4faaRjOP7UF9pha
         Z4pQPb5u5yNHuuGrtbUuPFNTRSWLiZkDPPbnMS/QjU09A616AvyJvcgKJt2pAa0n+1ed
         kQArCjepM5nW666Ac/jghUNV/bXaF8LSeWAz/m+NFpHzE8UF9ftJ65AYNc6V/axNXLHG
         XqEjV8flm+Y2Za/fS2EtYmb69PS76KenvjkwY38DAfp2MKpPC+zksUuP6St9+71ypILH
         6vzo8OkrMyM2PlHBlipBbTrOKzMNdEcJE9fp7eX3tm3UzY+DvSG32HcFyzuQwvFAerRo
         nOaQ==
X-Gm-Message-State: AOJu0YxMfEqDPpehrlxWFLdVV473UdZx2Mx3wAo1Ck5utTy9VVCZCHHl
	vE0VFkmdpYsRTHTt9j3rH2HHGwv0K8Yguq9UHVTV59lOjG0HfY7qmp1gUrhEuM93iYqXqWHkC/0
	whaGoi3Dg0EP3QR2zwklHO/pkduNALE/hM0d5UR1yZOnXRA2JKf6LPhCYzSnpzlwI8AkOQL9B
X-Gm-Gg: AR+sD11qZOZeWnDGEAZlqIz61cdfnNYVbv74+dPXpNUlbsBYKCqihWJ5QyyyYd4g9xy
	q32PD2Qc/l3dkeNneH3dXwnhiNzO8pyK4pJmZUCuT+vVnHapcZ0Mn4ZrAGy2CJpvCbS4RuL5xnp
	kgME5SzyrpHWi0quWaGzsW7zTZYefBZO3PGxtDLU97B4qj4ncjVZEQWVrzJAJK1OT/zqQ3dyGZL
	sEFy2uWv/HVSmvW/8Rwo6G763afF3xxFZx0m0c6yZTRr13KT9jLcu7SRnN0lPNY3xAF0zr2uieu
	GL1Pew5d5eZsCdNrEQUl9+CNg/HkBwDcYo9XMmP6LeoIALwhS8ZzJyY/I6vxJ1KiPnvE53pUuWC
	7V/fXbjXoL8lX1jXh6UpZnlwca5SiQP+9A1mplktjfnP+wI7BpOWxWe8vzyd7v/Zk0/vBMBWhlm
	DU16Tm44GtA75yBhhj60+55P4=
X-Received: by 2002:a17:90b:4cc5:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39580ed0a57mr5089559a91.8.1787122482489;
        Tue, 18 Aug 2026 23:54:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc5:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39580ed0a57mr5089496a91.8.1787122482064;
        Tue, 18 Aug 2026 23:54:42 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb4ffcasm1526626a91.6.2026.08.18.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:54:41 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Fix IRQ cleanup on PCI IRQ configuration failure
Date: Wed, 19 Aug 2026 12:24:23 +0530
Message-Id: <20260819065425.2044186-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a855333 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bw38Geq8loADsqHK4B4A:9
 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA1MCBTYWx0ZWRfX+7QgsUreGOZo
 Tate7tqMtQ3yeei4OnE3REeapDAXV4iO3nF/h/LzoHQVvTHw92eBlrarsVnqR3gqZaEua13SPAS
 nk013xk6m6wgGVx58pUhrW41YPNpmB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA1MCBTYWx0ZWRfX/bvrV43Mki2K
 usfTgCksbhaWqTfBl/8zxQIh3V5NCtl43YLKOgIavLN1ZJVl8ZfoApOp7rdiYWNeH23pZ8LVKRY
 q+c/tD93Gq/mmPbOdC9USyZytAlvg2xL5pu49l2TQnY2moPMJXOo3jT1i+dfGPQ96101mlsycpl
 /fZ5fiTJ8X6KK1eeDVJzar5BDCLIOgAxPFYOqj6Gy2SoHVcG3mkToZA0mD6yjPWD3gH6soqgesV
 4XD0DWeCjxRcut58HsBbqkAzGER1dIRr580bXVehpwvxBKdzoxTTeGT7/UQkl07SgSwajlw5iLD
 GHXRgU5ApYpTU4IdFUshhaeTwrkLfQ0n6FO45HkhDl5tjMwUaaXpPctGDJFrZc2kOLYI/9shpoF
 lg9fRDGZoYkf/qLblCM/kXgvshyShF9fjetP+Qd1HPqvfz7mBKAaKbBSAEKWqbNGeSlykufgtuA
 oLB4osP+IMPIpfNvZVA==
X-Proofpoint-GUID: HyDOwHu0HeXeIwfrSEeTJpt8EkuaTff-
X-Proofpoint-ORIG-GUID: HyDOwHu0HeXeIwfrSEeTJpt8EkuaTff-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_235444_268836_4FEFC57C 
X-CRM114-Status: UNSURE (   7.75  )
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

Free partially allocated IRQ resources when PCI IRQ configuration fails.

The first patch frees previously requested CE IRQs if CE IRQ configuration
fails.

The second patch frees previously requested external IRQs, stores the IRQ
number only after request_irq() succeeds, and cleans up allocated
resources on failure.

Aaradhana Sahu (2):
  wifi: ath12k: Free allocated CE IRQs on request_irq() failure
  wifi: ath12k: Free allocated external IRQs on request_irq() failure

 drivers/net/wireless/ath/ath12k/pci.c | 55 ++++++++++++++++-----------
 1 file changed, 32 insertions(+), 23 deletions(-)


base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


