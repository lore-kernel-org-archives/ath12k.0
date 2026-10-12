Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EECCA9ED5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=; b=RG/lwjtBbONP1JCa7tiU9NjJ+1
	XwEx0hK25FhAjxE5Y/2UdWBQgBKbZVPkp2QmJIfxoaUxI1mR1QgNJEOMLOPIGiaOQMOqqanInFIwM
	S2X0Ag4Gq474wYKaBPOjkSjEhPUnC+UGy0ixPIJX1c3rirQVUw3D46guOxmH0OOQONr3rbuR6Nv45
	iZ7tcF4n08y5HTDpuZWWth69O8ckMJ/zkb9ZmiXWjFOodDM2QSryQEDnitjDueX13o9IYcB3n0gka
	lyKlWQVCVT332HURzidq20pIXdG9H8xQYixKa2TKIu/Y0pJzsLKonTdme19Uhy/RhIY+/0pax8plY
	89JYa3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAGO-00000009pER-2OM3;
	Mon, 12 Oct 2026 07:16:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAGL-00000009pDE-3RSV
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 07:15:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55oIM1339397
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 07:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=; b=WJyoUWJnVa80v1H6
	EOaC9TlLKjEtG9ZG3YRlYXMTcTdcU4ysz/tK9Q9XJ11FGo/cVHXjHb4WI6Z+fqej
	uSkC+9VwCsWPgKYs+3bay4Tc0b84YWQmPYtphL1CxqpdcBD5hvddCo6CI/30YP0r
	gGzAwcTWlx/tL5LLf/5szP7x3MJWbll/kkziPrz31C1f60Zcx+fnVCLEnAGhDJf/
	4VNR8clDPXC0X3IZMyE0dDKghB6g7hOYG9+ns95CLW27JTmRQoS4BPtjeavjaUS6
	A0V0EPXONjCRVPfMxAPRBZWr1AtIRtDrdFQY2UvBfxkORtMmNOTLpmqWh/c+GOJG
	OmKWdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk25av5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 07:15:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533962f6bc9so3783081cf.1
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789355; x=1792394155; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=;
        b=UQf17sugak3Fr0+MnC5zosuArda69eIxd7d6rna8KAbZUKRlk7vSC4cnQPCUo/GfXe
         QUUgja7seipFUc98nHLjG8jWI0JGTwkwVe5XPmkYSopZifCcfgp2HmFDE+VtbwymBaHS
         BFnRpOVBKRcRuomQA2HnH6M9WRzlJD0sNBJ6D9MdGnNtMhE38+Dr1M7KAYG0RBs4BdyL
         6wEsStaV8zcHl9lCafqkBZjyxD8STh5+hm28vwNlu2y54DtuUEgcX8T6j39VNjtPJRja
         f5EhiX8sNtpxIjdt7VvU6CQyXIwwUMMoZnC2qL6ODvboxS8s26Ob7m1UpuEF/wVMjtrL
         ntLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789355; x=1792394155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FALdQOa0iewDJ5PNUsXZhf0wCNU9EWPT335/P5eVh18=;
        b=HL0EoXCw9qNGzo6cSa1DEEZrse7pcex48p4kQ0UH0UuQG7dKvGJ5KO7n86lErubj9y
         e+xImmdSNOsDTSARutuTTMXBeWDT3cdTpPNNVvRMdzkUYm4fuCINZH0dKmyC6GHxGqPp
         l6JeUff5JMxRt5vIYDB6HD8rWDJqq0FtitEENUhG8yeU+/tsS/QSPiRnJMBDW5uV5zrx
         VWfm+ZyyufweGrLpAMX0sAUYsbLBqjNpCCS9/5GPtal7dnymPw4xGchQALFTLzQDfkc5
         6mL4h1sES1ULSGtjZhvbZVMhZN7XJ8M6L3DGDVvr7g7674PWAuZsaPrIhAgrYv58iG3M
         +5zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWFQCsJvwYfMvqUqu1jSy3lJcTQt/42dxNMw7+w53tgPWSSnTss8doXe0jEeV5BV0ihIrhZVA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIUpmezBf/NpmneIoD8fyBn75Nm7DaDb9ykAzhpYB70vYKoieYp
	BAQimeNKHwIxNaqAMn7gMXAHNlNp7lCO4HxT3zD/QNhXz+WcWNjahTBQVVPqHCw7UPseTmUVgqY
	3SrAbrhU/wcgAgURuVU1taDoogBOKsfph09/uLGLu7ml0XpvQWRFQph4Vase9JZRS
X-Gm-Gg: AYBFou0GyhNACHdRBzqj7ZxwCjHNnS8ZjdDg4bC2H/DNLNLyW26xTi2zANW7Ih+9tB4
	64e6eq85L2tXNMrNvnobTkIL79ZJUgbYtzoA+NiLYj/XeHW4a0E1+jf1VaiMCV863XPrqyFan2z
	+Iu2eBgM3zG06ilTAz1MqS/KTEtzMB6nWsdDnKxptr4a7C2fQvc+jPV6WKZIzVl7c7/l+Hctsgh
	75UH+TjcuFKBRNIP5tHyWYrMUktsWc53UjKZ004JjIHASr0O9irrt6qe83hrHqLjHaGXoCkfE/a
	FQSMHWtg+eGo1FrcN6xb9C27N6drDb6zLUVSDK8pCTn/HomlASzX2rkKm/7TJND/U7WZaoKqs2c
	diqolGUafVRwSsV9105X5nA==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr1612192685a.3.1791789354428;
        Mon, 12 Oct 2026 00:15:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr1612190985a.3.1791789354033;
        Mon, 12 Oct 2026 00:15:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3382b8953asm199591466b.21.2026.10.12.00.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:15:52 -0700 (PDT)
Message-ID: <8ff749b8-2ed2-4ccd-9f7d-e7bca7aeb38b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface Pro 11
To: Dale Whinham <daleyo@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004165132.4313-1-franzelfranzel@gmail.com>
 <d791e70f-9c3f-4916-94de-8d76517339bf@oss.qualcomm.com>
 <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFcmK8haaN=O+aqvcRr4t6jc6dr4Bf2QDDPso-aT_frqEfSPWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vxl04dHSi0_EGt0izB9lFYu5p2QOS3jH
X-Proofpoint-GUID: vxl04dHSi0_EGt0izB9lFYu5p2QOS3jH
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc892c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p15cCi0eOIm9mb8E23UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX96Y0C1soVppN
 cM5KLWIgp0B2omosMKWjsttLN76ZdpPJliv1IAOh6dWEupUTznJSYXCoKXkBngrIm2niyWNU+96
 U7eAL8pQjzqexTyj7d3FdrtjPWpK+dKHMSf9m+dTn+6mxa95K9ncxcOkDH4je2DXg0T4WQM83rK
 bQj6huTTyIbrbD1IchVXCgI5KN/ddU51sK/lrS71FeBvNd9KyhAVXuSFtnnTXZOQCLxRuWO91UO
 fj5xrnmqvKzflHSKu8Syoq5FAOqHm9BI1/k2HxiuOS3j+Q+BSC2WFn+qzquQG80ncZY8srTAR2x
 N8JX7M4KHudmlr25fXFFPjnBQBkK/eJtf5OOtxmprF41bOlnVMAsvz4+1NtQdGruAOMsmLoVVT7
 6QbkkTRkCeyorzNmcQYKbyfizwxnfEF5owm3DImmYuTNZ1yPxLDPyVmcXuercYIZg/XFnm/M/ng
 zyedQcEEB1hghrmxO4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX5KTsjgdjeykH
 ZZ/CLDMHPt7ufJHInnTls3jnqFuNV/4Qb1AZpz/QO4vU688XH9ULK36bg0+VT3pFxsN/HK+C4da
 Yxr4RFHN4r1dkO1Vcs5i+cKWtKXM5Lo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_001557_871668_19AEBB88 
X-CRM114-Status: GOOD (  10.44  )
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

On 10/5/26 6:50 PM, Dale Whinham wrote:
> On Mon, 5 Oct 2026 at 14:37, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>> my preference would to to break this out into a separate table-driven function
>> so that if other devices have this issue they would just need to add to the table.
> 
> Indeed, as far as I know Microsoft Surface Laptop 7 (aka. Romulus) is
> also affected by this issue.

I can confirm

Konrad

