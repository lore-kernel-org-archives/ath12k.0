Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ADFD29DC2
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 05:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tU/KRnYAILDO3dB1Azc+pM/mtMZvzE4x8geT7Su0Pyk=; b=j2qQgFDw+FwLU9oXKnu0CUQPlS
	dHBdxyNem4ZxWscZ0SqQXUjeissqSUX5aRmmiO7sivlCizAS2O+YTpBClXVWsS7YPunRfIiHaiNSp
	UFpqM22LfNwvRROtlyIXrtOBqE2ZcDXu92uXqd9SkA7v1MdVfaZbYO/IqOnwQBD8+2DpwM++MP/7A
	Dw0eaICVzQIzHoSIWiciraj6MpNzvvCe9/0KEAnHKI0+zqlhzPoJh/E7c+pFgGZPkRUKyaZyIRxEp
	+bqmJAC/Hs93irskIn4nZkbh911a/2X3I10Px0JVG1cpaIXwctRLfmWvbMH1OsNhkwZ8qp4edSjyA
	tMrNkRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXEt-00000006Z1v-0LQ8;
	Tue, 13 Jan 2026 05:46:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXEo-00000006Z1B-3ggS
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 05:46:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1tSmR2751258
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 05:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tU/KRnYAILDO3dB1Azc+pM/mtMZvzE4x8ge
	T7Su0Pyk=; b=RSPq7YFi+FTwr53tcfFuJ4rsqH1chiruMjac53rht0M64cASezC
	BSi3q9a1OKC3cN0wtN+EZdGVg3xS0b7PEkyDzzrYfIhYzzat/62HUAZaKrEhVfUV
	HZmYyNIctBtlPZ0fz6yI+CM1VRP3g+08zx4N9e64scRCgQR34wpQDwbq+8TABvqa
	G520JrHwcwErVyF7jyHdzC+P+8f9hOddYLAPiZOcv7xP4jwnG6zLgErJMPm8NbPr
	vMC1cCvfAfRPpEKBqGTHz+oETJjY4ckHJXr5RTHpKrBNzZ/qQ5vRNZ2dJIKoLuHm
	eRxThcHphsljKwu8V5TdIo9grE3Wt+HJXsw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjrj42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 05:46:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-121adbf76c3so9392232c88.1
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 21:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768283200; x=1768888000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tU/KRnYAILDO3dB1Azc+pM/mtMZvzE4x8geT7Su0Pyk=;
        b=A3e8//sKYPWHmWy4nW6WJBFaJeExu1JHVyYp+QvswsMNhWWbxuJOt/3wglb05GLSb7
         j3umyXnbO2yiDUVEGth3tmGMirX1X/scBABOFjNmcRnAosajo30REzdrKVbdtAZY2mwi
         Po6+oA224Z7OvSmkRlGVMlYZKBZnuoke/7rDDenedGfr+BSEMQzthyLI/DeBStRyBEjv
         b7aRRcxNdtRV8VII9+JcHrIfXvfwbrkIT/GEjd7fl9Sfr4OvXsepoi6ReWq3TDU96qq4
         q/HwQxZX+OA22w6IMM1XB1VYQEKAZR3Qbx1pkaB4n0pv1MTa0h4MxOkPcer2iS6Y/GjN
         s/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768283200; x=1768888000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU/KRnYAILDO3dB1Azc+pM/mtMZvzE4x8geT7Su0Pyk=;
        b=e0EUvqscP6yDlHUDhxpdYVw5eCfs5QtRqelDGlBAXBH4BRTLHeeYSg3LNgg+43YtMY
         SPkzkknteWIe7pknmOuTOzFRsJVClAlH/EvUq0sETnc7HUaNivrt0lia2aztn9DdlX+o
         3R03dl34LUJEDn6i+DV3sskR7nmgbBj9mwbSrFggUqJXTIw6bCskK8F5JkufqyjWC0sf
         zyVFHAXezq2wRDJIrYZGWWD/yNKZG90VasqquBtjoeARvu6kNPcQSQeFyRG8WlwYpe46
         xDN5p81+BzmUjAbqBY4g8s5fGrZfgp1M+Yzf4OxeKV2+wSMqm/5F4Z4/yErEcyP/V6UZ
         AElQ==
X-Gm-Message-State: AOJu0Yx2kwoKaW/PIMdFot4pq5R/uqBfABCqEm/amgX8VEW3AwwUTWdX
	T9iNLGO9GP+KZj4g4C+ra3SAgDgqlPwJFJg/FF6taXSchh1EYhCdMSfhCcvb9lY5aD/7F1IyrAa
	NQa/YJC+kr2p3+rtVM8j0Vk8wVW+5wkzX8rZ1DW8KtN8emEcr2HoI1zzw8tH2bkXmpOOiQ6zt
X-Gm-Gg: AY/fxX7TlfjQNDu01L4uXH+kIyMPHdodzmCJUBae2fUaTZwcQJLDZxHIoHlWUQBGPLQ
	bhXKQIFEUypQ5Bx4b85H4kw31bGnQFN/jmF7FNFsLC4u4e+bB+psN53UfwfJohZH1qmeF6F+NDs
	MgUsMict2cAmDzTKySg3SizSjT5BeeJT2GpbB4n/30HrrUv0wOG35COOSODJ0tJPMh5SOrUCBuV
	q5jsbyTzMWEoFz8xQ5eCqcrsT6mBYMgQAul+5mdsMt9JRmnTgv075S8fJnADBWper8aG2kXIn2T
	rlU0EQ4apqu2DnCBUUMPD9B01kC1f8MN8aZmlhi/hKk3Iy3/qCHccCKGy9X+5s9TdwXzR2vsvr3
	dTe1Gt6O6SH3yuViuwShWUsXLkrb2Hdu/Zno++k4zqqV2xnQtNkNZf7+/KoirCyQ0
X-Received: by 2002:a05:7022:118:b0:11b:65e:f35 with SMTP id a92af1059eb24-121f8afc59emr17921984c88.7.1768283200320;
        Mon, 12 Jan 2026 21:46:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq/sH/GSbEemIBwDDxPWkUQ6BoWEy4MTQOBcAtcPuMD1IdoI3ztfh0bidQtJfCCH2UatIzAg==
X-Received: by 2002:a05:7022:118:b0:11b:65e:f35 with SMTP id a92af1059eb24-121f8afc59emr17921952c88.7.1768283199775;
        Mon, 12 Jan 2026 21:46:39 -0800 (PST)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm17879256eec.5.2026.01.12.21.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 21:46:39 -0800 (PST)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        yingying.tang@oss.qualcomm.com
Subject: [PATCH ath-current] wifi: ath12k: Fix wrong P2P device link id issue
Date: Tue, 13 Jan 2026 13:46:36 +0800
Message-Id: <20260113054636.2620035-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA0NSBTYWx0ZWRfX2rUqpxxYfFLc
 HFYLPY1RsDzv8Dh4BkgiJ5VhhtzmWZXKOE8S40cHmHnk1dArQYyEUSE1IFjWp0JEFxcXDrEXREa
 /TGDei6lN3HPhNqSLeKTuDOHGEXjYzgXjHl9ba/ej18yM1iqI2lU4yCUUBdU9uxNjBZDAe9tqEr
 auHopcDk9+rvD7abvVPoCh63Mz83cNtCVfaFUrg3cKeWaiKrnVWd73hA4tB8stLXhXJNWceRdqh
 abI7qAoLZMJKGydShw27kWk/GoTtvL6twzNuTkZTpSH/QowrC8bvoGhZuNvH81UrEc3GGHjz8BM
 39VIK90NY2+5SusSP3+7/OFLUK5RhDY9B+0EHRiuEU75uJVgWlLUgTueelt6Cw0dtu3BDT90nZd
 7eA4MShH3dkIP2/GweiO/WvxRoR3ulg7pbfqND4Zwh/jL6o7FJ5RHaggkW52d43tUkTOp438C82
 PqCcfR2WIHrBqurQdbQ==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=6965dc41 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tX-LjxTrKDr3nCdR25UA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: n_d8XFgH5U16TZOu6ava6GEOBYBrzqKl
X-Proofpoint-GUID: n_d8XFgH5U16TZOu6ava6GEOBYBrzqKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_214643_043866_3E19A059 
X-CRM114-Status: GOOD (  15.27  )
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

Wrong P2P device link id value of 0 was introduced in ath12k_mac_op_tx() by [1].

During the P2P negotiation process, there is only one scan vdev with link ID 15.
Currently, the device link ID is incorrectly set to 0 in ath12k_mac_op_tx()
during the P2P negotiation process, which leads to TX failures.

Set the correct P2P device link ID to 15 to fix the TX failure issue.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 648a121bafa3 ("wifi: ath12k: ath12k_mac_op_tx(): MLO support") # [1]
Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index db351c922018..32cdf6d73ac0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8838,7 +8838,10 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 			return;
 		}
 	} else {
-		link_id = 0;
+		if (vif->type == NL80211_IFTYPE_P2P_DEVICE)
+			link_id = ATH12K_FIRST_SCAN_LINK;
+		else
+			link_id = 0;
 	}
 
 	arvif = rcu_dereference(ahvif->link[link_id]);
-- 
base-commit: d0309c054362a235077327b46f727bc48878a3bc


