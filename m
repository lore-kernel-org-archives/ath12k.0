Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED567C369A1
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6ANBOqm+FiRypMhdH8047TO8EdqBvFBZWgckBGsDFA=; b=hhnfOWZGoBb3GH4m6wXGRYNLhD
	FitQglXCzTZKstGlaobZqECaxbCxA9Fcqo9hkjivPuZKS9VWRl6U5bVcA+wukaJPk7LSdzzUk+wT3
	qmM0zqYvdAD8Igg4Eyw43PBKRF2d8SSJWytKyr31Xmj1PdCNigmC5CkxhSCiLw7JcaU1urVwza9w8
	Mcy0ETkYh6JpSMuHOsw664aB7emUvHFTIuylSYHND5BmDywQaO8HD911oZTot9OFuvLzdblGwqNel
	dGbu8NGcMLPnOnS5hDb5t5s0oYOw0YhoRW+WRChYucARvst66h1fgl7PWOqFKrrZyCsg6LJcRAsV9
	T7sLADBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Bx-00000002rsC-30GS
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226t-00000002qnH-1wJw
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:07:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382HMFN023306
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6ANBOqm+FiRypMhdH8047TO8EdqBvFBZWgckBGsDFA=; b=XUJZrGbdeos3HrnX
	XrSgA6xaIKcv8ySusU8gbY0+zXeDveJO2b9sXbJU018QHJ+cDDAgNFgch7zyNMS7
	9xPdNm4nXdYfTs2OQBBCyBXkjmxAQQZzL3L1LEzFFdN22gZHFkQGURQjBpFh3ABz
	+3NcMKr+09MgPIvklf2tG7R8vc1fl5aRhLK9cIa5XHq7dnncL0hMWHlgioEqPiRX
	Hen8MGQRvGswMrspM1yLuzEAey8OgehF8Ec+tKjnQRP7DFFgUllVYskxvlenQorS
	1eqiMITKcJh+JOvLsl1BIe7Q2tR55jxtaHzAFkTlh73IeW46cgdUxIx1JZCPA73c
	uMIwJA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftekpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:06:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736d30d2570so4510659b3a.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092418; x=1744697218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6ANBOqm+FiRypMhdH8047TO8EdqBvFBZWgckBGsDFA=;
        b=vqGN6grEhzDPb4mye0M7/AOOc+C7LeTankZeqvRyQN8QncRvXnIySsE8WQOOXKXlP9
         X5DvWr/OtYPW2kKLP7owOzqBFaoTfDpvX9MGWj1tPcJVdbjDbrDMUmI4YSb58hoMz1LO
         9ULyH9qkxa8jQBtt5lOZk3JDqnlwtLacEiN/waNKvC4y/QHsHgRnAAd4radIrK+M9rIY
         wI8/Wg6uAiZk0Jxyv94zvUdyZs73KBQDgbSz6husj1hkiM2NiI6mYZt1zuEqrJTfWd7f
         jwr98uM0TA81Qg/P1+nnyLJ8ythB2qfO7ZbGDtzhdQlMMhFAettQ2mL3gbloQTpXsBOK
         2bGg==
X-Forwarded-Encrypted: i=1; AJvYcCXIO2+k4mDDK+XWncbAI0ss3iyB9jJcv6PaSnnazx2wV/HTrxd8zHimDmGG7kMoRdEP7LTTCUo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7K5co2EIaf+7Ll5/sp1NuR9GANq7pdB1kkZ2wX36qwCf6zKY/
	5qCMvXvSMt3HqUot/9l6mVsoTKIKm5AAplKS7Ls9A0ToTqnmqy0ofCJv2XSSLmaRLW1kvSAc965
	vKDkglNyUG+VXLckpxopNk9LcExNegVL3YikKEFWZpC+L3cbHOhgf/sk13L9fwcLFrkCL
X-Gm-Gg: ASbGnctcWs4j0bMhsIYhF2X3+5GihQ+Q6dg3Qs5mg3sMQfuUGT+BN3n1MGYzIpjJtme
	MIY0SHaBa4GbpWs547orLvOYFtO0QmHdwN+cPIwDJxxHwa/XqzpaDVi+t/gBF9ymBCeFSoaVGJp
	ieakbzlUViwFvRBNhekAlcpRzigsMPekYSqeTqzfYX1OykewD2etHFTK+0CIh9kOxHMFCIpLMcE
	lS2X+1JGT/ADuXpaxHKfeLqx0Xinp1eJ5Ih+9b4xi0zY4Zo4xGKsJaUTvnChmNfUTALxoVUhtpe
	aSVfvv+nTw/atsnvPbmuyCckW808sDZqDtPXrp6R9zbVxN29iBFfX1iOKjdV2tl/Fc7NzfQSFO/
	bBKyUv9LrV/4U0FUccTygLovFftjJCs7p5aZWc/9p
X-Received: by 2002:a05:6a00:2410:b0:730:7600:aeab with SMTP id d2e1a72fcca58-73b6aa78298mr13548264b3a.13.1744092417860;
        Mon, 07 Apr 2025 23:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwlsb6E3Suvk7p5xaMWgdWjGgmaVwWbrEHvBE+yrmvdnE1XhramEak+pBayohMqzjrBY9Qg==
X-Received: by 2002:a05:6a00:2410:b0:730:7600:aeab with SMTP id d2e1a72fcca58-73b6aa78298mr13548238b3a.13.1744092417396;
        Mon, 07 Apr 2025 23:06:57 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:57 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:33 +0530
Subject: [PATCH ath-next v4 5/9] wifi: ath12k: fix firmware assert during
 reboot with hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-5-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f4bd03 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fe55Uragd4x0HF6_gBkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: e978yx207WhB-uFqU2_TQxUUemv0z7UX
X-Proofpoint-ORIG-GUID: e978yx207WhB-uFqU2_TQxUUemv0z7UX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230659_516218_C5BC8AD7 
X-CRM114-Status: GOOD (  14.75  )
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

At present, during PCI shutdown, the power down is only executed for a
single device. However, when operating in a group, all devices need to be
powered down simultaneously. Failure to do so will result in a firmware
assertion.

Hence, introduce a new ath12k_pci_hw_group_power_down() and call it during
power down. This will ensure that all partner devices are properly powered
down.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index aae1989c686bda37c12544e72338bbfbc5f75042..8ee532dcc2652ef4b92bc4c4346af47b783a6708 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -1757,13 +1757,34 @@ static void ath12k_pci_remove(struct pci_dev *pdev)
 	ath12k_core_free(ab);
 }
 
+static void ath12k_pci_hw_group_power_down(struct ath12k_hw_group *ag)
+{
+	struct ath12k_base *ab;
+	int i;
+
+	if (!ag)
+		return;
+
+	mutex_lock(&ag->mutex);
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		ath12k_pci_power_down(ab, false);
+	}
+
+	mutex_unlock(&ag->mutex);
+}
+
 static void ath12k_pci_shutdown(struct pci_dev *pdev)
 {
 	struct ath12k_base *ab = pci_get_drvdata(pdev);
 	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
 	ath12k_pci_set_irq_affinity_hint(ab_pci, NULL);
-	ath12k_pci_power_down(ab, false);
+	ath12k_pci_hw_group_power_down(ab->ag);
 }
 
 static __maybe_unused int ath12k_pci_pm_suspend(struct device *dev)

-- 
2.34.1


