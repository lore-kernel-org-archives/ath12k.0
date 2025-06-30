Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB13C83000
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 04:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zlwIaUvtBdKmWYrvQBftvSATw4E35AAP8krPXhnxFc=; b=PKjvj4rwDKzTFMjbyF1GQCzO1G
	+4v0aomFAmR01ut9zDBAQE/PRJW97B6dVgslhfy9IEdeMKF+hNgcOpw0joloVnGuqIwpdBzQeYozJ
	MIARkK8n7FNUflcHEDbXsMQNQi8h9bpYB6tr+/wJAZu+ECWD7GnI4hbmDvqfkgFuWml26wNPxNpos
	Za5ypjb2ILb2CLPysayVfCBtk4J+ZXbcTcVQZ343g6ua1fY0pQO7/4uGJR1M10ZwPON/JXhcLSgvu
	O0OqeAhUmrfMX5IBDenPmxq4DgGFAGBIzL1RO4Qqm/U9L8pWHeosFPEoujwglwi+9qK41+070qLgG
	FEVGfObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5vk-00000001BIK-4BMW;
	Mon, 30 Jun 2025 04:15:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5vi-00000001BHP-0roF
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 04:15:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNrOAA016537
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 04:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zlwIaUvtBdKmWYrvQBftvSATw4E35AAP8krPXhnxFc=; b=cRJTVUzGg9n8pYoY
	tkBd0SntV2ekvMA7U74iOhbFFEq/CUfnRTVpiXMfYuE5cpBF331Ogc3ESCtjQLwQ
	j9LNfpppygkqS5iqCmpDYbs1QRwS6aqZ+uK5Y4nizTJV8PW1o5eN5TcuIjOg7kON
	H8XhHtfhTc+B65MxfrtYfggJR+6YsXkRsBDHWDe7fEvT4w39VatumbZ9hnFm3TGC
	VU0gsadP52JwdNPwaPUg2qHGNBwPBmmqrSSKH3sU8fTxa4PMfWqMSa6oh44lG52F
	VIYr1YWwg8lLZj609I1yHW8vwdl5iKCFKNotk2i9xhUNeeIA5ONR0rRlwxCeT4L0
	RGCO/w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hu8hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 04:15:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235089528a0so39990245ad.1
        for <ath12k@lists.infradead.org>; Sun, 29 Jun 2025 21:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751256941; x=1751861741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zlwIaUvtBdKmWYrvQBftvSATw4E35AAP8krPXhnxFc=;
        b=Z0MAvJQuOBP5NvF6k/kXaNWVkcPX4OKktiwtOeLp61lmXexDmYPYA1zQ7lcnm180ss
         3yXQ+YY77b5H/SSknW20ov7S8tpoAaE62YSwpmPFAL52WdW9pUREdakT+gMex144TscI
         5PzT358we+uSD6I0C8fm2kp1IwbTcSax8yPUOrzs+RN8rooEexKqJVGnaDz01EDDqa//
         UnxPFPqvGPnBMNXjIYQhlTYnu1lL8mZJYqxeoplYTiEEKFdiXTMMNEy2gUOcKemqUqBy
         l2r6mYRq1qn2QhOoGmYqW6pwG7vbQQbE5DylrigvtrOG0SzNWDQcdwu/sKUjSgpCF2h9
         mhAA==
X-Forwarded-Encrypted: i=1; AJvYcCVgnCsF2d5XFTKtEYTAyPDKN0LudycVbcqettkiLfwbitBm48Csp/Y0EfFlviRJAM8RRWkl0aA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuBBdm+90jwOnhOFHCQS9yLKP2elTVfXFUdRsKMj1hsDI/w8rR
	6wqlmzMDH5NfyKpj3isO+kToQEMGgPIN1KLnvfO0VDS23txJUPDbUVoP6B4FVUXk/5ZcqMuqLl3
	pW9gwRG20jzwI1vzUcJq458AHnGhQkBTPTmV3M6S6+VC7UNBzL3PIvZgCAq9R2J2CpCENS8uH
X-Gm-Gg: ASbGncuL+5oBN7PwtY62C1kKsw6j5a5QsfWPnbe+lDDlZTXkLoKSmjM0n6BSszdcmED
	xqpuBnVKH1RWHSjXdm7Qz2pzWxLC2xYLgIKohej+aSaG7mUC+tKIXTntZPoYXNATdZrEsAPNqay
	+4Bedi2nzRrMQ66/qORY1SvcgGPolz1TbXSW4CFhCyQu/VEe9fr+orYpqOcb744OfP64f3tZAZq
	s0jC4LVAYa+qkf5v2c2WwMirSNau4BLHTFhHys1L34MSc05n57K9DVe7E47DaZQYkTZEBMqfldW
	HcpyhPdHtFCcyoRR/BeA4BiC2OS6mwJPieFzEuvsF3dL916e+GFq+34eoqJGDb8/mGpJT30i0/l
	HGQcuG5tbWocZP3lSjHnc7t7lZXNXjIjgAH31r87D78JHhbs=
X-Received: by 2002:a17:902:f60c:b0:235:e1d6:2ac0 with SMTP id d9443c01a7336-2390a54cd4emr229127155ad.24.1751256940766;
        Sun, 29 Jun 2025 21:15:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ4EKBLyFvklT/nNxN/0BCu32hBk9XzR7iL2Rmh9tkeKSzTTpmxpJFvoPr4pnVeNNd+SHgyw==
X-Received: by 2002:a17:902:f60c:b0:235:e1d6:2ac0 with SMTP id d9443c01a7336-2390a54cd4emr229126815ad.24.1751256940322;
        Sun, 29 Jun 2025 21:15:40 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f069csm69366955ad.59.2025.06.29.21.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:15:40 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 09:45:16 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: advertise
 NL80211_FEATURE_TX_POWER_INSERTION support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-support-for-tx-power-insertion-v1-2-77f45484d5bb@oss.qualcomm.com>
References: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
In-Reply-To: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAzMiBTYWx0ZWRfXywZEPkcUmcx6
 XVFJyaGI9A47qhOIuLB5n37bwhMGMGQ5qFPULZ797FCnISLls8tmgjQNHvJhT7Tu66a3cqLBbHX
 pfJMYVDCx7GOiy7SxjTHO4ByRf1QazaKtllktMOwsbKC+0NuTPlrBifvJiHCovHMZ+5u1JJz7aM
 xSnIRoPoNWxRg861XMbPPbphhwcFhPzPqKH/A1F9YNrNCUKF2OnqYKslDidi/Y6j6YtjTNxqvlc
 c0n5GiGbRFLgPFkwoUnOSz5p5VfVSKYvu/r2/VhwCVY576Yu9wpep9ZOdLgBIYCCDOPXWASVAf9
 MpD+95FTzh2/Xepu5fM96AcskfAvBp/ZF7UpYq6mi7zqsgUM3N++v+N9W6tWjXio/h8VQfKIv22
 FJyVrLolq5YI61VLCGMOrOelj+OIOESa79t9nZONSnnv8ZTcJAsgRg5r3Mv+8ZagcldfW/sd
X-Proofpoint-ORIG-GUID: VLHNqJWPVfPwltr20d_mIkzg_jh5On90
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68620f6d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xmVKpWhJFmdleDmdprIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: VLHNqJWPVfPwltr20d_mIkzg_jh5On90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_211542_263195_F71A0471 
X-CRM114-Status: GOOD (  11.96  )
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

Now that driver is capable of inserting Tx power, advertise the support
for the same to upper layers.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 241f11bd8c4051db4873d1109acbafa1aa9815c2..318b651c6d8e60102317f05549f7cb2da6a05620 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12894,6 +12894,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
 				   NL80211_FEATURE_AP_SCAN;
 
+	wiphy->features |= NL80211_FEATURE_TX_POWER_INSERTION;
+
 	/* MLO is not yet supported so disable Wireless Extensions for now
 	 * to make sure ath12k users don't use it. This flag can be removed
 	 * once WIPHY_FLAG_SUPPORTS_MLO is enabled.

-- 
2.34.1


