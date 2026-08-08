Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8A1C55174
	for <ath12k@archiver.kernel.org>; Sat,  8 Aug 2026 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9CE3xwkshxnXLN8j/UUUlWXuJY96hDqpREDnP5IHL8=; b=u/7wv6Wu/azda9CpF6VW+2fZ+o
	ItFA+nS/fzs++VrZ2Lf00SYSxidP/SJBox5ZFfi9Yi7dVicmBevxPTGk0Yv8v4hFkF0On0+PmKYDb
	6PcQCDmiuX9OAg4BHW6X0ufxuLTw/oa0EAW6uTZMyBHYy9huVvWg0GizvfczOmqOEGUO4/hK2YVIG
	guAmKITSvGYtLmmZElEqYgX4z8ZQMEhTIQKFrbbmuOwiDvrxqofb004hRau0/f+/pmqyameVO0BrV
	G1RBx0cpE1Xsk/EKlpge9xOaRwVq1SfylFPeVfGpB6AnPzth+/kH09RMV8zfC+xQux8iCdiV7JM/b
	o2pkXd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiwB-00000009UdC-0vs4;
	Sat, 08 Aug 2026 15:26:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsiw9-00000009Ucr-2R77
	for ath12k@lists.infradead.org;
	Sat, 08 Aug 2026 15:26:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678DbgIt275057
	for <ath12k@lists.infradead.org>; Sat, 8 Aug 2026 15:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9CE3xwkshxnXLN8j/UUUlWXuJY96hDqpREDnP5IHL8=; b=Z+KXoaS3eQiQxIyn
	ePjEL2lTj3zwQ8au5S/WHjSIlSHl8p9rf8o3YOohKOGVWDa9mZ1/UfgXqOaOf/RM
	F9db/dShGza/JA514S4LOfin7Lr5kJYOKBLZ6BQ5yEFUteLwmMe5idzvVoo+8jZP
	tlTlg7BbPdfKNdyltxRBDorNtXjZuWdbs1N8Pk+ehnKG86vnCoRVGplCHeh6Jq8P
	ZTYPgUsNukHZv9xj3c/z8jNfS9h9gRIZuC7ymI6rmI7BgE4iSzmVH4819Y1Nx/j3
	pirNcJviE/WqebWYPxz1oj1XeFOh2D6Z7Mf8voMS6/fvXUX3poGH5jD5IjlmYrDo
	8LhDMA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf797yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 08 Aug 2026 15:26:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so400291a12.1
        for <ath12k@lists.infradead.org>; Sat, 08 Aug 2026 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786202771; x=1786807571; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9CE3xwkshxnXLN8j/UUUlWXuJY96hDqpREDnP5IHL8=;
        b=CV/jfewOnLoKjNwtPxUZ2GbFOSTFwzhB037/DUpHnfqK4YuUZ13fmWueqbtRkEs7LF
         WquMgukCOW/hs4hbmeRkY7X/VtFpP2V1NLLFPnQVg2SV5bJyD1q48IRQ22l76RhOcq7D
         jEuyA59406jYRLAbH48GXlA6kD+6Z1jQvurGm2RIcBfZWqrmfwBwAaVuWJQXAp76sMQ3
         z1cK216FFaBBE7Sm4ZBGzGbukkgLIFM/78J5IZ2EDJK0s8CzdIYzev1JfQYH0XILVlGm
         a9hbkr7smLq1Q67DCaReNoP685MZsmh2IT8N/3bBygeFL/iZFQ4y86N+MOGyaoGx1PI+
         xcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786202771; x=1786807571;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9CE3xwkshxnXLN8j/UUUlWXuJY96hDqpREDnP5IHL8=;
        b=qYtHKzY9iUCy+rr6Jeyer9As5PIAYtm222aiw89PP3RyQ1QYQcvkktSPdjdx9NxDbX
         zY/T6CJgjPBOHY895JoZhC3fKSTU1aPZ8X3ULUx/v7iH8F2Yqen0tKTetJrIaiHQGU2+
         uTMO4NIoFBdZHsHgToxKcaBze8DZyrXe+364/nFeIi7INaNkCtnNYO0zaSUiTO4Xt6Zm
         GAIr+haBuTDmMzPHBbVLM7TXZLoDiBOl/rlxrjZ+JWYRP1bxMuUS46SwBUojCyyVNlHg
         kTOwArMEXPe1BAKWkhSf86loSKTx79MOh96JKC4QsqSqDNDhJyME9apAD3jwYxHUbwws
         wP6g==
X-Forwarded-Encrypted: i=1; AHgh+RoKlor+UMMWtQuiJlZs4+yhQ2Tc6J5L8837Yda0TiS9HLUmv6cZq1LbK98b/CynJparaf+Gmbw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOZLahy3e5K8unh/Clj46PwngoLn4iDtYD8WLuBXZGf59XbtJr
	gWBGfZaclzaibf4pd1c62MZDLRKOU7dfhcdKKyQZiOEWF9fJ+95IECy7rhhJfCjCtrJG43A+WQy
	6hZV0gZBWLLeiY/zrG0fWGFkOE5VenxHljjLEuUw+D9ek9ZGWh9Twaggdj34bnW7l
X-Gm-Gg: AR+sD12FONww9fyCoq4+yVVhQLyP2RwQc7n3uaMjyT/FOOf099g1eDkwC+4ROOIdSj+
	f1RkTmXLwAXxJa1v9UREGt5DO/29yoBkOIpWtgsbN+YS22sJuSY/ahZuvKBOjaDUM0rj9ZsGBmv
	8jf2oI7VJds6MscrBGgw875kFV3nlblHHixvLdQkYqKdzne20/KulTNQUbP1yE5sxlOHjcshvX6
	Hn3JrKHJJysgGCzlkS0yAoZfkk3O7Bg665EJxxv4RiFl90yDwO8HcIYEbp6ffsgYcu7fKV9zDeO
	48e1RJ+V2ByPlIhUNN/AgjrnQcjM0whf2PdmQVPIfWCmPpnNAL3ymGLvN7sqiHRz/Kb0SoknY8Z
	9RZhYNYKUGwHDEw3jUGUxig2liXaQ1AcAKNTaO0/FwqAsL97YL4jWI+Ne3Qbs
X-Received: by 2002:a05:6a20:72a6:b0:3bf:9bd9:cf54 with SMTP id adf61e73a8af0-3cbd38da722mr6921818637.8.1786202771491;
        Sat, 08 Aug 2026 08:26:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a6:b0:3bf:9bd9:cf54 with SMTP id adf61e73a8af0-3cbd38da722mr6921786637.8.1786202771020;
        Sat, 08 Aug 2026 08:26:11 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb883d9sm20509821eec.15.2026.08.08.08.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 08:26:10 -0700 (PDT)
Message-ID: <746f106d-f435-47ca-a33b-32e4b97843f7@oss.qualcomm.com>
Date: Sat, 8 Aug 2026 08:26:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 7/8] wifi: ath12k: fix 1-based ring index in
 REO Rx Received debugfs output
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
 <20260806132427.3704828-8-pardeep.kaur@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260806132427.3704828-8-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDEzMiBTYWx0ZWRfX6RQER+PjUsfI
 9EbgnHBFVJ1TKGl/4FsUTtPIEVrVWsO2RNgIqvaIefwPiGbZWuXk70zCTfrJltK1u/DNmIUONEr
 4UmWTO3AtdxYz5F2AwFPWNFHwdhVnTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDEzMiBTYWx0ZWRfXz2lGVdykAU3W
 qH/0iWK7FZtZPRe14Z2Y90vwjmVLHHLdlWipl24WytmJTrm0dO0GlKIwKrCCkPaD/DabZm2gHY2
 3K3yqV1ZoqGBdH2urXShyppEmSbWx02N+6cHIn6pe/eudGf5cylMXijDMCB3yEaxkBg1Qz/Zd3u
 DLShd1qJM+qCTt1JA5PI40dH9UdRb0V1skTixZz4AF7l0oOWXzSeYGjCZic748eT/xSSJ4f9AI5
 JLtAacbm0aJSqPVlRI841KPOrdxrOM3bbZ00K8bmRMeEmdgFgZ24AECH5VQRng5fhY9sm6Y/erA
 f8OoQ8+VOHZIJyDIPYBJ2ZY2zuGMxktmQD4VnxZQDx/YLQThPEiNEd3YA8+421rvqg8+dWckl4j
 6Hel3B6hkzR1G5esgYiUX1ZJzMVlNHTVLNsLmdtKXPyga7i1v9j8N5E95wchzumyYGvUMvMgVVd
 tGDlRAyuAObygxuMSYg==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a774a94 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2czXWg7JwIIyxzas3cwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: OZ7xmZGIy65dp_r7cohVDvshNha4Rf1q
X-Proofpoint-GUID: OZ7xmZGIy65dp_r7cohVDvshNha4Rf1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_082613_736356_FDF06E9E 
X-CRM114-Status: GOOD (  17.60  )
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

On 8/6/2026 6:24 AM, Pardeep Kaur wrote:
> From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> 
> The REO Rx Received section in device_dp_stats debugfs uses a 1-based
> ring index ("Ring1:", "Ring2:", ...) which is inconsistent with the rest
> of ath12k where rings are indexed from 0. Fix it to use 0-based indexing
> and lowercase "ring%d:" to match the style used by all other ring counters
> in the same function.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 84873d542e95 ("wifi: ath12k: print device dp stats in debugfs")

drop the Fixes tag -- this is not something that needs backporting

> Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index 216a1af22898..d4ea21aac21e 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1215,7 +1215,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>  	len += scnprintf(buf + len, size - len, "\nREO Rx Received:\n");
>  
>  	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
> -		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
> +		len += scnprintf(buf + len, size - len, "ring%d:", i);
>  
>  		for (j = 0; j < ab->ag->num_devices; j++) {
>  			len += scnprintf(buf + len, size - len,


