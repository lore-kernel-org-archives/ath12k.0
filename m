Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D83FCA19D
	for <ath12k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=slZwQnzsHMNNKBnrmBFkp433x8
	irSziwxxzuJ5nIYDwIqydMCTEKhWThN/5QgZuxarfL5C+bjzRalBnxx2+OUifVNbcyc3R033qMROI
	2ulNbbD2dNPPywMYtL5KrTp5FherMQFsMYLNxMK+r9ZtvFe58PU5fE9ODDDFOGe/uggVa+/JoZVR4
	4TXKaWqxi7bbbjXIVldp+n1/hYcxTS7u1SLxSom3YzL0wy6sf/Wnh8vx+tiXb7MTHG+LONbVv0teg
	CBcBpjnlFWnkwe/j4QcUgltTFF9mpJ2jHQW8iLjGikueWv1ktd541V2NakWqLAzxF8puWfpdKJAnJ
	NJK/JEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfo-00000008Gus-3gUd;
	Mon, 09 Mar 2026 23:06:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfm-00000008Gos-0aIh
	for ath12k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=Ul5L4/vBf2GH1pordJt4cuVEWo
	lnsYrf8cFWz5ur7b1paXWwxYoa3G/jGUFGy/d1fGQVso55A4yLBmuWe/EgKgfIWPB0dq7GZfMIIyD
	kZ5h++F+3wWmtcwJC5cwk5nyaKEsdCqUblBynodHAct4S3mpmOGre3/mhD5gqqmywklaR50BKBgaB
	2wb+nsvUf3rDAJA49p4kzDYa6tcPWDQShLoyGSBDk3sVB7LLpzESN/DqYN0iIkcpMGQSjcxmFPOUW
	uqV7EFbfTz/LjJzx/E9G6ltBhOD9CQdl84r8ruemeempMncNgUMhhfdjJu6Hs+daRjmZxOSo6k2aC
	od1Cwr8A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfb-0000000DJnC-0Tbz
	for ath12k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBhwl1659911
	for <ath12k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4nuiFplGeEP
	W6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=gloHc0jcRhYOoGyz7DgdnhjiojN
	H9hpeKUd3Kr08GXwo2N3xaErYbMYE0ASu4NTUYcKjZ9ez2A9Ln/ugpg39/yqLKpt
	mJqC7xYLnB5LKufywMAf1lsUOjU0QpQNbrVZdB+sEyfZQPgeemL8PYJLPvILMPtg
	J9WFvV+Y+4Xa9nvrlKx47wQN0VDhAsMxk6T9hBaepKW6iyHsUBePHNABli94ozlE
	2crJCJTHgxTLIb4YTD/Z6PXFQqMxMW/7NsUo2SFXI008JG2dOtvgKhb9qGrKUvGX
	iIBjRfQLrG1MsJtDR2Pool1dBuNiAgVrmfsr2Hh17M6MiZ/6pAmlisLu84Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr41k83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a116bf0f8so453952646d6.0
        for <ath12k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097548; x=1773702348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=gADvGCnJXsPlYFIOLrc5wEAY3YuYBX5tnO9ZkjKz/veA/zZAGX7lIKYDtJ+yCIMGLf
         NvXOYIeH+iFo/2GSm8sG/juqDkd8766lrLqOLd/MvSr3xwgqE+jR0Fg1mpqeNiUpa4B2
         fFmmaSVcBXjS5kNPS/3QWGolg1UAvdEWHjDZexln+rA2IDSimY31efRlpvaFqZ9JonMe
         MFY/JboedXmGOrv5vvnzen5SHjZXaWtoqxxlHZ9PwyK9KmC0sk5FQwgExMXWaNNY6ipI
         mv9EhAwI8WX+/UV2MLOEhnHv1GQz56Lw59jzTK8gC7RK8r0z5+OSsdtDV8VAhLVRBFuU
         MzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097548; x=1773702348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=oj/gnYOrLD1QrLYN+3uWoUnuFYTbqiUqKBVcY0OKCD42HBTiTHUGQyr4OdFhtRGJqK
         YMuKj1vhmvaWzSALPT4zh6Lgjxn/aqSL+tSVoHAQohLXK9t/vlqnXT6SiX0HI4YA2uyk
         KDQVPB7BadsMfox96Xq45OF7J8F05x8hdqSeLxlQiXnZcVElVBfwx4+91kP8c4DXKHU9
         WfUDnIogijOZmzS5HWtdGXFT/t7ezoTwpaIVqwIOSEMAt2TRi/Q07mzcMETZKYmKJwIW
         USMWf2NTRz4/rWF8v1QD2hShe7gh3ab245hU6Qjk4A+PegJ9VHgYVkpE+lvzk0+w8uqK
         hZIw==
X-Forwarded-Encrypted: i=1; AJvYcCVxxhrV/sBCQOEscwwntDa4m2+VS+FwEvS7LecRZCN+026Jf5ceAspFFv9iaBgW6gFFtrMoY6M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVHZwMaPNlmYrOpM0sgeN1Bx2Zi7QBEueCQsIl8WOmleVLPboS
	w+UkYwRZ6hB4KKL3mLSkh75KIFqr4Q+KLTd0XKSxpLx6ju2uiRkCMqgnAEGMOe2VVqTFcYghFE4
	tuQy+TuPpgIVQ6GPHxGg0DyyWb/FnnqQXNSPbK8kZbv/CAIWBkLEg+DzP6xWcUGTc
X-Gm-Gg: ATEYQzwOYZsC2bbkM81KqTNvaudXqEssey+03uy30Hduj4W4ZYOOPNb9fUW/kJ9SIE1
	MH34Rx1eWKn7ZoVbZCkRo0bbhqUYjOefEvGxVHF/U4FZDzKqsk2sr6KYi4VjsIN6UzuRNIf1/zu
	uB3zHd8XrVrNxYvZ7UfCE/AxLhIs130C6Q+kUObuR4sNZ1sgnSe25mvdYEFwnXXH+sBjzqamFFm
	4Zx+odZhMsFLLTS4dp53G5wl6UWlAQzsL5kwWF60qFKbcJwa21zQEzgWu7Rc3ByMcyMVN7+cvBp
	m3kZsB8Ee8xzizTp3SJlBcZ66w5pUwLJ1nBwIuCk/WTfT7hwdl/p+VNPgQKerW9WEFAf4WNI/NP
	wvkoXJhlL7pBJfRkINka7zlLGwYk4z2QjK+AZRgRW52lIvs10rQ==
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467938185a.0.1773097548037;
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467934285a.0.1773097547515;
        Mon, 09 Mar 2026 16:05:47 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:46 -0700 (PDT)
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
Subject: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Date: Tue, 10 Mar 2026 00:03:30 +0100
Message-ID: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX0Tap9/ce9yZV
 tAEbchok4WPRiUwzyA6JJTZEClgPNqTgWh8bhUzTXPVrozaOZcIfntULzI1m0uEnkT5ePSQBMUh
 R8RXvNfgGNb3mIAEaOz5M4No+hSCKih7D8oMEaH1rZ2yrt9VilCd6T65ZjsNA+9maXaPsOOIf1t
 Z/s342/F5nx0clQf//3cFkaQ7epCyJWrJQT21I4yk5rzlTQlNHTxbZk1lNf4T53UG3NedqMA8Cr
 GnhRR3MPC7vc5b/bEMyg5bakPtkAdSDmOCwrnCP+KcWo0L4zA82yN7OZHsGKYWYzUwgeh3XeET1
 sktu5sIuRFEu2oUxB0YwkaoOCxeQ+AfqLjmk0evUlNPQH09aTwni7h3ey435E6lNvC/BTLOZ2ca
 KE63L+/MDNCI7bBZ0HyU/3B2Ej4GBZs28HQfLJjl9J1gciRVT4O+7LSboA4PFVdc6V60kXa+Gbo
 02dt3FXkJtA3Tnd0GVA==
X-Proofpoint-GUID: cC6soT4_OOdW6SNSQRttj1-i0IgtZ-w_
X-Proofpoint-ORIG-GUID: cC6soT4_OOdW6SNSQRttj1-i0IgtZ-w_
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af524c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=NWmyY4P_PqWfpxtJLaAA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230552_626375_54015F7F 
X-CRM114-Status: GOOD (  15.93  )
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

The QMI framework proposes a set of services which are defined by an
integer identifier. The different QMI client lookup for the services
via this identifier. Moreover, the function qmi_add_lookup() and
qmi_add_server() must match the service ID but the code in different
places set the same value but with a different macro name. These
macros are spreaded across the different subsystems implementing the
protocols associated with a service. It would make more sense to
define them in the QMI header for the sake of consistency and clarity.

This change use an unified naming for the services and enumerate the
ones implemented in the Linux kernel. More services can come later and
put the service ID in this same header.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/soc/qcom/qmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 291cdc7ef49c..b8d07f2c07e7 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -92,6 +92,18 @@ struct qmi_elem_info {
 #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
 #define QMI_ERR_NOT_SUPPORTED_V01		94
 
+/*
+ * Enumerate the IDs of the QMI services
+ */
+#define QMI_SERVICE_ID_TEST		0x0F	/*   15 */
+#define QMI_SERVICE_ID_SSCTL		0x2B	/*   43 */
+#define QMI_SERVICE_ID_IPA		0x31	/*   49 */
+#define QMI_SERVICE_ID_SERVREG_LOC	0x40	/*   64 */
+#define QMI_SERVICE_ID_SERVREG_NOTIF	0x42	/*   66 */
+#define QMI_SERVICE_ID_WLFW		0x45	/*   69 */
+#define QMI_SERVICE_ID_SLIMBUS		0x301	/*  769 */
+#define QMI_SERVICE_ID_USB_AUDIO_STREAM 0x41D	/* 1053 */
+
 /**
  * struct qmi_response_type_v01 - common response header (decoded)
  * @result:	result of the transaction
-- 
2.43.0


