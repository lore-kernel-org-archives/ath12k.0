Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EC5C83F1A
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1q9Fv4tG0fWETsk1VpsF/yNtAzh6//bIa8M6llAcnx8=; b=D4aHrNHcq9m+U2OCCIJIk0UFH9
	26D0Mgo1XF49H0SGA0ycxY6LJ+HM1f2R5f8CplMgJ2r8uaAsmqWkjWPs2KRLIl0RaHnXavYuQ5PmD
	MxJ3gNrLS3C3uTkpm16vdOj31yhE8abc24TQQ/fQ1nnbV7tnubF4Mu81wxHiPeByFlQAvfIBu3gsy
	IP+gs30zgB/Y+OV5lUkudTA5kiXjeSc13koYyuHyEuCHlLi67XRUng2y8LYLuaeuT9WaswfDwi8oL
	5KNKyDoYJn1JWeCV2dOh7/sxIOsAPlE1NKNjWL6+gttajkZwJjoAD4dUUywcwHnr8DYF14p4te30C
	92d70EPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDHs-0000000Enea-0Lym;
	Fri, 11 Jul 2025 12:55:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDHq-0000000Endv-0LAh
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 12:55:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAhtSQ029937
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 12:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1q9Fv4tG0fWETsk1VpsF/yNtAzh6//bIa8M
	6llAcnx8=; b=U++QESSJNLKPPoWz+BbBh2M5kvpGEg9QpfGEabV/47L9te2J0bm
	WCuc7LUfxBMtDjHgfOVGC1Gr1yBXlOAYsmOOtIlh0aGdtTEnVZWLffaa2bIIhvIk
	GuNwa6EjMjC4GImsrDERmUuUDQCgD8r/k1WbYfMUYK0zU+GgeXhXUrTYGC9H0Rxs
	WSUiKbiDjNx+U/c+OmWgEoHhKQhOJ19VAi178RfyipJeRVLtEUaZN0BMdNdfv/jf
	UDF3UYQ0+SkV8KH7+UPO5zAx6meuhVuLwt1DZFXN1XQutGfWIJDuq7kp9wzjGgpU
	VD1zt1MfRYfTX8/TGcUhb4ShamNnA1odxdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbernwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 12:55:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2355c58ebcfso5930225ad.2
        for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 05:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238508; x=1752843308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1q9Fv4tG0fWETsk1VpsF/yNtAzh6//bIa8M6llAcnx8=;
        b=mQo0oWqgYvZtzswD+SWlRQSL8NfXkUrQXL/pucGqUdcwW97CnMBAtTqtiTg6ddZs/K
         2i6R1t5yoUa7MWDRsF2w/zBq2eOiDUC+KBPqYsezc11F205aY8JZt8/xA9b/Ekl5pOxN
         5ljem2atiBor64BMSrGyCm73jcuYAN7JGK1xWKaHjGACfLSDohBtcnVPdiXC0t3ckty9
         MAdbcunNC2yma7Wk7XB1pbq2dde3I5x9HML26KjlGUh5hYdVKXFITLblHz2a5GZCXfd5
         /OdKLdaYtlxV7IFK7fB1Qy+kc0748j6rhOkXJEcye57GtGujYD0aB42gFNhxeN8GCQ1J
         XUDQ==
X-Gm-Message-State: AOJu0YwzlU5owU1jcZ99nacUr7lQA+H47E4T32wDLiVSaFFBVyPjp/q8
	90nSp0EVl7Srry0fW88VucGI9osSHhVFvuxj3MHO7aERKqdDjZI7eUo9I72eLu6ZSqVFcG0Dxv7
	+3DIDYg56dideQKkYYVMzJMpdPekQs3NF3iilbahWEz86a/8SRFCVO8RW7il7r/N1xRr3LvsZ
X-Gm-Gg: ASbGncuUQ0P6g8ekQQOYHakMGSE5Dj4P5FUNcWuomiidfYyFWPqnJkCPjH2dUudLugj
	3QkTDFnb4hIqnjCwDBxTd4ZnFcUBhnRxebrp2ivpZnpcYtma6orN93+u88L9E/y1kV+AxVqRRhG
	MBB3oQQGFXU2HGB5JbND6SSSiwxcdaxKe9vnp+QpFjyM3daPUfuzNTAxz8qLz/tcjm4Z6jCAHw/
	Yy8udNSikU+yHmoMpVcuxBnM4aFF5NcRZXRY4bffuiXnadBGaUYiqfDYW/qK/dT+qBCPdtvd+ph
	qyjKYhRG/VRFQVfvebLk05zhRa7PCoNlhUlhtsOQSBthZt9D+NjPCejcHKH7XFEKz7rSTF2/HlK
	A62BtHkeQJTrCQkEtNl7/mfM0OLdNhi60mUbZhDmC/3Q1K+HiSBVEbKHUQ3GwsQ==
X-Received: by 2002:a17:903:1c9:b0:234:c8f6:1b09 with SMTP id d9443c01a7336-23dede84f28mr15016225ad.9.1752238507791;
        Fri, 11 Jul 2025 05:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXJZulD7GXkrZ8YJrGnWfeNt32cIteJnhhsEZAOeQ4GeCt+0MyuG/l0p1Pm7Nj586ode+JVQ==
X-Received: by 2002:a17:903:1c9:b0:234:c8f6:1b09 with SMTP id d9443c01a7336-23dede84f28mr15016115ad.9.1752238507334;
        Fri, 11 Jul 2025 05:55:07 -0700 (PDT)
Received: from hu-nmaran-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de434141fsm46542225ad.168.2025.07.11.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:55:07 -0700 (PDT)
From: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>,
        Nagarajan Maran <nmaran@qti.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Validate peer_id before searching for peer
Date: Fri, 11 Jul 2025 18:24:54 +0530
Message-Id: <20250711125454.1549124-1-nagarajan.maran@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MiBTYWx0ZWRfXwFujY99AA+3v
 XUOx4caYzF2obREXy9Rs49k9gA0rGVdlFImSUZEIe1FijdJSAEgDJNgPE3g4bu5kOVhlzCKG1rc
 xPak/FCf3PlV5QiVzvc8hjgEHYxszWIMpmK+ztj4TOCHEBuIJXb+G6kKvvRUAM78tjL7sFrZOQi
 uPVfOZG7psq2KygcdfLGDeB2SyXqLQdwKQCGyGo9jihjwCCIa9jjQi2mhuESGC7Kaxc3EBRvv5R
 7qciK7fHXU/sfDgYpvRWPZ0vMVhGQeNU/Umwsy8dZS4BTfIOLNr5oSz5i4VIfRd8kFaHSl5zhw+
 yvUsZMbDcBkC7mFrao1X4u+8wHlECaoY5ZcPxnpCkVuAlfRKbkQy2TX3n+3xHJTrlFiNzNTvUvO
 CxUgMCtsbg5p+WbibAp/2K2PUccNOYKW7nh5pbbjhzl9MA2veEcqqIUzCn7CKSKzaE+hI142
X-Proofpoint-GUID: 9fSnUaM0M_itxxWAHvXvi3EzXwv2divo
X-Proofpoint-ORIG-GUID: 9fSnUaM0M_itxxWAHvXvi3EzXwv2divo
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=687109c4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0KvMerAzGZTWNi1JVVAA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1011 impostorscore=0
 phishscore=0 mlxlogscore=744 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_055534_128295_6DB44DFA 
X-CRM114-Status: GOOD (  11.58  )
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

From: Sriram R <quic_srirrama@quicinc.com>

In RX WBM error path, error packet is received with invalid
peer_id (0x3FFF) as there is no peer associated with that packet.
However, this invalid peer_id coincides with the ML peer_id valid
bit mask, causing an unnecessary search in the ML peer list.

Prevent searching the peer list for invalid peer_id and return NULL.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Nagarajan Maran <nmaran@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/peer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index ec7236bbccc0..1a098cb22933 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -100,6 +100,9 @@ struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
 
 	lockdep_assert_held(&ab->base_lock);
 
+	if (peer_id == HAL_INVALID_PEERID)
+		return NULL;
+
 	if (peer_id & ATH12K_PEER_ML_ID_VALID)
 		return ath12k_peer_find_by_ml_id(ab, peer_id);
 

base-commit: 3a6df1678acc3687d49ce94e23df7b6a289f27f9
-- 
2.34.1


