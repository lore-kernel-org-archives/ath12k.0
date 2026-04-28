Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FC4FF8867
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 03:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvbBNvK59z0ts17Fz8Tuv/cBWhhNAtDBIorhgFmFXp0=; b=SQZ3I7MVQmN/5OuvpNrxYfTXJl
	amX8D9yROSSD664tSu4OjgMMzTPZu4Mq4DEldOEwaoL01A0UiFvBN0URcGj0T7QVCmJxwUmrixh4u
	0XJDMnXVPai7KPk06XhcbwBC7wzfhvgMAmePGnkcHcZoflg9wV2MoGW289M5hO1Qw1uAgWl7HvTu+
	YHt9BZFxaPfTAt4pL1BNx2GiIvW9EzxxXopfMYtGe3h5H0AVxAE/gKFrLks8/cf6VAcRVQ0WGGZdd
	+g5vaohbwuKdXyHpfHgACOvePjoMmR4EpsYdnocyrFsXoNnhBh9FEniGpAIbi8nR9RbpzuWE/XoOT
	zgc+h88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYid-00000000Txx-3AC5;
	Tue, 28 Apr 2026 03:02:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYib-00000000TxZ-0bca
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 03:02:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S0iiar3123502
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 03:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvbBNvK59z0ts17Fz8Tuv/cBWhhNAtDBIorhgFmFXp0=; b=P01Tgrx6vkDmiZgS
	hwSwrWbKRaK9h3v0RgVTqipsi/zVgvRRy4T1XUxv3sx4RQN9wzD9929bTbdCk3sn
	tXg8NheUqco/9CN1FF55Q+rlRjQFxQmVT7uPtixADS0zfNAnmtiba8iUNIaoaklA
	FvMI1rPMOLHivYDd5DnAqpm9p8pjiVCGjtmrPhRUwoFRl3uc8z5Ac7A5X4G+zQJf
	prQeHKhtkGt7HhMIAjbBxfvIviaHbe8B3BlrXjQ3r7wfJf6ZmFrNvWyUrmtWLNo3
	OVAhoSxkpyWBOzOsfDIu+EdhQMk79uZNAMvapu5gRHl6yaPpayI/6E0NfDDThudD
	vyoeaw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgkf8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 03:02:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c799a65bad2so7809859a12.0
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 20:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777345355; x=1777950155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvbBNvK59z0ts17Fz8Tuv/cBWhhNAtDBIorhgFmFXp0=;
        b=Yy7XuorHTkytGk8+EqDQVxpujxAXG11CJ5ZgxwNbtaT2q6VrDRz0uOCwiGuk84/L3p
         wFwQrQUs4T1FE7u9Ib9gqF66qyvORDAvb3QBidNFERn14uc0GbTGTStd6xbsWMWm2J2t
         eTAp77xNXA19xKgIM8OaY6WoNB1clx728vrtnTpB64AwWLTrXZ1QPUI8FkP6Y9rcM/3Y
         JfR12qEvBqOgFGSUSzqocMvvmfayo8MpvCA/rCYkDwJAGatV0JVXys/uut8jaPBPQ+Zq
         FHd3UHOPVr7JNP1CbGUUH1dnEpFfLFTPnulcu+0QIJbiaHRj3Gjpopc3Yz8Tm7Vnk+H7
         4qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777345355; x=1777950155;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvbBNvK59z0ts17Fz8Tuv/cBWhhNAtDBIorhgFmFXp0=;
        b=komUP4Bi8UBVS9kLLctnKTbIKOjdx2m3zlDHSKxkYfNOeMKPw5aC3OcyhvWS8MALps
         Khh66h0KKtvl+NPl0ZEPxe3STSr4WEJgD+BJGP4kCtvohCpNEnml2d6q1xK8jAGHYL/j
         jGuagdtIhn3fJ+h9DU4qK8kFxOLrCjpTF2oNyQxnBD2Oj1YUhmfOPPGQ5e3tDw2/yksz
         cLt1mYRAGHKkFmcAMYvQJrqyjQamT7oHgUbqdn7rRUIVvluy7QXYB81PkfKAWSOOYnSs
         2R4u2hDjbI3Z9/cIbK4Qn4Iy0COzJXD6DYxRMl1vvpOdtf9M2s7QiAokm3seQgjX7UcY
         Crxw==
X-Forwarded-Encrypted: i=1; AFNElJ9tIH81v4XIaIPVK9LMWkxwE3mGnX5sMpszEf5sw5gPNBtY+WaJXjhgjWxBXS3aAEdd3DA+gao=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzfP66I3XpIu5kaFuFHy+eYBKhL69OJupZRLmT21wSPgVX8q+M
	e0f1HIVw/wAehLGzQyChKhSlxWybM35kA43+Z4iH2ik+RrC7hsyLH3Ya6fC0QuItCd/oQU/OTrd
	KMBZJbqjPUIMNsyh7tveliBFO4tbIkJgcPrTwikNABOqtvRT0I6/roRAR6Zg+2GH4CVw9fs0Wzk
	s=
X-Gm-Gg: AeBDieveMHZy+4kWpXiNZA5mkGUwPLIp5csVYPx4o5KvwSYZyus2l16vf5z/cLirtru
	zi5QEPeBjUaU5PdAaq6UExdg657s3QNsdzZ+WbuAfjFvIDxiUfg0iiyN9JdFoTtnLp97f7Sz+wd
	OMPkLOYkUcCDJeqp1NLCAasJF4AsCqIU6tpPcnvTTve/UOVpZJENo8Qx9AIGIgH4hpEM5xmzL95
	CpawLvPDjhevpojnEKKnUFu7yGYfmfX9DtWZya9Eqdr29nbrAKGcl+Xcc3Tf/wVaxOrOwNWjJhA
	4y6gR5LfXuUznLL80I/jCK2DcQdBv51TEbqjwEul3+dzHPCutHzVtUEXBr+s+yK7kNiWn2C8xQs
	nlqcQPCWhylMvuqib8aNHs3Qf3fvDJqK/is5tITIhG0ecQsA4eKcs37+mwDlfpmqZsJ66dQXnsb
	6FydboMY8tmQ4t4YurOVrL7Vy7rfQGVw==
X-Received: by 2002:a05:6a21:3388:b0:39f:ebf7:5ba6 with SMTP id adf61e73a8af0-3a39c1bd8eemr1424594637.25.1777345355533;
        Mon, 27 Apr 2026 20:02:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3388:b0:39f:ebf7:5ba6 with SMTP id adf61e73a8af0-3a39c1bd8eemr1424548637.25.1777345355085;
        Mon, 27 Apr 2026 20:02:35 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc35d94b2sm683426a12.31.2026.04.27.20.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 20:02:34 -0700 (PDT)
Message-ID: <7289c0d5-9cf1-4569-97be-f0812b1b2dd5@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:02:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath 0/2] fix leaks in some WMI error path
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260424144813.1708214-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260424144813.1708214-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyNiBTYWx0ZWRfX3MethaSEx9dB
 9cxMFPlavaDqcfEUQQr7235z09wYjGeY06vco0om1+8lRjGyzKHe/mi9gIRmjxJ1Uym1KLJSXUI
 Ut9yTyXAV/hZKbcmGbZDO5S+kJrGBAYGe4txbW4lPGlSMe96acv+16M3Ao8UudSrJ3GPHbHzQex
 jlV8hGMlbicUnPLc45qKJqS/ZarB3LkIIUKaDySmu9NYqHogz62Gd6sr5zNZ4g/iFvAGI3j7cOx
 VLx3NercvvhgK85NgcZ5V3U9O2cBnr6O5TfckZxQz1u+po89SFI9DSGlQwV3+JWJ4JTrQtE2bT4
 eTfRweePwSFGwf+7DiXA9vEvZ9ad4yt2pNr1ssDw2jEMEOttiOuDwYN7cBTYyufVylPq6806BWr
 rjrzai/ZHeSV01qfrWC0gochfEaFyn5/jaXSvro2u/N6Bg7u5MJobx3U+Xcngvt069/AiocoZyt
 EvUFK48jICy3MKU1vgA==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f0234c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FqyUr2HIOI8AG8dd71AA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7kWx34Te4tsWwTPMJVkjHDUmNu0Ia4e-
X-Proofpoint-ORIG-GUID: 7kWx34Te4tsWwTPMJVkjHDUmNu0Ia4e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_200237_191405_A360BBAD 
X-CRM114-Status: GOOD (  12.44  )
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



On 4/24/2026 10:48 PM, Nicolas Escande wrote:
> So this is similar work to what has been posted here [0] for ath12k.
> 
> When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
> explicitly checking the return value we fail to free the allocated skb.
> 
> This has been split into 2 patches per Jeff's guidance to hopefully
> ease the backporting process.
> 
> [0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/
> 
> Nicolas Escande (2):
>   wifi: ath11k: fix leak in error path of some WOW related WMI commands
>   wifi: ath11k: fix error path leaks in some WMI calls
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 131 ++++++++++++++++++++++----
>  1 file changed, 112 insertions(+), 19 deletions(-)
> 
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

