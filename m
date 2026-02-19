Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F5C531D0
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 21:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=; b=xhBHPeHP/GCg9MXAWizgsPRqD3
	tycRZccv+/xSRL8l3Q8f0vC1HwOFXjyuMfMknXjOvk3tfx+PRimKEusa54YtoJxd708A0sOJIJeke
	CjX3NJWsYqSDiqQi5aCtl86LqTC/czcN8H3re3D1GYqyO9/xayEkWHf6H4NxzLn4gLIf9VRZWtJ3I
	d1NgX7gX5IXBrrNLILzxwHeslXUN3TAakmWtX6DLjqg39h+5Q0aBSta4khWevgchwAaXLrYUEtctR
	qz2JXt0Je3+z+ZB9wLFPT1HDCOU3ElvkYTLVyjkADCRzGLTOWiZFJVdBG8LB/Jm9Aalh391L3AXRm
	uVuRWx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBWr-0000000C5gD-1jRv;
	Thu, 19 Feb 2026 21:25:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBWo-0000000C5fN-0WiB
	for ath12k@lists.infradead.org;
	Thu, 19 Feb 2026 21:25:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JKuJTM3077992
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 21:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=; b=CcgqruqBhDF4DmBj
	U961qpivyYUC4c43YJ87fzFdzJW/K4UcXFTfVdt350VDvcbStDpQE8v9Bq8E97AU
	wG9QrsBdU0h5/NdvJpUtwMsIEr20Z8htOFPYMIG8G8/VsyNiy2LKwYPFtJpZuZw/
	wGePOG7pwsBNpkoO1UHCUr3LOqipjap3vaeRQhVEb6ihuLjGF9bnek4Y4w8K+UTB
	xxJzB3CzbA2CEPiVmX6MFM1KUaWmkfaOLQVdeVk6Smu1jBAHy4Nut0IUJ/jeGJUY
	+IulmCQByThQGD0jrtOOs79jpiD9+WVz5aioZRJk4BoeqSdYIs3cUmqtQWTH3pXh
	81KbLw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk83388-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 21:25:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127133794b6so879581c88.1
        for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 13:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771536339; x=1772141139; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=;
        b=OEH+/ywNMT6fffEoiAFK4IN3DCagE7oioN+RuMK25fHB+G5tDJe7D8wbZbBSXjMtcK
         sKym0+kxIhQsVHM0sGsY6+ihRgGLw8lPMa8i0Ne+IpPs4IxpCf1+tqF41ShANv32UruH
         3KaXzIsfM6WSL2T4n8dcdhbK+vU7LrUXNDyWfJcAbZod7qEHzAT68B2NXAVej09ppUg/
         Iq20JWMne+oNYMfLKyiMkHbrvwmRFe6+D8DOtGJjcHDmxGnZkOo3sGj7mKfeRAQ/JrZG
         4OBR92DicebcN1M0A5gte1F6Rvz9OvHHVCZohZZNOvodm/xnUx8i9oSB2DjlXwERoY+7
         i42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771536339; x=1772141139;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=;
        b=g5x/IakVb8GSyJbKL2CC85sEKolzay7EN1dlc1phRWh6MuIRaJaP/ZPvy9ubA/AP+2
         7jmZzZCE6c4SZyq+dY/z27q5NEKM122Otd4DeQ2vphealQudirJ2/17zFJhMqfXUMVdv
         GHNBf09RuqmuwO41tvA1ZiDyWOzRx2KdP/j1lzdzAN9+AUu0ICpTtIlAE/Td30YPiFgl
         d8aBSUPQ6MavC0drOJ+Il5Xx3nVYg+VBZTFIsCJTYP2woZIVRnVKmugmM1xWPwB5LrBj
         tS22ZinoVbPZoTfTvV50Yt0iU4t6m5GPymCuyaQhM0QR3ngcU4pWpwcGWqFhFYy0H4ok
         xjRg==
X-Forwarded-Encrypted: i=1; AJvYcCXsy3FeqvQ8RHhxGs41OroNpKwLZKOtV7V7UdjsVQB0Hbl0dA9Kw9lLSvbYxviE2DosbMMmMNA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxX8tCZ4oR4bxMYniu+f/a6QyJKPSVlG27tpj5jtZ6aUeUzNnx
	WZTbTGYvck6bFZWtrVSlxh1pBvPc7o4svRtL9WWY7C9Q3+0QVspZT5R9Dei/Zp91hQLFygYybqR
	jywTLDjrzIvqD2V5npsrqmqkpj7bH4ZFUyvTfV0kYfTELRm3+LxcyyrRo1YFxtMlA
X-Gm-Gg: AZuq6aImYI3L991f2KafJfPFOmJplNOenB5Izv5PH3UKBAvTt9Mm+bNNM2hxEm7cJG5
	0O/G9UjfIXsWSTAmHSZI78O4A2U63B10urNRiJKZ40ewdcXNRAFVXvwHsBhIBIt560vz5OUxst4
	iyxv5xcnpkb0+nZviRxTZD1o401vSLQEnexpRCVggn6kz9GuJUAM8hYEJfws1Wc8or4YIMW1CrJ
	gpburfr7L47/x6W2eCyMEXhVhNZrXXYq7gjQBULZpoXBxq7G4berz2fVDyTXDeFLIhdpxezOshB
	vrCcWFwJ15V9PB9zJnabQHMM63vSpHLowUNU58qWmaVarcOEC2zSP04USV/ZQjMbOY1xey84z7k
	c4dcZ1DuC12jg5ZH7qxdibM1cMEymk7Oolw+LZoskmtoNKD7bTba3KER4OEmqjWIC2bT8qMptDe
	7n7PyGIbvwVsT0Gg==
X-Received: by 2002:a05:7022:2510:b0:124:9acd:3bd0 with SMTP id a92af1059eb24-12739790159mr10632455c88.5.1771536338956;
        Thu, 19 Feb 2026 13:25:38 -0800 (PST)
X-Received: by 2002:a05:7022:2510:b0:124:9acd:3bd0 with SMTP id a92af1059eb24-12739790159mr10632432c88.5.1771536338383;
        Thu, 19 Feb 2026 13:25:38 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c6430asm24324381c88.6.2026.02.19.13.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:25:37 -0800 (PST)
Message-ID: <1ad37b2f-5f3c-493e-ba3c-fec1a0377767@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 13:25:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
To: Bjorn Andersson <andersson@kernel.org>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
 <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
 <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SRsbV2x2QY9HvM8jOQl6K6OfIjtasGV8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE5NCBTYWx0ZWRfX+vIEzXrf/C4M
 OUT08NApPUMYvzU4IspSk4BbV9ta2nzaJDlR8r0VJKT5snvRdoC9gTJ/+gVZ5YODKVhqI6JDBXw
 pFJ4Xm9Q9smlPlX0siFTRpdOJx8d8QHfMCbPfjXJfjJqSuQqqDUErIKUnxBXYwT0uuY7f6guYQ4
 XXDG/CCEy7cr/qfsyr5iR7C9rvyuCWk2B/q2f7rb5WBm5EQ6wOEguSHryUnDy9R+QIuPtZshIAi
 xdVbTPSRkvxJt+YbRx30bBaJ7ZWrYln5Vatlxr5W7lts0/JOS6hVXaVTlqecvGziaF04S5xQFPZ
 /PbYyjhgfMifX3XEfL3vTTn5O2BHpcxGG4AHEzIaQ/+OW2PtS2VJTQwB9/9HtE2POLE8nNPMsma
 GD6MGUDCtRXp10eJJY/FwHUF4cWVmncQnWCtE7H9RW17Zj0iV6okU0hajs9IJ18Wu+VBeeXgxsS
 OOVCSwVcDdy5Gr5sERg==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=69977fd4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=btePvF4m8IT5Eud_TlQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: SRsbV2x2QY9HvM8jOQl6K6OfIjtasGV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_05,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_132542_307502_2509959E 
X-CRM114-Status: GOOD (  23.09  )
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

On 2/19/2026 11:18 AM, Bjorn Andersson wrote:
> I reviewed the downstream code generator source and documentation.
> 
> We do generate tables matching the ath12k c-structures, i.e. variable
> length arrays are always prefixed with an uint32_t field - not a
> uint8_t or uint16_t based on elem_size.
> 
> Looking back at the original implementation of the in-kernel
> qmi_encode(), we only read elem_size bytes from the c-structure, but we
> do so into the (little-endian) uint32_t on the stack, from which we
> encode the message and act upon the result.
> 
> In qmi_decode() we decode elem_size bytes from the message into the
> (little endian) uint32_t and then write 4 bytes to the c-structure.
> 
> 
> The fix would as such seem to be to just update the length fields to be
> all uint32_t. The problem I see with this is that qmic [1] is the only
> publicly available code generator, and if we change it to always
> generate uint32_t length members, we also need to fix the
> encoder/decoder in libqrtr [2] - which will be an ABI breaking change.

And IMO that is a deal breaker since it would break the interface with all
existing legacy firmware.

> 
> If we go the other way around, the drawback is that we no longer support
> the c-structures generated by the proprietary code generator.
> 
> Worth pointing out is that the structure of the c-code is an ABI between
> the encoder/decoder, the code generator and the client - it does not
> affect the wire format.
> 
> [1] https://github.com/linux-msm/qmic
> [2] https://github.com/linux-msm/qrtr

Going back to the original implementation that reads and writes a u32 on the
stack, can we stick with that but add endian logic that correctly converts
between u32 host endian on the stack and either u8 or u16 little endian in the
messages? Is this specific to QMI_DATA_LEN TLVs?

/jeff

