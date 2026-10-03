Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD61CA5FE4
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 23:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bZnp1l5Sf0+DvNXCbo/mmmPSmEpfl+U8dXwsWmNIH8=; b=BnHnvJb12Dt8/gDDxNcey0Tkxg
	7bGim0FOEyL7JiJEbj32RG9YgMwswErsNRxeXYrSEIhfn3qFgvadF4c5odFEhnmMGaF/z7MqD4cik
	TQB0EXQCPUi/qjk4h4BJi1ZUkR/ODyXtTMPgzIX3UVa8vPg4ecc3G1/5uiqE7RrX2gkoOgGo7Jo2R
	Utoc6l1uf2WsPuLcrhrtAo72bgjTHY7Az/35hvfndmSiOc/XAyhFdRd9jsggIwNsm1rMbpJmZL80n
	eqfZtEMcu3fk2BoSc4t4eFR3ZpuEgg+wKleDYs6a+Y9T8TCxHeDRphVRZNEEGTTpPU+bNPrBDEKof
	BWptP66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8ik-0000000E9ET-48Mo;
	Sat, 03 Oct 2026 23:00:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8ic-0000000E9Dm-0gy8
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 23:00:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Koqsk2193574
	for <ath12k@lists.infradead.org>; Sat, 3 Oct 2026 23:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bZnp1l5Sf0+DvNXCbo/mmmPSmEpfl+U8dXwsWmNIH8=; b=E2jyHK4ieCgZoZ0I
	rz2YiPk9LkphLR+JYFMGvd51prs42UANmr9ZOHmfgJS8j/8uYz2L6Xp/cYd/UyLk
	wJNGbYcQDAuVjur880WRmiM4oU0ddOdrABR2FlSTWqXnMYZVldsAfpIMO9nStCmV
	rVMNoMLr9CtUI1gfvG3pSC9+q2IdcoMtN2ecCqkx0EDHzFRlWRmjCn0yDzrcNgIE
	dQQFAp5tcFvXpxcT//w0Knwkl3vAQlot8AJ6v2pfsDrSERQXVJhtWYP0UmxULZ6g
	CPwjs6Y2zrvzTJdon6Lxb4m1mOqYtZGVB39s9ly+BUCe58bZrsMzqI64Pj1e82aV
	b3M/Ng==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr69ytu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 23:00:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so1340256eec.1
        for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 16:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791068422; x=1791673222; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bZnp1l5Sf0+DvNXCbo/mmmPSmEpfl+U8dXwsWmNIH8=;
        b=Wwe3Rcjx9T2JDm46pCbg3em9T76hO8zVLTvkwxqFETJ465N3IxF/c+LsVejOHY4ehK
         2nXtZt+V1ZflROTdjCj5mev943P4fR0CpEJu1MgGFtno29EMUak4EYj3kfzzentKJC3d
         RCzUgxf2hHdXBnYxSP0DsDWWyHgALN7E778XUgFq6uTpY/Kkq5f5f1lDYze/swrPyyh3
         O6ACkTq1Ijh885aCl1tskvjGG8Arjr22yaselQrsPZJ/3h8pomUT96ByrahJbLrgY8Pj
         YpItIyhWcSHkcbS28WWokZjFtwUgTTcxed5ESNEkv4FOIo9MzHkDHu8ko0mASH5vsztE
         1KuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791068422; x=1791673222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bZnp1l5Sf0+DvNXCbo/mmmPSmEpfl+U8dXwsWmNIH8=;
        b=GXpLhLEO30YAVqyzVrM9SIrbj23UyN4/AOfWF0dCBG3KuFGcNln0cYHSIwnFp5MI7/
         cLJeB/kA1BFElas5UysRHLftIl2nLE/5nnV+xtRgl1e9+1SwZgoQ9egfH1+rbWO8dS8n
         zPBf5Olycig0XHNWcTlQ4L6OuccwE5O47qdfc6fc+K2S7Fzz2Dj78bDTjReSi2YLc5Vq
         glHQMzHOO2zBV1aUh3410M4jHSG9wR0sTmyGAEx+Nt5atggeQsdVGQqUJ1kvicsfbRse
         a0/3ESDdItdQp43Rlgph/gpfYWL+xf4V0pJsuC0BjTrYbUt4Qw93UhAMPmIgkclHhy2P
         iJ0g==
X-Forwarded-Encrypted: i=1; AKwUvBwci4yfGtIYTdm8l/dvjCzHNOMYkc3elZu2kuOx2blO7PsPMJgRMPdcRsd2Phc8V8sc0uEAbSU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJicbDfDjvh+mDCq3ZN/OGwLEH5vIO8mM14PZpgtB9wJXGt7+ZO
	lyLLQaWS6SXS5hssyOCN4iaOSI9OwMmF89XKi5zYeDzlrCgUN9t9ipKnCjLHYhaY3LITK+8AzV0
	6it8gRcAcnAeS6hVl7jfYAZ1g4Ft92fry8ncvOjtNk47EL7PlfIYtN9fyLWXadPA7
X-Gm-Gg: AYBFou0oOI2NH5ermV2sTqn1V8IF2LRIXuFzU/nRBLTAe/d4DSpThkd236YtgyQ8i30
	tDp5DFg0ONfqETzkLAmqU+m7G60hXQ6dh2W56qSWnyPspSAvFwOjbVF/J7kNJKH0jUXYubTyfzr
	23x6C0XmuYMRH81ctkBYOQvtya7D1/6UX5Sp7VM9MucJMlRbVFdZWiiYuTvvrZyV0pbgoQZeWkw
	Z8XvlC2WFrYGGDaabNjVKnSDxry/M86kxBCWWpcJP25Zj05tenNNPTkKtp8WATo32c6M+i3eN33
	2fNsKdOADsYCf5GrtZ7ZBqAL1RtWfIEziRv6y3qIBqEWaIa+N2IFQFgUt0Wi2n2UB4HUVjcw3qH
	9MZguA5qE7Z9sgbPVGpAahNU8A23g3J41STWyDZ1x0WTKWoTtqem6S+hCGA==
X-Received: by 2002:a05:7300:ea08:b0:34c:e77c:f928 with SMTP id 5a478bee46e88-35111519db8mr4821007eec.35.1791068419687;
        Sat, 03 Oct 2026 16:00:19 -0700 (PDT)
X-Received: by 2002:a05:7300:ea08:b0:34c:e77c:f928 with SMTP id 5a478bee46e88-35111519db8mr4820753eec.35.1791068416453;
        Sat, 03 Oct 2026 16:00:16 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f1500b59bsm18150132eec.28.2026.10.03.16.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 16:00:15 -0700 (PDT)
Message-ID: <5c764600-4e22-4827-bf4f-1ba4ea4fdd50@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 16:00:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Reserve space for a string terminator
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20261003095913.575108-1-yaojiale02@163.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261003095913.575108-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA5MSBTYWx0ZWRfX2Bkqwk2zKpq2
 popFHsry1QMMT28y91sVWRPNh3GDqHh0YpKDtfpgz0NvsCIjOtsJf1Vd4ki3MWCAYZHDlGR3SrY
 A6xQwh38Xb6jFX8idLg5KS1jLQDFL/A=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac18909 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=Byx-y9mGAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=JhsGp5YEgYEiw4z---oA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: -qOWSaYktYrrUf9z-A5dSuuJT7P95mQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA5MSBTYWx0ZWRfX8vzZkiLM9zxO
 dYCgSbmrn7DQbltZaHCpxg5nEXp7D9olbO27tchHZOjnQ5A2f95yJmPuYb53GBUCB46hl3hOeDd
 Aa4E1Q75wtxKvd40zFSgY2lt3CfV36eeCrHHFBOzYxZgwDmga6Zz7IWeN8hrg+i3i7T5rDkaS+M
 4LhPdxaJpdZF1UqKGp+4OwBpvmEkDkVDaCdXGrBx/1ku2vZuWZMsqe7LQBVClr2JcAb1JFVTNBj
 nAG4iKBxhuChDVPWevbvyOCc3Xq4r+I8t/qTRnMJcMAsS4L+UHWbIYz7NrObap59L8i29RgN/kU
 5S32B0tXAV3muQwrrnxgJPBPUVKKexpVX7G8hApKJvmvXL6zqf2nAtWHKxJtw1i2Vjek77itpOf
 pZFP5Zbo5vC8y9Q2gXsbEP/9Uu8o5yJTWGCJcwmnycAY9mxp87Z6NageMSO2cGhmLzh/CrjblcU
 5kXsdeLIxEpNb+BgBvw==
X-Proofpoint-ORIG-GUID: -qOWSaYktYrrUf9z-A5dSuuJT7P95mQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_160038_235225_EC256658 
X-CRM114-Status: GOOD (  16.38  )
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

On 10/3/2026 2:59 AM, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Documenting that this is actually a REPOST.
The original v1 was part of a 3-patch series:
https://msgid.link/20260926121250.3258285-1-yaojiale02@163.com

The Reviewed-by tags came from replies to the original posting.

/jeff

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


