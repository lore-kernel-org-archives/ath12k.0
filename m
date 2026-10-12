Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE218CA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 02:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=; b=s9+kBNQ+a4lFp3GO1yuNTf83Ud
	GOBK5jbsfq4TPtmHByaR6VMTIRi3JgmaiSijp8gnsrOvfp6Bnc3ue741qwaRKormj7vwfeqpTTWZu
	cN/mGmJBN1UD4lPGO6//xgFnEwaRGnHz0TLQID/na+56HFBQhAveqlkZFZ20KxDsoo+zMHD39l5fE
	a+JXr2P++bRMY0TBDb0ulCb2lxiUxKYnP5SRqxelvEfxr4lzHYZm6zOkdmSrWxdp/2XarTHZNBvPF
	GF7QNXTWhbB5MyHd+pI5Ib2lfBrFp62ESIHUj/PwsbrFyenQvtFONrc8k9ni7lXzCkHf2HTv5A6oU
	eGSu61UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG69K-00000009asp-1qVe;
	Mon, 12 Oct 2026 02:52:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG69I-00000009asQ-0IdN
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 02:52:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1lTZx2015790
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 02:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=; b=P6rqp6Yy2CKdpa4l
	yjj10dDeodgVAgks7h+nP+wEK1O3d65zjptYwzVk7WqBwuli3o82TnFd332GwR74
	B+k4R/frn0OZX8dI5I0jPm0IFDauk/ari4N97AUoQS7T6NADO+h2It/m7S+kZCkW
	9bBlrF72GpHYEdx3GxOxN2HPquKiye0r/8hU7fbVs0iwLdmLrxP/g8tkG3JOFlRE
	tIcdZw8N5vuJm5L4NexYjjIp3GhwR3BoqXvgT1upXwBFqEma1c1Iv9D03TUCcs09
	N0KSAs1Q+9rM55olerqkwuG7VOjYV4J7lhtkdr65ZhehGkXYNMVF2Q3u84S6om8H
	Z+siRw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fct05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 02:52:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc435388657so1664472a12.3
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 19:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791773542; x=1792378342; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=;
        b=OxtkAD5tumuLrKxAd1esVK+oP9IOfy2r3N2NZUhjjZ5OF4k/SRMISvikY6lOouD87f
         LGsjUGRUfU1wLmshug09ViS8yHsLx8jdpoR1Kc4HEoIJprUCm4utFROo7B3TTdZG1foG
         A3bSdPjlB7vOWx9eEXscUN27o9whVT0AyYe5SXOgCzCrZ9JVBTJftubePoZ18DTSMbNz
         j0yMBtgWVDmO2eKYfUxlUQv4JtP591K29kqRnTLQkrtuE9UQBdQ6SD0uZSASxOON4JNO
         89Jnw9UNImRU52XsrC6Q+6vU+4B/OBvT7bmIy0vYgruZVXuLeSN+LRsqqrnojjuEPCJN
         bnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773542; x=1792378342;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJbREqwsQUUO1NfreZZnhUkKL1+aQh3D5/8AoPrzCmg=;
        b=iTErL6+O9r6Qtz+k0X6vKMLSE7tOrLncb95MT1jJ1RjBWmlTfLFAn8gcd36YJQDhmp
         DYw/zAptYqtq78fhA+H/n2wCcc1O6OrvhzvoAEPwZTfD3C32VivsDvSAb3omsFah0Y4G
         3obEXJYCRgiwKVLcsmN2QvNYRNPtk3zrM6me/VKy4N4Xsh6vzwqkGYeRPUvgOJUtxWPR
         DQ2gfUMc2nIaRV6e132sdMfdpDp3R5g1o12F/3MekGgHkUJVC8eNIZZFCDuA/RjCBAPc
         MfAtdcpAVcjg5iV8GjZEb9stRnIOwWsD0dE0LQlJMo9S6elz5BiPYkF5QLggkPBLnqiX
         Hjiw==
X-Forwarded-Encrypted: i=1; AKwUvBzOMbaEupM3n+bxX/cNbVpN03Sq/c5PVoefSr4IC7CdAxPDxQD43zM6u4Jq/MRG8rOH8pqorKM=@lists.infradead.org
X-Gm-Message-State: AFq9FYI4nA6TakTCngcEUf7QLaBQ2dPmLHI7l3/d2OUQEqu2QAQNkp7f
	yRdrgoDHAWDFynCWs443QodFUSaqNVeWZFWMLZcSVzHQVR2FOQZCiDwJlyrzAzqYQFAEn8Ag8H7
	AuXJtkOsK75az3795hG7vFExiOH1TauJgO3ciyxbHjon9K5OL5P0Kz1fa+sBcOq2Z
X-Gm-Gg: AYBFou3g7FYWuY3tzUFfn2hsgCFmkQuIY0utBev7JxGZNKDW4sjHb3xkbeHrOGpciUZ
	c01kMQkrruIv956iuV90ckvtvNDMgO9LFvjeZw49sKP1sxZdhQAsA9jbu81mvwXCHqCUKgnCayf
	E37aXg+RyjrIubnVyb9WmEfITtpc1eHuOZvhdtR3KIoKiqCYlKooJ6a23WdKnU8OYAFChNxRjmy
	vhQ2ii6VyvZAhjVDetHWs1+IesZ6Xwt6IyF1jkvw+V++bOCe664BumRxjL4gYPlN3WWvI7oeF5H
	FNZpQ1LLTl0bMVJVPCLs6b80Uhack9TxuHFOyX3Z1F5q7lVYwkzhqiIxl+3u3FfZCJ1YZ2C4kOR
	y6adJ4NMghWQYV2NA9pQcV5JJgDBqC6o=
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr79892055ad.37.1791773542122;
        Sun, 11 Oct 2026 19:52:22 -0700 (PDT)
X-Received: by 2002:a17:902:e847:b0:2e5:e1e2:21fb with SMTP id d9443c01a7336-2e842ac8aa0mr79891925ad.37.1791773541669;
        Sun, 11 Oct 2026 19:52:21 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8202sm35146905ad.51.2026.10.11.19.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 19:52:20 -0700 (PDT)
Message-ID: <c6c45288-1eff-420e-82a0-db9d92286db5@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:52:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Microsoft
 Surface devices
To: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Dale Whinham <daleyo@gmail.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006062728.45007-1-franzelfranzel@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261006062728.45007-1-franzelfranzel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxMSBTYWx0ZWRfX1/L7NajE5lRW
 PXtJvS6MmAvx7PH2KkHPle8V5avrya3CDpbeiddpjPdzrmzAycLwEKcKqh7r+kjkarTOPFsbyZM
 P5mF9IZ3QvCZmJR2OSPqPdRdCIBk7bM=
X-Proofpoint-GUID: Qkx0k04WLnnHDRRSQUkOFLuJ2KNTqsKG
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc4b67 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4vkvQpwsUkj-1mQPOeIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxMSBTYWx0ZWRfX8sDbaFdeSdbz
 E3b00+lNANCKlLNDUhL6OL5T2CqIWkn3MrhgWI2+BHabDNyBcM/fztixtYP6qhEOcyxK5sZcqbN
 u4CZrPOxlm3kf+YOZdySKaB7qL2KoIyytIPyfZLnzTRbZ8aSi7AXNQMhHFCWmyJALXHzlxv+xq/
 NCdJ7hSb9AzVhsgP3yL6/0gBAjIPrYv4pUntO5+BZ4EiLo+XEGBj+yeUWpvP4KZBlR9QmqZL/R6
 RmLDqkVjEzS5TIR/+h71g9R/fRYn3lrkqp3lPlDS1bNCPWbRHZpYsa+ky74OCW4DGpu+GDoTrTh
 D+s3ovcI2PMd3DPNHgISLuqz4muW49/Rpom1YwJ2+AbLNoB66eQS3cZwy6zCZMG1iFSjhAVDAfo
 ozq/DWK6RGutI/m1lzMXW8XCmKYoT6LmSzir8P9fh3M2ZK5HlhoYpGKivf9NbIhSfS9RN1rDmIb
 prVxwjY5/LmvjeNGUKw==
X-Proofpoint-ORIG-GUID: Qkx0k04WLnnHDRRSQUkOFLuJ2KNTqsKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_195224_142397_26A3827D 
X-CRM114-Status: GOOD (  13.67  )
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



On 10/6/2026 2:27 PM, François Roux wrote:
> On the Microsoft Surface Pro 11 and Surface Laptop 7 (X1E80100), the
> WCN7850 hardware rfkill input reads as "radio off" and the OS has no
> way to control it. ath12k enables hardware rfkill handling, so Wi-Fi
> stays hard-blocked:
> 
>   iwd: Error bringing interface 4 up: Operation not possible due to RF-kill
> 
> ACPI platforms can opt out through ath12k_acpi_get_disable_rfkill(),
> but DT platforms cannot. A DT property was proposed for this and
> rejected, because it describes what the OS should do rather than the
> hardware. The suggested alternative was to handle these machines in
> the driver until a connector binding can describe a broken rfkill line.
> 
> Add a table of board compatibles and hardware revisions on which
> hardware rfkill is known to be unusable, and skip the rfkill setup
> there. Other affected machines then only need a new table entry.
> 
> Tested on a Surface Pro 11 (microsoft,denali) with next-20260929,
> booted with the unmodified mainline DTB: the interface is no longer
> blocked and connects. The Surface Laptop 7 entries (microsoft,romulus13
> and microsoft,romulus15) are based on reports from Jérôme de Bretagne
> and Dale Whinham. I have not tested them.
> 
> Link: https://lore.kernel.org/all/2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62/
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Assisted-by: LLM
> Signed-off-by: François Roux <franzelfranzel@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


