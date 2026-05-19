Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E786CD4F5B
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EdOeg9kry5DCuhVDvfah3Cl7e8TyQfRe7gsfuaY4ir4=; b=unwoxbkrO7jeyMSAJqZ7FgtdHu
	iKvo/UAgW/PHPKfOA2AEKq1pc4xUpCEFeBEGFw9WsW5MtNUym9R4VvrpmfLz5yoDnuSVUsuD5/P8k
	DkPMdhHEwugK0tCwgNq614RUSxWIM3gPgIlYekWrCM3n9GzfLTcBawmyKweYAGU/iJff7qESuwtml
	zrQ9vbE74ZGXRGJOCKm/F7m1wTHeASGuhdXeTei1DGNcPW2pNwOK07kF6Q/FvsAH7I0cGi29g40Wa
	8938dDG/K2V4cIKNzG7au9DWYa0NSiAp8Hk5DzLFniSpsLa08gAHB2PLqVRdzznQLgncCYp7Sru30
	E1ywSAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQ77-00000002cNC-2jsW;
	Tue, 19 May 2026 19:28:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQ73-00000002cMM-3zrM
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 19:28:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEweIS1739353
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 19:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EdOeg9kry5DCuhVDvfah3Cl7e8TyQfRe7gs
	fuaY4ir4=; b=b7QL9BzQEIYUjPGzh1YP6aIuq+IezWk55BiQ0BkoyBruIVDGTfv
	solSi23EZRdJmH/f0lWgHbY6wggn7hXIdfDMn2senOtlnHmaSZo0/Jl3ifWjrgbE
	4XPWW1q6w9C49iebJ3Un+Ye9IzvQ0EezOKsne2TYU/uT98K05D09AA9VoRgy5Dpx
	UUeNz2fZcHHCKgOlh+K1N7UE2vz+OohoPBLP1VkwRAMcGDkKU+xUs8XvTF8FyUQz
	wUfjiLuc8wsh85lS5aXwWBVvHqw6B3ncFEshH1eGxZhaCHOYw/1g0L5wPT6/DGhJ
	dyXtNGl7QNCMA8laPJwgdunPLrjYYOVdFZQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3q953c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 19:28:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c802399c5b8so380447a12.1
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 12:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218899; x=1779823699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EdOeg9kry5DCuhVDvfah3Cl7e8TyQfRe7gsfuaY4ir4=;
        b=kPhzZgQnPUYEeH09WxmGgJXC3WgBwpju03OseY6RW9uVRd80PAB29kA9VJ0VjSU4uG
         KyqGlkM4BegFnTDIfZOr+NCq/UUk16CZNwEhwTtHv9cv1MYKYfWA/a46VmPs4Npbd7rA
         RzxH2P++gXv8Yj/eE2jdU15LlttalwExasObTpMCFbTiLrjaR4bdnLjx0pYVn86cOsCq
         +xtJ0b91TkqKFRRc4CBC4jsOv9ZInu1ugqRKx7yfu/AYMuwgur1BNRaM7mtkbRYiQblc
         MrcUfw62lEnQQwsylkltStv84S3wyC2Kia6DqDrSpibORQi7TbjDB+kLMKFX8xqLPbO4
         OQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218899; x=1779823699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdOeg9kry5DCuhVDvfah3Cl7e8TyQfRe7gsfuaY4ir4=;
        b=A69BMmtKIrQK3mVXvFr7TB6B+Y8oydMafggR8A0DK/C7Q826uFk174r+juJQgghMJc
         w3wLKQdEUSTBNQ7q3XnYXNwvFiAimYp2JPxNdyGT/qR2qApnJuv41KFOb1L6pcUF5xxt
         VwcyVx6cg7jMAE+6Qu9eX6D4EJ2l5U/eaoUHgXXkpwInNouxLJH+OOMiZq+HyHRLyf7j
         fDfmUj0pVCfeCunWpRylRLNx2CsL4hex1S2kjeyI3Q+BS5hPPQNcYbMnWWSvZGFCQb3S
         /lEQ6zEMMIijnNA32iAA2lOBwzG8H7tUNM+9y2N8Y9lQWVTrSloHfPbhay/y7Hz9VAgu
         tFhg==
X-Gm-Message-State: AOJu0Yzcr3L4nYIvyp57OOj6TJxow73eJJ+u1DbH5RNCRXCXgp3qUkbO
	Z/U72FBD0FT0VljRL4lG/icpU34om3ZIhZI9NIUQhdCU3OwsdLvL+QNDA/kuszfvOytULv43oV2
	9YhUL0W0crcj3dFzC+i+QVUNqMFgibsy7Q3kIA09ibIP61RoXagHD7bx6BsXJPLMcoO+1GyU/
X-Gm-Gg: Acq92OEGV85oCbotKV5s06MlmbgR3njgeYvLI3qbS3P6hyUnNvAAjPkVZmxHtIDg+yt
	NNQ8/duU57UJBVn/GEx4UI/XAFLYfmbTBCRQYR2KKUcb5yKfulEX1asSP+HKIsc1aJt0KaOGkv0
	9nMMpCDP0M6lATDo5vajzIyYH39B5KqGV7fSNdrQQZeXz36iu/cKIusFzEVk/vZ27xgtTCYIuT6
	hlMT+5arjep5Qht1d00O1MnmIDVrOELm8ygk4SM30r7psYNwITBKzExmoNHur50x+xaRBzxcn5+
	Z+m22x3gA/HWndJg/O15bnm+uMlw5S6poRgdZZVZ2US4GF1S/3nOUc+moJBBlTSQoNPUpPevfVP
	8jevY92cctg6JZdK7OxC/icG+wbvO6GPvuAsPDL3lN1cJBA2k4rzQg5D9Su9QuZfl10h90SetdK
	wc
X-Received: by 2002:a05:6a20:9153:b0:39b:8b59:4ec9 with SMTP id adf61e73a8af0-3b22e178e05mr13015349637.0.1779218898879;
        Tue, 19 May 2026 12:28:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:9153:b0:39b:8b59:4ec9 with SMTP id adf61e73a8af0-3b22e178e05mr13015332637.0.1779218898363;
        Tue, 19 May 2026 12:28:18 -0700 (PDT)
Received: from hu-rdeuri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm16778813a12.16.2026.05.19.12.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:28:17 -0700 (PDT)
From: Ripan Deuri <ripan.deuri@oss.qualcomm.com>
X-Google-Original-From: Ripan Deuri <ripan.deuri@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: fix error unwind on arch_init() failure in PCI probe
Date: Wed, 20 May 2026 00:58:15 +0530
Message-Id: <20260519192815.3911324-1-ripan.deuri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oipfsQhPkHHnVJv6qVV4bd0FeYmVGVZ4
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0cb9d3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yK6w-Yv6rmC57_qGVNoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: oipfsQhPkHHnVJv6qVV4bd0FeYmVGVZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5NCBTYWx0ZWRfX1pZ/EDeF1Gmj
 sgMYDFheu+LgEQmHJZ9kzJI1gZ90+TG4oyiDm3WLDjI2rqe3261GxnTu5+nwNSM6KWZmRmT5gT5
 26D0YZedEPAuImhYlTKzR8EGpAXW4dTlcTvmouSSJPoKJGWoNlg48GSPCjG//P/x8O/mW+FeGhE
 XsVhUTkTFnzn86f006DJOCbYVt+mpOKWwH8K2zpFmKbqvrJaMTMPqRI1mcYMPRVVvf1xVTeFeBM
 YjyHaWoIQ15k3u557pVM6as7JX3FzC7iVWM+L7hCa4rWfO/pSPPV9Y9gOSlPMNbKeP9+Yf7NWRt
 3d3xvGwRZkgsG1xOPCiPxRe22940MAvcNG21CDBPQb3hjdynkGZSI/1p7+JClQf7w7iBuh7vuur
 GMHYP4brd02yt/JXeoCzEh1/RI0eLAPvhw5qhwdfUFz2rcEYdcxB6cty+YBLzSJ3LRQ89K17/49
 OC81ZwHLSBoB9x41EzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_122822_111257_03E4DE03 
X-CRM114-Status: GOOD (  13.06  )
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

From: Ripan Deuri <ripan.deuri@oss.qualcomm.com>

When arch_init() fails in ath12k_pci_probe(), the code jumps to
err_pci_msi_free, leaking resources in teardown.

Redirect the failure path to err_free_irq so teardown matches the setup order.

Compile-tested only.

Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
Signed-off-by: Ripan Deuri <ripan.deuri@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 375277ca2b89..d9a22d6afbb0 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1639,7 +1639,7 @@ static int ath12k_pci_probe(struct pci_dev *pdev,
 	ret = ab_pci->device_family_ops->arch_init(ab);
 	if (ret) {
 		ath12k_err(ab, "PCI arch_init failed %d\n", ret);
-		goto err_pci_msi_free;
+		goto err_free_irq;
 	}
 
 	ret = ath12k_core_init(ab);

base-commit: 7b25796f571fc09a7aa6fe7efb23edccd326917d
-- 
2.34.1


