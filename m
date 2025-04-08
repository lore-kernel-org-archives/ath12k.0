Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25D4C369A2
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JChD1O+yvBzCtKJYKyDcBQV0cXUyrIoaCqUHMw537Mw=; b=ecoFNQvE42KUcy/po7GAUyCBh1
	Q7jLOPAq5h3ZQtssFHQrfRIQTds7vyOwmpCq00YyJf5piJAQYhhqAchPJ4qft0pJPlL4LeOHAQS4u
	rEuy95NLkDWCt6RNJo7VJog/OvhXBWTrbZFTetrkewl/Sf7/H8chprsCsjsQ6a4RZ2CYCSPF7iOjU
	PW+NGRNW8EioyRbMlcA1lN/MInsA95hQSOek9sK+w15LBcK8Vlmi3epb+tF0j6DDN3XGKFNgDnGIs
	RZSvJZv7sf/PJSxHVKCP/3PYgmmEMojSTBQV8yKKh3ofyW1VYBTYX8pyWXOoCcjy1+OmTHwTdCl/8
	npqRR8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bbi-00000004mGD-39dg
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 16:15:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Bae-00000004m1B-49BG
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 16:14:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BIEf7019609
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 16:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JChD1O+yvBzCtKJYKyDcBQ
	V0cXUyrIoaCqUHMw537Mw=; b=WN/Y6nFOrDT1UqPuXYnL6kcEPZ3GE6wdWWvZJS
	mrQkLkuCkMLwTL1T6gF75IgU+U41DniIV/Vqd5vM8j+nd7wwspRcYG1t9/VYMyt1
	wPIjp0AxGpzrquaVgP2asBqRSBu2gZy03WmC1hdPjk1LkitKor5hqubFG7owVlZd
	1KTK97lhdULYJ77dd0jmBykLzPZGl6UpKHT7LZ9geLUebjHur8nMDMn+WOkcAM0U
	z0lE80k6+b6A4EneHJV93zyWDsKnRaSE7sltgPA0ryCvIoYBL6kjLeRf1Qa3sfTM
	dagWWD3c1KevuHngcaJIkJ2gbTRkyEIE4SkeDAfXmLD39MXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3gbpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 16:14:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso5222031a91.2
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 09:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744128858; x=1744733658;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JChD1O+yvBzCtKJYKyDcBQV0cXUyrIoaCqUHMw537Mw=;
        b=vpopOcusWuTawxapzJpNe2JQWJ6i/TJaTQ7PfFZemYaCBVh2AWn2Vn+N+y+Pc2kD4/
         yxqBkOchmIqtq4B52JftWev2hsSlpFFjz0QPHCP2w8EZtMbxWdEOa9eOGSNlDoQZ8UXB
         Y2LTxnGd35AlxIciohWueRZve0FFc02Z4I0zj4CcsbAyKXKqQcN47B93M3SGn5yAzqck
         iHb5BT+n/d8mDalQ65M05v/+qHwnFedjSbvmLNzR6EQK/pnIUx0wzuns+9mDPcO4rNmd
         N7/KJ4dugeaq0GUFafqCtLydIQz8xrE7pBAw1NsXYsmTzap4o/tcJ0Z4Pvh9y5DrgACA
         iaWg==
X-Forwarded-Encrypted: i=1; AJvYcCUHIf2CjCwGWjrTO/tvbMfMlk/+Mb09GoOhAm/CEGc986+UIUNoIRzr72MxtoZHgtmns7rcnxc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww7b6QmESJw5smuQROuAezweeFQIB7MKqcPdaFRgNT6waqhlQT
	VXeIp923Xe65bqE2K31tA54ytld2xN1SauZNU7i5EH471EGnQhBxbcyGCzz+4hizlKnHCVJeLaA
	4bjRBNCAfpx0tMPFTesE3LBO++Z9TnQLKp3hOYosx7hqhIqJGZF/e89BJ9FkX
X-Gm-Gg: ASbGncuTg93SN4gPPpAQkPNEjsGrjs/iq24efSXQySHNhW9ADMbm8lgDZtJRVQEbvBt
	vnomb8P6TC2bUv4nZBGDSo80zr83EBUcCDpYGKUWHqsedfthJTnZQzR9CPSoo1CEJiPopofRzT5
	6tgy+gqZRonEfLt0VXhWJU2kUr9jRUWmHoAbPvLigIR1LHCkTxH+rNDwp8HX1SyRj/s0RMQJrzr
	HZLkrijJLRmnQluIsC6L04q2rmIUhYi4dUoZvf7uiLhgC0PlB//dtn0e8zQy0IkpvVgLS9KK6Xa
	kpDKDMsliwo84EEGeKMPb/vXgo8EkuPKK1hqyddHMJa6T5OM1Xkk
X-Received: by 2002:a17:90b:568b:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-306a6153940mr24692351a91.14.1744128857868;
        Tue, 08 Apr 2025 09:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOioE+oyWgP7nuMALMOBlPvbaof1KJ+SidMoWLQ93dXA/LLo0o1Vnym6X8fAaQxiq3YX1F3w==
X-Received: by 2002:a17:90b:568b:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-306a6153940mr24692273a91.14.1744128856950;
        Tue, 08 Apr 2025 09:14:16 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a32066sm11217405a91.27.2025.04.08.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:14:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 09:14:12 -0700
Subject: [PATCH ath-next] wifi: ath12k: ahb: Replace del_timer_sync() with
 timer_delete_sync()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFNL9WcC/4WOQQ6CMBBFr0K6tqStUNSV9zCGTMsgTaDVthII4
 e4W1kY3k/z8vPdnIQG9wUAu2UI8jiYYZ1Pgh4zoDuwDqWlSJoKJkhXsRKMZ0NcN9hixDrPVVEk
 NR1k1ooGWJO7psTXT7rwRiB21OEVyT42CgFR5sLrbnFs3gLEb1JkQnZ/3P0a+oz8mR045VWeQH
 AWXqmJXF0L+ekOv3TDk6ex7o/grEkmkJTJWSF22WHwRrev6AZ6aBkInAQAA
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: ZOnk71-jBNfHpQ7e7GlP_pHn9gzPjLYN
X-Proofpoint-ORIG-GUID: ZOnk71-jBNfHpQ7e7GlP_pHn9gzPjLYN
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f54b5b cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=rOUgymgbAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=L6nWsz-Al0U9Y10IXFUA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_091421_166902_506EC8F9 
X-CRM114-Status: GOOD (  13.94  )
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

A linux-next build error was reported in [1].

This is the result of a treewide timer cleanup [2].

The ath12k AHB support has not yet landed in the tree where the
cleanup occurred, and hence a new call to del_timer_sync() was not
addressed by the treewide cleanup.

So fix that one instance.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://msgid.link/20250408105146.459dfcf5@canb.auug.org.au # [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=8fa7292fee5c5240402371ea89ab285ec856c916 # [2]
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 1c2171e2bb73..a9d9943a73f4 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -334,7 +334,7 @@ static void ath12k_ahb_stop(struct ath12k_base *ab)
 		ath12k_ahb_ce_irqs_disable(ab);
 	ath12k_ahb_sync_ce_irqs(ab);
 	ath12k_ahb_cancel_workqueue(ab);
-	del_timer_sync(&ab->rx_replenish_retry);
+	timer_delete_sync(&ab->rx_replenish_retry);
 	ath12k_ce_cleanup_pipes(ab);
 }
 

---
base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
change-id: 20250408-timer_delete_sync-b6ca367d2daf


