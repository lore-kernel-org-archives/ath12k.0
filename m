Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A5C282EC
	for <ath12k@archiver.kernel.org>; Fri, 14 Mar 2025 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VyOn1aKiy6D4dgEukUkOVanpfIkyynBBfS6GIWtkA6Q=; b=crQwDwE8cuKVKwy95mEWAoNwjs
	IjFPIUHj+BxppuwxMwOyDvwQjvtc4m5UjeN33Fh03NePreGWkwuMk2u1ik9NXprkjEE+PHuZAXIOj
	u1Jm1SozM0/y1ClZgy2zD/rFfVsoHgK+cn5ZzT6gRgrczvZJ7btx2DLZZUdAqZn1f3ZtRxc1IbPf1
	TY6d6ZVF2jHFq/zPC5UjtUgE4l5wUGyQFYtT+6fR7T3eYS0sCtASYLuO6DfSSH33fcB8f4dfUE578
	EyHKa2fm7WELTcLEb4lIQsPe/1/U2uuPrxVp6nQCi6boR6P4P6f3ofeH8MYOuRaTgRgINtQ2L49Yz
	RMkmaUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttACe-0000000F4MM-06Cn
	for ath12k@archiver.kernel.org;
	Fri, 14 Mar 2025 18:56:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttACb-0000000F4Lf-1BOS
	for ath12k@lists.infradead.org;
	Fri, 14 Mar 2025 18:56:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EAPBlD019879
	for <ath12k@lists.infradead.org>; Fri, 14 Mar 2025 18:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VyOn1aKiy6D4dgEukUkOVanpfIkyynBBfS6
	GIWtkA6Q=; b=SQRihnTijjjy1k3k0d2tTdow5Ds+Vpl6wFJAmEGKUS5vgtreXUe
	pzMNGMreew+F60xiI8qduaCMvYbMSpda2cBMtiP3gJVjWeIEEE1xJMCXpcpetvt2
	2eV3GXnDPvHVe97qjCNBiAVv0v7LW++wQ2nccw++xXL2u9Y7wgDUCGXk6PMRiaJ2
	tleT1SBH9MLb4n5VA9+0re7dmFxwdmd7Pns5ChH9v/+yd04zAL2lqvZmCaEr3KS+
	bG7yKWvA+k3FmcY0jh2aMSSa4m/UDhF+TkUML8Zth73lYPGuz/NsXxSd6dl/65v5
	aZzewXAzWZTTNnXOtv+cFC2hCZVPyr6kmig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cjph1a8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Mar 2025 18:56:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254e0b4b85so40100245ad.0
        for <ath12k@lists.infradead.org>; Fri, 14 Mar 2025 11:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741978569; x=1742583369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyOn1aKiy6D4dgEukUkOVanpfIkyynBBfS6GIWtkA6Q=;
        b=UsKlXtxK0N1TaFJZYou1qLqUutO2wKLE7pj7GW00wBiJ2UP4szyQV7YmqG4BFGuw9u
         nbl9Q+KkjOH6kwI/9HEu5nFnAC/URt1bNta9yaJIT3vLo5Mx6hXeoy0Omrzc3sXRJu47
         1mhGVCElGvNkHNiu+UcQM71rgnNaj9THRzwVt2GIBqmBeUL7erLUjkOwFjT4epUX97D7
         P2qkGMKB6StunVMxOfjyPsHPYp6/vzt3+LgO6OBI7rdS1sP7fVWthb/ipDTEuzLNmxOq
         VYBuUnLzm0NVrQWJv2M3ANIXzdkcgNCO5vKwyoFgK45TsopyT3ww1aa66oEeppujt3pA
         U7iQ==
X-Gm-Message-State: AOJu0YypeDbVdnnRdC5kDzWaz7HtE1whMh/0G15xcbZweJ4nYKBU3hMJ
	EzzK4Bd/hxKpx8TN81CcUBsoNzhw6ad5Q/bRpYwpaHafu5IhBK4VWMVy7RZYeSp8LuaAdDQJRFC
	9kUzqdf6LpnzbxFE+yNIpVUeI+qEIG8Xpc52iycg6/WWt487692ysdd5MP2dpIuNx/avz
X-Gm-Gg: ASbGnctIG+tDKXVc92Kx+iVHGE9Fh8U9GPQlPprb+7WsKzBJE8CYp7icmTDkAsJVcFZ
	rQejoErOtq9khC6fQl0BiptSZ/OG6iYY3NwXMPy6Ooyg95C6SUDed1U9hFJajK4TT0QyuVY2hvS
	qrpR09/pDSOslvbcquEp5ZACOnbyyhgogRHkP3vqKnXLB6TKlOKlB53s3cp2urDAX/cpLkS61oT
	Q4TKqVy7FWeZdIwruNw2Zb7tp8epFA54Lz1b7LoAjWhkT2G3Np5svqhSsSijByRVtzT8v0bIQK1
	pDReM8loBQ7AfsT40Ou9nYK7SAfq7YyYMeIhatVSsJf3xmj2e7euhepAJE1XeJcvtlOqMotd
X-Received: by 2002:a17:902:f681:b0:21f:6f33:f96 with SMTP id d9443c01a7336-225c651f518mr92671565ad.6.1741978569127;
        Fri, 14 Mar 2025 11:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/GGBWRoSuRKKWXboT1ZxtyS1iodJlSRZgdnr7kSncoS+ebLA7B9IliKWxFY0tpmYCBtMd5g==
X-Received: by 2002:a17:902:f681:b0:21f:6f33:f96 with SMTP id d9443c01a7336-225c651f518mr92671385ad.6.1741978568723;
        Fri, 14 Mar 2025 11:56:08 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4d61sm31793525ad.242.2025.03.14.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 11:56:08 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: remove open parenthesis
Date: Fri, 14 Mar 2025 11:56:05 -0700
Message-Id: <20250314185605.68454-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7sw9VSF c=1 sm=1 tr=0 ts=67d47bca cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=pZvEp3DiZLBnWKbc7rQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7-_or8P3ijjkaTVBLnCkJRDESknzZ85r
X-Proofpoint-ORIG-GUID: 7-_or8P3ijjkaTVBLnCkJRDESknzZ85r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 mlxlogscore=844 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_115613_437048_F81E050B 
X-CRM114-Status: GOOD (  11.10  )
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

PMF debug log has an open parenthesis that is not needed.

Remove open parenthesis.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ca50853ef190..84154fc270d0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7557,7 +7557,7 @@ static int ath12k_mac_start(struct ath12k *ar)
 					1, pdev->pdev_id);
 
 	if (ret) {
-		ath12k_err(ab, "failed to enable PMF QOS: (%d\n", ret);
+		ath12k_err(ab, "failed to enable PMF QOS: %d\n", ret);
 		goto err;
 	}
 

base-commit: 0e28ee106c46c95eb322833c17c33e3c231ccd0d
-- 
2.34.1


