Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1607CDB483
	for <ath12k@archiver.kernel.org>; Wed, 18 Oct 2023 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHwUsnxXZMsIPrsWiuNtQJFSAOurr6/6z0ioBwm5LCM=; b=yzWmuJMFzQSmn1
	v8qgC/OBmN6AJsFcuPugrvxLatdi8CTfEa9kY4s3v64A5eSevQmsKznr4gSkepl/w3yMGa222sw83
	A8WhbhEXiNxsvVfb3K85wzl++Pxxuby7+5Iqex9zy/mjNIJHKT+iVrBtCmeXvKtDbVSI1jqxTHRxf
	uGhO2/rMReqtmCjMH+618x1Ak+GEl8dDXTQqn1/g/uROmsRQoQhRac4eMoyENwg0+WmNf/lfV6CvD
	dQfTSItlQVYsNpxq3XSRKD3bG34VxN5HlGbz5ZVNGPaFfb1+f8Rv/P9M03s9rP2oDMIwrEUvcpPop
	x6ha4Sqd0vnmePhOPWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8VI-00F3Ny-1h
	for ath12k@archiver.kernel.org;
	Wed, 18 Oct 2023 15:30:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8VD-00F3M3-2k
	for ath12k@lists.infradead.org;
	Wed, 18 Oct 2023 15:30:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IDPmuL011697;
	Wed, 18 Oct 2023 15:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=8WGHgyQhGMrDBAwzCuGsXDWBpaI3lMoDenX27spWghY=;
 b=NNJfHBV57CQ0wv90/cAFcfsU9wLhARmIJ9P61Vz+XXKl2BRvj6yjoMvKJUDT09RCmv8x
 uUXNcFskPlBajXYyHpm4RXq+rJdf4DOAkKuegzFITUDwn5UZKVECogvmFRSMdQm5zOHX
 uvKRu21hjLG7FNSiLhh2O1r0CT3PecisEeP1jhLAOdZmVmzuMe5QghcQU/durQ/TmYZE
 bwx/W6jtgZ3OF4b2gQ6aj5e31Zz5DBUihvxIGcNZ6C32WoAPhb1yyOLuklDu8lP+kpCN
 R0zmbk/sJec2dz7Jv0WYQnNQJ4s0itr/QckFApcB9tBmfJEskpB4YNu5blXALO40YtES rw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttg82raaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 15:30:29 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IFUSfh001544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 15:30:28 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Wed, 18 Oct 2023 08:30:26 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: rename the sc naming convention to ab
Date: Wed, 18 Oct 2023 21:00:08 +0530
Message-ID: <20231018153008.29820-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231018153008.29820-1-quic_periyasa@quicinc.com>
References: <20231018153008.29820-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4htAaR3Md0O0oOH4WWs6XkcVtpkIbYvj
X-Proofpoint-ORIG-GUID: 4htAaR3Md0O0oOH4WWs6XkcVtpkIbYvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_13,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=664 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310180124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_083032_013853_2ECD68D5 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

In PCI and HAL interface layer module, the identifier sc is used
to represent an instance of ath12k_base structure. However,
within ath12k, the convention is to use "ab" to represent an SoC
"base" struct. So change the all instances of sc to ab.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hif.h | 18 +++++++++---------
 drivers/net/wireless/ath/ath12k/pci.c |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index 54490cdb63a1..4095fd82b1b3 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -10,17 +10,17 @@
 #include "core.h"
 
 struct ath12k_hif_ops {
-	u32 (*read32)(struct ath12k_base *sc, u32 address);
-	void (*write32)(struct ath12k_base *sc, u32 address, u32 data);
-	void (*irq_enable)(struct ath12k_base *sc);
-	void (*irq_disable)(struct ath12k_base *sc);
-	int (*start)(struct ath12k_base *sc);
-	void (*stop)(struct ath12k_base *sc);
-	int (*power_up)(struct ath12k_base *sc);
-	void (*power_down)(struct ath12k_base *sc);
+	u32 (*read32)(struct ath12k_base *ab, u32 address);
+	void (*write32)(struct ath12k_base *ab, u32 address, u32 data);
+	void (*irq_enable)(struct ath12k_base *ab);
+	void (*irq_disable)(struct ath12k_base *ab);
+	int (*start)(struct ath12k_base *ab);
+	void (*stop)(struct ath12k_base *ab);
+	int (*power_up)(struct ath12k_base *ab);
+	void (*power_down)(struct ath12k_base *ab);
 	int (*suspend)(struct ath12k_base *ab);
 	int (*resume)(struct ath12k_base *ab);
-	int (*map_service_to_pipe)(struct ath12k_base *sc, u16 service_id,
+	int (*map_service_to_pipe)(struct ath12k_base *ab, u16 service_id,
 				   u8 *ul_pipe, u8 *dl_pipe);
 	int (*get_user_msi_vector)(struct ath12k_base *ab, char *user_name,
 				   int *num_vectors, u32 *user_base_data,
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index fae5dfd6e9d7..3006cd3fbe11 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -424,12 +424,12 @@ static void ath12k_pci_ext_grp_disable(struct ath12k_ext_irq_grp *irq_grp)
 		disable_irq_nosync(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
 }
 
-static void __ath12k_pci_ext_irq_disable(struct ath12k_base *sc)
+static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 {
 	int i;
 
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
-		struct ath12k_ext_irq_grp *irq_grp = &sc->ext_irq_grp[i];
+		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		ath12k_pci_ext_grp_disable(irq_grp);
 
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
