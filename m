Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836E4E6BF30
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 17:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzuLzdW32575u3ngxywQ+2PkcHLv9quudlxmBtCY18Q=; b=apRMYjoUPJbrA87F+mXQ+VvP0m
	rQvXuv54xAFTmvge7kuC3EIgN6rIzP0aExzUAi6zsQJpyB2gtpQ/VO9A/D1Weh7dxaLxQn5SqVbiA
	V7Ae0qBnwedK98uROMjGotgUx5V7+HB5jzsnlF56679Q7F6Q7qs5TtKOpNU0lJizjixZ1hPyCniLi
	gtvsMnTtxoedPo8cEc/zk4vRi7tIlk2wt75I9ijCruINR6DN1a6g71UDAQCOkffkCZ2Zu6oI8GgCQ
	+Y0SnIXvqGROeU4faqJbLT6u5alV6bEiSz7fQKZnkjlaqrIq6X1xWDQRAeK1S2nR/AQuw2JuvE5cF
	Nhs0HOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsjL-00000001nmS-0jo6;
	Fri, 30 Jan 2026 17:56:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsjI-00000001nm8-38Iy
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 17:56:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UHVTSC3296760
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 17:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzuLzdW32575u3ngxywQ+2PkcHLv9quudlxmBtCY18Q=; b=dMfuUBz+F+eWPmnI
	mtm11l4AOO/W9uHvoic1dwYg5og8/PGVCc1NIAqQBMdLm8BuKh2HdD6CUGlCLi2b
	6m5C6S3PPWeCsvXarD0mTRBqO9MuVqLaNIeAcnT8mVg/vZzRDLFUyzt9/PjBPns3
	jmMIvBHM/6Jc1ifUbqckSObw91QMKmrrB1NgqijVZ2fTHLG2UJpmJrRy/O8VuGxz
	P6bb38vOiAPNEfmlrRkLx36MR6SPC7ZlvA/mypVjuSYlD5cWclXSWZ4fZhM8Q8H1
	av+pAM+h1/z9lFIfjZPwFN2jyCBGnAjG7ZLy2AWCNC4pK/rzcDkEYSvUHsFcgJ78
	EVkSfg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c114c02uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 17:56:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b708fa4093so13394010eec.0
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769795783; x=1770400583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BzuLzdW32575u3ngxywQ+2PkcHLv9quudlxmBtCY18Q=;
        b=TKlwbHV6PZBzA51OtMVMdAcNkRNzZysiUmhJiZr4d5EKTzyVlFU5FmjUrjOpYVY3mm
         maPTaFLPaWiDHsR4hNWwHrkSq++nu6IXtaZoCN0c/gQODp5yHlDOq62F0u1n6klOELr3
         g9xubSogt+iw2WrW0tI9FiPE4V1WQkd11WKEf1An5ekTDBBgny7N3OIt+XVlmYmR2x8L
         qDUjWCzoWhFdqzJrMac9zjFuiq//UlInO6LupEzW9axm23UuMaLN6SRdzTrB295KSNbE
         j586c8DFphHTX6Ze74bwB9twom+SCHtWNsLAoNpLEo04vQAswM6fRTM32A4Sau1NBFNV
         3WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769795783; x=1770400583;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzuLzdW32575u3ngxywQ+2PkcHLv9quudlxmBtCY18Q=;
        b=QYmU6Hamm6NU9380CnMNJ7j4UWN3z+zkeumt5sKNMji1RGZpPHQd0+ojSFI99rq+iw
         RDbOrRgL7LarZhdk/PY0HVURGrKQHWZ6WjUYCwPfz8TBs+1LwaCpptHHy7G2ukCEJB0d
         IAmlsFMtMKAYczjshaoKuGVp1tQ8atRqGThU9JXcrsYm4dreHSN5hdQ7S6W6K8dp80ct
         IUhcKayAsawtmN3a4wfJMgccr220zjOd4g9UUtD8thzqV0A4UDrU3M/kXpW1Dgnu0j6k
         DRO6kigCl30uPfCrb2MqJ1TsrgMBKcjESPpXwcfXhCvRQ13FWv51LFMBcOJoLXBxO/8h
         yfoA==
X-Forwarded-Encrypted: i=1; AJvYcCVSInHjX6EOkUmaDQBzoj4FX2t8hhyXGrmTGEmBcZP194+ptAelFHY0fTwLxp4gOrbDH90u0KU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3IWCodysvZZElI8a97AqnhLdua/JvbbW5mV7iZ33CQv+0PCyx
	m1J9I2UwQd5FJjr8EyiqzFu9D/pyjZeTJ1pOiEyLkT8MGhIBl9+R3DDdPOzJXMdmyk0CD6Tk749
	hkvYbN/zBV26LMuoW+6Ngffeh43W6yP8e+Lu5Z4MX+PRzqy+xaNoPqhH9GRXDgQA1
X-Gm-Gg: AZuq6aLK03hm1MWVHxoZhz1z1+btL7j4g20MHWF43DPVWs6bG4pxBZwfaFPn7+B9GxY
	XYjRQLswhUD5wahlaQQeH9ohvBtFp5NxkxZdFAXZZe/sshMNA53/Xrwotks22L4VXLU3+jZNh4b
	kXu3jlLmORVGcndIhrbJoybwmsFBZGssBM5aVmUyQBV4Jn5LTRjMiYZJ9p7oPED8SZ61DTCgjvu
	P2hEkjObsJE9NPgAcRrJDl1J95Lfhg8dwb41ZxW2RlIlmzbq358rbNM8MtRkNREtWRW+ovyMUoz
	OFiM8EMH58I7af/krlBKwrW89EBtiibzuR1oy4TrnPlqcDeWMO/dYz10M/4mqlP9EcKBN/5wW4W
	WhsSpkexza16kqAJAcs5A0BVGNAYncpUEuYnUJKzs/vTset1DbH561hhQ+a085EfztdtBOxoh34
	uz
X-Received: by 2002:a05:7301:9bc2:b0:2b7:2e9a:3193 with SMTP id 5a478bee46e88-2b7c863c399mr1961060eec.3.1769795783141;
        Fri, 30 Jan 2026 09:56:23 -0800 (PST)
X-Received: by 2002:a05:7301:9bc2:b0:2b7:2e9a:3193 with SMTP id 5a478bee46e88-2b7c863c399mr1961040eec.3.1769795782651;
        Fri, 30 Jan 2026 09:56:22 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ee7d3sm11887156eec.11.2026.01.30.09.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 09:56:22 -0800 (PST)
Message-ID: <8bb02c38-7476-43bf-b0e6-d8e29b0c777a@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 09:56:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fixes to station statistics
 request
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Saikiran B <bjsaikiran@gmail.com>
References: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE0NyBTYWx0ZWRfX7LxYozejAT1Z
 r/DYOq7Djg76865aTYZ1uv6tNtSwZKwy+mbkUxVrHeigtlYuRg6HdneCM8k9VZMCO8P4Tn6NmqR
 GtixaRMd0erpSsZXiy/fLC7tJLEi6XPUbVkgw8YIi/YL2lmK6pEPyDap9T6vCA5cuBGn4QSdNBO
 JQ37lenTBHzSmWl35mzyfHAtXbZ4y9kz6LlhZjcO335ocAOs2DCZQyRxCtSG7hFZl1pP4INuaAg
 4DDQruZ7tbbPSbPgOKnC/xAcuehpc8GL6uwoAUq6SqP6I8+T27Y+4UbqoaEChvXtLX1klj613B8
 +1PKn7ajODbPBty0/ClPrtvWwgqZQyRK2fymUWhEUDe/3hQ9YXqbH7WDLTtRuGOFjkAlZEE6EJ2
 erZjo0Be2Zcq81mDnMX2LkoJXwqvrI1lJEV1ljJPjsCFStuAOgLzOfVHnNaLNX8VsoKYPJlvcNB
 S5qeWWzm7qELn2YhXCw==
X-Proofpoint-GUID: J2OZIpJnPC2iboNF2I99x_Bpi81T1uq8
X-Proofpoint-ORIG-GUID: J2OZIpJnPC2iboNF2I99x_Bpi81T1uq8
X-Authority-Analysis: v=2.4 cv=YZuwJgRf c=1 sm=1 tr=0 ts=697cf0c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=6wuBYe4-bsxGNRZuf9QA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_095624_795820_1E4765C4 
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

On 1/28/2026 6:24 PM, Baochen Qiang wrote:
> ath12k hits timeout and memory leak when requesting firmware statistics,
> fix them.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Baochen Qiang (2):
>       wifi: ath12k: use correct pdev id when requesting firmware stats
>       wifi: ath12k: fix station lookup failure when disconnecting from AP
> 
>  drivers/net/wireless/ath/ath12k/mac.c |  6 +++---
>  drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++----------------------
>  2 files changed, 16 insertions(+), 26 deletions(-)
> ---
> base-commit: 8c6bd5e9db28152563c984d8c48322610cac8609
> change-id: 20251121-ath12k-fw-stats-fixes-6e008a4054fd
> 
> Best regards,

As confirmed in https://msgid.link/CAAFDt1vck6=sp4N+yEi6J8WwOmW-ZLfHaFXOaB+R9tMGophMDQ@mail.gmail.com

Tested-by: Saikiran B <bjsaikiran@gmail.com>

