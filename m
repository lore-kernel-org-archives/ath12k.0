Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5EAC7115D
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZE1jK+fran5zJP4vF84ura1eqbV0f9kchFGUeeWMxCU=; b=OnibWyj295Z9Vn/mROQgjBaU1p
	SrysejljRFVNQDw8wk134pk2WbWnd1HqEdWh4H+5Db6FM1Bm2eO2b+In6MwdPV23vMfYENzPIp6y2
	9eM7U0q8OMnf+dwtx/UnyoJ4yYbuXavtMNFM6x7x7NMZZ2C3K3ErvjW9qgN1yohmiSP+W7u5QFVBr
	WsoRdsreOlixE7W1CX5yym2HOEaLPJ7b9XY1fwARnN/OYkKxbCtFmIZs0HhbEFAEyz684GK8vYzBa
	1rAfQ1Fo90o63sIc/G1pyXAndWgM+ZZvjiFTgAEqZehrXsa0KT3KrzmL7AGqeXpXf4yjsBp2NLqpp
	5aJhzoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTaZy-00000001j0m-1DqR;
	Mon, 23 Jun 2025 06:22:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZyV-00000001ej9-0juv
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 05:44:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0P26Y014609
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZE1jK+fran5zJP4vF84ura1eqbV0f9kchFGUeeWMxCU=; b=MzSpZJu1ChJfEvGI
	lrYDQfCXjPueYbV1RiTsVUn3XUkd2Iau+NvDIRO4n1cpwO/vaGLSFdjdRDDPP62Z
	aFHaPF+WD8VwbScs8jhrG/mVxrdLGLWu0epyxrGJ8zdmjo/o0c0cxMugpchgELvH
	o1YLS2R96K1DlpOyKeFISS/3RRgdscPmF5NRhc9SjYpl8FSZZ5xWewmYELa5E7E+
	CfjaAsWZqElGFbbgBDk2r4wQ7bMZDfXZs+6eguPoQkUfFbMUEtJvFAiqbyWPxD/t
	Oxkao5la791MVc5xo46kQhm0wWhC1cL1YRq9TcJVC/QQ9zSFMPIx63zGA5FbfMIL
	X9vZwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5ghrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:44:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so2412525a12.1
        for <ath12k@lists.infradead.org>; Sun, 22 Jun 2025 22:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750657449; x=1751262249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE1jK+fran5zJP4vF84ura1eqbV0f9kchFGUeeWMxCU=;
        b=CktxoJCbZZCkSYJBEnB4GVh+Vlhm4qiEAwRfklrMXMihjGc2V1pnbig3BVhFD9Sqjx
         p19ndeH0IZAc3mibxxxT80BhzbSJi8XM+Itm80URsFlPl56QwP9whFHMTGawhWN4ysB4
         qCSbVehAyRdm2M1vsucUs8x+qBvovHifMOzkNc2fYMu5SCZujRPkn8vKuopZ4dessldk
         RfxgetzOMjkEf1obswHy+GXszxE7hkLRjlKgIJwR/C1ArfF+5x5u4BK5Nh7gekr34bmQ
         Cu3CkQ4m4yfSyOxfHv0JbgtauNpDaKGFA2KD3S7XJX5Og2M2Ysd5Ec3hJfns81dO80nS
         csdw==
X-Forwarded-Encrypted: i=1; AJvYcCXxY8Afpoa3z7faHpJNq/sB5AVvu70DywjwNwixaSfinoTxwj/xtHefOh4upAq0ye1jLW/9MBo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm3srFWm9hLGzg+SaCEsaDN945pH47EOiiwgEFpfp3OkAWGJAK
	EesUsbhI1j1z1cJb4qUukVhOnUGIaqVNYcbn1IN2vt1UZZSz03b/cwGtXWZ0VuKeLddUUNE2XXf
	s4NKtXixOTp0u0iSXnbPjQCtDhKmlTBqB3lTDQFZBfePpzzdgcH5QCNOQXMeqh0mWtPmZGxAd
X-Gm-Gg: ASbGnctbTeKntqpL6Rh6Dr2prI6bfjw8eIJiuRXQE4k1vMKSTlJKUzln8FYCdhdzapN
	YObKq2fY1dUwEUWdCi0ywznTns7Ddt15+ISpvXmK8Sz8w4VJ0WqzvNJasgqLSCcmHsBCwUIY25v
	XCRDMQyaLj+7/rOtcGRNROGKevQieZzKWPLVgMNzs0PD5zg2WVJooU/C3HAoVbhT87v6aj1U89w
	AspLe3xYZiKfMZG0PTdRzq3bJCarAhSIegxR8DzGvwsldt7ZJ12bTP5aZtwm5CyXPL2MwMKrs4Q
	Ii09UqC9/H+eF0xup2LgxPRYiIVJYxE/j5c9UP+EdkrwHn0TImFclrQinTTZk0yg
X-Received: by 2002:a17:903:98c:b0:235:5d1:e366 with SMTP id d9443c01a7336-237d977557amr211329585ad.10.1750657449530;
        Sun, 22 Jun 2025 22:44:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2fjA6yXvbrte46QeaUhRGDd0j4oR6dZsEFJZhHK+trgT9ehHcZxq+DgkT0YeTB9qXSCO0cQ==
X-Received: by 2002:a17:903:98c:b0:235:5d1:e366 with SMTP id d9443c01a7336-237d977557amr211329365ad.10.1750657449125;
        Sun, 22 Jun 2025 22:44:09 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86c49d4sm75260425ad.200.2025.06.22.22.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:44:08 -0700 (PDT)
Message-ID: <ed04a28a-3fe1-0f25-0f0c-d5b61f894c25@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 11:14:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x0FK6Bas7asin0JuqsgSxXe8f28ePBSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzMiBTYWx0ZWRfX+5ydvtWnHi+j
 lRxSgTJLW+WvSaCK+sHYgUd+r2XAmJjmsYMV9stgngMPZ6PQH7santFhk/P1II00l4Up6IpTBtR
 mwul7kUCzPENsQurviZWBZ3LFcBFNwnQ9md728G+o8sJde5ETxtnXc/UwN8SAvxGnc0ZB/B3ipJ
 EwsMmzAjN9q6c6H4zwSK4gAWGbIXTGfIban9HwZk7m9Yk973UH+xcm3Qk5tQLglhjxMt+KNCFSz
 dupd62LhrwRlX3GJhHXb47yJzuLDnJKmy4tv0Tw84LHxKwQpND+xzjkSM54m1Waif56Qc2a9UAC
 IwTtbWeyuXxLMMzIfhz8ntg1/pH58ub+4S/vz76lehj7B3B6nYf/LgM3jHy2hEkQyaGYhLC220H
 lpa3PzyMKEQRAsnQKWJ5NKfmaKXL4viB3qxXZSo82beEsgpc+eKa+RNQGQeOIdRhWAynL5vW
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=6858e9aa cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_9NqMhxDF2Aqya9w-eoA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: x0FK6Bas7asin0JuqsgSxXe8f28ePBSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=950 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_224411_224967_1414E072 
X-CRM114-Status: UNSURE (   9.98  )
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



On 5/23/2025 9:19 AM, Baochen Qiang wrote:
> We got report that WCN7850 is not working with IWD [1][2]. Debug
> shows the reason is that IWD installs group key before pairwise
> key, which goes against WCN7850's firmware.
> 
> Reorder key install to workaround this.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> ---
> Baochen Qiang (2):
>        wifi: ath12k: avoid bit operation on key flags
>        wifi: ath12k: install pairwise key first
> 
>   drivers/net/wireless/ath/ath12k/core.h |  4 ++
>   drivers/net/wireless/ath/ath12k/mac.c  | 80 ++++++++++++++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/wmi.h  |  1 +
>   3 files changed, 76 insertions(+), 9 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

