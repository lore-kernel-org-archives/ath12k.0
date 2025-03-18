Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0F8C35FF3
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+yq6v8v3HHnAum7+7jnCtPk0HsxZODrvCK8fT5xb+E=; b=Son9P1WdQUpgUpMp0PXuH4xanb
	zZspXXuZAs4IDUuEef1GamqnISMErRgQX8xRNO0kGznGnDtJLE2qkUuAcjQfVVawIt5cJsjl6DjCR
	hBL5kgaYGjxqPacebAL15SKeriFm1DL7tZgkAWLijOMKv8CPpRN9jYRGezIuyHf9qbWfGAklkBe80
	mMETf/8fdVP1zvwJqF3sPdDBPFXbBvgiejFXDKsscxZ6koak2wPFl30rREfcIvAXWifCOIcWot4j6
	56cARcXwKLeHM1tj1g/S/IlM1pQKAldvRMVApCR3zWJGBJZPDYeCn4hFafd1+Afm3Q71lZanYP8sN
	MzaO/BNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tueGM-000000076MC-3bWf
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 21:14:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tueEz-000000076FO-0DZK
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 21:12:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IGAT2I004568
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 21:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+yq6v8v3HHnAum7+7jnCtPk
	0HsxZODrvCK8fT5xb+E=; b=iQaRTLZOclPewR9kCIWtctFH912QbaM4wa3W22Qd
	ZR9caZsW4SqVx/pe+JyY3VYV4a2tgn46KBV68rFXLZxfp4Fh3SfP4JRyPcNjZYQn
	6YDD6j40GN+Y2jNjy5iN6fKUYTKt6kZJCFmWM/1udW+T1ZO4YBCd1eSOHl+KvxAg
	NytjF2agXlspJ0Iq4aiAIuxXJJjnPDQw0rTcMBl4DWOw44W3W6KJvIBonpFfoKT1
	VeIyv8LmT9EiiF9jA7RPz+DTaTexBJ07oZ7SWigt7rkN75c3tPkjTZsmsHtveB5V
	YgkXIvT9uWk1RPe97XFqTapWopLXVhNDeyFFeVMmWU6r9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbutq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 21:12:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0c1025adbso1444236285a.1
        for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 14:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742332366; x=1742937166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+yq6v8v3HHnAum7+7jnCtPk0HsxZODrvCK8fT5xb+E=;
        b=eXiNsIifys73FgNC8pHzXbcx+PXO7BYseFClQtiC9zQtdTmoE/oOL93vNdt/OKVCmo
         Tt/f/oGY1Hzw0vOPSecqy7bykGupTG8M/E2ZXLWjY8ueMufLoIM0aanGBU2L9Pet1rlL
         D5ZLFBz7I2TO5hC2ccTtkR6Z8js/bS6Nwmmba8FmkGFDxPaL2mKoIxnv4YoRM7QcK72e
         t1t4uDXDijt++/G9gXCJME/Q5suzeP3CKC+kEss6EqIQNJdofJAua3xCglpS7IPX8uGT
         wksAyPafQzM31muF16JVHFpWa3OTgD6+Tn2rJl9h0A7pksMok/nZvi+9pfgtdzDxPq/3
         1TFg==
X-Forwarded-Encrypted: i=1; AJvYcCWaXs2N2h0qpn7GrU8Nzy3Qv2nqG/fB+RLdVxNQ4UGHtSgdXMmd4dvqq+gCc34GHCD3D/wHH1Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYNLujBqeGahN40VzSOdhbYEKWGpLquZI5FcKb0fsTrgiRbv0P
	ZJ2u5jg5Yyq/UD8+CHM96GvxwmuDS3amjVA3mFemiMnR3mzqt6WQoIYRDyJSMFEeuWibEBwRL3m
	5UK+S6dGuWeYUFqJlCZFPpWbeH3zqjc7ijn28PLGfqVH2CCLLpGKrrqJuAWbj
X-Gm-Gg: ASbGncssBSZJWK4xAzSZ8UyPDmHOr7PI/hLEh7wKvWDPMdS9p9y6e7RZMAQca7HYp72
	d5NuBCU1uEOyjo3h7+XQQxnQASt06DDEznzRCyHtQFJymHGsYElMNQ/1TMafPkvaQVoh4j+OX7B
	TjHHL+VlOBBk8zR5FWVHSHmMbKsaDtQdnqg3ArDNcpACUbnhznnxQtavzvda2wAKFEV5KtV41O5
	s/DBw9XUD3ahzAgvMVdg+hC3yS1VrTTWFnH0MJsRAKL/A+0pqE5r8in31UngYI78e1j5ublzr8b
	DbXcyjj2XWrb/D1fRqKzZVHA0hc3m7goni96Bmgn/SAn5WwWp36B4X/rVvVhQklrw0u/1xev4oh
	KKS8=
X-Received: by 2002:a05:620a:2483:b0:7c5:5768:40b3 with SMTP id af79cd13be357-7c5a8469b3fmr21663785a.45.1742332366633;
        Tue, 18 Mar 2025 14:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnufZVz5gRlnk7AOYnKewS8LotM/XOXWouX0li3fq1egAx+1r9AfmpEv7nD0vj12zeT2h33w==
X-Received: by 2002:a05:620a:2483:b0:7c5:5768:40b3 with SMTP id af79cd13be357-7c5a8469b3fmr21661785a.45.1742332366307;
        Tue, 18 Mar 2025 14:12:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba882806sm1761383e87.191.2025.03.18.14.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:12:45 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:12:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: linux-firmware@kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        Christoffer Sandberg <cs@tuxedocomputers.com>,
        Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH] ath12k: WCN7850 hw2.0: update board-2.bin
Message-ID: <iffofcri7ah2pwu3b77z5zfsa2wkzl5mcoarm2any4fdcjvsys@o35roczyxb6q>
References: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
X-Proofpoint-ORIG-GUID: Jo14mkneZBPSkCkCdTfhV2AMU_eIUwaO
X-Proofpoint-GUID: Jo14mkneZBPSkCkCdTfhV2AMU_eIUwaO
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d9e1cf cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=yDUiu3_GAAAA:8 a=vfnCp4mGswuaxUiX0_UA:9 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=gafEeHOdjwYkg5oUpzAY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=743 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_141249_223947_1BE965FA 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Mar 18, 2025 at 02:40:18PM +0100, Georg Gottleuber wrote:
> Added an additional board string with qca-swiss-army-knife:
> bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,
> qmi-chip-id=2,qmi-board-id=255
> 
> Tested with 2.4GHz, 5GHz and 6GHz (iperf3 -t30 --bidir)


Please follow the process specified at the kernel wiki [1]. Otherwise
the next update by Jeff will revert your changes.

[1] https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

> 
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>  ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 1987068 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/ath12k/WCN7850/hw2.0/board-2.bin
> b/ath12k/WCN7850/hw2.0/board-2.bin
> index
> 48f18e23014c4a8d1d771c4bd1ed1ceda00a33ef..659acff5411e6f10accbf227b46088fa83ec0291
> 100644
> GIT binary patch
> delta 89
> zcmV-f0H*(lqj~(Jd4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
> vgcO7ogcgJsgcyVwgc^h!v>f=90qB>ptr1g~OqCpV0WpV9l^nNEl^r>}c)}mC
> 
> delta 87
> zcmV-d0I2``qj`v<d4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
> tgcO7ogcgJsgcyVwgc^h!v>f=90d$wKtr1g~OqCpVhc=cRw>Fj?#=AG9A7=mn
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

