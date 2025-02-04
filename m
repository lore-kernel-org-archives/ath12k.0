Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9C9C02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbAWOdRveCbpzhH2pzN+O2kbwmqTXxZLpGezB7431Tg=; b=EIbmrywJhu2G0ls64u54KfDlIF
	wJ9Qcg8DiqFCRF2JmPUKwsvTwL+ea4eyfW+4MI8qyIDOHQ4eOAYwmYYEHOuoKbmq4vUaKS0ER9mQ+
	4CmS3hMT+RgPV03ojEWNeg6kZvIyoG6tJX8BY7QmEdCPHacuWt1gkabLvdtsgDPw43MNQsCYmtzR4
	gYVTPD80ItzlT1tQOBpwyHF0Hc91FumWEo8piGzzh6Cm0lJsDblYspdAoMK9EydJQG5zRJ+Qce+4E
	HkDgQrSjmBTEAt/aQBJnf+NhjDR397VSqSc5MEIcyiWuoShwPm454h0uYDKYMPQ/IDseKZwliHrXy
	CncccFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDUJ-0000000HR8y-2mjc
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:36:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDUH-0000000HR8H-2NZd
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:36:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51457wOc008232
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbAWOdRveCbpzhH2pzN+O2kbwmqTXxZLpGezB7431Tg=; b=HENYCoN9VdwMXpqE
	LryL3nxGibOOFH4dHNkY7licAGv2YJWVDkumMahIr8EmnAX8PHvP2wA+1ElPeIPx
	jMFGh/B1jMZ5cxnv5zVwes3y4z38FJDuesj6yqLK3C5X8RHtaPJpeK1P7pO/1FxT
	lGmV6ppvCwnzoIBF/7yaM8nh4/84xazrz4A75W2SWe1JIuTELo0JnluXkSjGbSF5
	HI7pprvVrEzwp3GMQAg8Y8sH3OKkZGeDVMr+ReeznOwrHjudm+8Bbfl+YFw2b+hm
	FGNkUhF8XDu1n3+eAB/TBAVCI8xAOrYGSm/596K4tCgxnM2I6R2d1RandKxNIXg4
	ys/f9w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcfp09hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:36:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so9967557a91.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654607; x=1739259407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbAWOdRveCbpzhH2pzN+O2kbwmqTXxZLpGezB7431Tg=;
        b=Mx0E//EGcL+ozyb9CtVLhyA55E545lxmvT+Hv4sH0YA4vImsH0+vAziik9WgqhOYli
         07sc2Oj1PIVk1hB6+DdgxdJWaKG3Wm4ck2chInhP57Q3lytei3j21EaGTfMdO5by5uW9
         T8paBFwPDjyndrT8ExJAWyABEBY7HVo6irS+hKga7XYhaeUc6jDpzA1Bnes6M59DMzFC
         EuSarQfTZ5mr4FLzLohAlhW0hyLTiUPfNra5KqX5UZfACrJJeRYEKEufj982oylAGPzK
         7K8JEipUvuRUr/T7B/zhsHujNLp6t32WDvQAwD7ylSJ4sazgf5LPg9UX5ts9N0a+o+F0
         1CUw==
X-Forwarded-Encrypted: i=1; AJvYcCUCyuwVRwNDH3OYjGBMC8pmJv1cTxd2ePk9tUT15JGIn3Cwl/KCnE2E4ZtSl4vrPX0rK8ckVUk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcMa4EdrWZTpXpi+Sp/nUzclqaf73mUR7bmlDp5Gx2OVMIY5VR
	hk1DpmCLFiGNUIBsrFNlF1BC3T7zO++dnCyGMuFaFO1Rv3AGwmcdlvJlCTzQ5aj696Otq14IbwE
	ONskZ3iPim36yb9GAavVj7Pg38IkNdqNjpeKqckvIM87k1gvowHD26Z//fQjA
X-Gm-Gg: ASbGncsYmQKZYKBBwEz7EKGcDv7n6/GeevWEvLwg9oHab85fMCs1zo9PyjYE6+Xe8Ca
	XzR93UlCvwZlzRTklYgutvXHRWUjEebVch3y/vtHxATkJqE08IdmrwoltnXZXXOYWU2ZBPZHcD/
	GSdFIY36zo4X6S3716x37GKIHbXbdc0yVzu/b2KkPa87KrvAAJmzJAQt2HAAWA6Of0uJT3HHjuv
	MiGpruEbmdg4nDt2hCmLHYmo62MUdEKjnv0478dXmniu8QU1foyOR6CEbbKbNauVMwOD8ZRSbuZ
	V9DAuVH/sXpbwWemQUQ8pR7/RmHzAZZMWgR9++fEIv9wrjY=
X-Received: by 2002:a17:90a:dfc7:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2f83abf3750mr41483080a91.14.1738654607377;
        Mon, 03 Feb 2025 23:36:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7Xutuk35lQ6hPLOJ5yqhph9zSp2c530B4uK44ZIzrRai7sqcKP/ZFgEZJfc3lJU+RJtITsw==
X-Received: by 2002:a17:90a:dfc7:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2f83abf3750mr41483035a91.14.1738654606986;
        Mon, 03 Feb 2025 23:36:46 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bccd590sm12752169a91.12.2025.02.03.23.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:46 -0800 (PST)
Message-ID: <c2169141-2449-16fb-55be-8145854ebf78@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:06:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] wifi: ath12k: allocate new links in
 change_vif_links()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-7-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-7-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: clsq9wyzvullxNLTSMH_MiQtEf1EaTN9
X-Proofpoint-ORIG-GUID: clsq9wyzvullxNLTSMH_MiQtEf1EaTN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233649_726695_65AC92D8 
X-CRM114-Status: GOOD (  12.47  )
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



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> Currently, links in an interface are allocated during channel assignment
> via assign_vif_chanctx(). Conversely, links are deleted during channel
> unassignment via unassign_vif_chanctx(). However, deleting links during
> channel unassignment does not comply with mac80211 link handling.
> Therefore, this process should be managed within change_vif_links(). To
> maintain symmetry, link addition should also be handled in
> change_vif_links().
> 
> Hence, add changes to allocate link arvif in change_vif_links(). Creating
> the link interface on firmware will still be done during channel
> assignment.
> 
> And since link will be created but channel might not be assigned, there is
> a need now to test is_created flag in ath12k_mac_mlo_get_vdev_args() before
> accessing link_conf or else link bring up will fail.
> 
> A subsequent change will handle link removal part.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

