Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16444C35FF3
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 04:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD18WbhBUdIOb7+GpzfnfouBv5NCmtlMczJlG3+q3Mo=; b=2IV9MOzVKYVb45ncJnZPwhj+tZ
	XwWDkvRtWTTZj9hvKdeWMq0GldhueeeOjwTroj7FrxrwM0f+6UIChk1q4Ep1xkF+JROfuTiR5uVYf
	uVTUp7cw7ku8PbZtfy4nV56MGa+vxZ2sKv5u2K/olHzWwaCYUIRK67abwgQYG9ay6J8RKFzbn2epg
	mpRmOMKUWenH4+eEeuhr5vYNVnWVp9PqjlYQNVHlP4rYeRpNVLgtO+pRq34jsIRmBl9SnnyiT6B+D
	90ETlToZ/bs0Cvaw0i03tmh5Pf3rPw5Zo9hDLuXywi+VgqGYhvDxJKOZV7ecLtTEDtQJvpsoIYbqY
	eE4wi73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTai-0000000Dmzh-33pU
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 04:02:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvTag-0000000DmzD-3hkU
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 04:02:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1WRVM010077
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 04:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JD18WbhBUdIOb7+GpzfnfouBv5NCmtlMczJlG3+q3Mo=; b=ZE/JBdduxtVkRBDs
	vkFJrV7p105h7NJDggX5RXarzgZFACN0aT/c3JPN7jrgq+d0nuvRqbtUIrFAl1Gf
	I34gmyoJYiwys0DFuiO5QX9Frb1NVxUk+dybLBmLNFhnNK4LT8xt7TRm197prOBW
	nhk5XEtblmJovUDTR5gp8GiZxHBJ/91GeOANSPSimrsS68+bROGrTXq8Ly6+ekO5
	yRa7j3nTQn9rEh7VFZoWegc2Dwu8geVvmpXaw6ZcxiovE71vE2eBp2FsylOnK4GY
	4o/MwykIpvJxALQpsyP2y97G/GuWG4wUjXggZLBShtd2lF/GSH8nK1y6wufTx2p0
	5j2wEA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gt5kgt7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 04:02:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22410053005so39728555ad.1
        for <ath12k@lists.infradead.org>; Thu, 20 Mar 2025 21:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742529738; x=1743134538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JD18WbhBUdIOb7+GpzfnfouBv5NCmtlMczJlG3+q3Mo=;
        b=a+kHHv8+DT0CaYKe1yzK4rrdqVQrT46sOoWo+3588hw+wyuhGV6bmfZrNkoV75e5fj
         iYA3LMk1UsaMvgQXKrtQiAXIlA7dHEhZl7Dqpgr3UyYme9HbEmea+AnSBbeCn9D6alfM
         sC701FFM3qurgumx7cw8O+n2UAb1xWHqC0U4dC9o+SOgb3TTnXa9x7Lr931XbYU+3Mf9
         nwOTv2o52/480hikGfFpweyz1boD1kjx8EXMwW6cQNGzhtMg4yvA3zwsyTpMZuurrhOn
         sXWYwDZmavTovz73tow25q6y5zfKimBIgEWxj5fPTzjkRn6Q9Zr4OHSD2V/fEpzhExSu
         I2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSM8/FlIv2pjriCJ//bntOQfjTjIbLCRMLKBKvXTSqTTWIAcij35u+uLSVNfw+PZJ2l2qPTms=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/WmSjo53Jjq4TGWPaA3Qf4/C2v0hBPd9reJ4017TxQtQnPz5X
	2blVvHxM+onPbElF8cw8G25FhnJcPRn5P3PvuGBdcUcPYPRrpPw+/7o787z8irhNmZ1TlLWXw5N
	/3bWE27v5SVj86Xru0wFKI8YQ6C4yPXRfk3QRVxZiJhYrb/lQ7y1proaoiOIc5Ctlw4WI
X-Gm-Gg: ASbGncsXfMdHLsgF+roT1QQW71j+XPzei1QuwytjPPqQxxsn40sBOW8tglkthNiXwn4
	cIfZk8e+EdL6nJ4Ol0jZv9pb1nR/OgyZz2BlPk0XaXGu42EwHm/EcNZYDt0oRIc8cWonLgnKEaI
	6deXNc9bYAqVms6nX5CcnVDl/DGd9wYR4ZoBYhCr6rdm7ScQ3IRZ808sc61jlOljZSsCMbb51u6
	//NJ4RbT2MlGxY5tUMmK8bvO3vxv/dOtqwrgkRE84hIM7mEjfVW5e9D3aapq3i4OktwlppKhin6
	tI3v46+HcXiPOBVRvpFe2Yiu+91qgqo5vvYQd1o2r8+AGre4jrx58FIokiYxjJAa
X-Received: by 2002:a17:902:d2d1:b0:224:24d5:f20a with SMTP id d9443c01a7336-22780e231a1mr32879695ad.48.1742529738091;
        Thu, 20 Mar 2025 21:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOORXpSCrIooWpg+Hh0W+iLzidTxU6JhELu6gC9LuhonlQLlvNzNwqYRFOtv+WzcHkmGjgww==
X-Received: by 2002:a17:902:d2d1:b0:224:24d5:f20a with SMTP id d9443c01a7336-22780e231a1mr32879295ad.48.1742529737727;
        Thu, 20 Mar 2025 21:02:17 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.201.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3964bsm6494675ad.32.2025.03.20.21.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 21:02:17 -0700 (PDT)
Message-ID: <34578e55-f537-fe3b-0782-c79ca18b2f8b@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 09:32:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v3] wifi: ath12k: Fix incorrect rates sent to
 firmware
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20250320112426.1956961-1-quic_rdevanat@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250320112426.1956961-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJf_lrZnLjeIwQbBAjPt6rb0ldy0WAbd
X-Proofpoint-ORIG-GUID: UJf_lrZnLjeIwQbBAjPt6rb0ldy0WAbd
X-Authority-Analysis: v=2.4 cv=PsuTbxM3 c=1 sm=1 tr=0 ts=67dce4dc cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=13kUIL9uG/hLjppKjZ3b/g==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YRjURhDjmDyyyRhygVUA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=912 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_210238_944522_3D5A4D4E 
X-CRM114-Status: GOOD (  11.40  )
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



On 3/20/2025 4:54 PM, Roopni Devanathan wrote:
> From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> 
> Before firmware assert, if there is a station interface in the device
> which is not associated with an AP, the basic rates are set to zero.
> Following this, during firmware recovery, when basic rates are zero,
> ath12k driver is sending invalid rate codes, which are negative values,
> to firmware. This results in firmware assert.
> 
> Fix this by checking if rate codes are valid, before sending them
> to the firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

