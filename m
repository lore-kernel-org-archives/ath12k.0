Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D5FCCF9E9
	for <ath12k@archiver.kernel.org>; Wed, 29 Oct 2025 09:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWi24kAJejrPENad76Qq2UdryfCSFDydt8kyu/N4BqY=; b=ETHICNuupdlOCvn1+wmT0JRA+W
	oYnI73UACnT33egcaf4Z9Z4MXpkFnwwMxDwILgPn4OCKCcqrWavD3c7j+6we5bL2SqPvopCFMzuYz
	ifhN69FRHcO2UxOjgGPGTqgwYIHrDvJtgjvDGk92GZbNo3M4x9NDcAbRRA+UPFlNZon35mWGsMWfu
	NGM/AMxfbnKaItS8X9DSLG3cdNrkbYJ6Lpn4JvErRI3wGjGeRvfsxmYtkZxKvWkGKoF0YF9hiLIwb
	TweLUhIkgZNDr1+kK6u+q58Mck/sx+DaGieeCCpRlcE6cphbrcLYO7Q+HezLUhVI0cJGnHypmOH3V
	FlrJIZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2Y8-00000000VZc-1QVc;
	Wed, 29 Oct 2025 09:33:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2Y6-00000000VZ2-2YXd
	for ath12k@lists.infradead.org;
	Wed, 29 Oct 2025 09:32:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uoZF3720134
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 09:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWi24kAJejrPENad76Qq2UdryfCSFDydt8kyu/N4BqY=; b=Izo+03bpwNgirYPT
	koLcdRD7HsnGn2kk6xass8gkF6HfaCNJIQ9WKY+8JjMFdO4Z8xREAajxtQo2XCwB
	Nr1H6ZZVUymIJBLeJpuBOYctmKN6CcxrzXkoj8EL7Jb0SheBcWSTSxjuQ2whoGck
	XXc67IYKwPEG45/SpXohrGUk4puvvIhpuBON10KgHl1WUb7W6QnJ/w86aswRnwp6
	nIEn/sTLCZz1NaIeNXZUR4CABI4cctD/bg3dOhBREmhtAPytOWLhjOVfWRaA5MR+
	uA2le8poOfDOJOeKW7EDQxRy+Cz2cRTfoKGY1VnNx1H5sxivy7xHDkAiLuRnXUoI
	w8c/dQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a221je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 09:32:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so11293638a91.1
        for <ath12k@lists.infradead.org>; Wed, 29 Oct 2025 02:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761730377; x=1762335177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWi24kAJejrPENad76Qq2UdryfCSFDydt8kyu/N4BqY=;
        b=VJtJHWRjQt9zwu3m9ucbXMEHuIAIc92VVTwugQC6x+9PEfNXQSluiKIjqRG1epQf5E
         2FaE/nsES1BJrvuEaTlyB+OfSsL46qp4g9SnH6MnPa8ZmOjVEmE4uAbo/o4xQnbDH3dM
         PATZtuuUH793BwbP3yHmdq0U/DUNYNH2gQ1F1OaVwz/1lLJsrtT2SSsrNdPGblw8k3Af
         8NiN6gfZrZQn9fDmAD5fvjJO9FVu53Rh/KPxL/xpAd6nIpDQwYfiIQi/+nzuv6kcFJ1k
         7Nca//z31dF6duncQQxS8eB56+X6JvugMkR01ANUMJpWk1trL6OFEWqesDseVFI6d39v
         WcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730377; x=1762335177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWi24kAJejrPENad76Qq2UdryfCSFDydt8kyu/N4BqY=;
        b=VzX+9mvUD8tmYeKeqjSPFiAfTl+sGbjvGYKD1w8QNabSCVsMYvqXR99SW9/8S/53KL
         HybrJl1R303pXiV6SroNGIGw6VGwsHE4DoYFLKg0ZArsNqOIKzWd2SAdLemMIT8NX87d
         vT8aZc2pZAq3ZjA5beCK+wa7jfRHlvelmqymOyTZsVxD/B/HMDtYba0iuXfqY7c13abf
         Hk2ccbWsgIZbXUMRjthBDOfjfoUWsv3S4LBD2I1+lhB/Qt00+JcnscgfEW05SjzxZ5py
         J8vvRUuNVNfGsR+hBDr5imRPrY2h55HkQrfqBBgTtpnJczipfP+sf5RWgJaFQIbJPfq5
         VeJg==
X-Forwarded-Encrypted: i=1; AJvYcCUAXbTme4ed7ZFfthE273FAoASzBpXYKdT9QIgq+vnODjMNU5QOJA6yytVNdswxDeZFunGqo/s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr/zTnsjkaKZ41NqiCb8+WJos6HlvlNL5U5YEEK1jL9CBXoTE6
	9qYf/sZLPYGNc/KzLkfVZir+1LEO3nScaV1WaJLZs2u1+gMt2CDVaHPYLcPEiughXu6IJr74Pjw
	eic4oNuxBH77veu+WxN8DUtnX3QHA7vXLtnRZO4E5M69f07BrNtDtZxnwDaLk5ZjU+DYXovsN
X-Gm-Gg: ASbGncsmu3Wwx7gMxjfOGbht61mnHb0FHnYjSNOPQ4UieUrLUvpapdry5UKJFmMEY4A
	iTGwjdU5ejpVMgWkJDarTEQpD8nHrkNvw3/ox1E7MdmFAWyH1i8ZbyVeBlq+e4HhtKQTfExqZWo
	qIwJLFMWqhOMzY8N5MRO05QMq9QSJIpR4ju7ZHo6VStno+mNAr5PMhdqOKjFTdUGZomPhlSscaS
	d5qOV2lOwJEnEjnYX5pxxmrhrBulrMWGIphEKxpLamPq0bgo5ilnjb6DUd1qSXf5w4I7Y/AkTqt
	YhlbnUjoT4MnkBPka9XsPK9FkUNrcuRwT52VSRlJeSdAImUqVjmSFebW7GtSbTglDj7DnY5WZqb
	Om+vgDRvR0C7d2XaXhA48vcZ1qAuqYZUrX5vgHSZSnePj
X-Received: by 2002:a17:90b:1d46:b0:340:29be:8afe with SMTP id 98e67ed59e1d1-3403a2a211cmr2590095a91.33.1761730376858;
        Wed, 29 Oct 2025 02:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT9rcn3NNg/VsimPAfxmXnqtN4k004t5UmNePulLNNW92ejPqrq14iwU13N8IYS0m1DaSM1w==
X-Received: by 2002:a17:90b:1d46:b0:340:29be:8afe with SMTP id 98e67ed59e1d1-3403a2a211cmr2590067a91.33.1761730376362;
        Wed, 29 Oct 2025 02:32:56 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d27b2sm15042316a91.4.2025.10.29.02.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:32:56 -0700 (PDT)
Message-ID: <1b7ea1a1-b1ce-b50d-c141-d9865b0d0175@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 15:02:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next] wifi: ath12k: fix reusing m3 memory
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20251029-ath12k-fix-m3-reuse-v1-1-69225bacfc5d@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251029-ath12k-fix-m3-reuse-v1-1-69225bacfc5d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MSBTYWx0ZWRfX226QP/61bTGW
 iKgZy4QrOt0B9OxNTPBJXZmImoozueacZWdUN5OL8NDVen2uvLjK1Y3JfO5VnXLX0eV8Iwk9O2R
 Md0Kq7w4Ch85bQoq9ereDZs6NUNC6+cYRAz8BuYYnHwufPabHT4LJrsZGGSPP2vpOHp29Nx1dZZ
 ajCfqDssa8B9e4dEzm5uOp/t20mgULk2fzDhcfIDEeEXuf4V9c+fWLiVO9oeUbcjW/+HE2eh1c9
 O9MvisTgo21cVhWXl5LIy9N7X2oB+2d7nSD5Ie6WGOidzyP5YpdGghMI/HZMFw5cwdaIKdaoe7P
 8RH1q2A6NZR2FluRkIQmfKEtY9rQmQFtc2VD1gI18gPUyTT9zZzHG3C+G90ItVgNyJ1j01AcZtX
 3I/3lnwpHoELL+MxbAagOu/hCtfiqw==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901df49 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y1qFtuX8SmuMirZhVQkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SEzElEvHAeXO5IIEFW6f_2qgf1E6Og9V
X-Proofpoint-ORIG-GUID: SEzElEvHAeXO5IIEFW6f_2qgf1E6Og9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_023258_654765_2022B54C 
X-CRM114-Status: GOOD (  12.32  )
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



On 10/29/2025 7:37 AM, Baochen Qiang wrote:
> During firmware recovery or suspend/resume, m3 memory could be reused if
> the size of the new m3 binary is equal to or less than that of the
> existing memory. There will be issues for the latter case, since
> m3_mem->size will be updated with a smaller value and this value is
> eventually used in the free path, where the original total size should be
> used instead.
> 
> To fix it, add a new member in m3_mem_region structure to track the original
> memory size and use it in free path.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 05090ae82f44 ("wifi: ath12k: check M3 buffer size as well whey trying to reuse it")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

