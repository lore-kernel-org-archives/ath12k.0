Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D662FC83F10
	for <ath12k@archiver.kernel.org>; Thu, 10 Jul 2025 01:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jDXYe4jNUNSVfeCbq0YdJ/kt/3BAyjDi7f8EfK0Ccs=; b=X4akKVMoYEPUeu9UWq90g4akmw
	miee+eo9p35u1/nn2XXO/RAEINh83yoz14jOdecD238NNPpJzS35N7Em3SEe40lcqqFr+pkyLB3pv
	UGKxOyHS4MFht/fY4K79PGvFcMccDjPakc7Yipe2gzWuyINQ9c+Y4poJjaWkVF53xigLbK16MyhT8
	ot9m8u/d5Yz+GxibUVuIiL/B+8+dg9uJ8+t0FIAbwORWR3qAvdS2UMGXQ4D6b0ainGQ6LgI8U2QXQ
	KDSisJzd7dJlAHvOd5YJvMwxBC4qsCwkJ8NGU4e+c4ZJUTm6YDAUyOWwsxfq4npWaQiXPG0cjXXXf
	mUvHS+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfwW-0000000APd9-2cDi;
	Thu, 10 Jul 2025 01:19:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfwT-0000000APco-1Dri
	for ath12k@lists.infradead.org;
	Thu, 10 Jul 2025 01:19:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569ColLW030248
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 01:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=/jDXYe4jNUNS
	VfeCbq0YdJ/kt/3BAyjDi7f8EfK0Ccs=; b=EvwgnK17vOq8xd6BPFE0kJD+/ej9
	vIA4UwjgKY+tfvBxF6bhHubhe2le4tvhG/nOyNpKN0mB1elyP1Y0WQqbAUAqZy06
	6Sm6za6BKF+y+Xrwy3Qi3o0/gy/2o/7XjVONDbcyPhxmpTJUPKcvrlV2TNLH+jpK
	oMrGqomybWXGMFPayiNSJlKz4QD4IBPpcxBLhPfpKQ41lgEscFghQS590r4GgSib
	JlA9/H2sYj2G9wFQu+DbSUCp5apQ7799cc+Chv+U/1xuOkSZE/ED1CEX2irHd3DY
	zyjYWjGvbzDSTuYkZXdXRuSZ44OI8A0b5DRQducMc7uCVlrVMob15YsiHg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg2x34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 01:19:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so381255b3a.3
        for <ath12k@lists.infradead.org>; Wed, 09 Jul 2025 18:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752110354; x=1752715154;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jDXYe4jNUNSVfeCbq0YdJ/kt/3BAyjDi7f8EfK0Ccs=;
        b=F3AgKiAOG0EE4r1j3TEtzqYAP++CR5uPj0+SkkG/ksfBahaudEN82Mvxr3fJzIJ9Wv
         3tbLKKedwzq3d7sXXcTmZi9eDncTx1qPRI9Lv4YUIHN7hLLWEX8QDNRGsHGDzTBmdPme
         /xZibLMCRh1QR5h8TpRZ6uk9aP1S68bluhR0vxKLMJ5he9c9aI0+qo6faoJlst+jZqrY
         nJka/GWzjzkpbWx8fo6urVKUd0ubn1SGGEmH+jbuW9ti5y4IAAFVseYJMQpufrNt/+2u
         7+DhDzkzaLBvNcRQMqaNQ0ZD9Zru9SVQBkReHP1dNZRuqSJtJz2d1jLtVVdfKsB4v2CA
         xsug==
X-Gm-Message-State: AOJu0Yzje2ShikzhUrYv48oMYZJ4QW7633RjP6zoJRzSlGVouklGEyl1
	9O1Uom6n5C/xBVweoa0lyF2uUfiu02W9A/k1CZFiTFm9l5/l8kfr4p9r3e1T/CbxNoIFZR6FZBv
	Ui9D3T4SwjtKrEKyb2AOV3bvKpYLvLy72+mG+Cg1tAK7vDG/mIepHFJxrs30rHXXg1impY3Nu
X-Gm-Gg: ASbGncux8HUkoKYuMXATIRksbwYPxlWCnm0OjLn/uZP4Pp410HTdC6AfqSEZAEhk+u6
	MBhNASTcWGs1WIO1anTFeVDoRq9oXep6vVwU5/jyoogInLJ3IFZNl4XURaAn/1Mlbxp4fyLYNdj
	8Hnyp3lkiFV8op5tYKjlRaYaAHR1RvMtDCSs3UY7wI/JbPhfNNiwTlnK0azvxe4R0AlEKV08lPZ
	7bsbDo2MYhgUW7/hAYUcicj2B24VOsr6HyidhQHxMUiTJ4z2DkkCHv2T+w+XoGxyQZm5qqjdlEW
	tAMWhIChwaWW7jpRbVwzKL/5xAoExyIVDXvvFXI1Dfqqt3YciSMyPXJFzGCNhikugLgTJl0vvA6
	9bISPFyQLnQi6KSuG5pLfvXm+nNxpKS7LQQmHmoyyNtzVybgPP2t5pkdl
X-Received: by 2002:a05:6a00:6d56:20b0:748:ed51:1300 with SMTP id d2e1a72fcca58-74eb5453bdbmr1515537b3a.9.1752110354292;
        Wed, 09 Jul 2025 18:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEuYYjd8vj33kOZ8Ud/o/aPFfBOH5+ENwfi6X5/1d4bydiZcoA3aNmQbv0/jWJV9AdXdprOw==
X-Received: by 2002:a05:6a00:6d56:20b0:748:ed51:1300 with SMTP id d2e1a72fcca58-74eb5453bdbmr1515517b3a.9.1752110353823;
        Wed, 09 Jul 2025 18:19:13 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4caa9sm359580b3a.111.2025.07.09.18.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 18:19:13 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, tanguy@squaremind.io,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled
Date: Thu, 10 Jul 2025 06:47:54 +0530
Message-Id: <20250710011754.559817-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686f1513 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6JxCxXzoczi57qTM8cEA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: cIG_AnxVRavvTKcYXdKPDyLxjvWwLeDm
X-Proofpoint-GUID: cIG_AnxVRavvTKcYXdKPDyLxjvWwLeDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDAwOCBTYWx0ZWRfXxpBOFj2HIttX
 HXe4Rgawn4zrJ9li1ZfSMhlhAzlHgZ7Fv8023qrU3KiZGJImVGASQx9gNzN26mfFLUcfl1TVquT
 9zN+jrA+RH9OkwWuM0Z1okjXfD7M/4w2nEHhDLI7BvjYnlrgc9gQJiN92FSYJn8fDFZXloP2K5F
 VulGmhUtv4/q+Wyt5T2Yo8YzAVYgBXNz1BoYfL6E848ziPYlhBxrQQYGLvpd3tCX+RH4oLBhUmS
 LrBoAd5sDTCDIZM/19aizVTLE4Dl8EfYZAsL7fNHdqCkjupZqU5dn/boETXE74E/c8+mamsT2Lb
 lW69xW0MQuzIHlNBwhsE1jRmcIcORcXRjDVMN5j/GrNUEgtjJUnSE49RRTc5dPcCcJcb9/eLGfG
 yp1mgYrfASwp1qfAMIrQFK31ZLmascWg6sXcw9tH4n+Z7kpGfE1ryEzcz02J2OX4u+o7MpdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_181917_360677_0B937039 
X-CRM114-Status: GOOD (  14.29  )
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

Currently, packets are being received into the WBM error ring when
REO queue lookup is enabled, resulting in degraded RX performance.
The issue arises because the REO queue LUT TID memory reference is
set to zero-it's being assigned before the memory is allocated.
Fix this by assigning the REO queue TID memory reference in the LUT
immediately after memory allocation to ensure correct packet
processing.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Reported-by: Tanguy Serrat <tanguy@squaremind.io>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220282
Fixes: 3b9cbce6fdd3 ("wifi: ath12k: alloc REO queue per station")
Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index ed325aa6322d..65b4c91e4fe5 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1060,7 +1060,6 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 	}
 
 	rx_tid = &peer->rx_tid[tid];
-	paddr_aligned = rx_tid->qbuf.paddr_aligned;
 	/* Update the tid queue if it is already setup */
 	if (rx_tid->active) {
 		ret = ath12k_peer_rx_tid_reo_update(ar, peer, rx_tid,
@@ -1072,6 +1071,7 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		}
 
 		if (!ab->hw_params->reoq_lut_support) {
+			paddr_aligned = rx_tid->qbuf.paddr_aligned;
 			ret = ath12k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id,
 								     peer_mac,
 								     paddr_aligned, tid,
@@ -1098,6 +1098,7 @@ int ath12k_dp_rx_peer_tid_setup(struct ath12k *ar, const u8 *peer_mac, int vdev_
 		return ret;
 	}
 
+	paddr_aligned = rx_tid->qbuf.paddr_aligned;
 	if (ab->hw_params->reoq_lut_support) {
 		/* Update the REO queue LUT at the corresponding peer id
 		 * and tid with qaddr.

base-commit: 45bbd91fc41b7cb6319e45e6fd732c5c8a0c44e3
-- 
2.17.1


