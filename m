Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB0AD46BF0
	for <ath12k@archiver.kernel.org>; Thu, 29 Jan 2026 02:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NZdSkvgrGItreWwuCnFrArKneP3zMI97nSFxIWRWok4=; b=HVl8xxTz6i2spm
	M8NG08oaypZYdw+ZOzPOZJTpte0fxv9HazvNeujMuU/6+rkaEjwFKpySw1Qz9jqqbg5j4YUv74hSy
	0lNjAETCwYobKIDM6ioztAYlDFdlJmX3jttu+rfB7ttXqrfsFx5mS04FAZlCatyA5JTZMqzom8zu6
	Bs3JJLoXmZPewZxE0izdhBwMWKFC316RPAqVC7bx1azjvgjRGuel3FyZx/A8jDgAbBCG3oeXvEaxa
	76WSS2pRp621UC+NyE6uOOgqZ9CNBIo8tZMCtNIUnix4WgpBehisX0zjmjy5H/XYCaIp6+LX58jy9
	OeWwbps06ygJJt5MCluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHhq-0000000H7fI-12ZV;
	Thu, 29 Jan 2026 02:24:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHhn-0000000H7ej-0KIK
	for ath12k@lists.infradead.org;
	Thu, 29 Jan 2026 02:24:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SGvN001315697
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NZdSkvgrGItreWwuCnFrAr
	KneP3zMI97nSFxIWRWok4=; b=imxW8SMfjOyosK+e5TMu86tqsmBg9DniaGQZUC
	bhXe9Dy2OusY1DjFSUP5CA4eVyd+ll7x63mw+wFX9ZhapJaINtxQv2nhL3tgaCrn
	BDtlBMVSuxOTc7yU6RQotxa/HAdabzhCquZJKVf7Sip7eQED5fXGYMH3zBCg+ciM
	0aeYmNLsGnW8G50yX53va99eUTUeOfiht5xkOIK25H2ixRI37IP56EJw+vbl7IVR
	YfV++kcHf8zyDeAjX7bPkPMU1DQAHm6ccMtiVLaa46H1VVcnEPX4c+5SZUghTHou
	sYs68AGIRx6QIPneFxyOZEB191tzKuYHozWSeK1xS+bo0LZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bype8skpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:24:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so3828955ad.1
        for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 18:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769653461; x=1770258261; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZdSkvgrGItreWwuCnFrArKneP3zMI97nSFxIWRWok4=;
        b=FIvvQMJvwk2j38of8J20UbzQRJmjjDHh2IPQAtkC0fQsO66xs4e01YdiLQGhNu/l05
         xxeHYDm05Hh2UQoLhec+vDcQ30wcEYMKhxeHKLxLdN9izm1vOq/t2naqKISdBfKqOWHH
         zBdYfgzx2F/W/TaoVsbszWRR7LQ9Klf8DHx1H7X7cQE5zpv69Q7HW4+CWTC/GXR+5nGd
         zTxcmwyd8RPVCj4+JarcXAoPjgukv06NkJnTV/SiIzeHBrKf0cBhhpYcYlt5z9e/xwA2
         KTpIGzD7r6hvcvVbyEIqEKLATSiYmry13ghDW2C9X1t/KZ49cADBB04xhmdJGSRO520c
         +EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653461; x=1770258261;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZdSkvgrGItreWwuCnFrArKneP3zMI97nSFxIWRWok4=;
        b=j0xGOwiLUYdZTEC98eaZ+8IP1Hjn0P7u/Ah33S5TSqleWTO086+yQ0bUsxE1b3tz0K
         MiU3yZQKiI4KwqY0MJ8fQoT89LJcthf9XGlb1BpzUscN2nTWdWnQbm63ePgMCuM3EEGf
         UHbBf/4ivXoYrHaCeb/XduvVYq93UJUZ+7se8vfKMZIYmkE/1EkmdmzI9XVZDPUoUPgo
         WlITldOpv5qncCUHm7eFD6/r1p4wLcWduqMCUIeC6xbcZuLABGJT9N7mRakwbIfJHRcH
         Yvwh/FRRWitlxVEWkqYKN1H+NnyjyLJAD+IWALbenCPorCLED0ENLnQyDNbGFpl8y5+M
         5Igw==
X-Forwarded-Encrypted: i=1; AJvYcCV4h1zyJoxybbZQuDRh/3Ic5aoLeBTzTAQkdBSY+0nFqSjqg1bVspUIJFmHHG7eQN0MXMc+kz8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiBdJckKX+v/VUaFA/rX93kk9RYclwZyVftX0Z82EwBFLjpo4V
	Tb7AMCLyJt73xfYHm5cchoD/JlarS089xa7PzyVvWYYc1KpX+w4akKh4jQrS2O0eYvSQD2QR6a9
	qprreyOcaeNNtWKa47CPHz62alTLVOd8QS/01chLpEVEymhokPTuDUOlrCvqbRNjswiDKrg42iN
	8=
X-Gm-Gg: AZuq6aKqK6VIV6RBRrXGIsAuJoBG1BDOxQXNgJnLDj+fKsQEHjVbTGwbSnBRiwQeJB1
	TBpcIUaVY39+VLynAIT8VcLBg75yw3FDd7lPzr9U3ZJnL7GX3akzx1MuIPe9SSk4NhWNS08oWj5
	qApc2nZiBrKMv/0NL8bZqnFALO8jh0b2DtOz64xA1RQ8CVms5n9bAnttjy/RgxuE5b5VC+2Sy+Y
	lGhQsA7hG0WPa0WzKj1k8WwVCqqEr+4V1xUwVFH5HatnChlH56yy3KQ/R1+EZpG+g7ZFNK4AbqP
	lqS54CeSEYLsogQPMDZXEYL9sGUkcTD3x5xyavVzXW5EGcDtO6okC4iaS78E53z9dib3KgbH9dh
	hPhvgr3X+H8BlRAGwSMHCkk2ZuUTLFhBoT7IcHuGd+9yKbWkw9eGHra+hVB857KQ=
X-Received: by 2002:a17:902:cecf:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a870e579dcmr67853795ad.43.1769653461387;
        Wed, 28 Jan 2026 18:24:21 -0800 (PST)
X-Received: by 2002:a17:902:cecf:b0:2a1:3cd9:a739 with SMTP id d9443c01a7336-2a870e579dcmr67853605ad.43.1769653460909;
        Wed, 28 Jan 2026 18:24:20 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm33851035ad.69.2026.01.28.18.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:24:20 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: fixes to station statistics
 request
Date: Thu, 29 Jan 2026 10:24:04 +0800
Message-Id: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMTEemkC/43NwarCMBAF0F+RrB3JJGlqXL3/EBchTWxQW18nV
 kX67w7lvZ0FNwOXyz3zEhSHHEnsVi8xxDFT7jsOuF6J0PruGCE3nIWSqkJUCL60qE6Q7kDFF4K
 UH5HARim33sjKpEbw9jrEueDpXvAEuvgo4sBNm6n0w3N+OOLc/9lmwR4RJCSdGm01utBUPz3R5
 vfmz6G/XDZ8ZnhU/5iViNUSphhz3ltnnZLWmQVMf4VpxkKta7S49cHUH7Bpmt7oZsfYZQEAAA=
 =
X-Change-ID: 20251121-ath12k-fw-stats-fixes-6e008a4054fd
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: BuTzTNOmiypIaCwSw1ZqEruL_-TJs3uD
X-Authority-Analysis: v=2.4 cv=C5fkCAP+ c=1 sm=1 tr=0 ts=697ac4d6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PKihFRAcjKX8bj3HC08A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAxNiBTYWx0ZWRfX6Hf0rOANcg/E
 ntZrwWWj6jC3pN15rEFgrHBt2IVRoRAfPkBunTzy/Yao4lT1Q+Af5mW6d9GiOyJiQ8oxFYyAeV1
 QEvGr8nvh7AJ4q6f9eQ6NaayxXmeoTndtpt5gPGjgL3kLZfbKXQ55jncY3NoEaORCwofW5GBC3H
 zl3sSmoRayN4XIRIHZu+aUKyINh7AHj5iZGJbMO7ftnYXJI1OmFDg0WFTLBjGjIRAMHw1oMiUBK
 9ip7KazPpdMdl1YFvPmdSH/IclmanIItQiuUczBFW8r0PcYEv6KRQ9joNPWEuIauzNV9UhEkhJ3
 SMea/yPcpPicrwWkLFUb43HS8vSnAoL0Mb+gTuEClZ5/5J3IUYtY6i2miCjMpyd2QQgpKQy3KSf
 x7P5om+S6uAC1RMzIyR7ka7W2Y9pd8/9HVAX0qd6hWlE9AcjkwW1OPrWpmv4r8ylndJQtL3zXHa
 YLaH5REFDB8RFZjwMSA==
X-Proofpoint-GUID: BuTzTNOmiypIaCwSw1ZqEruL_-TJs3uD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_182423_146409_C50A2A86 
X-CRM114-Status: UNSURE (   6.81  )
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

ath12k hits timeout and memory leak when requesting firmware statistics,
fix them.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Baochen Qiang (2):
      wifi: ath12k: use correct pdev id when requesting firmware stats
      wifi: ath12k: fix station lookup failure when disconnecting from AP

 drivers/net/wireless/ath/ath12k/mac.c |  6 +++---
 drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++----------------------
 2 files changed, 16 insertions(+), 26 deletions(-)
---
base-commit: 8c6bd5e9db28152563c984d8c48322610cac8609
change-id: 20251121-ath12k-fw-stats-fixes-6e008a4054fd

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


