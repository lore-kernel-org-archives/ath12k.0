Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36F8C3ABC0
	for <ath12k@archiver.kernel.org>; Wed,  7 May 2025 03:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W9HX03+YwTjD0p3Pm9mbuzNSJnPwRup4V0fUOLX2ono=; b=PrdfUkxT3FuNmbmszd74mf5kBm
	90DiT/NXZSg/9sO/PRcJj6xcEUAx6WCjFtAKT3YROcjOwHIhiybDc3/uvRnduHc2X+mXVi/kOFBJ7
	v9U/Q052gFzi7Gc0YZu07CfV/6tFyR3HGAa5qi2bAdcPtzHKe9pQctSVek1LCcLTJ2bz8jtyD0vqE
	n7lWcWqDLQbQKAAPDDVP+56C+oqUajdizjnWwfA21DppLw1GXm5aiOOtCML8xvJMUKvXhOf/OejAT
	5X6F5HBX0IJbBa1U4sMAeENyZ/+aQMAMSvM987uxVtdQAizGm+6HF3hAzTan0rtWz67+L6cAcv2+d
	N42aeUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjv-0000000E76j-1vzK;
	Wed, 07 May 2025 03:46:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQAS-0000000DTcK-1IFT
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 21:49:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546FHofn016868
	for <ath12k@lists.infradead.org>; Tue, 6 May 2025 21:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W9HX03+YwTjD0p3Pm9mbuzNSJnPwRup4V0f
	UOLX2ono=; b=OlBoKgbqO6U9BX3Rgi6xRYK+ipFWBQehjGCalFNohhsDsEEW+K4
	DCKIZ3PMqGZu6UOGX8wdSGdFYPXxgRAbiIZyBFK338AOJQ2hnZKcBn5AjaPitYgk
	8v+wzsWmRqdtlseA7eTANL1wRGyB2vq0HAItIWrDmYRfKIOcF6uI9PrTqSB8Moec
	m6qv5118MiMb63MpKeO1aiF/S3fUz65CenzPevfg84igPKyAtWm88ZbBMzqlJHNy
	522VPWUhRY9OSpqf/wZ8dBYtm2MFlQFldppa6zD37QgMDUNCHk03MXwqAENeO0Ir
	TXtomPPPrlDRR5X7EnCRBoLLqbV+HcNAOLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtte0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 May 2025 21:49:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso5425871a91.2
        for <ath12k@lists.infradead.org>; Tue, 06 May 2025 14:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746568174; x=1747172974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9HX03+YwTjD0p3Pm9mbuzNSJnPwRup4V0fUOLX2ono=;
        b=KhcCHwao8BB3/I5rgzT2qNHZWL1BgmQpbkuupfdzaNEtLWjP/uLOo4ulZtREccoJQD
         nIo8YizqDvZcuIlHBa0Cs7/HEcXRC0YrFAoBcw8Ybjs/P8XH4KJFIKxSlwd5vAycNcJV
         AK3dqbI4VXlFfxvgtoEJjy8iAx1I+pL1ryi1nSX/iKr72DrO1E1VltGbopCvN7HgzffA
         ks/QI1YLVe7vemlzPCf24IHnrHHHV+WFnIjqoL3GU8veZfkxxK3qxVNDROPPC7y78sPi
         gKU0nT4fLbHUDSBiTF0EPkP6e//rigLI3wl8Gsv/gJOfF0BfQs8wcCGcdFDMCtTcHGCu
         /+vg==
X-Gm-Message-State: AOJu0YxrjnYjXwQJcevFGbuAMWfT7AkVg3YFqijx9lZPTvtwi3aZUEyj
	B7osV+nUqG1+veYoxOShnDtNBrTTeHxhzweHz1FAr7TsGcllT4sL5vm6iimDSxKJibvyqOgYwwe
	GgcMDUphpubR5p5J/LIarNsDNVPkH3FYSWs8SlFQGuvLuenKLkT05n6mzHK2fCwJ5X1Lp
X-Gm-Gg: ASbGncux+6jOca2bV5tmKygv6LJhgmySp0uv8H89QJOP9gp/Nttf8isj5BmjLvxQLHs
	MkpDnGOrEdL9flS2KhCnn5G2O4Si+1U4xMgp3th0YcsJRCqNV+g360JxBHz8vR9Nr3J3uoHrNcN
	X3s8A/+quhxedppVu7tDhKGiHFcDqjFOsaO6X5laZNx7OOT2060SsBhIxkMzyyu5CSkgdq2H9ix
	fTF/lRneqTvo7viu+zWHyxLKUAjUot7pJE82Z5cFQu2uzkl4MDOSLX53PMCn0Q/fZl5TVpbwwdg
	0/IUXL8g/AilgmnzA2dDmqPOZnyFFzz9J6Yvi2PvPdbfmgflxjvNPKtcYvgoI5uMmQRZ
X-Received: by 2002:a17:90a:d607:b0:305:2d68:8d55 with SMTP id 98e67ed59e1d1-30aac16e23fmr1558271a91.8.1746568173598;
        Tue, 06 May 2025 14:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNDAOC8xgiVJIRLDotk5v4mn6JYnAC2r4DGiO6+vNgrKydCn8CW/ULlyfk64tWkX3FFLiDzw==
X-Received: by 2002:a17:90a:d607:b0:305:2d68:8d55 with SMTP id 98e67ed59e1d1-30aac16e23fmr1558247a91.8.1746568173179;
        Tue, 06 May 2025 14:49:33 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aaebec8ddsm361537a91.14.2025.05.06.14.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:49:32 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: disable pdev for non supported country
Date: Tue,  6 May 2025 14:49:30 -0700
Message-Id: <20250506214930.3561348-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=681a83ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HtYUS7siLqOggL-nrXkA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qHrkNwA3NZmc4pFgAnFSgaksAn4UAANk
X-Proofpoint-ORIG-GUID: qHrkNwA3NZmc4pFgAnFSgaksAn4UAANk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDIwNiBTYWx0ZWRfX89ipwhk/x1ji
 lj9qM8mwJk2P4h7dMFyNf/SSBA6oAYEeJFpzggcVl63bZDnGTSG1GnzblMXohlVQBqUvYEdSB5F
 K+Z5ekuC7t7gYEANHZLpi5KMUbXhVMMLYdFPz0NmZi9B1JW3PWgc8m76FX8NKZGHHUqChzo8+/A
 betMdp+bYqZcL7LJRpbW47Ke3tLE+QO47GpEP67yh4wdRcy848pzu/lq4ll0Iu0jc7/zSHskDnh
 2pGThZvQ2Lii/mJoJlm6cS2LznrGpYQ6Vgu5we+Aiv7o7rsYawK464uZhjFseTorQ7iv70P4ypj
 Ni6Ge4K+t0iq4ZQT0wSf+F2pv3W7KgIniZzZwQQrXnLbd2BsOSQUX35x+cD/TshOamZXy/I5EKs
 qJcXjCPBmE1GWqJoacuga34+U49Jv6agOVlmAZThqng2+Ug45Hj2eMhDvzQuBzgtGAsarGs/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=753 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_144936_359938_33269ECC 
X-CRM114-Status: GOOD (  19.42  )
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

From: Karthik M <quic_karm@quicinc.com>

In MLO configuration, ath12k_mac_radio_start() iterates through all
the radios and makes the ar state 'ON'. Even though some bands are
not supported in certain countries, ath12k_reg_update_chan_list()
tries to update the channel list for all the active pdevs and ends
up in the warn_on for non-supported band.

To prevent this, disable the pdev when the number of channels across
all bands supported by the pdev is zero for a particular country.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthik M <quic_karm@quicinc.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 +++++++++++-
 drivers/net/wireless/ath/ath12k/reg.c |  7 +++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4dae941c9615..f731a5759ac3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7726,7 +7726,17 @@ static int ath12k_mac_start(struct ath12k *ar)
 
 	/* TODO: Do we need to enable ANI? */
 
-	ath12k_reg_update_chan_list(ar, false);
+	ret = ath12k_reg_update_chan_list(ar, false);
+
+	/* The ar state alone can be turned off for non supported country
+	 * without returning the error value. As we need to update the channel
+	 * for the next ar.
+	 */
+	if (ret) {
+		if (ret == -EINVAL)
+			ret = 0;
+		goto err;
+	}
 
 	ar->num_started_vdevs = 0;
 	ar->num_created_vdevs = 0;
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 7048834e0d14..a6c9c670e91d 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -65,7 +65,7 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 
 		for_each_ar(ah, ar, i) {
 			ret = ath12k_reg_update_chan_list(ar, true);
-			if (ret) {
+			if (ret && ret != -EINVAL) {
 				ath12k_warn(ar->ab,
 					    "failed to update chan list for pdev %u, ret %d\n",
 					    i, ret);
@@ -181,8 +181,11 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 		}
 	}
 
-	if (WARN_ON(!num_channels))
+	if (!num_channels) {
+		ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+			   "pdev is not supported for this country\n");
 		return -EINVAL;
+	}
 
 	arg = kzalloc(struct_size(arg, channel, num_channels), GFP_KERNEL);
 

base-commit: 885e5cbaa0ee3738fcd99167439459ede2cc102c
-- 
2.34.1


