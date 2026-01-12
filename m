Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4E6C9EC77
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QiTlYrCp+242s9QM5OzpPgWjVIOQu2yqgspIWqzWL0c=; b=ieJGBYi/NP1eZ9LTQgnbUBCixT
	d9NuZGGqUiCFQ35e+WZaun9GR7/VC1yhtYcQsWABrwohRj2BKxTENGwlo1NmDpjOcLrZUotymN36r
	USeZQ7CX7Q0TDSMMZgj2LOzxMBgLOuRYFTTt94S2BCaTpJJr9xoD9WjBBvIPZZvqucTn+twaVrVSj
	WzkrcHl4bVQ5efraxb+mKv7Qy30en8O+zoLMYX6gzBnMgauTl8JkRkZK/kSsg0UuUs6W60C3AebJd
	N2Jes7wr1mSrb/t1IO++HXBVvISCT6G1VYXHCWkuQ7iWyRfc8krj66EEZBqN0BvlQ+gW/ZK8jJU8u
	Ek2b3guQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGW5-00000005I7l-3kEB;
	Mon, 12 Jan 2026 11:55:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGW3-00000005I7I-04wt
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 11:55:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7oLBS3142252
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 11:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QiTlYrCp+242s9QM5OzpPgWjVIOQu2yqgsp
	IWqzWL0c=; b=NuUZWtFAy2ilccT4634Cla+3VKwhLoEVbGT5266bGlTAkMdSnsz
	OS4+2+IiY7wZilRDzq9prWDCHJTqKFNVU3eo7ok6RFGujfJxCq7uCBRDyctw4zqs
	A4C7pCWO3GawlFEqDWA1aX4Du3TNUiQnkDex5w12uF/ywMPUcADVYoe/IWtKPu7H
	eiXbh5D0r8G4S0ttxDNm2tYVSM6D8qqc2yftbtJmkU87GaVplScVTnygkHbl+P/1
	4RMfshmafXz3d8ztwhdPnXvGm+Bj3PFYUIwZnZ08/+Cihkv6bWMDbQu0RbSVCkff
	gHYxv1AHDaTy0GiaM2PY2yldefyCC3f/0cg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4v81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 11:55:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11f44c1b352so30934291c88.0
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 03:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768218920; x=1768823720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QiTlYrCp+242s9QM5OzpPgWjVIOQu2yqgspIWqzWL0c=;
        b=dvwWSj5WeRJmCCSdYzrqHe2LmahmxIXJPz5xdhaMrIY9vOXJ6Cl8ydi+2q3D5Wf9u2
         Rv1JbU+iTQNurq05mj2ew9ywo3U+9e5DfFQM4UIf45CSjb6G7BCukz46Sq0h6/8vuOIt
         N2Y3suNDc82twysrqO9hkELCvEiQNe3Ba9lGvQ254M/DKmCNLJnUiT3S87G6sqKNBuR/
         n7iDgRAh5wpjVq1tUCtcYE8EqdvcIRLwDKu6PT79WI1gBQKSBsdqwsvneRZGItsIOuWp
         Up+VK750PtLCuYOUpRL/6vRSladEU36R1sop2YIMnK4IVggFzHYLI8sdgmZrdHwRjxR9
         mL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218920; x=1768823720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiTlYrCp+242s9QM5OzpPgWjVIOQu2yqgspIWqzWL0c=;
        b=RmgEGRQYEMWoAj/qkcWu8/XNN6Bh9+AhxLeSyzaKqCw6rpehWvbaChJP1Ms51eTObY
         5zwbsX2aUuyUl3xyMU75Q54Gu4oqq71M8PGs0VXMpEaDj6VFEWnPnh2HF0zOdQMRzEbH
         tzJWf+kFQhfm9y43NILb5QkhNupASTO6M+6H/ELYQlLqqaB22tO0Gtg81mWa5iTbWXZJ
         PXWYwlnJDyzhdh/J/ffQumfdvXgA1vdObW55y9cB9RdRNMu1dIGDUpNZQUnHmirSfF0K
         RYkl4MstUWxRqeMVzI7eXCG6x/f6jf94Vq6o9k9hMLFVEKVzYnATKbFQ31XiWg+m8kRC
         fHmA==
X-Gm-Message-State: AOJu0Yy4cgwxFqDVJnwVvbv7fNyimgjTSvJhh3msKDekXSCHI6CVmX0F
	ymp+N7M81hriVGSlBPaBeLmYcEyfb1OVRvsMnb7j0yU+CNYuj+fcwQfRxn5SQ3LMrkS1TuF0XUf
	f829CMCrWOkfl/2o50yqWzIuDoRu1tSwFSL8OXkFDqw/AJFlkzvsNyECdGA0JVJwurflugKxq
X-Gm-Gg: AY/fxX4JNY5AxShEsj2mF5jNb5faVhGsg+0HBb0xpWUDFXpWXVlaahWoZSrf55XeVmM
	dioK3hZQQvnzSq60cavzep3WxyKQAjXMGps1E6e14vUC/ZV/uaAe1yYWfUdjk91qHmuViw/7/2D
	xlVMvpPPyZTI6dVmpNQa3JAywN2dYdcGekSosPMHxXRDyNk7dyNYdNV3nh0Dx8sY314G4n1IFrR
	wba6CecK69UKDJhfCwGnYo7t68HMBZno0tfoOGtXTJr3Nw0YD7kzTo30aP5/WAKeCKwpHaRaPl9
	X4hA+hXIMWYjyN6RZzuyxrWEo7pRrq+/mb6P8mah17I1j6oDTxSXrcDuIdABrWJefuJZq9qW3CF
	5PQqY8iXfl4HXWmyjWh9iD3I5hPeE8scFigIVna2ffAsZ+f/QSoLYItTF82hS4R4t
X-Received: by 2002:a05:7022:107:b0:11d:f682:e475 with SMTP id a92af1059eb24-121f8b5fdefmr18634408c88.40.1768218919874;
        Mon, 12 Jan 2026 03:55:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+QbeglUyaGRsFN19UkoqBVLlQgsoX1tsbGzBj0vrb7j6DAphCBQ+n89q9q+YescjN00jEvw==
X-Received: by 2002:a05:7022:107:b0:11d:f682:e475 with SMTP id a92af1059eb24-121f8b5fdefmr18634387c88.40.1768218919358;
        Mon, 12 Jan 2026 03:55:19 -0800 (PST)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm25267595c88.5.2026.01.12.03.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 03:55:18 -0800 (PST)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        yingying.tang@oss.qualcomm.com
Subject: [PATCH ath-current] wifi: ath12k: Fix scan state stuck in ABORTING after cancel_remain_on_channel
Date: Mon, 12 Jan 2026 19:55:16 +0800
Message-Id: <20260112115516.2144219-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R6ju-AUvOUNnCvANGg1mrhqkHEg3sSCw
X-Proofpoint-ORIG-GUID: R6ju-AUvOUNnCvANGg1mrhqkHEg3sSCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA5NSBTYWx0ZWRfXxZwvCcCB0sO7
 md16SvrwBxpKA7D/jVrTcw+8G2VsOW/nslDY0Gxx+5Fl6DpolOcV4q0EuOWisnn45lfZcc+uzne
 YUWy0IjhFSKeyDKD2YVKN2qQ6GYE+0a6+vRU3W+PytdVUNj2oS1Nw+wBWLsgxS1Be9LXTyPeJ/r
 EyiwzBTRiETyLc2jjx2Q633yPZnxaOQWR+wCcUIT7QdjGhVIjONccTLMMWdPfyQwh7r+KLpHCXL
 ndTDJ3tzlt7t0Rp47Mf0kjhRRXEwsSOEmaF14yKbn+blNdGf5naBdfwWqrwLrw1CNi3GVuvPf5y
 roKxMbkYGF8MJF39/5+8I5HdIy5f7nbzNxhK3+SZxd+qOKVmJ09WK3vIJ0tmH1fwSi/wadqFfeX
 8ZWOXe+ZNRkhpSiBLdi79tHSBBMnzSXLdIp7jqMZNhC6uhMGshwP7XhBr+eD7WnUh6fwlkYvj7z
 L+KCgiO6FmIFtZBMBsg==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964e129 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SdPIdFeAA3FGzxFMktMA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035523_174048_64BF8A79 
X-CRM114-Status: GOOD (  11.82  )
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

Scan finish workqueue was introduced in __ath12k_mac_scan_finish() by [1].

During ath12k_mac_op_cancel_remain_on_channel(), scan state is set to
ABORTING and should be reset to IDLE in the queued work. However,
wiphy_work_cancel() is called before exiting
ath12k_mac_op_cancel_remain_on_channel(), which prevents the work
from running and leaves the state in ABORTING. This blocks all
subsequent scan requests.

Replace wiphy_work_cancel() with wiphy_work_flush() to ensure the
queued work runs and scan state is reset to IDLE.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 3863f014ad23 ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan") # [1]
Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2f4daee9e2f0..7b72db3193d6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -13448,7 +13448,7 @@ int ath12k_mac_op_cancel_remain_on_channel(struct ieee80211_hw *hw,
 	ath12k_scan_abort(ar);
 
 	cancel_delayed_work_sync(&ar->scan.timeout);
-	wiphy_work_cancel(hw->wiphy, &ar->scan.vdev_clean_wk);
+	wiphy_work_flush(hw->wiphy, &ar->scan.vdev_clean_wk);
 
 	return 0;
 }
--
base-commit: d0309c054362a235077327b46f727bc48878a3bc


