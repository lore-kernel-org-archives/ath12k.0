Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C8606A323
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 05:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7vcDPql;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QYqeLQhg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MOTMMQ4e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=suOxVZieRZqm2iI57IVt/ix3kHb7doy+c/57vzI5qts=; b=m7vcDPqlTTlOieEKrCkYv8AUke
	HC0hIvQzARJwh80Bvuxu9nfzGLRo8iS2Hxx2rfy9Hwree6//45yG/Y1WKjX+TEZUxbz76Xgtfwjyz
	yuewLY7MSxR156205cnc0ZCB1QXjsYnMt/BvAd9p3QaX1p5CH/yEnqNJtoiZtBzx9kd0fDtbnQZIS
	xpyoS2glBSYlbcv8enwhxvAPEUjP7dX/cypUCnuI8TV/F8s8ewLExn63kPGajInXlNL1oGkJlbymO
	n5mxzPMZLvPp55u05EdzNLfwn8TiYXwoYeFXgAeHDXcY4M49JY6i0Jhohc1/ob47xOnGj+eOqInYN
	EwGEYnSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSosk-000000019cp-0KwO;
	Mon, 16 Nov 2026 05:03:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSosg-000000019cU-41Kt
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 05:03:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG4QtZu3719412
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 05:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=suOxVZieRZqm2iI57IVt/i
	x3kHb7doy+c/57vzI5qts=; b=QYqeLQhg4O9iyTAzwJb1CqkDM5OTDHbn0cOFt7
	aIm2PDJkpLO2Jtrp+pAPrE3WEKzqFbhBh14V3jXZgBGKbpUnRvyNpIpMoPdRDyy8
	HsTVlZ7mbRb9g6qB3Oh/zVcGzNfzSdoZkCm/N+57Ifo2JHGB7R5oAlmnej4wO8KK
	4+GIEhrRBODalChH9NF+fLroCD5RlLkk50KJ7bP34du6ylq1GxekNIsPNPh/N/gr
	4KVpSS2WR2vs838J9plxSfydBn+YcaEll+3FsUemCCFnI5gxR7p/T8EIVR94q6Yw
	0hzW71ToDwXfc+KKJ/ap7QFeu7h9MTSDUQ58/9ss+DhATpAw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhms8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 05:03:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so4141351c88.0
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 21:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794805428; x=1795410228; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=suOxVZieRZqm2iI57IVt/ix3kHb7doy+c/57vzI5qts=;
        b=MOTMMQ4e3h5ayeKazvCFhH+9qVIUZ+eQ7O0/eZcle2kx9c/pYxTUfmxdke8FP5ZvMM
         8ImV/zVLwsN2EH0TTSJmqBia/sG1Cyolgk6L8LPWkMsnMEeWxj0eq+yrY9I3Jz07vW4v
         TKJdo7t21l1FSw78gSn0Uj1pwYqfMIApfYjw32YhT7fXXoURk0rlaWZWY7P3mn71S4OO
         ruyfz/EEXKc+3Aoda9C3PC4NuOA3yF3Cgxhjes6PhfnGSdsLNnDNrVLpFGRyrIa5A5sA
         YHiLg8UUV9HZcoa9SVHwPmUWcQh37GWlZ8pfqqkSm+UpF1cPq6BtRH5+8TzMkgSFmjlJ
         QbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794805428; x=1795410228;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=suOxVZieRZqm2iI57IVt/ix3kHb7doy+c/57vzI5qts=;
        b=Nh2zqzxzC0bUZn8c1MWrYjFsR7pgurEpwjukd0N1Kw1VY112kc8fcGsBZdKXmfUd+j
         n6ISUYbRSM84equ96PJzGwT0diwqBA8w6zCj8VtRXJgFZvuckYl0vveD0hSS+5jqo8KX
         M8OTKcQQbD442IQVWm7n1gcF6OgXNwZVGgzt8j2MeXS84eZzq+aBUHyEcG/cvB2j+Isc
         yNLG/KOPqHjVV/9CVRoER+83fWmZEPEyVgIfyxEHopeaWNUQVBgDLCZPYCAhf/OOKSIo
         hpKd5av4XunE/JmxoX1n51u/EC90vrTzhy/XvDrObNimV0jSesLD51cj464uScarksen
         4xLg==
X-Gm-Message-State: APuU4Z9Bs8q4eD/XqwDSYvbRLHLhxdrOJUXgp8AGw/wT8k0M0yYDPfgE
	faPLOvLejSdo72T5/t3k4lMU4JG5K2ZevJpqn2rcF1Se4GJmGQqBDP3YuMcCREvlrDUd1qQ/va8
	m06iAt66mjnIDpu1aCtkXwCcdVR61UI7NGdfN7yO6RtJ4Dva4gmW4Js8UdXaW74tf6Ss61MBH
X-Gm-Gg: AYBFou1TLIAgglYsCUIE8hKKVO0c46911XzIx03on5iww026x2exCBzao8qUNw1PTU6
	WWWmBYxbnx8aeQfoA2Pl1ixSok7BSwiWb1dOj906hDaeEVGqbX3qA/t04nnu1ekSbHSaPJ0YWMR
	uTMHVJaG8/FqpX0yQZn43KllPKFKaT7ka58dWrOzIePOlBljuj94VMA4k9h1Jr5fjqIlASOYOPp
	argCM/FekmYFVIVrtSoYgqKfFJ39Pf4k5xlfWifOYppSeAp02Ed6GbemKn2Vdhu5exKVSebhh9n
	0/5minxQCn8EB2QX+eZFJOOHA7EFB6kB3Qvn0qeZrr4Qed5Jsjn3ES/G79Q+8QlqCrcQjFrsXHd
	7zhnY8zeLKvO5f62rIVSJgoYBVOUhSJwj6KJneJO4Va7vvPNshYzSQZ6T6kIcDWhMBZy73y+kNN
	wnHekI/LeKOVdx/6Gk
X-Received: by 2002:a05:701b:4213:20b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b5031a46bamr10039840c88.41.1794805428250;
        Sun, 15 Nov 2026 21:03:48 -0800 (PST)
X-Received: by 2002:a05:701b:4213:20b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b5031a46bamr10039825c88.41.1794805427728;
        Sun, 15 Nov 2026 21:03:47 -0800 (PST)
Received: from hu-mpubbise-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm26815087c88.15.2026.11.15.21.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:03:47 -0800 (PST)
From: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Manikanta Pubbisetty
Date: Mon, 16 Nov 2026 10:33:42 +0530
Message-Id: <20261116050342.1287644-1-manikanta.pubbisetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0YtO10ZLiZZl3FO_oXmq5ivgiayTaBRr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxOSBTYWx0ZWRfX8VNG66/Ppiow
 Te5Bm1cdmqkJo40jdmhyL6kRScF6YfzqtMWisol5vq7tm01yMSF4ueoPsVA9G5mfQREKyfGKt71
 ihY5sqtt8B0pHwi2EdrjvN5KLgM75VM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxOSBTYWx0ZWRfXxyUaNKkL8Pjr
 4t7EAoqh8YJ1kxS4yEO6xbr34snGYw9h7Tc9rkRrsinbrmO6AyewbxObq4ByzrZZtuVEV/j4w3l
 TiLnHC2juTe0DV07dMWFhIzqEWJYQw0IEGo9cPBdoenw6hKp1suymdRn4SERCYDoLFKHrRj1D13
 vEgzZ6Z2+bch0yIPs89kw+13YkcYWNrBLRcWaIJopbZl8eUllQmwcDLSC/7RrwpV0+w34HPHBhB
 ikYcu0EjtVlQ4DBYsaDaua/WQri871difXOjIHRI/6Ie7F9MWJi4x8ea+1aXc0zF6yULih24SKu
 v4cjskby00ETXKdaWxWJu7IP2PR/8i3IUlOmtpgTJdaNvzoD8cKnxAppomEbo2hmyGphIA4J2ea
 27hSOiIVFdAGofKRw5ulEQyuEaGA8vhxXV/qTzR/kTvrPDHtBhEbufUXYUAV8QW0VCwz0b9JH0N
 zUzCXqi1RFefUTNrpVA==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa8eb5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=bBqXziUQAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=KC7w4LxTeaHZr_j1U40A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22 a=BjKv_IHbNJvPKzgot4uq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0YtO10ZLiZZl3FO_oXmq5ivgiayTaBRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_210351_035985_CF29B075 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
---
 .mailmap | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5ab2cf568d3d..7893e18b3245 100644
--- a/.mailmap
+++ b/.mailmap
@@ -595,7 +595,8 @@ Maharaja Kennadyrajan <quic_mkenna@quicinc.com> <mkenna@codeaurora.org>
 Maheshwar Ajja <quic_majja@quicinc.com> <majja@codeaurora.org>
 Maíra Canal <mairacanal@riseup.net> <maira.canal@usp.br>
 Malathi Gottam <quic_mgottam@quicinc.com> <mgottam@codeaurora.org>
-Manikanta Pubbisetty <quic_mpubbise@quicinc.com> <mpubbise@codeaurora.org>
+Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com> <quic_mpubbise@quicinc.com>
+Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com> <mpubbise@codeaurora.org>
 Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com> <quic_mdharane@quicinc.com>
 Manivannan Sadhasivam <mani@kernel.org> <manivannanece23@gmail.com>
 Manivannan Sadhasivam <mani@kernel.org> <manivannan.sadhasivam@linaro.org>
-- 
2.34.1


