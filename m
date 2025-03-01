Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D37C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUHlZ4aWNrlCR37bnX9mIzuNVen1FLow500YvX1CeH0=; b=zVAkLYxrrSTGxbtUPH6S6lxKUt
	9/9bNAkHXMZ3hse8pj5mfBYqGhJh7vJz/N/OiOxMraa3gIbNxWkrQTufLOSGkAaxN7M/YbfSYcqrG
	eFsl5l+LxlqoxW2Mu6X7MwjPW6sKFES2VHFMLgbY68/3+OutYPxuna5CPaXSVJUAdZRM+jxU2o3wv
	KaEBi/qse/OzJH6wVjvWfLxdd3FLiAYX6OR2T8befccaWh9k2jreItWGr0mDrFHdxmQFtJQAXKvc3
	RMh/QqxVcba+fwkNd8y9ovjWmUX/kXLYc5cOLsx5KoAHRUT++CR9X2YDqMiFxJnBgg6C+stVkpQhZ
	bUUuMXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toFF3-0000000DRXG-2oAa
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:18:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toFF1-0000000DRWi-1gV3
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:18:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5214BpSq027126
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eUHlZ4aWNrlCR37bnX9mIzuNVen1FLow500YvX1CeH0=; b=apClJgksW6hnfqGa
	zzQj94fwF8J5zsE1jMhViLFuE2Ai4RMDS8SnecxbzTEUiFhp3yTkx2gzz+huG+n/
	QkZh7mtEe+LH20wpy9iifabY4uqzknmdl/cGJKkfWkFupNdOtNQkZTmpxGjFsPly
	hZPDxfdCG32qoes4rljUGJ7nLqGn77KGsqAqxEHJyHDXRa/suuBDZdlUcb5s7BIs
	6D2MhQWIe/kxVht7abyRbt0QlQ3xAfQgpXGvJc6ncaZPWYnKEoDGAMe24vzhG7HX
	+VlqXPUZbmTWRvVt4czlJ+kDcsFXBqDiu2NA4aJk2zjj6H0yfu1O9i/S3aFCFWag
	TqMUoQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453u0d02pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:18:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22379af38e0so14377375ad.2
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740806302; x=1741411102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUHlZ4aWNrlCR37bnX9mIzuNVen1FLow500YvX1CeH0=;
        b=t2vEIYnRGKY7ZPWsTUs/BQyTjzhfrlhnblKmI8z7ni/IlOIdDxxbFKBsmfYlMFVFEj
         n7/7PrQYi8wmvkXHKJfI5Va8zbdX2cK5G7iKo2aJ0dUJO9x6grywTHcDm6R5uk2Lxfq0
         YCnT+9HlZOQWLyKy31gieu6KiUIBtKMb9QkFmlrXW3ASgJ9qCYFBJhMqFANceylc5SRG
         8y6nHzwoMF5utq+wPCHON19cl40V0w6NaOQqXg5N4POagiUBH4UTKgdaoDvRVQQyuBI5
         odLAb/rMAuEgxk/CmYTyQpPyYXFcjP54Bkae8OyopXcCyK7EJonfYmCFVMvvuN/p41KC
         pQIw==
X-Forwarded-Encrypted: i=1; AJvYcCW17PL8cZP8zgNiMxj8WZNA3OTLi2wGuCbtdJG6hpk5Nisju4c6fZxe3Y7CP+IOmtbGapK45QU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa+qDkDqNs8Gqwh2nxH0rcRP9A6ABBOm0AC4FIYY4WAeNLc0vG
	nK0S2xiQXvtMVL3qtwyTv0NrYXmWETm0ZBAfWqnBG9tuwsZHPQCMZSwjNyJVOVbjf5R1DEoOA7G
	bIW6r2n/ttUS22eA5nQkGQ3kcTJZrpRqYVAoJnJThsN1f9KQiqZbWvcgcEK53LJlsLyS8
X-Gm-Gg: ASbGncvHlRH98o/G/rKW1zI/+taH1GXROvQid/UXVQGQRilZKGWSsjwGolyDHJR8iw3
	wZDHBFhA7gTSB25krRZjxt3fBVQ/fXzS7025wb6gCY6MLYNwYHuwqmEFkeXzszNHr+5ujegmI4P
	a7GZ5W/RtIphD7RmHclP2sZVNDU63WvHb6w8zop9zyMf6BDkCRSUkrTUkKHP1ZbVUFofrG35BSG
	U53m9sv1r6tBY6TL0ue2o6gXlDSxkjRNUO3FoFvxwkZWPPZ3w5+FFUdH6IjN3eGHgSUaoISZE9L
	6LvS0oR0T6dGY01ILQbrPswA3iJNcosLjH78uq8BElDMKuL9CCtu5TSVAfAUl+0=
X-Received: by 2002:a17:903:198e:b0:223:4537:65b1 with SMTP id d9443c01a7336-22369255638mr96102245ad.36.1740806301781;
        Fri, 28 Feb 2025 21:18:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB5dZuFhGRTIRMtkKt300um01cZR3OsgAUXHswvI1dGw4+Q9X4LegsPD55S273PcAvlGdfaQ==
X-Received: by 2002:a17:903:198e:b0:223:4537:65b1 with SMTP id d9443c01a7336-22369255638mr96101945ad.36.1740806301448;
        Fri, 28 Feb 2025 21:18:21 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350503eb9sm41195385ad.193.2025.02.28.21.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:18:21 -0800 (PST)
Message-ID: <eac47640-5ed3-693f-04c5-6e2945268d22@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:48:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 11/13] wifi: ath12k: Power up userPD
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-12-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-12-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g5X9NcRxsHAZuT-fwUDjqhw4sJ4xuPlP
X-Proofpoint-GUID: g5X9NcRxsHAZuT-fwUDjqhw4sJ4xuPlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=720
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211823_450239_A4AD79B0 
X-CRM114-Status: UNSURE (   9.72  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> UserPD firmware image is loaded and booted by ath12k driver. Get the userPD
> memory region from DTS and load the firmware for userPD from pre-defined
> path into io-remapped address of this region. Authenticate this image
> using pasid which is a peripheral ID. Set the spawn bit to instruct Q6
> to spawn userPD thread. Wait for userPD to spawn which is indicated by
> spawn interrupt. Ready interrupt is triggered once the userPD is powered
> up completely.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

