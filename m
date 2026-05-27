Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E7CD4F54
	for <ath12k@archiver.kernel.org>; Wed, 27 May 2026 19:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZO3fziTBuxbAv6/WgS4fmu/DgnKomzs/QOcLDB/MF4=; b=h4Yf1lxFtFQN2Hw9Tv3T9lT9pJ
	GOyTvVsX7ZLoGxBuUQCta8nozD1lytWk3on4JkBBHhNc7KjH3Jitp1IwNxoIm7Sf5QR1AoDzYTUBU
	r39g0n/PD0ScP24++wxFjjMSsO6x5RzxS+wX2nDLg97eLPF4fcDZQD9eQ4zajasC5fvvOxdBEwn93
	FM8z7VOhDTMYbQxinw6eyasU4NuTQNtwZfcK3VdB2BnL0Eh+2zdcW/bDWH3nxU4lRe/l7WROkrM+x
	NQiTvbfbf9/e3Tl94r1ZPbIi9RX14BBvn0cA0fghZXRVoJuA8G/d7R1UbSzsqV3msu4KY/uEKVi2F
	JU6yrGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKIQ-00000004h6e-3Y9D;
	Wed, 27 May 2026 19:52:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKIO-00000004h6G-39Ia
	for ath12k@lists.infradead.org;
	Wed, 27 May 2026 19:52:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RHgBh0150057
	for <ath12k@lists.infradead.org>; Wed, 27 May 2026 19:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZO3fziTBuxbAv6/WgS4fmu/DgnKomzs/QOcLDB/MF4=; b=azbXpwa5dJ/EV6fw
	us1A+oRKB7oi9C4PCZ00DfpG/apj5eX275oZuW473rQiGzH4arAMiW/axqV0ZoXt
	pRwjVulzHq1DTfYd2YAViGyccI5c9ghhSwkUyv+aEAt3K3iHGOyCGbDh75/jMDen
	pRt5ogDojxN8PfsIRdW4IXvUybw47cpIE+4h92jrrUmPgVYXsRiYwvTSv7iy/Jdv
	z6WuFfGvv1jDSyvVRZcEhcv4LRkyGpmRZrmSqas7+mujlJ8if8ZadPJwmbhHU49l
	uJnZNjWzliP9IfkW/t9l7e6/hl69w0r5tFAK0jsPLq7BP4u9Vz+n5+qJxUczneq2
	rkGzTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxxvt4yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 27 May 2026 19:52:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f2d983d109so6809990eec.0
        for <ath12k@lists.infradead.org>; Wed, 27 May 2026 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779911523; x=1780516323; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZO3fziTBuxbAv6/WgS4fmu/DgnKomzs/QOcLDB/MF4=;
        b=cz4pAkW6/A/Wf5JgqM0D3e+wYjNEPLh3RLEo2FLKzN6YDjK07ToEbOUwK/rylLWD7B
         L31lFDviGLHoePi0nph+/CLtyhdCCjcuKkUkr7Cel+iP+Il33r69QDUWZfEkIHm/px0o
         TsmB5HCyXMQfoRxCWTznOnWJYmkrtVTOO6rcmxy//lNksCZTN2JqEBfX/fqjL591Q1Og
         A8RQIXQB7vPcBQFDXpudkK4vDFVchu4VjxHzvfoXHVLnzuWbwRmwuOm3xhuxr/B3vvge
         Jhgk4HJnEHB8Bbn2iUiJ+tMU/d0KFFO4RH71Mw3LYEAulghco0aOajbYQoTHQDhuhtAX
         GVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911523; x=1780516323;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZO3fziTBuxbAv6/WgS4fmu/DgnKomzs/QOcLDB/MF4=;
        b=nhXdm/Uami3gOSLKzV2R2Zvk/bYf9Zht/h/lDfCL+9BqvRPw6x4QSxtiPVh7PGHj2x
         1M7YEEAw+3vJmDrcyJtLJBoI11Z5rfwlB4NIEFA87LDIOIm2wjrbpV06cLzWEA6YPwDT
         OyF2cQ8DRgFEwVsMZKukAFHko9fGv4iVGLMJgJ/KGlFI1GIBsTNM/JFBjAmcB9S1Qmo9
         1ZGHSv+XMr39o10xLIv1ymhKYNPB5Oh6NR3mC05xKL4OgOjYOExc7h7tIZZr+edbiovt
         a5S6lZVaTa/P46eiV5O3OO0jX9tDMNtJISAISkhPKgN2SdUyqQJuBzVBT2a07SK+nbWY
         sM0Q==
X-Forwarded-Encrypted: i=1; AFNElJ82SIabzVAEm/A8p05PbXTbfqmqDJvLXLqgVv3o36/7mcCj7w06dv2KKK6Z0EkswEW0fWvWlS0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0RE9IDZwgC57M/uaVhxlT9F8/Cp7KOTXZGgzNhRGNRjK/M351
	0e8u+sbPnnv6k18mswBwhpRdgTB7+MYapZm7wNnoSmynq54eF8oh9wmYXx4YI8c/FUHSy1ZY0pC
	FORHd1o+4O9rAZggdt8ID4mfF8J2c+i7KRNsvpkli8mMxgJ6Gl3OhGUlv9oqkZQBb
X-Gm-Gg: Acq92OG90w0BhmmWspMbQGfCr+FfZvZ0BDDwyUdreJeqmLLfzIwXGLp39x3o6/6lFK9
	1wKfQEqNFAijzcEqDtBkbCKcUKXPjxT0tUOEBxf/v9mgerImeNtZUS6BbN7EkoOx94t8GbNiQPn
	gngmn2ERYUnu72VVzBo4KQrlvXXDRfBnGmD0Ro7dhM6MD5U+cQ6C1XwVbnwmDLomj4Y3F1MCXcL
	bIBligLPAZPIP3qdxa/VSpqgyRqKu9tI6Bgoa0eWy3reB+gEuZvLlIqnni+VKhgA9Ru7boWVoCU
	xNUfaXwJoF5xcZMx15A8UdB6/SB18tGAZ9ynW3lEwVDyDyI8uapEHUzLK4D2wd/Ny+UnZ7Wk2sX
	e14FOySaRKUetX+jBqUnRwzMQfVHff3RuGaUD/tu5LqTNl4hsjESH8jzAm6vpFTHfGijf4sbLom
	ZKWO38pbbotzG1q83g+p1DD0Wm
X-Received: by 2002:a05:7301:9bc8:b0:2be:6f30:f2f9 with SMTP id 5a478bee46e88-30449187ebdmr12061318eec.26.1779911522705;
        Wed, 27 May 2026 12:52:02 -0700 (PDT)
X-Received: by 2002:a05:7301:9bc8:b0:2be:6f30:f2f9 with SMTP id 5a478bee46e88-30449187ebdmr12061295eec.26.1779911522174;
        Wed, 27 May 2026 12:52:02 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304524610f7sm13536204eec.29.2026.05.27.12.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 12:52:01 -0700 (PDT)
Message-ID: <dc8c9c9c-dc85-40dd-9313-845a808a35f4@oss.qualcomm.com>
Date: Wed, 27 May 2026 12:52:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] wifi: ath12k: support calibration-variant from device
 tree
To: Andrew LaMarche <andrewjlamarche@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260131003222.2011259-1-andrewjlamarche@gmail.com>
 <A2E3AAE1-1A80-4265-9497-0C95C3308CD7@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <A2E3AAE1-1A80-4265-9497-0C95C3308CD7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 556prLeh95Dn96vnrSUUXBltC5isUWnq
X-Authority-Analysis: v=2.4 cv=bJAm5v+Z c=1 sm=1 tr=0 ts=6a174b63 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=HgE-MqBRfio-cNNWzu0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE5OSBTYWx0ZWRfX9px4W7MhoJ/C
 4tqeM1ZNr5EokWVnwQkzx7cpNg4G7yy9/duTgBGrbwQlOcac2BpXmw3RpFMFCURvAaJQzXfLENB
 syeVw0b+EYUHpYsM/zqO+F+y6WI++Ux7DJeQuGpekOysriU0MljH3ZitP+jEQystC/vIsLbmhlF
 hDs0UivF4h3NuDmBxcHzJJttCiOvQ11cg9vS1PQhC22qqrcMD1gawhIsoMb73aC7xC7GMYf4YeA
 wlQ4v5IaHu/LOdb+GqbA6sskm6GbWUCFxxK8lN7JnJtXx2wL8kUU33N1Ia8RExIa/eEH7Rlm4Uu
 5qnQ5Eaul/gznu8T4lm/GGO2rCkbCXNmyuktVjHDs4zFNvgytd2kIHkZ68j/ttPi8x2xSIeRtXr
 eKTIm+w7S7wFQdvjOpOh+oe7x1Ds6CmIM33NgUa11j282LEpJ2oHcrgQO/LZKcocvle7l8p8qBT
 cNYEloO8sk1GCgnDihA==
X-Proofpoint-GUID: 556prLeh95Dn96vnrSUUXBltC5isUWnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_125204_839934_1FFA1C85 
X-CRM114-Status: GOOD (  10.21  )
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

On 5/27/2026 9:12 AM, Andrew LaMarche wrote:
> Hi,
> 
> A kind ping here. I’m not sure why this functionality is missing in the first place, but it is needed for loading caldata from the device tree.

Your patch duplicates functionality in the Qualcomm authored series:
https://msgid.link/20250228184214.337119-1-quic_rajkbhag@quicinc.com

And note the upstream device bindings for ath10k and ath11k only support the
generic binding qcom,calibration-variant.

There are no longer any generation-specific bindings, see:
https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org

/jeff

