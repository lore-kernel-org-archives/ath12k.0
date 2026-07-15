Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0B5C44508
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 01:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsLhDqDBDnNRlsHM/2Tqm5id7aGedP3eAqNDjF1Xv0M=; b=VjDwfy/y1Qb2K9gak5CvJlYie1
	9o6zFxhTp25rJ8OG1Qj57UsHsujJGsMMKkFl6dVhffCR5Cw63tw2wawPnKRgdwu3mePS4QIN+a2Vk
	WDw9fpe2AerAN6MskuhHnnycxWxNTaIaolfcT07me2UkmmYESxa0M+kCjhRWdVLh2fuXSjeWmbewK
	gTo2qzV/1f5szOA6uGVvcY8BEUMwbovop7Ubu7L6EOcjcHrSrnNpyZXnrrHY+RKBs5rfD80fSlwEs
	aq5TgZg6WsbyKsRm8MScolpJAoBlH4YlRXXfc1LT2xGek2B5IIIeyUpaPuEhQ8p/rQSbgM/D98rPc
	c11VI6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjopU-0000000Dait-0vBU;
	Wed, 15 Jul 2026 01:54:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjopR-0000000DaiQ-0kPI
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 01:54:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0I7mE2134866
	for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 01:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsLhDqDBDnNRlsHM/2Tqm5id7aGedP3eAqNDjF1Xv0M=; b=KCjNuPmjU7fY2J5S
	PyvoC3SUEkfEXr5PyJeKR07ACPRN2WGqnQY/q+l7AHLQPue2kr34otrxiDI1mSdM
	2AphvMoD+PIYgNd1ycGZCgJPnw77v/6oAHYdDW1TOMmleOsvw9yEb2qd4IbpHnV1
	MXPhSRHxQWQtts5cvQMWm4IFFfambP7xV7XxxD/chdLPvN7U5VYNm1c9ryqXYwEP
	0RXVeEHimu6onZTUe6kvWtgPAtuLqwkNz5KSRqyZt2hogxsPPNlcx+eVDPrals/Q
	T4/S3QwcaMnVHiDxmBFIr/3IU+VSHrmfmtQUTm8eOqiqGC1gVjUnGfKXWM5kYlKE
	7wOM+g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9hsfhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 01:54:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8482b95574dso6203394b3a.1
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784080468; x=1784685268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BsLhDqDBDnNRlsHM/2Tqm5id7aGedP3eAqNDjF1Xv0M=;
        b=JjFLBbFrEyr29VBOd7Bbd5vrjgSjzc0BQHjgEof0JZfjLTTctAo2TxBgYDxLEt6+FV
         uz4pIe895jRI22FIraeLv44VHS3gOIcK0K1jSHPB20P6FJBgGwTJVX1Su9IlpaRGyusv
         LuejjDHr0+jYlW3E/JVEJlEVuO6ri6qSSJKEh8i67cxV9ueDpUpzjxzcV44ArLUq7KHe
         ezHUKLtOv8zbkNWzSjwX8eMqYyCqKi3PTIdnzutfiyflqPjQB6z9R6VG+X/7QrNZXDzZ
         65jLyIQthPN5tK8hhYdd19Hnd1XGHjAFtMnUEhko9bZlnvTr2jt5jRYVN4yW1/UqDHEA
         SVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784080468; x=1784685268;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsLhDqDBDnNRlsHM/2Tqm5id7aGedP3eAqNDjF1Xv0M=;
        b=XFJSfUEuw+E6Kmvac4QcozNjOdYqrvDVwPrn6F0uGI5ekqYWr2NhJ8As210Hjo6Ygs
         q62pOuTlIJ2N3WFhs+v6qxGfGaxNE+lMgYozo1D/aM6/vDWMnyYNkpRivHR8pmFAjCJV
         LCWwd2JWpdsT9TGmyAnuWOm1DYEnOBGMJHBaQhtnlskktnsfuzaXKU0IbnsCqocLAgjL
         VRlwGIlmS8hoAVcPVXcsnmhDQpZFdrx8/LZVktLQhJsRLj+9e7zWfyE4jnOWT66rYOK7
         Pqxt7DYEsXDoKKX+gAI+I64WMGnNJWS5Bu3Ag5QMofuW0CJTjszvGIIX2t7PUTuAOTAa
         ix8w==
X-Forwarded-Encrypted: i=1; AHgh+RrRD6sjnkj10Fzqkk/DlZKmByJDSzr3Xb4kH3hQr70g0TKGoInkeQSBoMHUEjURndoILd+nC7Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfnolLj96Lz3982XpcPdCJ8FMx6jJs6y9yrg8vMfXj8Q7Fz3Zx
	s1c0AL8zeWO3WTC6I5ByhVykmDSjK+ioHmFuMKOx/p/NmhhtY0F4uyrqHTW2VtCE/YF5s6L3fgs
	phEcjFEn8JAj+xGsf0UAplIGTtYc/QgVVW/y/UL1+vAESaH3e9SLMuZdPljcgBsjT
X-Gm-Gg: AfdE7ckTP1fakZtnfsvIlxwXBpYMWFXhe/rB+IOtyZAHXqEEnciBcBflT3GEvN/baco
	z94bndY4QKVyFfBl7L7+vVwkDNGPfT34uy1/i5zkgYkMrkf629BaQfeOvKFzbHjlQ/XQGpFAP1x
	ukl31XRai24YN2wOGxUQ/u4zu6PlwEB8bLKp3D5iIpqrLnW1xNtr0RS58TGalH18sgGlnNCvW8v
	o9aXSKVCJE5SaWx3CN1dd/J0N5AP0wlN2u7VW9p0jWM4xobXnyT/q26icJR7xioLGFUmyEcPdZR
	yrFITiTEp9h/0pm6DfxuOcEI7BBVZyhDV+HYoT+VBiR+cUhJY+F4dl1fhUFDKPzbCar2zolfZ79
	PTcx5cYIwcUdEulKlH3AhvTDY7rf01y7HHjOMFc0UGAMRpsx8t0AdATmppnZrI5jjq+yV20UlZr
	wGPkDbRVQ=
X-Received: by 2002:a05:6a00:748e:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-84a67241a16mr609290b3a.3.1784080467625;
        Tue, 14 Jul 2026 18:54:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:748e:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-84a67241a16mr609276b3a.3.1784080467092;
        Tue, 14 Jul 2026 18:54:27 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f26d82bsm2345392b3a.14.2026.07.14.18.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 18:54:26 -0700 (PDT)
Message-ID: <23b870da-f913-42f6-84ee-0f675b4498ba@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:54:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Set congestion control max MSDU
 count
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260622062614.760166-1-thiraviyam.mariyappan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622062614.760166-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a56e854 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=APCbmnoeBd6G2hkCapYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8HgjcoOgyKY8hGLBJKoWEaHraWImANW-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAxNiBTYWx0ZWRfX2iMxV1t6h1uX
 tBj2nA1cjelXHjLo+1nBDZFMP9SutV1Of+lzYoOpwx+LBUMfEIvphWmPWwepfdbTVAriYO7jNe1
 vvtKYPQ/O47SpwQA14o7SutcAuGqHdM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAxNiBTYWx0ZWRfX0GfjRRN4y2ax
 yRuINWgTJxyp7afGBIZDy90hibU4OiMsb5+hJT55F2py5ZhhqwPYGmqAfQBNG357TqOW8M6gS1I
 XZHKfPQGdNIPLjBGWu54sihhWb/39HTzHbwruzLSxu/pc7/kPH94tH9EIUQh+0rs29dkgLe0IGJ
 //czI51r+pcKiHYsGMTFhtjAw1y82NtUAbo/FNXtpIa7G2Sl49jmO9sSgalXitSvZInjXDz6dTb
 DtDPg64/7VSMRvz3F5kGlmtqT1Z14KNKipGaRpkq6FV01ms65DU91oIXq43t3ErTNTJBO29qIBY
 X68+mMB5cuEND3IT+NGavM7KJTOmktOWSiC/lPtLYrDY+4whWKgPnIVahPvMlktyTyL379tKIOR
 LSHfYAuI4XzAYCn4RHAjDnnJlFcOHbF5TDqlwJE7u9HKrdcwiRfCaU4TUSE75nenyuQcqwUueGa
 6phmjF92cvPRvUWL2Xw==
X-Proofpoint-GUID: 8HgjcoOgyKY8hGLBJKoWEaHraWImANW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_185429_456917_CC63FEA0 
X-CRM114-Status: GOOD (  10.45  )
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



On 6/22/2026 2:26 PM, Thiraviyam Mariyappan wrote:
> Currently when running 128 clients UDP DL test in 5 GHz HE80 (NSS 2x2),
> firmware uses the default max MSDU count (16K MSDUs). This lower limit
> causes the firmware to compute a smaller TQM drop threshold, aggregate
> packets at a reduced rate, and results in increased packet drops with
> TQM drop threshold as the completion reason.
> 
> To fix this issue, set WMI_PDEV_PARAM_SET_CONG_CTRL_MAX_MSDUS to the TX
> descriptor count using ath12k_wmi_pdev_set_param(). This increases the
> TQM drop threshold, reduces drop events, and improves throughput from
> ~722 Mbps to ~1060 Mbps with 1200 Mbps ingress.
> 
> Add a new HW capability flag (supports_cong_ctrl_max_msdus) and enable
> the WMI parameter only on supported platforms.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


