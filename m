Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCC2CD6E49
	for <ath12k@archiver.kernel.org>; Sat, 30 May 2026 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uRD66FKDWLNiktBxoDeBLGm6tf0fhPc9ZoqTh6hw3A=; b=XrbjyPQrHxB3o88RNhJyLsLk5U
	x7tcadHjv+aP+x0fxH8vgPfzcepTBc5va6KBwYwaZSrX56n82oGbYRnXZyiDoYQvPXe3ZHm6JlFi7
	D9YmSdKn2Rz4uijE50EPIXUyqMvCjmYx2tHbuwAM3GD3WXyVF2fE6/H0ncgu6gOeZdI+2yQlAxreY
	Sg7prU8I6yHd4vSZLubMxGfyMmXw2CapvjrLpwqjzvNCnRRdT10n9ItIQRIkwpQI1IyjviRoo1wl4
	e/9V96km6Moz+8pk598it3zSs6/2Ej9O1h7zIH8kAZvXbc7m74TXvGxqB0ME7TcdtqHBfeQM1h/ho
	lJlkBjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNdA-00000008ybI-0w8g;
	Sat, 30 May 2026 17:37:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNd7-00000008yax-2kCh
	for ath12k@lists.infradead.org;
	Sat, 30 May 2026 17:37:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UFJ7A22368950
	for <ath12k@lists.infradead.org>; Sat, 30 May 2026 17:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uRD66FKDWLNiktBxoDeBLGm6tf0fhPc9ZoqTh6hw3A=; b=i5ipaRNYH/QvV2Oj
	2DLEIFDVVm0KAyTGUhBYSy8ORGG/iTnbDk2+U5+ksK+wPL8je+6kdR98DiLOK5Ws
	lr1l7J0+FLsWvyvcPyQWgeh3VnnnWgLcNy2kjLD6WLa6aFahd/5Bsndko/Wo+0/Y
	KTTPNst23YKeBmHbWLMf4b/5jABqU6vlO1b2oln4Tk80I592N/25egtBNYJ2Zl/w
	nNjHFUnb3GZtGiB7nGE2jIQFHDcB550YnbAnffejTnDPn3H+pd4Z+0a4JjbDwkmM
	DK0GM5HN27xKVWZg2AaWo+zKt0tZAcvBDfishEcsOK1BXriC+2/B/oAPdbQY4abW
	1baPiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efs66scgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 30 May 2026 17:37:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2beb9002a00so78310495ad.0
        for <ath12k@lists.infradead.org>; Sat, 30 May 2026 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780162668; x=1780767468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uRD66FKDWLNiktBxoDeBLGm6tf0fhPc9ZoqTh6hw3A=;
        b=kozZcxDrYDt3NeyC2vglIHjIUZghfNincJNHfJlyNGmQVWo3YWuUSxXUH3v3BFJ3nl
         103JNJURJrGtmUOaP0ubrut88Qgt4GQA2KDkKkVyJEnGp9D4Mue1GkCveGXY7vKUqsjQ
         w+TwU0K9hxXDrwrrD4z/7+rMg1xv2oAqIoraS0warKHn+kSCg0DQelNXo7m9gQ1h3xWj
         bxruCikMdxOs1Fv9uBYjvAK0vsWwL5dIJxE54lXloU1g9/ScNVBnN7+QGVQhuI2NyhhO
         VmpBsYlyUyXYLkkK/QQUg7tFbaZQcyAIcSdQyihPxWax/AfhoHkupBcxA3Tb92sz9Rqc
         2EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162668; x=1780767468;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uRD66FKDWLNiktBxoDeBLGm6tf0fhPc9ZoqTh6hw3A=;
        b=DpRGipK2oJYloCyRBGIAMnXH4Pm3Mop5390kcVKoioJUejI2Hud8851KPfJl55GFk+
         WU3H1GQrb3H/53I/hKl/MCSG+fndjNnp4snDun6odkpAiv1GqS53L3Q3b06VY4qf910V
         6L172+jFb2X59SP0BAIHg6FmwRBvjKlwRML5ps9jogT1p6vAA5X67G9FeX9LI/TVeG8N
         ePnzQvjH0CKr/fhjJiUqmTBQuuAbnqepmoKJ1rkeFNFtpR177TEAJD0ih3lfB3ZtJke/
         VEaumnpQPc7SAa5n+8W/RT4exM5oM0WT1bmhs8wTBuVjAtUVonGF0whhYN8RS6Vgg96B
         U4GQ==
X-Gm-Message-State: AOJu0YxVr2wWrhiyf032HJ2OiCWOjdeK0qzzvuxiEzUjq1KcMnBZG0TM
	VS1dXBxfiTpdTnqoZMsTXrKvHEWA2y0rEfCGu7kCuYEiAxBE+6XFF8irzaeKPAcuUKWhteLzZC7
	chGEsNhhejNMIe4KN0EjF+BC8DsFHjpeGJURA54Fe4DuUcqWbw4JSJGUhNPW2qi/Y
X-Gm-Gg: Acq92OEBGgr9fZAvLuUq1IGHO1HAbPoLRtTQ2MoEPaKDmQMbJkJbuffCn3XA1a8uUGS
	y7au34AHPeYWtB+Zt266YNucYE0SMzztk4+2fbEse1Gerxy70fCDegp2RiV1rhfeOf/q1VuW6co
	bGE2opJCAoY/DYPrCEQK4CqJQpJ/Dfx97TCiaCojNN8+5nJivArZyeipQglnCDSiTuVODnFcbZo
	oTWXZWDlrWLSp9TmAMLc8qBjvpg1a6NKV9lt6hiAQHpYqNFv+Xu5yCYHmUWmZgDLICTfZ3180+x
	Vp/sO0LfYpf0iDRedhY6fa1kmfH8STeYFZlfTZstpcscmjLUtqvdWe8A8OxDBhO5vaBqEHy52WA
	qNMANzKOQrXP/jlHC7FMfCWw/FXW2CYUbmijm0YOD19lFfTCmDGkUXj0DTfx3zrTGJ1HtiGt1yC
	AQ
X-Received: by 2002:a17:903:244d:b0:2bd:c310:f7c9 with SMTP id d9443c01a7336-2bf367b2353mr56429805ad.2.1780162668047;
        Sat, 30 May 2026 10:37:48 -0700 (PDT)
X-Received: by 2002:a17:903:244d:b0:2bd:c310:f7c9 with SMTP id d9443c01a7336-2bf367b2353mr56429675ad.2.1780162667589;
        Sat, 30 May 2026 10:37:47 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd7bfsm53050615ad.19.2026.05.30.10.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 10:37:47 -0700 (PDT)
Message-ID: <6904229c-0de5-4e91-a532-80d9d0336793@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:07:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fix NULL deref when MLO link
 activation fails
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5MCBTYWx0ZWRfXwZtZtrIvwEB9
 Ypt/QYLsQ0Dq6K7dTw8KQPlBCGHW26kQblRwZeccdaHMInTX8EY/aiJ8c4bmksgsi0pvwZvPkiC
 vUnmbeMwz1LwQtyxJXSf7d6wROCX8pEv03TI8rilPbkLL5Q1vDHi1VUbVh7s6y6+aSEmSjn56+X
 dIykGXDc/U96FjsBZoKj4HaBtTYPX2NvFa1qqdkk1z+Vs89C+vJ6S3LVIMSs2chdXYSs4gzfPDS
 Vfm7VLKhXffzBtqfsYnVnOOMYNIGu9H1ylV07hFZh+eSd+IoofiWxH6y3KhvsQyUejTasHeZCjW
 +v93xxfedwAFmKWf0ZV0spaytYqmSx+8zU9Oyc/cjGecH/VskSucH8YCMESr6+0G4fM5cFEW+Ll
 G4iGvD+82xDMnU31hOiDzh9kybO8caKEjvAcEmD1vtCKQfcLWO34qrOXuCyxmJBN9uJNzZEhNga
 yKHpYOjnEI21yByzxEg==
X-Authority-Analysis: v=2.4 cv=X8di7mTe c=1 sm=1 tr=0 ts=6a1b206d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Bf6z4bKntrc-jtSRWE8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: krXiuRfo1ZvKujmcNmDrvGDjSHfntXWv
X-Proofpoint-GUID: krXiuRfo1ZvKujmcNmDrvGDjSHfntXWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_103749_704172_3F29C68E 
X-CRM114-Status: GOOD (  11.11  )
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

On 5/12/2026 10:19 AM, Wei Zhang wrote:
> ath12k_mac_op_change_sta_links() adds a link to ahsta->links_map
> before verifying that the link's vdev is ready, allowing broken links
> to be processed by subsequent operations and causing NULL dereferences.
> 
> Patch 1 fixes three error path inconsistencies in ath12k_mac_vdev_create()
> that leave arvif state or vdev resources inconsistent: a direct return on
> wmi_vdev_create failure bypasses err: which clears arvif->ar; and both
> failure paths in err_peer_del skip the DP peer cleanup and vdev rollback.
> 
> Patch 2 uses arvif->is_created (made reliable by patch 1) to guard
> against links with no vdev before allocating a link station, preventing
> broken links from entering links_map.
> 
> Wei Zhang (2):
>    wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
>    wifi: ath12k: fix NULL deref in change_sta_links for unready link
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> base-commit: 7b25796f571fc09a7aa6fe7efb23edccd326917d

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

