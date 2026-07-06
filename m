Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E40C43458
	for <ath12k@archiver.kernel.org>; Mon,  6 Jul 2026 04:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8uCEnvdXlL4V0kIs2HNz2HP0kgpCCW/AbbXVNw+D60=; b=ulIUpun0dz9JTt56N6f6zpcp8Y
	tLHpiShzpTvEuEMSP2/aTT3LKK7QCuxD8RvZDVGdbGFWhGxy5EV0rkalrDjAza6eV2yQWrRxLnVtx
	chCAQDMAMg7OhoiHjTGrWL5DB1ZM2R8/YTVKwoRCKIpAYiUcdCngnk4451YcvFlLlcKdNY2vYey+A
	1U0YWpT8NI8UaXO9LKIWKnA4IByXZdcZO8blYUiwrkb+TO0I9FPrbDRapZHRRYM7EPN+jAmIaF4iO
	Jn12iYxG9zXLlWyAuJBQxR+XltluCqxi4vMjQWIbKlu6StKaEN+eizJGNx7Vl6RBwS+V3LV48qFuM
	KXkKXRiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbCM-0000000BVIH-2fDg;
	Mon, 06 Jul 2026 04:44:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbCJ-0000000BVHw-1uod
	for ath12k@lists.infradead.org;
	Mon, 06 Jul 2026 04:44:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641WhX3402248
	for <ath12k@lists.infradead.org>; Mon, 6 Jul 2026 04:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8uCEnvdXlL4V0kIs2HNz2HP0kgpCCW/AbbXVNw+D60=; b=GkgvlNG4VS+EYFD+
	Dh/agRMZJPi04HXCxg7pAty+XO6ToYhI+Mr9sQV69rftYWGvGGC+Vw297/VVp125
	L6CBYc+LywVurcmmZjD+g62hR6bKyjLt7AFlSgRFu3ftggQWiGgk0PRgVNjEpNUU
	LRz4lfK3EPK65hzC6ZV7+cNqDErLWwdqkRsmqtpZkp9NVqKsUpbzgkm3PEtznf0W
	zhda0gUj3vlKKIruXsnXu19T2hhKxzrqfFD5MpBR6DRZYrVDFBbj1tXB5kqc5BnR
	h4mav/s/GZMzQ5YWVb3R4lJ8o6arqDcnBGq2yxfAN+UNKDpMwa2olqI5Pkse53sS
	i2633g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgm7mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 06 Jul 2026 04:44:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eebafso6289519a12.0
        for <ath12k@lists.infradead.org>; Sun, 05 Jul 2026 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313086; x=1783917886; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8uCEnvdXlL4V0kIs2HNz2HP0kgpCCW/AbbXVNw+D60=;
        b=jns59WzlNB+RyG374qg9+/4Vd8K+2mebxXi2O4bmX8T5YOIYCxPZ3LOZsinCdfSVYD
         TZQrReAzVE24uQXaN1DP4fAqviWnJb/t2Cc08ihnyAtu+hqYTsMjSgzyfPdHXOQeFUVA
         8WFwsJCSaOXahsqocwnZFsmjtj3SBISBYIkPm2TgahBqLCon+UXKkCHVB7EDfwGgF9qD
         NA5Pr1FZkiuhP2hp9XFm+ScHziKzVQPqJVmjxUeLIMKZd2fRCI3l2onMYZDxOW6uExjW
         iT9ZEmRjgRwDbvGR1aK0ECgfA53S6Y2BlqMZAwh+7EYR6bn4bNq66jDdqd9lO4MxOKAx
         AdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313086; x=1783917886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8uCEnvdXlL4V0kIs2HNz2HP0kgpCCW/AbbXVNw+D60=;
        b=T21D/95AzMfyxTP46ZmE0woBQieO5Jd7lekZyikmjMk9qNI+qJqR+MP9dPxG9gupYp
         h+cw9pIh48o4F35zrMFKidDxOn/VEELkXy9SKREsg64DBqRV6voQ592WkM2VjDPiEXdC
         oo+xwtICuO6E8ttTZsWL8ZR2WvI2bYGD+id/nekk/xVU2vTjUKDtxGtqTLdhbCRc6c0R
         h/Fr9/oyNfgRUdz8QIFolOuBwpn5/gZhK1VP1AfZsWT+b3Tvr2KdGb5anfFtiUQcCrY0
         M70DBwzEcDwhs6KbndlG23sU8OQ/uQ/vc0ZZzTHPDv2sHYNCxg8vQWsZLjVx1RM0eAU9
         z2cA==
X-Gm-Message-State: AOJu0Yya6n4/Bzh4Xk49qLQyDJOi+0TTkwLJxjy+rz8gYus0PDfcdhTk
	+y/LX04QVOD/TLZ0lzPlyo/qPitAUZ6zJaPCzlj4Z2akFh/Wcf0d0NvJ0sKbIpsTJXK6nbLX8wJ
	VF5LpaeRkdiCJWzSNDuEu8U96esj7tNB37il3bBv/C3sKdZkKjw5RKj0Yf8dg8l6I
X-Gm-Gg: AfdE7cmiZze8ZzFs2wKqbjmrnzRuxspIBqKAYelT9wiWx66Cyf5zCZNyhLeHKf3J434
	umbV52UWwdZWcO4VfBm6uUYzlaP7L0u8sU23AGFRb4+2iVypNgXg3BDD+4nmDEBknfY1oVB65pE
	z1q/jQdxKbA563qaAlJyHgub8v7ru12ksdmEHJKM4EOUCDYN6hXEndi3/Z7J+60RMfB3pHDBNsN
	BrEOR+gOuOrs5INzm2zVxiUUHMVpc55ay6GtrADoZ9PJx2w9RIAcmI3JxtcMNARZlxf5LAju1Ox
	SrkhUojqoBdw/h7JPy7PUJRkGfUg3mevAJcoKDXhqWQ4of2NWCMovuJRwsRsNYeAfN14l2/1NKo
	fLgt66+PsX7PNSSzJzCDw/U7MT+RnY3sxXN5d6YJ9YBn36f7g2aPJOm9/OAbR2w==
X-Received: by 2002:a05:6a21:48b:b0:3bf:db2a:d164 with SMTP id adf61e73a8af0-3c03e51e2demr9199842637.53.1783313086030;
        Sun, 05 Jul 2026 21:44:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:48b:b0:3bf:db2a:d164 with SMTP id adf61e73a8af0-3c03e51e2demr9199823637.53.1783313085586;
        Sun, 05 Jul 2026 21:44:45 -0700 (PDT)
Received: from [10.168.91.130] ([223.185.219.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm44980361eec.11.2026.07.05.21.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:44:45 -0700 (PDT)
Message-ID: <55640c9b-7f7c-4edd-a629-6fa98e56bef8@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:14:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix ML-STA authentication timeout
 on QCC2072
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260704073000.3300099-1-miaoqing.pan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260704073000.3300099-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NCBTYWx0ZWRfX2RKonkj8uuLf
 fWxWLdLnKaxOZdRvnKK/09U/F0gDvRYo7HCb0B/PbWg3x3M24HmjpFo9hQMTldy76RXYPRb1XU2
 rspeo7Dhj1Xk1q0owFxUnyGbpsJ+jks=
X-Proofpoint-ORIG-GUID: zT_r3HuEtrZJ5qZqyro64kMDu6_fWDcQ
X-Proofpoint-GUID: zT_r3HuEtrZJ5qZqyro64kMDu6_fWDcQ
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b32be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ziM92C7oNnnlFgKtw0sKeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VGMtm6mGyxy54b47EEMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NCBTYWx0ZWRfX4ty1uWQE9WOW
 dT15BI8o6BIZJm/lYevykSasaT+Lj7admYC6UhQkGG//mfkifFh3eR5jzYhgW9ITfelTHGIyZMq
 /vGo0Qawvr/i/NFn7xXJKEKnEK/BppvRydtKTNXaTPZND+vYq94jrujEZKvF6201RlOHGEAbpyg
 ktpg77WPHWeQKH9ILQ4diLm6VWYIKoGT1TnoMltJJUh1YMHP7hjkSTKTLI2TaY3a9Yb7u6JicnK
 SDqjiRBYmaEUjJojuDopkke8I1T0tqeKD86HeIBTQl5GXUY4GnquKSLX2PiAlymL+WzsycWxpuq
 ue7eN9pTKVZoHJGBuU+aBiEjhc7NJMUTxL52ugUomhu5KD1ZfmIXDt1OVi03+SdLZAEIPRn6BPz
 FIbpvL0+h7GEzb8mAYgcNs5PSi+oa707RvtGKuWo9qj/hTIAZUuyWAg1vIVX+MxmUb+SIlEZ5ua
 +PhwZPS5Xom0LXnwSvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_214447_557251_07741346 
X-CRM114-Status: GOOD (  16.38  )
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



On 7/4/2026 1:00 PM, Miaoqing Pan wrote:
> QCC2072 firmware interprets the MLO_LINK_ADD and MLO_START_AS_ACTIVE
> flags to control the link state during MLO vdev start. MLO_LINK_ADD
> indicates that a link is being added, while MLO_START_AS_ACTIVE specifies
> that the link should become active during the start.
> 
> When an association link is added without setting MLO_START_AS_ACTIVE,
> the firmware may transition the link into a suspended state. In this
> case, authentication frames transmitted by the host can be dropped,
> leading to repeated authentication retries and eventual timeout,
> for example:
>    wlp1s0: send auth to <AP> (try 1/3)
>    wlp1s0: send auth to <AP> (try 2/3)
>    wlp1s0: send auth to <AP> (try 3/3)
>    wlp1s0: authentication with <AP> timed out
> 
> Avoid triggering this behavior by setting the MLO_START_AS_ACTIVE flag
> when MLO_ASSOC_LINK is set, which tells the firmware that the current
> vdev must not enter suspend mode
> 
> Note that this change relies on firmware behavior observed on the QCC2072
> platform. The firmware on WCN7850 and QCN9274 does not use the
> MLO_START_AS_ACTIVE flag, so this change is effectively a no-op on those
> platforms
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: d8e1f4a19310 ("wifi: ath12k: enable QCC2072 support")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

