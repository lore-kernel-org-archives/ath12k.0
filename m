Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB104C88E41
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 03:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gs2bMOBg33skx8G/omcMjpU/uFdHwlt6fJoehkBMeCM=; b=nuBEQQ4OhHT6RYU2LfjTVbyPib
	zPraHO83TX78X/E1IYNCXjqxAPVeYvPe7WB0FTZ+ydF1wTcMUALsJncv566wEVyts/SnprQqeTD7K
	1AZQSA0vYLCHD8cPx0o1aVYE7OCkNH6Jy5D0o8SSx4QUidBjb6ESuFaAxHzXUvnIDrDPNSjTlGx9f
	S3pOwcRYXA+uCk0cOpGpBJhmTskxPQT/vYyHhQ5xorajWCr3DMaqO0ZEhG3qOv+NfRjefrjx0smP0
	YyO3fG99CwmMo1yH73SHBiIr+Z85hyg4pj1ThhO1ZPyJ+cf76hmY1HxAhA+JkfYeySZPANY3upYE2
	eg2DXitg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDRL-0000000BqmR-1l4c;
	Mon, 26 Jan 2026 03:38:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDRI-0000000Bqlw-3ZND
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 03:38:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLQvtU557042
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 03:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gs2bMOBg33skx8G/omcMjpU/uFdHwlt6fJoehkBMeCM=; b=dol5k7WeOvSttY+9
	pe4ZdYdESuAuWGgy9W25sVSEAfMJ4mfLXllJ4qZXqalaawU3BLUxB9E4WJVHd81s
	zl0QbgWZQdkfdS6LjI4imQoDnL/gm8xrnpRMYGuVj3coi3cD9gxKJ5ZAHUdRCfDO
	oNNOY4tB4i1SeRj8drDOvpZIyoBMQ5xzGHU/bUm25M1piuMm2D1pQTSCnxnBoKBi
	J5xVXhz1qKBIApbB5rMpluHeDHgl0ioOr9wnal5F7t+yJseJGTqpIOo0dR2tdQUf
	Nmb+u6w/9jzaBBO584RmxIo0ITGbpmeMLn5HJ0FvDY6qfiFfFSee2paIrA78JivW
	TGDMXA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9fuaty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 03:38:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso11701154a12.2
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 19:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769398735; x=1770003535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gs2bMOBg33skx8G/omcMjpU/uFdHwlt6fJoehkBMeCM=;
        b=OnYNmkN6/rBUnVYXTU28o9sdDjA3n01q9rbnp8AXNvWEavTfHUFyDCViOgu72Nwg6p
         K0JYQl93G+RDFSpUxLL4yUUb/Xf5L437+9CRg8H+V64EQOzzaLnudkPUNHLTbGbPFbsc
         S7IAr2rVP5q8RoLbU4WCDzRCFtUjqL1rdhRLjgrBqSZtvqeL6MQmLn4dCJ2r0f70daQ9
         T4EzzRtA99Fv3+gU9YCVFmffK6ysFKMYivfSVafp5kMwRR+G6lzw/wSuaE6ZJYbfTvtr
         etIk/DcIqgq9FYODcgPJmLU80XO4OEed5Ukr3of3h4oUC6AsCecfU3zEj7HU2zi/co0x
         PrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769398735; x=1770003535;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gs2bMOBg33skx8G/omcMjpU/uFdHwlt6fJoehkBMeCM=;
        b=MYz9eV7uWgjxWwNaIVHE7HlyBJq7yXcjQ6eXTRDfpac3yeQDYDVTt/TiwbQzIEXrs6
         OEswNU891b2aEYR/58k3C3+Je61hCuM2kIHJZT4ULD7/LIoc67KZqCYGze6VWYeMk9Dp
         /6kJZqicjiZqmHKxTqXlhmbQqoadTqHd4cs3U9FnL8a+ie6Nr9vOSqkkHeP5tC1D8oo8
         48NEW9nZhOq8dJTTrtAaPFGiEo9mma7bbbfLx9q2giTbuKskzFFLlL+qZNOKiih19xuI
         kzD9g0Wl+3xfJ67rbxU1iO6WZ2Vcj5ZbLzBJt4GLWCpTp+PQH0LHkSNfOtFQcRfGVaIS
         7pPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf19ysXEPRjVYPNdHZrLkoga/IAe7gFEA5WhN+0JwSfTkDKa7/YZSDhIBBDl+4Kij5uMIbG6c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2IXKyT69yf1LTFwxTebBMzBdx2VKgmSgUtmxOAR086RofTUsI
	FwbiTJRQi8jPF/U1JcebjBk16GuAoa+wQHdbvAyJqL3CybO2VDzzvfBv79RI/ZGymWO0uzsZwub
	LZW/+jIK7mAt59zphQyXmShzVj1Gs7DuCpEXbNSUJVUgT3Ma7Hn1z9X/mHEk1N66W
X-Gm-Gg: AZuq6aKgIedWbBp7US7vHeyAsSo5AjD+Ird0JrdRCDFbSIQuznMam/EdUKLhwgLnMWA
	lM9DFV7HZfIKGqUaCqQV38LmDnD2Km8jRaLXgrywIMMajG2t9/vdpx5xbD1YoaH8d15Rcut0kpb
	pHp4/jAbsn6Ycxvw+OA1HsUN68/HQaIbw0ZpQlnUgdrKWB5LI9QciaEcthmYfFAl2TTJnTXYONe
	P8iLM6oiSdrlNNuRAcgI2XoUuyHiOtPDoHegTyLYQ0Ai7ZzwBsX0EByX0LgsAF2+kvEsWKqOCkg
	pw1aRzZ5eb7L7tj69u+Qfj5FdHxMAErs54HKT5iKx/XpcNkO1LmIEYDTF+jUrlAHqIdbnnAcZ0z
	t3gwTN6QfmlDO6UTa7Qo0Mdxgb3aHysumekR27K5zLjtckv9uGbgf83+eCk7Ca3U85AhY49Nryx
	dAXFGO1i4=
X-Received: by 2002:a05:6a21:9082:b0:366:14ac:e1fc with SMTP id adf61e73a8af0-38e9f30bf00mr3173746637.78.1769398735312;
        Sun, 25 Jan 2026 19:38:55 -0800 (PST)
X-Received: by 2002:a05:6a21:9082:b0:366:14ac:e1fc with SMTP id adf61e73a8af0-38e9f30bf00mr3173731637.78.1769398734862;
        Sun, 25 Jan 2026 19:38:54 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536d88bd00sm7449444a91.2.2026.01.25.19.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 19:38:54 -0800 (PST)
Message-ID: <23eef2f9-51da-4136-af54-d48e0d652c2e@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:38:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix invalid frequency error in freq_to_idx
To: Saikiran <bjsaikiran@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
 <20260123155750.6007-6-bjsaikiran@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123155750.6007-6-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ZYOkDjS-hCceqjJqmqa-5CZJCKuZmiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAyOSBTYWx0ZWRfX7d69RfoW/bg4
 /1eX71ryGUacZl4Op/qd5D6lYvVg3Cug+fPTIjiqp7/+1R1UPHavepG05LIQJX8IvzPC0LZbOBU
 gKgvFITxUksYkp7gZAXceRq+Nk9BX57FupKA6gnNsO7Wm8r5D9yOHAB612Kq1fnVvC0eIYOEGYx
 2EwIfQiF3ux2gLI8bjjpjuAtRtaEMJeyfc7+S4DUA3cPd6yJMoyDbRcnG7/3QyKJ7VSo/dgclFi
 ESAuk93TSnMHfTgHU4oIEfNR3hp8EwXUzdDxvsVtMFDCIOQJ/URW0yz1aNjZSl89DLQj8f3da3K
 6G93duAdxmZK24r+DQdgLNKELZvPFYUYfvt9HEQQ56kME5v93zDxhAQKSc2j++bLxQxCQyTea+n
 rF+R+gU/oDtJBuA2djdmMMd/4bSjliXKKfSxJrQlypd7C0MKZZHxYFLZJ1wfpDycA4k+GeTmDo7
 mwi9T/PC9hXGar2N5HA==
X-Authority-Analysis: v=2.4 cv=btlBxUai c=1 sm=1 tr=0 ts=6976e1d0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=_REAg2KUEwIIqUTL4GEA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 4ZYOkDjS-hCceqjJqmqa-5CZJCKuZmiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_193856_896196_C032E162 
X-CRM114-Status: GOOD (  20.43  )
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



On 1/23/2026 11:57 PM, Saikiran wrote:
> During suspend/resume, the following error is observed in dmesg:
>   ath12k_pci 0004:01:00.0: chan info: invalid frequency <freq> (idx 101 out of bounds)
> 
> This occurs because freq_to_idx() incorrectly filters channels based on
> ar->freq_range.start_freq and ar->freq_range.end_freq. These values can be
> temporarily zeroed out (e.g., during regulatory updates or suspend/resume
> sequences) while the hardware is still operational or reporting status.
> 
> When these values are zero, the filter skips all valid channels, causing
> the function to return the total channel count (e.g. 101) instead of the
> actual index, triggering the out-of-bounds warning.
> 
> Remove the broken frequency range filtering from freq_to_idx(). Channel
> mapping should depend only on the hardware band definition, not on the
> transient regulatory frequency range. This mirrors the fix recently applied
> to ath12k_reg_update_chan_list().
> 
> Tested-on: Lenovo Yoga Slim 7x
> 
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index be8b2943094f..bef1b324b62c 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -6576,11 +6576,7 @@ static int freq_to_idx(struct ath12k *ar, int freq)
>  			continue;
>  
>  		for (ch = 0; ch < sband->n_channels; ch++, idx++) {
> -			if (sband->channels[ch].center_freq <
> -			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> -			    sband->channels[ch].center_freq >
> -			    KHZ_TO_MHZ(ar->freq_range.end_freq))
> -				continue;
> +
>  
>  			if (sband->channels[ch].center_freq == freq)
>  				goto exit;


this has been fixed upstream, though for a different issue.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1fed08c5519d2f929457f354d3c06c6a8c33829c

