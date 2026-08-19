Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99CEC5DF85
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcnPZgHH2d4MNKTZmtelfrRGS8bNErGXqN5MMvyrAqI=; b=kfcc4OG7h1056llLV+jLo0CkJ7
	+sORqfuTmOY0tnOU1urjnN7jmmaIyQg3LtnZKeDh6XRgiGmlMXbPVahUt/0fOfXzA0LqEh4gp+m93
	kKe9C+6tO6L+Vt/uEECuH5MrvSM/L/7HluwlAvtwbPVQWpY4vUr306c15kfmlg0j8LGQD9MRRafyR
	SK9zGqE8oVWURUgaH3DgW4F+PZRAW1apGC+RR0xi404Bto9a98htJJH7PuUy/BgWLgQE1GoAuou1A
	lRfetGH3TS1amk1GRXUGP1Mx2Kg7RyV2/dsIzEs/MFwzJlS6W8Jjc4z9LLDZzI5+WowEmBhYGWdPq
	eb0iqy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvj-000000091H3-1Sbn;
	Wed, 19 Aug 2026 05:33:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvV-0000000919D-3014
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:33:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I1FA361339
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pcnPZgHH2d4
	MNKTZmtelfrRGS8bNErGXqN5MMvyrAqI=; b=JMWxP5coEzDszq86cjVUH42s6vs
	WqFpMXKnyioX5xrpJd+W8yzG/1XnvUCbbZpHaD1tT9xzAF9kUKI8zXto80i9DlKT
	PjU5v4uI3KDWsbIqzxLExfp73jfNt65m945adVsmFMmUOOxx2DLhvyQk0xscqKZi
	Rnb0xiauguIF3q717vgsnEei2VXxyIu/shWpRMsaVCFSI7our+UuPZL+wJ3kZ0YV
	qexGzrTtHfpMEjwFKgEdIELSCE0rhIxB6Hv+5lsYQhfsb3G7vcQ2v9gzrslJWtsm
	1g0nldbM5C4IebZEFLTfLcqUEnIe5jUgEcvZ2BtHYYhZ3N7YjNqm25VHk/w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm1ge2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1197424a91.1
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117604; x=1787722404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcnPZgHH2d4MNKTZmtelfrRGS8bNErGXqN5MMvyrAqI=;
        b=XTDoWU8uppM/De1iuBAPRQX0PDQqtH5Wwgmtovs63R1b1CPGv8nspY+MX2LNLvy6IP
         4M0nC20OIZ3nTNmTTlSYubHPwCxQ9RyyIPuiZDVbvvrMw8IyayFhroW3VJdIEMBngN7I
         gXfCl9qX2afdduUOkSCvxVfSKLdmyEu4WyQSNh2HyMoKnWQz1GVYjB4+o4RO+2UOAMtS
         Z+q5a2gN4VVLA2Y2YHl3lFeldof/HPTyJLqTS8yewqv+NQig//0OtRrvxI2WKaFkhWhM
         qYWa13IqgebgWf6+5IhcKUylj7m3nLMWIP6v9bNXz0t0GU1d+NZjo/CrnJ0+J76CsHqh
         ULmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117604; x=1787722404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcnPZgHH2d4MNKTZmtelfrRGS8bNErGXqN5MMvyrAqI=;
        b=OhH4PVrkLUXih+O6uk1s4vZQN3uDjkNLICYqPqLbMSptxLrp4MUbxUXAmuLDFEOw/9
         45su7ZNphGK5DCDt3Hq3eo+eG/jr7/bIxBWd1fCgSoiRTX0ySW/NR5Ivhsb39UvY+SjX
         M4SrlgnqbFSJ5kYUH9ifCADfMPKqTKgt/hOBao9VCxvhGD+TmgG2Uic9aGIg4MXr2mDg
         YEci9/VPrGV4BoEUzqdW1QRvdMYQWgNxtsjjHSl9IYWLtl3+yfX7ROAdnWLDyHDrKyvs
         R+K6fbbnWxtvPPp36x0lMZY0J3Nq9E7tqKsL93QwQwibapJFq0lLSHidH5401kVqJgmM
         w70w==
X-Gm-Message-State: AOJu0Yxh7j18Uurj1b7CQXz/3sP/PFHs/1sb7+uW/D/wCIP8Srr7br/e
	C+CqaVpLjuLeea7CbspdsZO+zFwxWkaCDNnaT8q4rOmc7qT7e9GPWlWThgnZ2xd09WVG8p1sZJJ
	4LlPalhN4c799vPAzyljNU8FS0XYBZLQMSChKZJxnl75o4OyQKx1yFjV/Fn+7+kqRVKr7hBtu
X-Gm-Gg: AR+sD11+Y5o4nFV2f1Rl1F3V0/yUoWM9I1wy7ORz5ON/mZbaWkDU1S8w4QXxvtspjSK
	tEmIxt+4tsFJGjxqShfNFRiR/Vg2AYO2mfHvOjBlOjjBILSyP3XLs/FdrIUC4tGMDF1zzxL7PY+
	NWVBJoEXLLAdmUya1FI2/dTgFxWQq0IZgspOI8ayWQ6sFslGjUJX1uLugNsIj/UsajJv9ZgBDkX
	HjVQI19XMVAA6AJnccDXzzPmoA6RWcGf6gAPtOeUVe1Nomx3LLU3HmnWBStCala9zNH6kASysvj
	H17tMcBpSzc34k6GCUtPY4uQYhCFPkala2WhizaaUhrKAjO/CN/ejRhWnhfDlPpWX/s5SQ9O1Iq
	EORUyIwRjvUmykSVF+s2RL/vVl0BQ2UzaXwYxw4cJ5p+eIS+xEn8f
X-Received: by 2002:a17:90b:4c44:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395810857dbmr3745159a91.9.1787117604450;
        Tue, 18 Aug 2026 22:33:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4c44:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395810857dbmr3745070a91.9.1787117603828;
        Tue, 18 Aug 2026 22:33:23 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:33:23 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 7/8] wifi: ath12k: fix 1-based ring index in REO Rx Received debugfs output
Date: Wed, 19 Aug 2026 11:02:46 +0530
Message-Id: <20260819053247.1420393-8-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX4LBZFx+6XSSB
 aYbj72u6I9pgTNOXRiXLo0xQWUuk4o97Kdqv8VKt1BYH6SVhkWKlYegL5b0MeqTvKSE5+AeC1f0
 N5+8r0Ef7yh6d/DdJjsFv3Pd8Kx6Lb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX9kbbbl/P9vRP
 Pxo9uyQkm+b4mJ3do8lFpHxX+GxhGfwrMwdVxDqACPgZts2jOSH1kYmWy8yAnoRb+r3SD4Dm5av
 yyg0qUc7uO3o2be4bsT2ahAWu82cMJIjApT7BhXC1lWNlgSob8qmydsK9Y1N4kX7rRKb2H2cyuH
 zAbYxNZYknpJ8WBN9ohjqBCvrby41+xvKwKS2msiZsPlnjXq1VD/9aywUzZebZj8lf66RiY85dl
 CQL1C1JGpwH1Rh/mDjYMPjjUMGt1PWvp2l02SWKGG2vYlouFNxdqfSu5tG24lTP7quIqiIpsh53
 JWeMe8N/VulU9kT9f30L9JyEMsncfkxbVakCnTcxLie878/EZO418Kqbm1iynj7dNL782jtgpcb
 g1pMHKOGEGoEYUZNLlDhT1IL5t+xtXR7RyYLDy9dUvVAktCEBAtEpdqsnFHGHf3i+LZj0IW/zn1
 /QOGCUpvVzevpYsOOPA==
X-Proofpoint-ORIG-GUID: yUQISQB_wQQxKPFws8AYc-YBWFqQX5hH
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a854025 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qz0A3ntWxt9h8-tH59wA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: yUQISQB_wQQxKPFws8AYc-YBWFqQX5hH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223325_855504_B1E35D8A 
X-CRM114-Status: GOOD (  14.09  )
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

From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>

The REO Rx Received section in device_dp_stats debugfs uses a 1-based
ring index ("Ring1:", "Ring2:", ...) which is inconsistent with the rest
of ath12k where rings are indexed from 0. Fix it to use 0-based indexing
and lowercase "ring%d:" to match the style used by all other ring counters
in the same function.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 5d5597d80417..5d6710f1160c 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1215,7 +1215,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	len += scnprintf(buf + len, size - len, "\nREO Rx Received:\n");
 
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
-		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
+		len += scnprintf(buf + len, size - len, "ring%d:", i);
 
 		for (j = 0; j < ab->ag->num_devices; j++) {
 			len += scnprintf(buf + len, size - len,
-- 
2.34.1


