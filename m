Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E96FD3762
	for <ath12k@archiver.kernel.org>; Wed, 25 Feb 2026 14:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqQ3ayJ2d8gZzfwZpLATgNYy1XPgI1m/wWKy2F5sGWw=; b=uV1BY3s0z0LY95CeKVWmNBNwlP
	Zjp3wXrFT3OIbc4xuRPPJPobKwJjAxxRS0Q7fGGNs2c4ZPts9ddxX7x0E13GtoHxx3wzxnVm3t6iE
	onE4JLIJKnTE/RbqJ6Z6Tw4VzIXXI/VnsB+Q3Pc/9Y3F4vNOztjYCC+kiGohVMyYrZObqLEmmDHXS
	4iiGXFSRoShNAJgP9q4Vrwby/mG0emtFA1vRxVkO7P3ypSzHGMpEDmrhIywAkjmjVeul6K17zpLoW
	0DEfC5282lQbj8X2jtWadU8mQbQVzZLsMRS/cHiwlVwZOFEQT99SXQ8YVSnUXA9sXup8R9MWKAjrn
	CWnslVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFzO-00000004Dby-43s9;
	Wed, 25 Feb 2026 14:35:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFzM-00000004Dbg-3osp
	for ath12k@lists.infradead.org;
	Wed, 25 Feb 2026 14:35:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9Sup62127846
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 14:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqQ3ayJ2d8gZzfwZpLATgNYy1XPgI1m/wWKy2F5sGWw=; b=AqNt63yIFdzh7W+c
	ZOZC90xpoL93QXyOtvU/QjoVTQezyW9sdr2C/z01vKNx3oPGg5Q7fZNDi7TI57r+
	RqI4YWNlU2W16u9a//TGIIMTdgiHCE31bhAptSV40k3lW9BBaYnZ+6DaPNRtgRTv
	z3cWQLV/gWGLpvzvCqFuoKAv9SthmmoyKAqlHkW1n/kJ9hW+y3aL10hnVAEJMMGr
	GMN2C9EsLq4hiOlA5ojQE2dlaoUx+AQa5UPJCceBPyEBESY8Ect491/fzU+uyKS1
	vckEy5hiZPNvZQSKevKJT1V4eQbt4bTSCqQBkPKynBMVpnwFV3zgKkh/SRdrWw22
	oACUQQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chexeksp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 14:35:42 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d18fa0728aso72460318a34.0
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772030142; x=1772634942; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqQ3ayJ2d8gZzfwZpLATgNYy1XPgI1m/wWKy2F5sGWw=;
        b=RIyePT5PSedtsvheTm1GQlTfaEmCGgPYfYo8CyNN5SwJkdwBRLzJ+G1lHS+FXWUtZa
         6xdC3ySQkNss4OgyebLb06B8gFskJGkUW7tWMRUUvm+7W67lB18Um/UIfPElhPeUQLFc
         pqa0EHMx8QVOJIxVBlfj/Qi88qGyvjLy8QSJrcMTEwV7zE00gEZmsqXRi6hj1HsHmmHc
         tNiEjX1LbbYZqxlPSQRgzZ9zCjQC+RGNMYcVLoOk5Lj2jD8aAYayStjcrgfXQEyfs+2q
         pJuTNjOcDin4PUyhN+TaX1OzqQyCPt0YJWaf/Vg90XdSL7dgT+KFVqJd2HxuTBYo4kRY
         cciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030142; x=1772634942;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqQ3ayJ2d8gZzfwZpLATgNYy1XPgI1m/wWKy2F5sGWw=;
        b=cI7f5juzIQHi9U4GduB0/F37vh0mlR/tlAC6GN32HW9CgM/S1Fd0D9srCm9F0arfRW
         UCzgo5nz4lyAr2g1Fk0mV1F7C5feKCiA3+lJPA75JVg1Ki2FAVfLF1Fmipgpj3ZQ0Rp6
         ob9FO/41G1t+rnuccp5JJX0KAxpsStB/tKtmTy3AEyan+FySzJRVjc8eBaZGP8qEM9Lj
         S0eIBhXVfRDpAUc9F/zLM645I5OdfyBwYzngQYZ+fpwLrlqtvTfJY9n02F2bJw21WOmG
         l1m31bPjVihZen/dlTfQnETQrK090NR/UrqPzQGz9wcGJecg4pb8dpM4UawKFGXP8f/Q
         PgvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpuVnr5LijJjlCFAaDSar/lInUXWX5qStyG+yxccO9SbD1lpGUqSVy6AWeEsgAINo/KB0WlyI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yws23zHVBxzhQTp3oLMWWzTdf5Amx9HtbBBVAsYYxTEO1k5oklZ
	GG3jRnIyoFwOGCJOu95w3lxSUqDvkB6ITyhmTDQVHwAQWLC9zazMsYWJxHRkxST+BJQuDG1cGyf
	2uy9HJmomRjV7iUmuCe91D0wZepaAEVeuPzFVBvNOYlYbKdNoaHxmtTcbsFoK5H+R
X-Gm-Gg: ATEYQzx8VJmhLQg5ylfFJLzxDO6A8Jm8oxrE0CDXsXfPM0ggqNt3Lp9kaHc2Hzukk7I
	dEGHNTvdoCbmctCmxeF65rJl4kh049sxZ+RU2NAWn7nPljRvjKsPAnGDgRFRrl66XLBv5KG+P9k
	aYWAcQ/fNV25CP+I8n/qoCOmtbfSTiaZevfhuuEPxV/ZfgRZ1n+vC4u5mzpYpWYSC1BBbtplC/G
	UUffiigIhBkUj+W5f01PEsEOuBlaC8Yz96fLLCGj04ICww4mkXB0sU5Cc5rD29FSmCrYkJshwvi
	WaRmkUiEzwH7HiWJAOUA2Q7b6SORu5t5CuJlcMHKv3SbAOAUbJfONKhS83rfhTfz2Ar4BUQ4jqz
	nqEC0fgKMg2JMetRQ6PcrvmtWNV3FpEhy5mfLggjy0dmk2BC4F8HB0im8kpFKDFiu1fuZ7PUc/Y
	271H1h0w==
X-Received: by 2002:a05:6830:6c13:b0:7c7:64b7:83e2 with SMTP id 46e09a7af769-7d582a9831dmr300811a34.31.1772030142387;
        Wed, 25 Feb 2026 06:35:42 -0800 (PST)
X-Received: by 2002:a05:6830:6c13:b0:7c7:64b7:83e2 with SMTP id 46e09a7af769-7d582a9831dmr300792a34.31.1772030142071;
        Wed, 25 Feb 2026 06:35:42 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf78736sm13467883a34.5.2026.02.25.06.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:35:41 -0800 (PST)
Message-ID: <6c0b6eaf-c925-4b02-87af-b3a7f3757025@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 06:35:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: add basic hwmon temperature
 reporting
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
References: <20260223132622.43464-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260223132622.43464-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzOSBTYWx0ZWRfX6jjOHm5z9cdg
 HndRQCtSIqv5qzg46PmIN01OWPcGePuq+5NUZP7s4ptdFHOTAOS03Bfmb9bkl7xINbdl77puQMj
 EQU5kONf44i8cVjhsSr6yDyP//JBneNFVo84MjgGLaHNTG4X7540dfkqMPo+WSDJzp/QQOUdaY1
 5ePxGgl4XzW0/D2ZjMu6CjmRrtSmgbPrzXqaK2Br9wtB75ApzfW+N08ygB0pxni/6bHfPnXvKdU
 IWN65S2rvtADHgY4YYE3zaxNjgAR8JXFdETXJYgFCJ0nj6slGeI7Cjq15Hwl+1O9gaIDUqU2kKi
 D965Y6xosTu0S4oNKQdDad/zhO5XVrQ0luG/jM2yMEzbqbO0OsxzHEGPYZoUiGuE165T1fXP1dY
 yY6+jEZqUnhtpGOj6A3OxuyZ7Uj+JCQiF631Zz6vRGDm/pEMFRxZHmNm4FPnCrC9e6yqyp+VN94
 eOPQplSh2yYYIbEokOw==
X-Authority-Analysis: v=2.4 cv=V85wEOni c=1 sm=1 tr=0 ts=699f08be cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=TIRtq7bqiOsBIkxYvl4A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: UmbzupOs-Hh0OXjwWDxHNaY_AFSK5zO8
X-Proofpoint-ORIG-GUID: UmbzupOs-Hh0OXjwWDxHNaY_AFSK5zO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_063545_070400_C7226D1B 
X-CRM114-Status: UNSURE (   7.33  )
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

On 2/23/2026 5:26 AM, Maharaja Kennadyrajan wrote:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602160145.YQdvbqYY-lkp@intel.com/

I'm dropping these tags. In the future please make sure to follow the
instructions provided by the bot:

	If you fix the issue in a separate patch/commit (i.e. not just a new version of
	the same patch/commit), kindly add following tags
	| Reported-by: kernel test robot <lkp@intel.com>
	| Closes: https://lore.kernel.org/oe-kbuild-all/202602160145.YQdvbqYY-lkp@intel.com/

/jeff




