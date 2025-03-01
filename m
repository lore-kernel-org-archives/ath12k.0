Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62766C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fItfMe60bL3KBr33oQ76T2mDSO4Mwd15Hpg9wQXBud0=; b=fcy6LFzmpd0lLRikOawNokUUgP
	1Jy9p3c4DYOTppGF/vBoWsL4t35FIpmunL9xP47qlk6RF69oC6HE/8lHOEDB5P5KK1jFsiVGx0R2J
	WPfGzpbXg8Bpi+weNeWqDcZUkMVt8Y/n6xj9dTOo1wzA22toCDYiU31wX4UpgKMBm+Fpy6byUBk+y
	grXaySGm4UAGUwKTeLFa7y47pOI8tcrThduj3Dg3PFPnbGQKvB0wEeeiPJ7Goq0G1tBwR/CBKJy8R
	9jyDpD+X3ZLqC5+ZvNFd7LWxi27ou9qpPcgnFI74eM1sB19AxUYssm/CfARkeWj6FqVCe1bwmQoKb
	eaE4ENVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toFFt-0000000DRg6-0fQO
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:19:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toFFq-0000000DRfa-0AAW
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:19:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5214m7hN020599
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fItfMe60bL3KBr33oQ76T2mDSO4Mwd15Hpg9wQXBud0=; b=hYndMg9Ze+m08WSz
	4NKTdcptpWjT7ezxu4EUah+SHYRFgVxoVWUVCmFOfnvAqxVZJEzaTUZ5+EbRqBMe
	RUkYdiPkNIE1E49Ns5wapD4FTakrU/aeyomSAXz3EbngxkQZkJuJQqVYnmb2NqT7
	zbf2wGuwYEw6y+irXUJCStH5R7ecaAruOABJcpcqTDJ6GcdPMgunynAOXMIGzFQF
	tmYIfigeXN8QN0tMWlTJ8NSAy5kLqixp3WghnvawaHztdbwCce8h3v4Iki1Q5sWj
	eR0goC/TFYLs1hVYikzguN1rG0o+6ZOSFoYzS3MKvGQ3o2Th5fV0dvNoRo57KsY6
	ZdJTZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453uh701fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:19:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22350e4b7baso51083905ad.3
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740806352; x=1741411152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fItfMe60bL3KBr33oQ76T2mDSO4Mwd15Hpg9wQXBud0=;
        b=ah3Sryo096p2lm9Z5BkqVJUzkrhuub8+XeYttpvDDhqKFo1uS7qlXHRrLZHlS+wFQ0
         1SMrpP6cx0FPzUQnPluAKyzyHvzHPLatrdV53HfqSF8LN3fa3TXltImNT+9Fn0jWW3rF
         YYPw5/v1tCoc0v+qM8dKEf3JNwDU93HcnpCVkPisIjLGQoOpTLvo9ImRqFLbJAfrVPjT
         SVgqHUjn9/IeNthR7A7Fg4zU/yxrnJgvRvaWHQwBKN2ToVCdtsa0Z02TWAv9yi4oZDeT
         fS0o92iHv0JPy1GxBj9t91QK2tstneWv+jMIy/jixepvGFuXWhnt2VoD4qTJXdstTp1S
         Jl0A==
X-Forwarded-Encrypted: i=1; AJvYcCX4FrYh00l83R3Ln6vDmOMA1ie5CXdaHh0RCoSgDq7JPvRNPSm7DZbIHtz+V4AEafpgbXvQfKA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmliHdBiTY9JfdvDGdW1hhKnLJvwtL8Up1oNaWRo5n243RHklE
	ntiSKaVIfNdku5oJ1LBh7nbZ2E1N3C42eptDK2LBalbQdfgefEcv09wGKhuEvbiPryQeNp1uraE
	GCKwXhRCB0G2qnCJcDNWMbJC27LI1BC8qsnGL5pwwM2+VXoa13RzSFvjHUVzI
X-Gm-Gg: ASbGncsWwRRRIBHQfI6FFtLDm7BQOHFn4xKxkDaWGb8mH806Ngw9BkbyuFxZ61W2JYu
	cJX7LbdwoV4Ru6l7iLfiXGPedQhkjlMIO8yXF+6LSHYtoow0kAmBdHNzBi0vKtOjK6gHUJgv5oP
	veFCDekSvSLOky14hbEov3YANJnR90upyYu2S5Ql5lzkQ4wwdncUDjEpKQ7SCdIGQeGgC3kJzlo
	KQJR6tMBw6IQvimAlwKqPxH4QaqE9vwVUiPmJF8XyvSr0+oYpcC9uRnsBRfJCPufEh+QsE2mDFx
	rXiVwA4DjU8dItoWMEaQuR9UZp116bUVfHUDvnCImM3cWiCXVxXazA5ry5gncUA=
X-Received: by 2002:a05:6a00:2d8e:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-734ac35cce9mr9750330b3a.9.1740806352538;
        Fri, 28 Feb 2025 21:19:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEir5MRosoUYpbeb1u+Qi3ok691SR2Z4tKIzWpFn9/rNRTWboX60CDNLHbz04mtMwAbblyS+g==
X-Received: by 2002:a05:6a00:2d8e:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-734ac35cce9mr9750299b3a.9.1740806352169;
        Fri, 28 Feb 2025 21:19:12 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00400absm4673454b3a.151.2025.02.28.21.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:19:11 -0800 (PST)
Message-ID: <fa72ddab-b2be-3481-8e33-e0dd30e3e8a7@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:49:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 12/13] wifi: ath12k: Power down userPD
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
 <20250228184214.337119-13-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-13-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mLI0OWhiSzAXnNrfPGZcrFO_unqxSjUJ
X-Proofpoint-ORIG-GUID: mLI0OWhiSzAXnNrfPGZcrFO_unqxSjUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=786 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211914_087662_1CC093B3 
X-CRM114-Status: UNSURE (   7.91  )
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
> Set the stop bit in SMEM to power down the userPD. Wait for stop-ack IRQ
> to indicate power down completion. Release the userPD firmware using its
> peripheral ID.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

