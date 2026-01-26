Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9E0C88E43
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+MmwudRmmHBnDd5REUWJhq2FjqC5iYuepuKsWiFkJo=; b=zdsLausq0HWiRQVB9kIY2osHDb
	mLrFz1OQRDRQMiasvyyPOicartgOHqsQg5Onmw2R61ykAY/mcI4IT6D+HcoDi7XBpfvLKHREwqPdu
	kkmsPoQ62sT+UaQcKrVLpuP4cjDINq3Yx0ECLBZCpAQxnpl1yCOehBKLG1hqCn8Jytl17e9K9ifKY
	Se4Zpyw0Wyj4ix03XiDozjpEhsRIGByVDOzERR2f0RDc4c78At+3mYM4EZLriviCtTFznAWKBeimL
	oCPxjw4CEBWPM3JYxr5vweYalq0Suc85OBIVaE3YxVKAXogAv3q8Lm7YYLqPp1RwR1tPsvnLnK0sY
	Wj+HKSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkD8v-0000000Bpdj-0mNL;
	Mon, 26 Jan 2026 03:19:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkD8r-0000000BpdL-3dkg
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 03:19:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKckJQ3914455
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 03:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+MmwudRmmHBnDd5REUWJhq2FjqC5iYuepuKsWiFkJo=; b=UoU8VHQ7ihkZL6vL
	Ol0LeGWq3FfX+FDCjWLp6Ve4OxS4ANLi34FfEsXpgufzq9LSlRx9XqPzviFrlWn1
	vj1zMY1G+ZRT5EHSITCwAjMu2jEZ6rumfzinJ+AnrGANPODZnGV45b+ZsJzm4mRr
	SkTNeIesg030KGfqkGaLaJsoNBviy3Qu5THvFQI3jmPTZF9cVG0ogfg70YsEFSf1
	OmZkvGC5DOHojyUWVlcQ5cx80hx819HsEu5lxrsGPLL+rhJufIbMsc5Xuq8pFQuZ
	LOwhNA970j/rrzLh9Si+rrSPy0Jn1hMeXx1hjnhXefFPg1V5ffjLq9DAJaOhMuAt
	UOl5Vg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24k8qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 03:19:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d058fc56so29800865ad.3
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 19:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769397591; x=1770002391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+MmwudRmmHBnDd5REUWJhq2FjqC5iYuepuKsWiFkJo=;
        b=Z4PT3S/Vf3oeHqzreTSxrBQqr7ZzYo9pEZp/tNRGFJLCWtR7LNAa/sQpRtVQvJxDzT
         Y6dqQQYWpgPKRSLTVU+riOLoZJx+wjr7j6LntcOKiJngT25F1CR/fIIS6Oxl6Yv48jPW
         dPB3ONS5VVjY0qjhI5uRtHPV/HSkfDAJFAC4wmgmTrGRxyMCpiHs93cKj9RoeH6pgMFD
         ZmgBVGicMfLYLW3JNaZFuu8dbJNfKP3/mhlZiDIVllOmB6ae2MQSvxOviavBL99S2z2u
         Uzc4N/RFIsefUIbXe/eZHkh46NeTMQrg/UpFyW6lNO6zduusbHVaUo3VulCKMwef+QhT
         81sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769397591; x=1770002391;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+MmwudRmmHBnDd5REUWJhq2FjqC5iYuepuKsWiFkJo=;
        b=JgjHtGZ/VGkGLfyhqHDbNxye0BVGFqKMI3c2fZ8eW5yiYI468EWW2J4MMWzzV2xik1
         et8PfxwEjDE0LZK5TnwgBt8Qh+faOkY3ibnR5lAjimSEDS5nsRXeHYjk7sWalw30qej/
         CYMNH+HvWUXgvdefBS+8kASnZtMb0a0ILN1gfhv0OOP0M172gI5UEzsdHBQrTL0hOUUE
         Bqv0avtYZFfGFBIb2yjgPDlIZBelF/LqIaVpUd2ETgb9eL3oEqHEyG6g2hCAnotu71BJ
         nDKOpNGtls4qt35DxaMNG8Mx+mSdCVEIde+zR0m5Zti80qYBkxFtk33vFcAZBKCGJvbP
         eDxg==
X-Gm-Message-State: AOJu0YwegPkQ4xPuTJwLw7qVw8tpUN2Oiur5ELdxaeJDoJO/oDGaUSh8
	FtowYR9jd8pIZYsmwxMKzRrG10Qms+oMLSi5EVw1TLshV5az7kQOL8ct9zwlmSuQab0uMgfjQN4
	AxwdC+PaUDR/Glbus2zBvb2z6iu3siSX7p/GLM/7z+qWujS94ffdqBqYL5q2Uwx3U
X-Gm-Gg: AZuq6aI0/lRIlicQN6FsCcdBxgDNxbVkGTyG6LuPOUvsKnMer7m6e/+v9garND5kqiI
	CzScocbufXlHMAdHJl8aOqIRxhtIpSTciHC94CB9ZrC/GSE05SRZZEMjM5bbGIrXzrmN5YDrLCy
	+V6NAeYRceMndY728+/YNp3PG9gczfJa8VuHZTmDhZDt8t/J8/nEq3aVPJicrWZ21dce+PfY1tg
	l5sfpiasuhPvmUkkQMPs2iim41/iWa4f4F9Ry51OrPSbOfTDH9lNuf8gGGQFG2j9J+ZbvSSbivy
	xSvpnzZmrcVr3bEoRgdx3+XC1W5FJcVd1XJLoyYsuonHysc8RfgWrLYV9fdboTasnIcNMYA7E3E
	n0+roRSOGzu65REt0QqKw4ufvdM04xt/xcb+gjFEYt5OeZsX5z8HA+GEy41aS5L981e1VnMs=
X-Received: by 2002:a17:903:2a87:b0:2a0:941a:6b08 with SMTP id d9443c01a7336-2a845257d1amr25027925ad.21.1769397591552;
        Sun, 25 Jan 2026 19:19:51 -0800 (PST)
X-Received: by 2002:a17:903:2a87:b0:2a0:941a:6b08 with SMTP id d9443c01a7336-2a845257d1amr25027655ad.21.1769397591053;
        Sun, 25 Jan 2026 19:19:51 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353354a6926sm10367308a91.12.2026.01.25.19.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 19:19:50 -0800 (PST)
Message-ID: <40414ef7-4eed-41f8-bf1c-c94038b29cf4@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:19:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Add pdev-level OBSS PD
 configuration
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAyNyBTYWx0ZWRfXzCumO8uJ4sXq
 aZy6dcmw58A+NwyZioQr5W4kOZybI+GRKzKhzFNfJlkCeG3FkbHJOJsZkap79VC3fvSr6jvrjGk
 nxGJJR/2xKoggOZdHV75JSu7LhN5jFKcoLCeeke9hGgD9zMpfm8jQEnKRcgaXiD5UsMUjZSX1ud
 8PRJ1xYt3LxmWQny8Iizpg395R6WO0sGO+u2YaCjZAEdqm2HCKGO5ZZPajaFuemrn1nOg4EFmV3
 GNs2oKm+Y8XTsH7jWKJMm3bZtDhRrm2cVHVAJ/heyg1Os74fKu1BRy619/JfYx/3TrZcfkGP+hZ
 7TeWSb9aDDH472bsWb9jnAhFewx9WIUmYt+K2SNQs4TQ6p9Q7xLz0/SOe83WztgPqWNh3bp/PVz
 iLxikdQyBIq2/p731Syg53Vl1LiZ9Sse/2COO+lxXiZIDby2rQPcILwMgCfhv9gKyf2iMfesRSV
 elcP4zFs54wjs0Xtenw==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=6976dd58 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4n_vrpepdM3ewlY-ayIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: O7UX9o5Q2lpI7BHDbB7UQTYzH2yC7x-2
X-Proofpoint-ORIG-GUID: O7UX9o5Q2lpI7BHDbB7UQTYzH2yC7x-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_191954_060298_632FED37 
X-CRM114-Status: GOOD (  11.16  )
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



On 1/23/2026 2:48 PM, Wei Zhang wrote:
> This series introduces WMI support and AP-mode handling for HE Spatial
> Reuse in ath12k:
> 
> Patch 1 adds new WMI commands, TLV tags, and a service flag to configure
> SRG/non-SRG OBSS PD bitmaps (BSS color and partial BSSID) at the pdev
> level.
> Patch 2 switches AP mode to use the new pdev-level configuration path,
> programming OBSS PD thresholds, per-AC enablement, SR prohibit control,
> and SRG/non-SRG bitmaps based on mac80211 HE SPR parameters.
> 
> These changes enable firmware-managed OBSS PD behavior for HE Spatial
> Reuse.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> Tested-on: QCN9274 hw2.0 WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Wei Zhang (2):
>   wifi: ath12k: add WMI support for spatial reuse parameter
>     configuration
>   wifi: ath12k: support OBSS PD configuration for AP mode
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 170 +++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h |   3 +
>  drivers/net/wireless/ath/ath12k/wmi.c | 142 +++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h |  47 +++++++
>  4 files changed, 359 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 758064145fe77e06d07661b27dfa9c24fe0309a3

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


