Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDD9CA5FA1
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 02:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OU2a1AVipIhoZQb6GLRTapvpusNfuh9B13CGCk9KrWY=; b=2+/aDJVcXnTDF6121WuOjxU7XK
	9NJASFMshbVclHCO/F1F57rPqvFefKGmNLoabwcMzTu9mr4nMXBA7AhlzFbv74zPR6oxNaqxnFvUC
	lFecXZLV4t8JiHe82Yad0LzI73rUCtrpCkOWBK+R19tMBE84oVJ1vz1+560EqPpHX2rG+jP7fPweZ
	PYYLbaNG0JS4KIy4LUQjD19bAcKqPS4Osk1K22S88YVcn0rgsvGJ14nmx4+xZjprZFFWBuMA96Q8K
	DLqGnogPdHtt/WZ8OUiGNwvV7D0Il7OyjOAOk3GSic0j7yLFZBUh23aXDllNuovwSmmmaduC3U1wg
	6OayV46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNhP-000000028a6-0QYe;
	Tue, 29 Sep 2026 02:36:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNhM-000000028ZK-1KnB
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 02:36:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T1BWpA3278799
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 02:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OU2a1AVipIhoZQb6GLRTapvpusNfuh9B13CGCk9KrWY=; b=c0bOJ0r88lZFhPWv
	MLiRK3z2GoqJWK3Po+4zFzM9an5A4j2W6zbNzgKVqngI/TfDvjjX4A9GOii6ybcv
	/wbRXZvAU5PHhhPoPqc8K7V8zDRYl9I5IrK7RuzjIe54KHRwZjnA0vdcdSgJgiE+
	ykWvgHmUYOXZnyfHsK+puRpgBCVErWOFH1uVa/50RxZIXpTl+Q3Ge6AujszeG+qC
	ZjDo/4dEMz699kq1aXYLp8cvk1f1zeU5ZqCVlEk2ATyWcZUo9qW3hb8Vlz3840Id
	Vn1f5a/KhwSlyfoV1NZ4daAyl5KSSTcAsFWd2KDbbv8vYXu1WHnPpoy9rUKB+Zhv
	HIVLUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew07sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 02:36:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6498085a91.1
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 19:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790649362; x=1791254162; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OU2a1AVipIhoZQb6GLRTapvpusNfuh9B13CGCk9KrWY=;
        b=O76MwmB96q/Tx0xF6+48EIjJqqDbGMW+i9HJUUZXOVZ+a/liMydiWHvivfVnGiyaB/
         nbKD8A3JdYmVliY6vgtRm0w+NDMLnk0PyzvO30RlBG1R4PdloQQZ8bnX3GRQ/LNE7s3K
         hDH6A/1Vua9aZ7rIOzsQTmRQXjPIMDd5FGzjHE554wlZxlmX3pXvqq5+vrSgL409tevc
         SG7wDBpppY4vaFLWDWZalCFV+xNXHMm+G3USz+ZnRSkBYChn9KYWwcx89k2sr++fCk+4
         +OZSg9KmP87okmeBncLScOqx9cYjPYf57r1OtfR5gUFbmtgumbT+Fl2mv0eP+Pv42VYz
         CX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790649362; x=1791254162;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OU2a1AVipIhoZQb6GLRTapvpusNfuh9B13CGCk9KrWY=;
        b=DTFt2JhfMZEPc+zsyvN2AFbAPj7e+EiskfKVwDejFdJkrZBvcUnwn7G/8E4KDe/S+3
         72H49C0utCY5zq06k49aMBehYe7cbdpB2XgoN/hIFNW8NsaIoBw7MkhxhTXiyVO9juzv
         MsZSgkI6LowL/iNmnqeO3dzbKqTb2RNZyOiLgeZfQ46sRcm5wGZc6D4tbmlFMHZYlv8/
         3ZP71hsHG33Z4tFD8jrrXyl0FLt60bvqywAKg+5AbbPiOJo33loe2jHHR9ya6lDiIp2l
         65cKxC3nSTwThOGKV4bPIPKqGq971cSykozL84cQKm9scBnwg6gb/UZ+8t6Ej1HRYBN5
         Zl7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwoTakfrlPU+7Qz8P2XETSjskbMVaAJTGW6Crso7UNRoYWsNCfCU8QPMv3YVNOgYOVAuGtXLEs=@lists.infradead.org
X-Gm-Message-State: AFq9FYIrF3TJ2Z3q5JOirn3Eeezo21zHxRGX+dr1BIue+FLcUrrDkZ76
	iqgUu7NoHtYesglexoY4Kz6Mmu2gjZu0RwM+3pxwqzjrTFgXvtkMV1IvNOV3PkMBQmD9LHntgvH
	2s3wUFfFgrXDp8ENtIC8wvOOrnCRAF7HjjroWg2tboVrXreLRhI52lsa8b0NnP1vY
X-Gm-Gg: AYBFou2Zt3OGKYxoIJoKZL3Wqh0cPFzplgaBxiBLXqHhgy9WOi13rd9CnvsQXSrDzUR
	4bn++ryGlaD+2sZdugo4ndaHlx+MlOufR8JqX9HxgOWTkuIXqBWKyfxdBl7Nb1gHP3+XS8fD5GU
	3TgMlJl0h8Nt4tF5cKUn8+6itrK/ZGnaygm7x2Jdr7zpwJgKCX8pSYmPxd94sCYAtRuUc+Ln48W
	0Iena5HkAVSe1IvC8MJ0gnCpVm8Dog/yl0UFHa+ynSsnsl+/M/j8CUvA2z3BXCK4JMZRl1jofi2
	/cXAZ+SpDM1kjbsAturY+vG+UpNdpWwBf2VBbIapcTLwGcGI3WvKILwc8ijYVmXRmP83/Hpf78T
	qo9iGruUEY6F0LYC9O6YTs4OfmyhjH/Xl496iFqSb2ytNfUJnHILKQhzaxseKzKnevtm8IhU=
X-Received: by 2002:a17:90b:2645:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a098e05151mr12783753a91.48.1790649362161;
        Mon, 28 Sep 2026 19:36:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2645:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3a098e05151mr12783739a91.48.1790649361707;
        Mon, 28 Sep 2026 19:36:01 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492da42a3sm1456652a91.2.2026.09.28.19.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 19:36:01 -0700 (PDT)
Message-ID: <0f66a04f-18e0-488e-b6d5-aedead2f82eb@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:35:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-3-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfX4fSXRIV6xci+
 yvOCPn9LaIMBBhA6KQjSbGlmBtrSlH7cAZoVlxg+2s+9kTofSm+8ukIHoYvkB03I7PF82aPGIEn
 rBhvIZ+KmyO7He9Vx6ZPzlFKs+nIHog=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb2413 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=JhsGp5YEgYEiw4z---oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMCBTYWx0ZWRfX5xx/QxT1D7ZK
 GvEazGfdkSA2Fr2Z2eef4CwNBjRLiwQLMlBRtg98GKE+t1pNzsVmJXJ5Zb1X0YG9F/cflvkDLmZ
 EibBfnOdipGoD+ZEewyHfZPv8Wuxs/aWVUwkHUoRosrVMLDpEUtrpUu3991Qp230sj5ZhaXSmbm
 Nn6dFVhRBTn2/Lrh2FuotH7nKBCxfBWuZSH5cBOI7R3J6JmYJDivapNwCX1SW0KfySVv6RCXH11
 rZ1xF23CdpVKJEG7OT0unw/Qmnm4eQYkdDfE0Xhy1EnIGcGZl02DpuhCye1Ap9zC7MH62UctVNn
 CWaCwS1fRdxvDFIt70ogsHNlRqX/l99x1rj+cP5JuxFEjuSCGAzCpR74aZVsRbEJa+tuDiuY6wt
 5CKopq0eziSeKiPPVxKUkcWJhlpRSjm+s83k35FZrGKhGhr7OHCs2ByE/nSPzFsiLsWofdbfJUZ
 7hxQtbLbIoVu9YW4FZg==
X-Proofpoint-GUID: E50EevSwK6R5umW4R0RxR9gpfgNj3wOm
X-Proofpoint-ORIG-GUID: E50EevSwK6R5umW4R0RxR9gpfgNj3wOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_193604_493157_904F3C40 
X-CRM114-Status: GOOD (  16.27  )
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



On 9/26/2026 8:12 PM, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index b772181a496e..f84f1828275a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -6190,7 +6190,7 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
>  	const int size = 32;
>  	int num_args;
>  
> -	if (count > size)
> +	if (count >= size)
>  		return -EINVAL;
>  
>  	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


