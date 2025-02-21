Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E616C021AA
	for <ath12k@archiver.kernel.org>; Fri, 21 Feb 2025 04:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ahKVge7tG8auzKckmrmQty95JVdReoaJrd58xKCWsY=; b=35YM9cXMGZe05SnZpRKp3xcoTJ
	ROV+Mt2v3rnjKGJXJ9ej0lw+xPwInp4qutdXkVxqMXFiCfare9pwBWQptt6zsMtCJgZJIfmWj1P7s
	LAzttW1a71j8r2kKaJ7+bgLNmh6cPqE8Bf+Mz1kYKfOtxwIFKhVyHHgXJZONHwLD0omRA3Xqtjw8H
	+kBcdKtO8Tud7lh3kPDqhG1VMmJolFrQIMQSEE/YQ8V4XZnBAzcL5k7tlwoVZnm0zt0f3CGIuVJni
	EChX6Bet/OEyWGnm0H60g5yAGEBcPlE+N9diWY/1hKJOobuBMi+snW5yv8CHIeBOPB9/NFKKJjfoQ
	VnAtRydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKWd-000000045PA-3PYq
	for ath12k@archiver.kernel.org;
	Fri, 21 Feb 2025 04:20:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKWb-000000045O0-0Qow
	for ath12k@lists.infradead.org;
	Fri, 21 Feb 2025 04:20:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KH23Ge009732
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 04:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ahKVge7tG8auzKckmrmQty95JVdReoaJrd58xKCWsY=; b=h63G9IRRBdzIjrD2
	gQIhaCYbNBHMjoPIM+DPjcusJZfYErElUJO0iRPF0ptUBRZSCR6CEZD18KF5YoNA
	pyYTkJHuXdrH3xl1qxot3rGhy9u6xsa23dr84czaff0JprB6r6qJAqHwO0QGBt+Q
	DvlGxNGGlAXfYGZl8mEUDrOJmWZ12vkaR+KFJwLZ+lh9emDwxCBy5MP4mK3d8Gyb
	CDsMTP+623FxAyHMzPHSibLAl77qnjr9jvkhTxdhJ+G/anprJD1ssb5QT2IVQ0e9
	XlBXLr5SWEoHAFZOLue/LyiBPM7cmUqFHk69uhi7Z8Yz4gERxANz9xIVIj60KKBl
	387fZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy20fy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 04:20:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22114b800f0so51356795ad.1
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 20:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740111626; x=1740716426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ahKVge7tG8auzKckmrmQty95JVdReoaJrd58xKCWsY=;
        b=q9ZDKIHVDe3uL7W39r1lF4wJMzNMjCt+NBcDmP534m6xxy+otLEdfEsscwMQP8nALG
         nRTMiVPc8LM+lFEXgNwc0ekFzNxkQOtK0TRHBVZTiErxfO700nlUiK9F8nE3BJC/pJZU
         F4eWWJPN81cXJHjnoLZfIZPNzLF9DkxgHPHkceRmkEetzZcAYNISB7zn7YedRP+Ocbow
         i4ybEjQE+XAIYTVLTTprvM+0qRMe7d1Qir80R8+nSq8vs0KH8poxDdkZ2QhsK29VdiJY
         Db/VIZgtYzhVlM9a4dIARJhwILYHOOg9oINmg1MWFo5NNHOcQuo5v1WzJesKcL/oz66q
         wCAw==
X-Forwarded-Encrypted: i=1; AJvYcCWUOGI2TijIjKGo2mutYUOooJPsRPcQw5a6yO7/NTuIHCP3TEmTxyW/bqg/FVIubXLuGvY96lw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/meMv7yjeSxCTTiel/4Caq/ybhuER4FD7nyfDOOz0+AhovUw/
	UO2YBJHO7XYB4hQp/m6flc7v+BU5C/8cgFuJNv2QdkDRtw6oMNFshrpnIztRNZl7BApx8DYDNWz
	f1hk9685HObxkCTLBGhfiadGrG36y6nx0a6+oXa2pgTk06lDkZHxi7JH3Ftcz
X-Gm-Gg: ASbGncsdyODexLCjsi8bC9PMez0+mczifRG+yoGuYzUqWtr1bscT4TnJb7bgwr2yCrv
	vilme2SabecgcfCQ6pEItmvIPVelH+tEHTUQG8NrOmbLvZkRgtBvoGl20bsHeLuw9SUxrUPHZ/W
	Dh+aVKnjify2xMEQWfi6nynDNBR5kTy4MG+2n0/+fJ/DlDCJccbl9BgvTErXkS4bmNkLrQQQARd
	/lMRXaQTkT4/lmhbJTT7EMrQXL5zLgJSJ4i5PJLLdCy827GEeI1LGsuv7Gm29qUcwD04SmlZRKS
	7q8nE4jSMyWmp3FVaWGgDsBwwThSrCiCUo9uFl/ZzKsmvqi3VEGtViP5sA==
X-Received: by 2002:a17:902:dacd:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-2219ff336bamr23412275ad.6.1740111625817;
        Thu, 20 Feb 2025 20:20:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYAZ0isTl26l+K+/h4SL5AimCIhTElJu3b3IN2jh30CEjYVe8OExqTwqjwKLTD3zqr6+fFOg==
X-Received: by 2002:a17:902:dacd:b0:21e:ff3a:7593 with SMTP id d9443c01a7336-2219ff336bamr23412075ad.6.1740111625488;
        Thu, 20 Feb 2025 20:20:25 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53492d0sm128456335ad.35.2025.02.20.20.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 20:20:25 -0800 (PST)
Message-ID: <8cc7fb91-16a5-5458-6405-5fbcdd903c33@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 09:50:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: Add NULL check to validate tpc_stats
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250221041250.769491-1-quic_rdevanat@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250221041250.769491-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: edqJgnfEt9otvONKCIJSonvqyElQv96K
X-Proofpoint-ORIG-GUID: edqJgnfEt9otvONKCIJSonvqyElQv96K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=991 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_202029_294730_A6FC4B5A 
X-CRM114-Status: GOOD (  16.35  )
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



On 2/21/2025 9:42 AM, Roopni Devanathan wrote:
> While processing TPC stats received from firmware, there are chances that
> the tpc_stats might not be filled and the data is not available. This can
> happen under two scenarios. First, when firmware sends a non-zero event
> count before event count 0. When this happens, tpc_stats will be checked
> for data before memory allocation and the tpc_stats will be unavailable.
> Second, when memory allocation failed when event count received is 0 and
> the firmware still sends a non-zero event. When this happens, memory will
> not be allocated for tpc_stats though event count is 0, so when non-zero
> event count is received, tpc_stats will be empty. There are checks to
> validate if tpc_stats variable is filled that are used in two subsequent
> places, but these are placed after tpc_stats is dereference without
> checking if it is NULL or has valid data.
> 
> Fix this by removing the mentioned checks and adding a NULL check after
> assigning tpc_stats to check if it is valid.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Closes: https://scan7.scan.coverity.com/#/project-view/52668/11354?selectedIssue=1637145
> Fixes: f0c3bb78e42f ("wifi: ath12k: Add Support to Parse TPC Event from Firmware")
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

