Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A669CC02182
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 05:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1vE66wPRFswKFvuicyFGC0mSxtAlHJNXTigP24pTC8=; b=JYTS/swRwHoF99N8QfovyI8tMV
	uFZRhzdZysliuG4gerITFvRkCfHukyy0htBTVuQ+P4NNxCfH+LopaH0mDMilBxoI8it2wowLECkOw
	WCTfu6suvYKHALHO3zT2VDynzpONzgmktZvsqEILWzpJzoR2iFDbGzogH2elDHJoB9EoE0ikFJJbF
	sHbMp7IWxh5my3W0cJg8WlW6q29BGHunifZNp2lxmIQr8HpQh99PDS/jFNKhbecNYmALkyOuB6Qvp
	83UEqTQmNhvbIk+/HT+sDkKVqBACkTxDWpiayi4s6cwbXSZbz0wamfOlmd1O3EUiRiBifHjKITH4n
	Kr3IPIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYe0-0000000G1d6-3o5k
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 05:23:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYdx-0000000G1cm-3DWf
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 05:23:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50P4U2EL024736
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 05:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1vE66wPRFswKFvuicyFGC0mSxtAlHJNXTigP24pTC8=; b=EZ2d3eiWAo2O5FnQ
	uSaU9l6M4n/hInEh5b6ivenwuBWuB2PBQyUdVex78wgtY6uc4bXCK3nhm4yKuVzb
	AiTCnEClzOVtkXsQfUiQeEQqSvtXwUwCAsDRlrfY38f9YzC+RhJDAKYZ8lz9G0SW
	R7CQpgVv0K7TgBugSVlX59w2cyim/PT+cgRI7ym7mzqySxsQGXUxovJwBjIymGbN
	/7GVweqCcgrzyegQGl2ke7dbTYegJ72ci6aOrh0kQoSMhCtuvznehMO8zR4TBHml
	sd2gIUHWo8+PYMiWiPd4JbrPJy4gtVB9PU93sN9v9dJEzQFY/KHMRkMW4wNQ/1sx
	Y+DO+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cryr81x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 05:23:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2162259a5dcso83727875ad.3
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 21:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737782620; x=1738387420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1vE66wPRFswKFvuicyFGC0mSxtAlHJNXTigP24pTC8=;
        b=jC5jmNCXI3mC/Z4Tt6Z4xFFZwm9Buujhd1qhEoWSqNnLyF5ch8jw1B5tUaeCWtpjFT
         JbIlVRoUkC553tcAYjRxLBGY1mmdAvCQrd5HWo7J+H1fLRn4tzN4OEM+6tua8maIA5PT
         E6ewc1PXW52uXgXdS0ld+D3GwBUU5rgEw7sk5yovhtuYhStbkB2OfkNXTv5tqDqksdut
         vl79KN0scczTdgOcGEsFnC/1nNDmTRPnQCl1sMSZAv4cnTM9ixY/70A4q/dGyV6U8uVo
         +jjJUcF1e4zrQFmlagwB7rMAiFJRiiB/7Hmj2IBTW1Lr92RtP+nHnnKwsblkpBr75xFY
         pPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVezOM/85vn3mYi6HMvSiQuF9/RFRln1H2OKB1NZ6BCm9TGq3wwoooAm5qj+DjlxsZ81g7v6z8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkFSiVeJHieqYgc7L+/qUuoxCpbtcFItOe8t9TD59hmBURYFo4
	GOJIVA1cQ+WAJTPJZjBfmo6nBPifGNHroyc0pOPFaAcXnKPnKRqt8rSjL3MbZSjpJUtjsgb6yAw
	K5KfZp22vRX1Mto34IaVeO2hlzR9D1v+LSy0seaWIKJv/wPkGNpi0zpsQzlj0QGJQxiSr
X-Gm-Gg: ASbGncsvyC+SJ2yYpX3bu7L4jJACOD4zupFH6LlV7buv1KA0A/bXP2c8aiw9T2fF3Tr
	t2cCCXEMc5yfnEcXneSO48yTKIkpnlY2cP6lkIF7ZRfQAJNmbckayKWaNTYXDuZvIrVMnyHvIo5
	Z+CZ6Q/aqokC8wsa0J6dXdHYxliwofUC0UQ7KoOPHxyJnruYx+biGz6BJ7MxIxn5snBaZpfc3rA
	CqLQuxd5S8JkpXnO4tjdKcLFstiGS0dh+IgT8Loam6Pui6B8FT3ahi9wlJnOx5Ls5dBSNuV9D7N
	5nZVNPsTGjLdevAPZq5J7pU4TX7BqxtGHyOXaPthCg==
X-Received: by 2002:a17:902:f544:b0:215:e98c:c5bc with SMTP id d9443c01a7336-21c3563a33cmr578829025ad.48.1737782619721;
        Fri, 24 Jan 2025 21:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9YAuBKKEADfPUnFCxF82oRXgcOvIEtHq5ZFZoFbRx2v4FPiVB9rtGj9QuhhepZQ+JaXDyFA==
X-Received: by 2002:a17:902:f544:b0:215:e98c:c5bc with SMTP id d9443c01a7336-21c3563a33cmr578828765ad.48.1737782619361;
        Fri, 24 Jan 2025 21:23:39 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3ba3sm25041175ad.58.2025.01.24.21.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 21:23:39 -0800 (PST)
Message-ID: <cb3fc64a-322a-492a-ade3-c3ba86074a64@oss.qualcomm.com>
Date: Sat, 25 Jan 2025 10:53:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: Request vdev stats from firmware
To: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124185330.1244585-1-ramya.gnanasekar@oss.qualcomm.com>
 <20250124185330.1244585-2-ramya.gnanasekar@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250124185330.1244585-2-ramya.gnanasekar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QZlK2WYSaTUdUY1l7MPAd9I2vhm28MkZ
X-Proofpoint-ORIG-GUID: QZlK2WYSaTUdUY1l7MPAd9I2vhm28MkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=878 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501250034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_212341_821253_F65B0BB6 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

On 1/25/25 00:23, Ramya Gnanasekar wrote:
> Add support to request and print vdev stats from firmware through WMI.
> 
> Sample output:
> -------------
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/fw_stats/vdev_stats
> 
>               ath12k VDEV stats
>               =================
> 
>                         VDEV ID 0
>                VDEV MAC address 00:03:7f:6c:9c:1a
>                      beacon snr 96
>                        data snr 255
>                   num rx frames 0
>                    num rts fail 0
>                 num rts success 0
>                      num rx err 0
>                  num rx discard 0
>                num tx not acked 0
>              num tx frames [00] 0
>              num tx frames [01] 0
>              num tx frames [02] 0
>              num tx frames [03] 2
>      num tx frames retries [00] 0
>      num tx frames retries [01] 0
>      num tx frames retries [02] 0
>      num tx frames retries [03] 0
>     num tx frames failures [00] 0
>     num tx frames failures [01] 0
>     num tx frames failures [02] 0
>     num tx frames failures [03] 0
>            tx rate history [00] 0x00000000
>            tx rate history [01] 0x00000000
>            tx rate history [02] 0x00000000
>            tx rate history [03] 0x00000000
>            tx rate history [04] 0x00000000
>            tx rate history [05] 0x00000000
>            tx rate history [06] 0x00000000
>            tx rate history [07] 0x00000000
>            tx rate history [08] 0x00000000
>            tx rate history [09] 0x00000000
>        beacon rssi history [00] 0
>        beacon rssi history [01] 0
>        beacon rssi history [02] 0
>        beacon rssi history [03] 0
>        beacon rssi history [04] 0
>        beacon rssi history [05] 0
>        beacon rssi history [06] 0
>        beacon rssi history [07] 0
>        beacon rssi history [08] 0
>        beacon rssi history [09] 0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Ramya Gnanasekar<ramya.gnanasekar@oss.qualcomm.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

