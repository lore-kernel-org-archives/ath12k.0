Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD799C54E71
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRX0zzReklLbdIucEq/kXgD7SAusNflHLJJbjNtjYsc=; b=iGZwMcN4r2LHGqdjUpHm6o/4oi
	jpTRmXikmXSJHqIhrFIB6VZtgQryQS99VjF3WqKiAZjECZoq2LwSjoFpM3oxBiLxi6dQjN/N9TjAg
	ei33xnFrztSVe5kRfv8n8LRAUd3uC7CsCmBBIoEEuCLA1Lu1ebMpINOb23E7qp1Grfk88ieoSyQFD
	cpVIZa//RvgOF+Y9/pPVT3h0H56qphJfKhVrbW42awIaYcAegko14JpXZpoeEAvHP6JwfemxxCky3
	w8bdxUoj6gWtCwhSXsBbwgJ1AVM2ACIrt1LN3G/RCs04JmcmzF21B++SFi1sh/AKo2JKqL8qUWSFh
	AeHQI0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmnH-0000000GWoD-2V5P;
	Wed, 21 May 2025 16:59:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHmnE-0000000GWml-44Nr
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 16:59:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XIkV024754
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRX0zzReklLbdIucEq/kXgD7SAusNflHLJJbjNtjYsc=; b=dducDvupw9M6HT+S
	NLZBjd89p4uVba+8pcxnKSaAs3Z0LBr69gS5YDctaKse9mq5XL/nDfotIShXE/jA
	O0hk8r5VIGyBpJ0iMOrUMV9+whjDsRY0f+LC/C4eDVkz55hZt7KA1/XO+L/01IOV
	U9urxs901PzRLtXs20rr+4NdntsgzQnSGlPprf1vMo6f9U8K+9YudBX7eV+QxS63
	am28kqaAaAOMORLbjPn/tSoDqcyESO6qGAAiRAIlhcuk0gzmtvK2r/HYtiSRXYG3
	ELVEDxQhQqBNcTtkUrgqYhPt7nkcwwbF2u3a07+xU+h7FnwwgiBXwI8mHdrN+s2a
	fG7dpg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4umwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 May 2025 16:59:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2706b51df9so3206231a12.0
        for <ath12k@lists.infradead.org>; Wed, 21 May 2025 09:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846787; x=1748451587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRX0zzReklLbdIucEq/kXgD7SAusNflHLJJbjNtjYsc=;
        b=G4aJyYCH1VxE4ck/wSK4GOpHrLFCHJnZdOOE6vt1jRic5lFD9soGx9IaYqUyaq9Ihb
         39cVJu7Tf1pVKJrXNPFejQvNFYoXM+cMXuKbdPE8uxjnWzV9zhi9y2LLKjU3m5txK4hZ
         xfe34Pb7GahzrOWWzLAAE4101skX9L2Ealo56Uob0QVHzaNrAUKhIitZLbuSFGIkH78A
         YfEqpZi8Vfb89vtNg05xy6jTG+FrQYgWU2arwzEvizt7PArQ98Bd8FtEYBEJObGRFPg8
         qZeS89HWz9s5dQ80+kkTrB2IWgd3gZdpLPc1iNEgt9MgeasBYlUDUocrg2STpS3dAimK
         q92Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0Eoe7nNWIRgpXSoLfxmNVw8drw2BqTEu+NB7mIrjK8qCa2rJLXMguBcWwNP5uUbHzWa3WM4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIEvRJryn6ksnId9EuID9ulzFiWyQ+96nGPAskzDaYyx8mqzQC
	s3aBAEqa3a2a3gUOmqVOc252da0HdJfgsHbDk9+KRJ61GO8c8Gmrf/0ipNlAnlf9lh9xA6Aq1mi
	6llVrHb0a6RM4AnFugB45ecvoDFkmbm7lAWAgh27KPMUcCC9t5d5wJjzo1SwY8FQCM3/xW4V3
X-Gm-Gg: ASbGncuQKLvAca/RF/SPI9iDfZRH6vGzSODJZLhL+RqY7SNyIWhARnJhXDT++y4ECzl
	/rlcc6k+gnKgzwI0Rbj3XTJ6+X3+9nkwkucZqOzuGrN/l6UfaK5lFmtPOVwYY/ci3ztMIELIaCV
	qy4ill+J4bocX/I9y2xdzcP6awH7U3dlimGDne30AZQ7eSzHs9v/K/ISRe1tD0x04vsSrnmzroL
	VZV9kd3GyFRCbqebzGAIONJdfIIRv7oBn+9ihtmNaEqmGMwuEcY0U57PlaqhGi9hROUPsTAe7j6
	Z9vwQGpgp8zisK+5dFHrz6nx1zxxolIm3m9q7xEoB8B2iU4yD3uPwEbFgbiqQ7el8ZHMipIZaBA
	VrikYAzx1xucHTeuVifuu20G1xWs7Fap/i8+l
X-Received: by 2002:a17:90a:d443:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-30e4dbb703cmr35546433a91.11.1747846786583;
        Wed, 21 May 2025 09:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc2UvuBl5Dz/CL9fnSl4sMzh3CrOMKFOauBAMCgtqfKqZFgw34cOqWHM5pWNQAouNdLkqitw==
X-Received: by 2002:a17:90a:d443:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-30e4dbb703cmr35546399a91.11.1747846786184;
        Wed, 21 May 2025 09:59:46 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:45 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 21 May 2025 22:29:31 +0530
Subject: [PATCH ath-next 3/3] wifi: ath12k: fix regdomain update failure
 when connection establishes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-3-9737de5bf98e@oss.qualcomm.com>
References: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
In-Reply-To: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: aIrgi43WSvIoEeo-V--t04q7h1p-4WuB
X-Proofpoint-ORIG-GUID: aIrgi43WSvIoEeo-V--t04q7h1p-4WuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX8SzTU2NLSllO
 rn1z+gOQNlV1JhOv03n9HhPweFMYtiT70JSlLFJmBvkFt4hWL/QP1Ui8RCHzD1mOgPfLhTVvgk3
 PYxgn6jGjIlrFBt/0UopbNkYWkROLE03HrwEP6ElxQy73NUOKFmIKfPRFMJ2qooKQfig7YCSirs
 5tBRDz1EXNtrinBhiaiY1bS/MTTotnHiZ3dKbZuUJqXjOqdZHicHXaweNS7HG0CQndfjVtABTOk
 Ts2hH+WORmRpWOQxJ8xvU5NDnbGNMB3EaxqVXuVbAUMkxpF7L0J9pa6RpbG5blt5Bt05C4QOtgk
 x1rYY8ZVjUqOPT9dqFAAtRInzt2mL0wJvoYuACp9KMqT2X1jmMhn1Y1mv6wAagAUfrX/+DySBEG
 VC7vR6R0rWmXIdqh2e8uCu56y+RSIK6EHuEmFBN2XlwxVW4vItX7yOD3drw/Cy9J5Au+Tq06
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682e0684 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=EWTaEqaxvK_2CoIRUyUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_095949_139081_494D3CB2 
X-CRM114-Status: GOOD (  11.72  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

Commit 7ed3e88664e3 ("wifi: ath12k: update regulatory rules when connection
established") introduced a call to ath12k_reg_handle_chan_list() upon
connection to update the regulatory domain in cfg80211 based on the power
type received from the AP.

However, this update fails because ah->regd_updated was already set to true
during the earlier regulatory update triggered when the interface was
added.

To resolve this, reset ah->regd_updated before calling
ath12k_reg_handle_chan_list() to ensure the update proceeds correctly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 7ed3e88664e3 ("wifi: ath12k: update regulatory rules when connection established")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 755546246915cb355fc6f40fef85a87b880e2f91..88b59f3ff87af8b48cb3fafcd364fd9ced4ff197 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5860,6 +5860,7 @@ static int ath12k_mac_handle_link_sta_state(struct ieee80211_hw *hw,
 			link_conf = ath12k_mac_get_link_bss_conf(arvif);
 			reg_info = ab->reg_info[ar->pdev_idx];
 			ath12k_dbg(ab, ATH12K_DBG_MAC, "connection done, update reg rules\n");
+			ath12k_hw_to_ah(hw)->regd_updated = false;
 			ath12k_reg_handle_chan_list(ab, reg_info, arvif->ahvif->vdev_type,
 						    link_conf->power_type);
 		}

-- 
2.34.1


