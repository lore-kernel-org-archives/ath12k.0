Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58FDC677C4
	for <ath12k@archiver.kernel.org>; Mon,  9 Jun 2025 00:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pssxm74EjvLonq2GL5omi6L5LoQks4JqU6dREzJv7bI=; b=bPqu+Pg+SvCUm82EkH4KoLTqrY
	lEvh8L7flujTkGarp75SWCi176ReKWaIeqdcrDVtu08G0qoVF1KWjGEbIqCowRFr+MqOO8eqs7q4D
	OiigVyvF3Y4Afwx1c4IcQ23+KG3+UpD83f8b9TvH24d3cMObTncEKL6Nb9AeuTSW5AbzgrVeGZhfn
	TVSFq1wjxi9/F80xWTDFnpuPptDmRu6cm23AsygYhPYRbF3VeBqnMaxzRtr0ECKxMSO61quhirKyB
	MB9lUMGlEY0Yh3zsBh0P6E+XAP0QSqS/wm1eMyIhtBBvaP4KgZwtBSCZWDW1Es7YnQc57JdXBiaFR
	ZmbbYXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQFm-00000003BG0-2Kto;
	Mon, 09 Jun 2025 00:20:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ6Q-00000003AnV-3pn7
	for ath12k@lists.infradead.org;
	Mon, 09 Jun 2025 00:11:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558MWJiQ032550
	for <ath12k@lists.infradead.org>; Mon, 9 Jun 2025 00:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pssxm74EjvL
	onq2GL5omi6L5LoQks4JqU6dREzJv7bI=; b=HfPxULB3l67zsRUXi4xKFTBRdaK
	RyBzqn57rLrHZm5On3v7K0zeaYnHgwkPtBye0W8UpGVdOPb6wNMQ29yKTVQppwQj
	cCn3RGep702HwqonojEDZovsx95I+w9Qn79erjrl8OD/rlLctOqg+YrUvbiTgsNi
	XgM92q14Dz594xI4CIGz5a6ghqc4Tw7dS06eUdVNa/a5TpFCa9msqnXWAh/20BZ1
	M9O1JLgl6cjcMaeVrqypABTMnyEU6vMqWEsRZGqqD9rQ4cKSMrPeahN6zwLtZDtR
	3A2x12eLZbgmmmFLjPWnzVBcxZl5xH48txdfofg2n6qy2I2BPsbc1Q9a+4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9mav5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Jun 2025 00:11:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234b133b428so25629615ad.3
        for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 17:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749427861; x=1750032661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pssxm74EjvLonq2GL5omi6L5LoQks4JqU6dREzJv7bI=;
        b=Faygwiqd6v+SynZV/75yKsf0NqODNFk0aCT3gxqrhmmPoUN0lQLO3dYQcsn1rITWV2
         wGcS4IHERBi+6WAUEhPvmJecC7zD3tlMCSwJi6Gk40EqCPDJFOVjj/y5Ndq2jukOW0Cd
         fHPkdxXeQA9grUXRsb6wmeMLM/opzTBb0SDCLE8xzmGepFNisyQJdLPTCL3tkke5vq7n
         Gpj3KBiBOoZIuP9jneHI6ObUijuoEenIz7ZhfDMRT6ZdVmPG7LzmE2dlgJaJgXtJwuDo
         h+idNqkKcKKYD7flpfhaSIZA+fkB0ZY5Gu6gqi1Tc1qiuE5OmtN39rSmFh27z+HSmCrv
         kyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAwdZPB9HycY2CjKM6izUUPisDrJvhP4b0RAhlRsXNQO3nRsaHBEWUq9yhKtyQCJfaifCDG3E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ5V/znYU+apZ0v89d7fVv72R/dgRryHFO7eYNzHqYWSWHImq3
	3hhJvdjiYWjuZITwl7C8uJ43qBUKglcSb1grpVkkx21HECLC7nqmjUIc7ezV4AleEd7pPigbhpN
	eNqawmP0sc0LVO+h9mtUUIEwdRCiq56U32TUuKkE0m6zIvu5cCJwoLUWFs4G9h6S7rmpyw7F8
X-Gm-Gg: ASbGncupEDuffVTbMRE87ZcupU7eYxniFZ1iDOIxxVbRbbKq2ZELgiAPd8rSoH4sHe+
	5y5p6AF2ey01zxL7R6WQb4jcvsVGhels2QceJA8VnI0iErjwGFzoJXLBw/DDz0D9aX1CM+ChvyA
	Gvw9f//T64zHDxRzWfQVVV5KteNpizCquGwbv0eXOKcp+t6zNQeYfDxshVTalHjV90OTRVMfgUI
	vtzvg5TouxkASE7OjVT3dg8ReLa/9oWqpz2d9un11jGoGILFHzdA3GNPrUzfOjzRBt4NQwNklkC
	WRTeAQwgqgJ95v4yRqYzd9K6TDOno0kbG0wSm9qyAToKGk6Z/L2oPuJf6x3v0dVaohKGJVAuAQ/
	EfESguJ0QO3nIne9v42dlSF83al6YiDoj8LJtzomH
X-Received: by 2002:a17:903:3ac8:b0:234:a033:b711 with SMTP id d9443c01a7336-23601dc017emr135552225ad.50.1749427860629;
        Sun, 08 Jun 2025 17:11:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1KUu/tEjUvpknxoMD5TLenltbICAuhrgw4dTLcSZWeDWalWh/E5WML0iQxjmQcoAfJiSBGg==
X-Received: by 2002:a17:903:3ac8:b0:234:a033:b711 with SMTP id d9443c01a7336-23601dc017emr135552075ad.50.1749427860314;
        Sun, 08 Jun 2025 17:11:00 -0700 (PDT)
Received: from hu-rkaliapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059cbsm43731235ad.165.2025.06.08.17.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 17:11:00 -0700 (PDT)
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
To: johannes@sipsolutions.net, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
Subject: [PATCH wireless-next 3/3] wifi: ath12k: Send Puncturing pattern of mesh peer during assoc
Date: Mon,  9 Jun 2025 05:40:48 +0530
Message-Id: <20250609001048.2263586-4-ramasamy.kaliappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=68462696 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U-DH1WXsBolClD83dJkA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aNpTA1IgE20EBPJTxyBAPlpRfr47XSzd
X-Proofpoint-ORIG-GUID: aNpTA1IgE20EBPJTxyBAPlpRfr47XSzd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAwMCBTYWx0ZWRfX72oFLBm/59Sl
 mhQl1y+jA9Sa60KNN4O+FiGbzLZs1OYROL0v9idHyFE+jvZw+cmuwYUWvWBMQtL2Xl+EEN+0J2S
 1xAgIdo94pHT1xn1A2r8AXwcwfJ207DQmjEhGdRI0/KWUU0PXItQ+GjnVq/L6AFgrlLKGnLbuz7
 RruDZOvVfchI2d87N1VlhAIboFiXM7VvS6ptojGX7UaWQpueNsNi2ffxCMijkpv9OVTQoJQPUZT
 Z2Nbge6VyiS7+X4QKyCG050rqYlGN7wUphnwdE4DDohLSf4KQx9DF6lKm4gUbamxjIFim5VnEo8
 tB7jzgkuA3NS38/lV4Xag6XBC6JRc8WMnnRFGHOYxN1NzVwhVxitzbvxNDEfrFi4bvOi3B1Vslh
 9F/TexL5+OH01Rc/UuoN37KC+UrhTcOec9e1rOjfiOf6H6hiRurHW+57pfbOxbRwBteJYybD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_171103_069583_0A573DB1 
X-CRM114-Status: GOOD (  12.29  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Mesh peers can have different puncture pattern. Currently,
when associating with a mesh peer, the mesh peer's puncture pattern
is not updated to the firmware.

The puncturing bitmap should intersect when the mesh station
has a different puncturing bitmap than the self mesh vdev
punctured pattern.

Update the mesh peer puncturing bitmap in WMI peer
assoc command. Firmware will internally intersect peer
assoc puncturing param with self mesh vdev puncture pattern
and determine EHT PPDU Tx bandwidth for the peer.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88b59f3ff87a..4ac3d4f350ea 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3028,6 +3028,9 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	}
 
 	arg->punct_bitmap = ~arvif->punct_bitmap;
+	if (ieee80211_vif_is_mesh(arvif->ahvif->vif) && sta->deflink.punctured)
+		arg->punct_bitmap = ~sta->deflink.punctured;
+
 	arg->eht_disable_mcs15 = link_conf->eht_disable_mcs15;
 }
 
-- 
2.34.1


