Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1399CD4F3C
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 01:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKQe3CSDWeI3ZAT/8ZI+HGmO/H88qV/HqEiNJoaBIHA=; b=Xogep2puuEsxhfwGTy5LTrl0LQ
	QK/wX23gT2x6vqO/TGRQhAQFCDndJfTWnQ/xRaUuNbN/VS2QHerMyjlqOEoiP3nL9wZYcZH3AAKWS
	nRySYwCFtuztNr7oyqurnRFfyFuNG9pWVWATLUB4yeNe+YV0/1tYsDP5nxfjBi8ZyI2NJP313s9hY
	TtambtSbEsMdreESVnQ1B7KtmeE9ti3I31wdkaDSpp31O3LTnp7LCL08/poJWhm+VTmHsdukNOyUj
	lvfvXzulLsKm0PecE5CrAltjWec9eKZr9h/eZQPdO4/T7/jImZCgA0Bz2YV/GUPskXzvDPkEHZMWp
	S/5mB0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP94Y-0000000HLBN-2n30;
	Tue, 19 May 2026 01:16:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP94W-0000000HLAN-3cAH
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 01:16:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGf6bX2091009
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nKQe3CSDWeI
	3ZAT/8ZI+HGmO/H88qV/HqEiNJoaBIHA=; b=Bbl6fZAeRvAvbnFXIQFEbyBhgVf
	38cUd16r0r6+IIxFfE9ZjQfCX1FZLLU/xHMPiuL8Eh/L4KAVWQYSySSAJs/u06qq
	LiX2aXBU9FbM++gG9btDEA031u5y4w9UafnNAufNwJ4W0WZkW/O/RuU7dP8xhw6V
	xPCQPCVmXCjpzYSc6h+pc9+vZ2uyPKd0djioqF0yL7qPKDkldCg3iKkQu5b5eoeW
	/8dWmV3zNlw+zHWmpTYSzx4s8lU8d8HCMnXHhTGczjIEuprlLCP5e1g9O95OERcz
	61Lk2oFZjUbxlIljTZfnIRedOqGZU5H80AOYUK3ma3K8nVJEyR+3ve4SYKA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpk2mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 01:16:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba718173d1so40655335ad.0
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 18:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779153395; x=1779758195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKQe3CSDWeI3ZAT/8ZI+HGmO/H88qV/HqEiNJoaBIHA=;
        b=Z9AaYRBqHcOBqy8CKqZKcl7MKcIG5HzqzFnCuJYuO9Cm4fyAFm4sc2hA9p/dfY6n7F
         eC+0FOpqIp7CD3+VA6vftnw6TG6mS7v8X1n1wkW+pbaYUC8mecwaed8xzndhwASuqhja
         xzCx9cmPpGBZueOcWDMMm6kqyfKPutCPKN2DoygOqw+NiZ3/1CVYRA4QBhR1I4l4WBjH
         GAltqH+AbvbrcViFHpGDt8Qi2tatqvX9UsUwU1Z3IzKEV9L1sJgHBEhsovSltmiZch9C
         QGw5emR5HqYnR4rFMsr032UuYymbvqcHHr5c1PgG8iE0gJT56rDuBW8suWx8k83Hhs7c
         qoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153395; x=1779758195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nKQe3CSDWeI3ZAT/8ZI+HGmO/H88qV/HqEiNJoaBIHA=;
        b=n1onypvcO7VgtlCbTFiRZhWRV5ts0b6MsBC220tBYi/+qrsNIlTxgd0IXHM4t+Oj4J
         5uE7fQimT++INpzyIgjpvXvVx25RnB7Rlv8r/EF3UCJs47VX+ta2GOOMZbVaQvH1IoYq
         6+Vh+qku8tJFiKd6gtWfttUm2akjOUGU1aCzGXuhBu9V8KAyp3d3GW2l4jhr3d0NE2Jh
         4YPulRGIZZffby6DTc1EGnaQ9GU5JX2pAsSW9afqdNCcnuWlGkQhxG0MlTgl/FuN3Wh6
         KRPBVjZ9ItN5WMUREGDJgr2VEVoXoxeriCjuuRY3kProw5QbRItsJwHW9rEC9JC2R7EA
         oQrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XxseyfQ4yVaQK+XNI4lzTFE3XElP1dhR+n1Y8axWAOz2TmhBckqcAihmD0TxIrsatlzO8kJI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5mpfm8kYFwqT4avVLceU2qscUAGif/YuBiJwALxHl4dZsgoof
	5k+Qy2OqxcKZft5hbg0rrv9YwTyHPvyjT09xx1q6AYHIxSv+e8V098BBwjkh0kZw879ECJwYCuQ
	eBcXPVcDd72IhqBEZZnl8O0yEp2ULAMU2g9M6Fkco7XrOUV2hQv43UHqjUkN+26J8
X-Gm-Gg: Acq92OEl48SHFD3RFYyppTvA3QKgbMwppErZNYZ4AKNKQGuY6oo38QnA3ZDYX22L5tG
	amlPdDWudiUJVdf+Y5DNy/Ncx0rYpzQ1xlM+nxMwNaXbmeEwt0VYy8ZneHEHo60xQ/Y36dxKmGd
	/0yD3vCL4b7IAwG5Tbi8Jdg7/jBqkmLjk71gldj8rToIUwwxZ/nrXHnwDGPSmZNN9rXhkmLPLxx
	nSCZGn6cGZbQkJ7+QXAfL64ZDhM9sdmqpaYKCaVDI+n0DYCa5o73PecxXViOO/TQ+5tqCUG8EGp
	bdLd1S+eII64GKUyWf5/5xdylinnu2vctWUQMR2RsNwgkweYQtnuR88XiM/W7SkeWbV3xDoHIER
	2+tJ4wNMsC8c87CsYITnlUXej8M35pK4du8iS8jU3x96hLhc1Zg2nEzTHqW02nSDE6V+MTFuKvi
	ZWuQd6ujQqIw==
X-Received: by 2002:a17:902:ea01:b0:2bd:d7b5:83ed with SMTP id d9443c01a7336-2bdd7b5879cmr77645005ad.39.1779153394801;
        Mon, 18 May 2026 18:16:34 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2bd:d7b5:83ed with SMTP id d9443c01a7336-2bdd7b5879cmr77644755ad.39.1779153394333;
        Mon, 18 May 2026 18:16:34 -0700 (PDT)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm151727265ad.38.2026.05.18.18.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:16:33 -0700 (PDT)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] genirq: export irq_can_set_affinity() for module drivers
Date: Tue, 19 May 2026 09:16:26 +0800
Message-Id: <20260519011627.713068-2-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
References: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 33P0vhJKb4FAA13WIo0THlP9eQF_75yE
X-Proofpoint-ORIG-GUID: 33P0vhJKb4FAA13WIo0THlP9eQF_75yE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAwOSBTYWx0ZWRfX7EwEzOnXflCP
 azpleDRwHZ/TlSDQkTujf1yKaYl4tV4RiT+xb5Sfl+lTxxqmybrbsvy1wRlK37V59a29MxvbvbL
 y+R9J5bJw8CR+woO9YkQA3swuiQR47Baq6pyuQcVr/gm6d3JtZ8PCUD6dyxgcdtY9dStpKouOEA
 wc0O6YS3LuDTndRADgdkV08j7+qj9z9604q8O9DapogawuEfyDK5mdcEsg6c4HVdKTxO749EN0l
 VoZSdNrNfWz1vyfocQ4M7LDhpMtDvcQvgdXIJ90CaG7O6loSHVK9UuduNYdpOKBX+vmfZspSrAY
 0n1zwz7E4C202LRBxupNVMzFRKfAr7AA8sUxm+7N32MjeQFaafp79XBU5ONqq4quqK1lzUTzChz
 nVP+vQrDG1RWRvAp0PX7LvuGdKChOHsH5Ccw/za3tnN9xCVk3uAzNiYpl9CpZ26aya2ZOd3PBoy
 UnfloaEg9QZAP0bjm9g==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0bb9f3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=h_boC3gFLMGeuZepMsQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_181637_015312_6E6C8E2E 
X-CRM114-Status: GOOD (  11.75  )
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

Export irq_can_set_affinity() for loadable drivers that need a runtime
check for IRQ affinity capability.

In hierarchical IRQ setups where the effective irqchip path lacks
.irq_set_affinity(), drivers may need to switch to a fallback policy.
Without this export, module drivers cannot use the core helper and have
to open-code equivalent checks.

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 kernel/irq/manage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 2e8072437826..c3aa33ef4be9 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -171,6 +171,7 @@ int irq_can_set_affinity(unsigned int irq)
 {
 	return __irq_can_set_affinity(irq_to_desc(irq));
 }
+EXPORT_SYMBOL_GPL(irq_can_set_affinity);
 
 /**
  * irq_can_set_affinity_usr - Check if affinity of a irq can be set from user space
-- 
2.25.1


