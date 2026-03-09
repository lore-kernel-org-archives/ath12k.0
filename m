Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4753CFCA19D
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=; b=i6/q7w5nHgJWW2u77lfgQbTBGC
	HNNJPR3TT2wxB9g49z6slI9HpR08CKBBq4iqL0QAvDP7RDGit9WxUAU8RE0JU/Q/QI5xhW+bJsRIl
	UmiG70J4UUPRCBYUDQhgRjYgbTF5m4bVXk2SnIUJPvsgQPTQe9Nq1JRsU/8fFArprBN9oza8gM2Kf
	dUJW6SU/IWzdwPtQysn1mZRneK/CIklq5iwykpb3WJTj8laV2jFjYNdSg6r8Wk8mm1gjM9Nsdq3on
	3uBqsKIpPVvMvHv7DeIrz3EUEJzdbfnIPZ4bopemMzHl3uzvXuYdu+wdvXb4yWx0A+0dMeM3kMHnh
	PRgh+SRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfi-00000008Gib-08IM;
	Mon, 09 Mar 2026 23:05:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfc-00000008GeE-3fLp
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0KJ1203723
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03PO2ofFbk0
	Yu5UA0mjka1WF4PLNd178/K38c0flSgc=; b=RdOiles10PVFNTsM+iN8mqyJAEY
	kLhkqbaC7CnBRxLlA4FssYmNKhQNycGzI6juLkAHvRtuzpXLnGxIHAbiBge3mT06
	sdZOjrvEnZTmrxqVJb1x6EdFzDW/nHGtdRFao3ac/Y+g+o24BXIDHBfOLVa7FUk7
	DmpcarEZxqgdUx/EefKsK+iK6bxGgq4Cp3hfOB4FryWGMKcFmYzwKGOjLkWYLj0y
	kBbEGi58WEdg4i42zYqUhKi1FK9+OIvOlu56FnolRdvOEJRAbRcxF4GuHNRhFWN4
	WTxfDFn4JFdQeIFvDYQPvfCFYSh1c9YrbeTgXLlrnN2W3OtoNZKr19o/xOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329n30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso9642234485a.2
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097551; x=1773702351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=;
        b=Z4ZDEDcMYk/v5SralbvwKbpw2KehiWK79t037DCRSlpECMwKs86dIrhb3qf4JqMqsc
         QAWZEixTj4TVzqDf88bqO+ByUFXcIpupPcSX1zNgJrJ7dQtsE0ucn5ACZ3UPm3/5eo3T
         gHWbagzjBVRh3bkDUa/Mtafj9cN3gDG+7LDxeXdJGtzGDPMobVbDIK0h74Zc/V+h0fQZ
         +QGL0SQMrq9nDOx08ZftkNHVIuBYv9rLAJRYzVBqwsjE80nkncJB3FZI9nC+kqK5IoiU
         tCX7mQyx0b72uZK4IxfGmBhPD3s9kD2uYDhHmvccJx4odts8grIMWV0WSamMf949a8fY
         MHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097551; x=1773702351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03PO2ofFbk0Yu5UA0mjka1WF4PLNd178/K38c0flSgc=;
        b=kEtR+nai2L+xZ2ZF7dNapi9A9k1TWhhKEK2qg8qhf4ioNHxj2kNOhrMKb1yIbthNse
         co4eE3d78a0kADtw5Kjxs12f5ZBSYcbu1ro53Dt1/ezQirkh7DOSJLIiJxwVLt29+cHT
         g+lXm2gX5QqhDWgzzG3Yjg+l7aUMTCKDVHORDfdpxMNpAdDH96ZBWld0Qh9HR5MDFd+8
         U+q27vv+Bu6Bh1j9fr3UZNlPSSSiQmZIFMQy06i0EukMKBQVvzN5heVKQT1lFGD1+w8d
         Z+e8jkPGxAjAhLFvCsBjmhkxv1hBd+/CFZBfKyX6QEtdk7nrbFl/jIf7u9Pk4ToAIZfn
         pz7g==
X-Forwarded-Encrypted: i=1; AJvYcCX+KzvPAIMNx2BzpDgIAPrDqjSM9s0BkW8YPr3FjfhfLq8wTy/vo7JOS1Loqq1havT5+gweOJg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrHamdtinP+qtfulErMBPlqMWQ253fgi6zL0/PcTMblKQEXBfq
	wJU7l8AQWR24+mkOqJT4IdtC34T3jN5PLVF27og+E5gLazWR87GMOXDdsPgDbi/6UJk21sm+QAm
	/ugp49oxB/pcU4zWEnRwOSN/y4WEXzB7T4ea+xNmYWHcFYUzcQl/jtkAmN4JsS4va
X-Gm-Gg: ATEYQzweQd3D5HIJz71fF/vAxGD/+MwrLkLcokicrkW1zlg1dhe13SN58nOi7xRCbw/
	vmFgCpyOUH5VNp9lmVxoKpIR2O9nAwxwU7LyNk3AEhdGGftx6U1dbnyLFJDjhY0VWeNlhtkM02k
	Ydo9rcyIhb9hsvobI9mqsHy66WHiDL7O1njxdfY/k7ayw6L1B8J6XNeriiACrt6+gaBDwwXXwwZ
	fRCgTTjggYJNcV/6K6rAStEvC1F9MirkC7bqRgKnyy+ZOfBeMSRyhBMyRPUhBzbAwx7EKolD9wK
	wg/Vy2lCNedyeOKn5xZBStQWuImbuT5iG2WC9OBUh3s7F9hZajxTJt6BMkRFRg40lNVUX3Qghdw
	M9Tx0UjEipvsCoVE21cmkc1oOhabmzxSxReuipzEKN/yvSDeLOQ==
X-Received: by 2002:a05:620a:4445:b0:8cd:9584:6335 with SMTP id af79cd13be357-8cd9584736amr41477185a.77.1773097551424;
        Mon, 09 Mar 2026 16:05:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:8cd:9584:6335 with SMTP id af79cd13be357-8cd9584736amr41472385a.77.1773097550949;
        Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:32 +0100
Message-ID: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX/Rune4WuLxg3
 JcVXjVeRkYHGACEQnpt3BXWhwJxjh7TPZV3InzeAnEBqzOHZTqJvI6U3jMM5ePjlE2FoRWvNJr8
 EgQP5/anHISANE9uppkkGrsvJHrcVmJQohN17JMBsOdh1CZ3s7/AMlPTT5v4AGU8/kh5sQoAugZ
 xlZrVEUo6JwdrH715iNps4axRA5ECcX+jfxcEsP0e+6LIZOJtVW451do1KBiJH4m2/BuE6Ndi+s
 XG4ZcxxttX1ASI8F7JvLBv3vdVwNl0fMnTQ9FATp1rpNcRtxd6RfCEd0Vcn1GuDUYM/NAgBUthC
 rUIIrJGC6L+nugs/d/HT/usy7rfattSeWgBkozE/qNt07eoVtunYoq2VBtsQOZe4fMMwTpis8t6
 XrZ+KXVQfFpWevYKeiNzpEPG1sK/U9dTQSR38Oxsg6w4hDTgDTvgwO+8oOR312phTECswH0hA11
 37u6hMNQWRlDcNLV5rg==
X-Proofpoint-ORIG-GUID: r6D8tMi1r7NzRw-AZPGepzCdQlfPD-z_
X-Proofpoint-GUID: r6D8tMi1r7NzRw-AZPGepzCdQlfPD-z_
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af5250 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=DFXFU3FfpSgEbJi8yTMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160552_910434_9D89C04F 
X-CRM114-Status: GOOD (  15.37  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
 drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
 drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
 6 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index eebd78e7ff6b..4fdd0af415d5 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1105,7 +1105,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	spin_lock_init(&qmi->event_lock);
 	INIT_WORK(&qmi->event_work, ath10k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&qmi->qmi_hdl, WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&qmi->qmi_hdl, QMI_SERVICE_ID_WLFW,
 			     WLFW_SERVICE_VERS_V01, 0);
 	if (ret)
 		goto err_qmi_lookup;
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 9f311f3bc9e7..88d58f78989d 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -7,7 +7,6 @@
 #ifndef WCN3990_QMI_SVC_V01_H
 #define WCN3990_QMI_SVC_V01_H
 
-#define WLFW_SERVICE_ID_V01 0x45
 #define WLFW_SERVICE_VERS_V01 0x01
 
 #define QMI_WLFW_BDF_DOWNLOAD_REQ_V01 0x0025
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index feebbc30f3df..1397756d6251 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -3337,7 +3337,7 @@ int ath11k_qmi_init_service(struct ath11k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath11k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH11K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH11K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index 7968ab122b65..eae416db8b52 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH11K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH11K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH11K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH11K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_QCA6390	0x01
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index c11b84b56f8f..f31cba7af722 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -4061,7 +4061,7 @@ int ath12k_qmi_init_service(struct ath12k_base *ab)
 	spin_lock_init(&ab->qmi.event_lock);
 	INIT_WORK(&ab->qmi.event_work, ath12k_qmi_driver_event_work);
 
-	ret = qmi_add_lookup(&ab->qmi.handle, ATH12K_QMI_WLFW_SERVICE_ID_V01,
+	ret = qmi_add_lookup(&ab->qmi.handle, QMI_SERVICE_ID_WLFW,
 			     ATH12K_QMI_WLFW_SERVICE_VERS_V01,
 			     ab->qmi.service_ins_id);
 	if (ret < 0) {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index b5a4a01391cb..2a63e214eb42 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -15,7 +15,6 @@
 #define ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE	64
 #define ATH12K_QMI_CALDB_ADDRESS		0x4BA00000
 #define ATH12K_QMI_WLANFW_MAX_BUILD_ID_LEN_V01	128
-#define ATH12K_QMI_WLFW_SERVICE_ID_V01		0x45
 #define ATH12K_QMI_WLFW_SERVICE_VERS_V01	0x01
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01	0x02
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_WCN7850 0x1
-- 
2.43.0


