Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0C3CC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mz0bzaFxUOs/yhflal5pNZ93HwpCHwYdrX0Fgd8LfFg=; b=dpoJ2Coy0p3UyCY6DbqXV0sxrP
	YaGOjDWneaDoEgjWS383fe5KenfVkT4GIofR5ltzfQ9uyIWn1GMMF9POC1nGp0zvZwZ37scCccgrd
	V/8ZKSco0uIfUxiy8LDKX6TSo/6jUWaDCK0gt/dJozKO35IfRc/6uivHBHKU9dswdWZTP6zgkuVwI
	vmmfVAXNMVcR/8QAZ+nEGPA7Bwm3Xbr+9XE5BPsXTuD5f4le5a1XJLs3hcyDtCDiW1xT1VMxXbj6T
	fLIwWLAO79zr5a1ARQNb6Vp5+N7s72WdTM6bVakhnbRS4dpXp2ZIOKbKvd6/6LkhMyUNLRzLMloh+
	luORrrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH5T-0000000HBIZ-2MOi;
	Thu, 15 Oct 2026 08:45:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH5S-0000000HBIK-214N
	for ath12k@bombadil.infradead.org;
	Thu, 15 Oct 2026 08:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mz0bzaFxUOs/yhflal5pNZ93HwpCHwYdrX0Fgd8LfFg=; b=IxJsxchSkbj5fHu1Q8PrJETDDO
	aA7EuXmkjpE9zX1VdY1Inw9nHDy5ejAygtB2lL98JmKBJLkgWe170W1agoy8ddjXXZiWT3rBrh7a+
	5aWjvHi8iGHbk3uYuIZUXSBK6h0W3VdxdRNb+YzjGzvrJ8qgHp4WfC7crTfZX/FXmsacSxsb7RREA
	ceccwrerbGsmgISaGGwBPk1acb0vVLCv7DrpsCWLVPWZZuEyBYDzZIFCUdeDFDOvV1Nik9V1vZOWk
	xNi6yKF3XtH/DKz9MzeMNIq4S8bfGMaIEwLmcLUyf7uZF/OHu+3jE4K2AJkls+nqJuYFRFKvBee0M
	JGNzsl6g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHH5N-000000007oa-2nQS
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 08:45:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6lZuK586364
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 08:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mz0bzaFxUOs/yhflal5pNZ93HwpCHwYdrX0
	Fgd8LfFg=; b=YcgP5cpzLCkMETzZvTod7PKLJ+oG/nW8QuwP2/E/X+e2Lh7T03Z
	hmFkks/+kKwv7pNqapUAYfsZZlAuYqTZNHCcTEoft857osi5nsURmMLYvt8v6/0j
	6fyPShZELoOFuom2ZopO+Bl68QnO6zmK27+a/nmQjxVQx+RK7wP/WBKJhi8HqGnK
	b5PKfMXf7ISTukDQekaswWwNBnVhEhDWQtgy7eLYRg7DmrTJwRsAVliiuwJheLIl
	zQo87mijw2naBZDBt+ceW/3y5KHF4RkKeGWPSE8Rp2A1CttsfMqXT57q3dmDi+Hg
	3N+gzbVkKS7h1OjwFUnhdX3rBpkBDsgvCWg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdesv56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 08:45:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so2789351eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053909; x=1792658709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mz0bzaFxUOs/yhflal5pNZ93HwpCHwYdrX0Fgd8LfFg=;
        b=VUhQtZfni7wN+o3JCiVf7f+inhq2BcJzXB8ViST5H6U7il42DK3sxvL0Z79ppMsy6L
         HREm8pJChMm8HF73bKKpt0oMqakRFv8nSJTtOCSOTy6hRu6ikvDAQvUmTz3MyynNK5Vd
         178RBI96AAKCYNS6ouEuunl7UmBX9RtOlneVvcnVYKj924MH67W3ZXenlLiDAFXyrR1H
         VQGdyXSByVXyFy6fuIX0wVwF+GRTGVbJilhpHRN/JNnoE76xGRINwrkKD9/q0SZMgL81
         H6q1K8WEd6I15aYLpLTGLwMqtkR758eVXiYOixo1YwpoOa0OSyrtXozu1lkxeSVEeFDp
         rXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053909; x=1792658709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mz0bzaFxUOs/yhflal5pNZ93HwpCHwYdrX0Fgd8LfFg=;
        b=DRBcjt3fB2g73t2hCa4opv8XicNMxc2VaPh2s3pFeSe14mNYV6HMpN+i/8Xatkipha
         usyDHtQivKolZqEDRgLvgr/WjHRzGOpwInlJrgQ50nUCRMgsMG4hHer9AGzM2qosltmi
         ue5AxRDPthtIfeUmZdWTqT/FwcsMgeDPbQ9fXBe3WpnHTBuNMoyGPjSsWaDypV2NgVeg
         CMyf/rtqjSQhzxu/0ZE0o3VWw8rSXSAiPKgglk0skLbSzMNjbwWj4W06b6RvUjnQbX6w
         XorCuIiS2bzk8uPzV0j7HvTujp0tpdmVzeBR5iczU08aPCqYk8M7cgpo7BDyDeZbOcBr
         VKDw==
X-Gm-Message-State: AFq9FYIlBUOgh8fMelTqcGliF3u4dHcwZ2iL5Nq9txE9J4BgRSnZ0XzV
	K+6IxLpl57L6dslUGIAS+OOlDjAOgRu7yH3ks50o4XI3JdE3vpPjHYjIcklJnpEumFKkdFEmQn1
	KPqBa+KKw8uXL/0tw9t0fLAbW2ud/qvtW+YQU4AC3K4aNICHfNax4hUpI9tpE9gRbQGv+v04q
X-Gm-Gg: AYBFou1u59ora7Wl8SmGK/l6p7ZpwnEch9e41An/+2ONa2UzTm1BwxcuzM0hVjZfxoV
	3FQ7gd7kfXCnT/mAL3H7s/H+UB4w7aMQBW3ga3ISGHrpjAZL5fjFcye1otgHCwSPrgDGO/JMsdA
	Y0HxlJcRAJVqNYi8T13GOZssDlNrUpYjYgdAdJtzOSIgH30N5AE8lxxHXF/G//22BEfpUOVR++0
	fh+MEYWIjieg629a9ICg25VCTjFkbjLtLyk9sQ/0EJ+jSa9a87irE6VW99k3PifRfwABoXffWF2
	1mDyOwgj1cxafmNxCE6+zLE7nt1sYcSUibgJ9o8yPSAdk3us6/wRga57lQlp6u9hVg7bAopcOaT
	xf69xBFW4cQzKkJGrjJoncV8KBs+fLv+yq/65ghn5o4jzSPTZoORvrA7gMVNiLjP1dSLfA7Zdjm
	qXgH3CurYdHmWqIVW7
X-Received: by 2002:a05:693c:42d3:b0:35b:17b9:ebc8 with SMTP id 5a478bee46e88-35b17b9f562mr15075929eec.19.1792053908957;
        Thu, 15 Oct 2026 01:45:08 -0700 (PDT)
X-Received: by 2002:a05:693c:42d3:b0:35b:17b9:ebc8 with SMTP id 5a478bee46e88-35b17b9f562mr15075898eec.19.1792053908340;
        Thu, 15 Oct 2026 01:45:08 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm64646942eec.12.2026.10.15.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:45:07 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, praneesh.p@oss.qualcomm.com
Subject: [PATCH ath-next] wifi: ath12k: fix IRQ disable imbalance in AHB ext interrupt handler
Date: Thu, 15 Oct 2026 14:14:45 +0530
Message-ID: <20261015084445.3045925-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad09296 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NpINWkwEc0pFvE3pZ_QA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ep67cECaCpUp7auaIwKX4BQgopOdqN4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX2ATW+41nlna8
 1dDd3H8FQTDUaKOmP+9qh7spJFCFpXmioabk74M5ysd7H2hVtzzvtJSDAH3AYfWQBNqXa2fejlK
 dW+9eGNXSxLOZcqeLq1bmhi9tyrny96ixg4fbP37atGgSnFAxskvv49qjPAsRb0vLPlwL+2sLvV
 rred9X8Xi+R/S8uJKIZF5PQFJV20CF0OzA40pdxW4tBGUGcZYY1Bvo8YyetypJFHTi3N0lSjFuf
 FayM4YCRuhlVPgFs9mdgXGnxoPcgjl/WoVzd6/mSy2grV7ues06N1QXJy9qz3LeuEXrE2bMM71v
 n4FgBPZMjlKTZJF8VaZasIGVLLZ0Dl5fFb/88YFAVfLhlcPWatXFvwujCTyEmS8DLkUAl6wSiVF
 eZT2FPp1oplrPtBo6ra5g1ZyDODV/jWr0ku8IIV6ul+WcwPdtSpfjr+iZwDOdRPLCcJgleeBuIP
 n7I7caLKHUJVoafMjzw==
X-Proofpoint-GUID: ep67cECaCpUp7auaIwKX4BQgopOdqN4g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfXy5SFadDOkXTt
 Im3uZ+yVYjS7okfSJEqMIoaerryQiVf3+mExvEC97XA79qJGztW9/RpI0qeTjAHJkunbT8oBVNp
 d7by+a4Bq3+Rjtx0dyYSsB9R+nAzyuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_094514_031511_1FB02F4C 
X-CRM114-Status: GOOD (  17.71  )
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

On AHB platforms such as IPQ5332, IRQ group 3 maps multiple hardware
rings to a single NAPI instance. Each ring is assigned its own IRQ
line, but all IRQs in the group share one napi struct and one poll
function.

When two IRQs from the same group fire simultaneously on different
CPUs, both handlers call ath12k_ahb_ext_grp_disable(), which invokes
disable_irq_nosync() for every IRQ in the group. This increments the
interrupt controller's disable reference count for each IRQ twice. The
single NAPI poll that runs calls ath12k_ahb_ext_grp_enable() once,
decrementing each count from 2 to 1. Because the count never reaches 0,
all IRQs in the group remain permanently masked by the interrupt
controller.

With no further interrupts, TX completions stop being reaped from the
WBM release ring. The pending TX descriptor count grows until the WBM
idle link descriptor pool is exhausted. Once full, TX ring allocation
fails and no new packets including management frames can be enqueued.
This causes stations to disassociate with reason 34 (DISASSOC_LOW_ACK)
and ath12k_mac_flush() to time out:
"failed to flush transmit queue, data pkts req N pending N"
where N equals ATH12K_NUM_POOL_TX_DESC(ab).

Fix this by using napi_schedule_prep() to atomically test-and-set
NAPI_STATE_SCHED before disabling IRQs. Only the first CPU to win the
atomic operation disables the group and calls __napi_schedule(). Any
concurrent handler that loses the race skips the disable entirely,
keeping the reference count balanced. Guard the enable_irq() call in
the poll routine with the return value of napi_complete_done() to
prevent an unbalanced enable if the NAPI instance was re-scheduled
before the poll completed.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.7-00587-QCAHKSWPL_SILICONZ-1

Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 2c55aae06dd0..e5bbfca2b2ac 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -602,8 +602,8 @@ static int ath12k_ahb_ext_grp_napi_poll(struct napi_struct *napi, int budget)
 
 	work_done = ath12k_dp_service_srng(dp, irq_grp, budget);
 	if (work_done < budget) {
-		napi_complete_done(napi, work_done);
-		ath12k_ahb_ext_grp_enable(irq_grp);
+		if (likely(napi_complete_done(napi, work_done)))
+			ath12k_ahb_ext_grp_enable(irq_grp);
 	}
 
 	if (work_done > budget)
@@ -619,9 +619,10 @@ static irqreturn_t ath12k_ahb_ext_interrupt_handler(int irq, void *arg)
 	/* last interrupt received for this group */
 	irq_grp->timestamp = jiffies;
 
-	ath12k_ahb_ext_grp_disable(irq_grp);
-
-	napi_schedule(&irq_grp->napi);
+	if (napi_schedule_prep(&irq_grp->napi)) {
+		ath12k_ahb_ext_grp_disable(irq_grp);
+		__napi_schedule(&irq_grp->napi);
+	}
 
 	return IRQ_HANDLED;
 }

base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
-- 
2.43.0


