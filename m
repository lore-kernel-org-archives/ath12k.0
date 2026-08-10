Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9FDC5AD4E
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SceX2sy7F8G3sFYLj4u/9YUSzA6BhxHVelvLqQ2qv20=; b=YlguzKdp/j90CGiwasLUXJjKkH
	dSDDPzDi/oIogoXhUShaYn36ngrWnykr+qaDHwkC1uYrh5YKIawFLec2jqlF/VC5+DYy9fGlE/Nc2
	M784qCZDZ6MJ1HHKZMN0+DZhNt87EYUWf3xYuBdqZr8DvL+adGgXTlQ0Xz7wHxv7mBT7LFh3lEWtf
	uu8GsjY1VuR36Xatw5haWxddLK23wXga9gIzMXYc/E2cKkZKWRlQbvJyg3iQxyRryb2xU9qbp2nTu
	lvBBBoNGiuJIyE87Szj6TWnatTGKXP5eqGOzIutCdL3+zACzGaHLjQ4ddJ2F5x1pctQrflV6ZxcAh
	QUxtG8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMaM-0000000BQsx-27JC;
	Mon, 10 Aug 2026 09:46:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMaI-0000000BQs1-0WoM
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 09:46:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S1qs1189351
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 09:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SceX2sy7F8G3sFYLj4u/9Y
	USzA6BhxHVelvLqQ2qv20=; b=PjJzJdEoUlUz1HhkkTs5hhbx39z2pVM6tNJt+s
	3MuVxNUs1+t9q+tavVVXfKMomK1hSfARwqOvIgZRTvjqrre7RNpG9o6HOL7Mf3gh
	whdEeihA0+inY1qv4m2C8eYvv+O39g4Nfqal7orUuxPaScwFjqqF1TIXSEevdUoH
	NvhNYx4kHOb+uK8QDoMUdDozgb8KE/pczAZlPJPO4qOnKEnwFgARxY5IS8HXSogO
	i/K2HtTL6NoHysUgb4djPwey9Xfz+eKMsVvkM+WyboBD2kGE2hTaXa01OoUL1QKZ
	vwEPkyTsqBfgW8crm4DpYwVBI010fBCIrPPhebuNNSht46gQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v28wgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 09:46:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so26761255ad.3
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786355176; x=1786959976; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SceX2sy7F8G3sFYLj4u/9YUSzA6BhxHVelvLqQ2qv20=;
        b=JYam0JWYzmGnekaYGtl/v7vSAxVddv2hZwZAw+0lgFY0YMSo8Rvf7RqWqagah2GSJ8
         KkuR/S+0FduvrTHtyj2QjgKUeefxrU9rBvSA2gbUa8Xc+N3fSCZCnSzgs7SOu/VSJXDk
         aOegWr5lNYCxs8YV3ssahfcxp2QFDJWHozHnrqMqMP2IxIw13plgNCfqUesd8sfwlQkM
         w7BEVOU6XIrp10caXUwxwfvwd9uYz/gRZuQQY21MHSuk+4sEL8NcA+u0AnZ1jARCpv7Y
         JG/Ehx/pazIyBksJpsKYnVUPnT16HkcqrM7DGABZUem8ysYXIMtCIRNma3YivPOTAFBp
         k6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355176; x=1786959976;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SceX2sy7F8G3sFYLj4u/9YUSzA6BhxHVelvLqQ2qv20=;
        b=IDcgoxQWVhwqFufLxX224fDQg0YwJ4ScQvltVvZKohJZPgUnbFDfjS7NtdUlrbSy40
         0BCUGQEM65QG5SFCBECU83loMBRaRBRSsrbQSt/io6awbn2n5CIzXaHLhACFW66nU7Nk
         MAsO2/nrz46uQRo/2PT61q8YhoD1/MSiEWsinE+84euj7vUjm9ZQulgd5YL7rIbrrUnL
         Ydh87mxqVoG6ZK1tJVfG3BPm6foDYE3RROGQVHV1+4GssqiAb4g+jbU4EzjT/OmUu3iH
         U/H7le/JBofxWRKbfysAf1BsECCG/ZONC5gOJD+hCzUGhRZTNNwgi20XP7BVkjSe4UIz
         EE0w==
X-Gm-Message-State: AOJu0Yynr7ubyZnfyhhP1B1aZluk9j/xmVfjsuF9uYHdsDY+mL6MO7NZ
	SXFmAATcZSTUJkPnl7+fuJPS3NoxuSkbzL80jbcM29bYoGhpNSWbOYmV9MQp1WCMy9ieFcHet5V
	dmIVzRz25zxYLr6tyTlst9oPs4WWZ9vgCi9wGxfvQo3Fd6ht/Gw2FH6i5mkX4VSimk/DdUO1DJg
	w=
X-Gm-Gg: AR+sD11RiFpqysRzMh8JeqESayi6gunKzsmOUjK9c+R0p0Ol1+5jxFGMok70lYrVn/T
	PPVC6cwL80j8MwwfnbkGgEvePt3t+aM9RdRKPxE1XbDlgmWzFDHJLt1e7CLHbgnIzf91W3CwXE3
	fJvQHOLtZk7Ko+KFfk2pv5rtrFxovliAaBZZ5JPDgW3vZI0Dy+c+zRVxTe3n/RikcFZV73wt0vg
	vdSx0CKptOsVg6qeNlzRaFzVfjQ8Lb91Gm/8mTInY5WttsmMYG3cDRbDp8cUhRyOx9zDZxcUHh9
	lGPTQN1pcsaZHMASqglUA+sG8IfgimPK83nWo8P6PH/km1BVEcKHu1dmqyUhKnWVWBv0LydcKo/
	C1ExgAoeDczrV/SDrNQH8GudGrTwtDbhpCvzkOh5TRDkA/5e7tlLLMg==
X-Received: by 2002:a17:903:8c5:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2d106e99159mr353867575ad.22.1786355175965;
        Mon, 10 Aug 2026 02:46:15 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2c9:e2c1:4fb5 with SMTP id d9443c01a7336-2d106e99159mr353866995ad.22.1786355175372;
        Mon, 10 Aug 2026 02:46:15 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccdb26bsm32671125ad.22.2026.08.10.02.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:46:14 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:46:00 +0800
Subject: [PATCH] .mailmap: add entries for Baochen Qiang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-mailmap-v1-1-95129af871ba@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANideWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0MD3dzEzJzcxAJds2TzpNREA6Pk5BRDJaDqgqLUtMwKsEnRsbW1AMp
 lFmtZAAAA
X-Change-ID: 20260810-mailmap-6c7bea02ccd1
To: ath12k@lists.infradead.org
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a799de8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=pHwe-td3AAAA:8 a=pGLkceISAAAA:8
 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=SRrdq9N9AAAA:8 a=KKAkSRfTAAAA:8
 a=oQLfJTBTAAAA:8 a=icsG72s9AAAA:8 a=fhHLQuVZd-I8e5nCu7EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=1CNFftbPRP8L7MoqJWF3:22 a=06DSgVp2mo5w6X7jAMMe:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=cvBusfyB2V15izCimMoJ:22
 a=RgvzH8KC66dk9vUkDcCj:22 a=T89tl0cgrjxRNoSN2Dv0:22
X-Proofpoint-ORIG-GUID: KiGJ-NmDzi9bGqQwf-5SaEJEdx-UkMO7
X-Proofpoint-GUID: KiGJ-NmDzi9bGqQwf-5SaEJEdx-UkMO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4MyBTYWx0ZWRfX79dD/egSuZcD
 y2knTD99esRfYvxwgL2ZDsllNiomKjAez0MvBpU6ZqEl9aXBWyqdgtgoumrbRIsbI4AnBiV8n0u
 tVyE8FQMqfQqZ9ENuz1nRaTxpJL7MGkEeziTCtLLRJYSlUo6sTRXI2AO5O1V6BtCA8nhfrNTQJs
 kEc59SsOodDODX0zgbYYSuolbdTHN9R9dE7766/krDVx1dL1nqr69fGjEK6hYWAFpgJiLEZdeoc
 brJobnQwfnplQ9cYTsfFvIpv0DECK5RUZk6AaYGbUsnIzKqjfGjCvSqWs+HbnD0Fth+kAGyrVfz
 IZa0T8CgsHWa5vjNUGF0II9hfa6NM74wmFdSJ7uUgdziZ93sa/4qvX9oWrQS7ibXm0dd5d1y/Kv
 KQwz5rjccBexk3bRFMHZL5PViybtGKrJ9a3tD158uE5C4lKPqvfdpb50HVRS1bQiH1drsLctGBd
 2OhTK/X+u+L7S8KlBkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4MyBTYWx0ZWRfX+r8ocg1OxNYf
 DUoGQ5S9FqK9LIVAak3f9s3Q2J15M3ivF6q+y+Ryv1qq4xv43xKDMUPcdQsA6qUxLQHMwN7wKIQ
 rBg2y8+Nd+dRh/5D9wr7XESPFqB7FFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_024618_282834_6FFD42D0 
X-CRM114-Status: UNSURE (   9.63  )
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
To: ath12k@lists.infradead.org
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index a0f64c31abcc..332782494b6f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -128,7 +128,8 @@ Axel Dyks <xl@xlsigned.net>
 Axel Lin <axel.lin@gmail.com>
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com> <bgodavar@codeaurora.org>
 Banajit Goswami <quic_bgoswami@quicinc.com> <bgoswami@codeaurora.org>
-Baochen Qiang <quic_bqiang@quicinc.com> <bqiang@codeaurora.org>
+Baochen Qiang <baochen.qiang@oss.qualcomm.com> <bqiang@codeaurora.org>
+Baochen Qiang <baochen.qiang@oss.qualcomm.com> <quic_bqiang@quicinc.com>
 Baolin Wang <baolin.wang@linux.alibaba.com> <baolin.wang@linaro.org>
 Baolin Wang <baolin.wang@linux.alibaba.com> <baolin.wang@spreadtrum.com>
 Baolin Wang <baolin.wang@linux.alibaba.com> <baolin.wang@unisoc.com>

---
base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
change-id: 20260810-mailmap-6c7bea02ccd1

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


