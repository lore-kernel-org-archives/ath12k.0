Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2069CA9EC1
	for <ath12k@archiver.kernel.org>; Sat, 10 Oct 2026 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=; b=rAMrMTZrIVi3oTL+Q2uS5hdAC8
	fVB9nvP50pJ8MAFszXCHGtMs5i5+tB4s4PljBKlwnDkMgd6oxxpxzYqvVFU8+6ZuzLW5JHKfV18Gk
	1kMuoPDGSRMaM2+inH3gWyrYqp7AF9NYX8IT/KDFjbiNk5mlp/363IZtZOsudmjyM2Ii8KvEUvFBQ
	eWYVXLM+3Bfhd8nirvJHXmNfG6iJR112zAGKhX8Q2PcJpitgUV42OS8unwiXaJ9+z2Hrz02uNd4xO
	LPf1moLTJM/Mef5/KdIN51+1sp9Kx8fPAxE9u7r8lRtx+dLKiwO7paLRsvSgo/JWyrPVS4awXWbWv
	ifn9iFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaXn-00000008JMB-1PJu;
	Sat, 10 Oct 2026 17:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaXj-00000008JKB-28cm
	for ath12k@lists.infradead.org;
	Sat, 10 Oct 2026 17:07:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AGrYPk124295
	for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 17:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=; b=dhAdQ/ycMl+oPia2
	fd8bj0rA4C6/kmqcKWlHITpsqMTg6fOHMqnTdnDYtPu6rsAu94ToumDsdmDOT+7b
	oLitpw8uy+KCF0IJ5vBm6qHAAYHhjgCy2ChbEqSGOTVh33xwGYNb7tV6NvbDhmSW
	fTEzmFRNXCcS5koS2rmh/T8z+Dy6GgeN2o28sNQnOhmlo104/S5EgdQoA3ja7kXt
	A9QeaRBUEaWee/adwXLFSYPEOviys0tUCJfBSFlUJjKT2aty0qZmenPbUjEKkEKl
	Lt16S+u/qCmBcPmFygY+GkjkyM5ar47MTtvZsN/OeicltXFoYzfwjOeu4/u5ofcK
	EJIO+g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dr7he33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 17:07:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-358856e5105so2857013eec.0
        for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791652049; x=1792256849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=;
        b=VYPy4BOs744ihiYDCximVG4jMbAOIYpTC+0W3vaFwHlxTVgjpo4xcNTtvcpsPVW91F
         0KKbNN2gcOreeSKCnlyKAltk2tR4AS3aNuYZI2ShW/3eT/XzNypc7rdST0Cg2kU+lvuo
         D33foJTFzD6nkWVDVnIVWAu5HNVUTQvHM1DLjkS9e9tt4VVizPF2IJyH745o1p4/g/7s
         GiqW7iMxREnHaVVqnoIvSnqEkfzTYaL934Bp2c6bd8ca61kfy2k0ZpaW6lStC/0mSRen
         ZDLWbZikXAT1ESusV/d305RSPMLe0ijypcPDu+Auumz+e8i+BDq5y2h+VRcrLT+hf1YQ
         /WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652049; x=1792256849;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=;
        b=LTRux3qT839RTxrdTIXzHz9/Vl6w9g61es3s6dbP8rn8uUO8Ag+8rPRfeDxg822lZy
         wqsm0O88VLXjqWKNmqvReiDghMwcj+SlsxCLmOin2QOSzTUrrcYegSe5ZH6kGF96deFR
         qqvgwyZ0eeJNTjrkdI+ZC7W+GBekPhDDdGV39QD0Nnz47VBzC/jzTmLWcrpagSFwji+s
         oebNEsFXGGvseUEo8RQH7kpAkxDVz4BTUPpSxTrvGnZPW0fFLH1nfvhv/wFaBT+lJfAq
         rnCoe5e5SyeZXlJeAhmQkQkUtOuuOFiB6RopBJAQROA02KK1qdnI/9xd5LWk0oUK+2xU
         8KKA==
X-Forwarded-Encrypted: i=1; AKwUvBxVolIKlx8jf3huCs2dmzG3WaCy5wg/XheYztTWggfON0VwK3IIngYikvhw/UKYQFolUyrktgg=@lists.infradead.org
X-Gm-Message-State: AFq9FYKJZ9heZh0LQwgIwyDd+ormOf78IMA2rnuYjo/BCJkLwcyh2T3l
	AJCtsepWSme2MP7Hnwg9CbXYLI4L9PCPbc/J6Copx5YSnVPxLI9LXijj6KuLyeCZ+U4Wh2dzvd+
	iVk4Ri2bd/Arvtm1ZoVFoXWdcPRFNZ65Fp9j2osQnRql4R0dVU2oB6RnujWJiYKu2
X-Gm-Gg: AYBFou1GuEYoawCxFV/ZWxL6iQraWIyLOlrjpKKZs6yFg6VCDbeVyYT+7ap+Hy1Pl9/
	eidFitSjX3PSebmEBZSvOa0g5vvc/8+mLehtqQP4w0VDGsoPQ9U8WUopcSqa6zuzLU81F4g4nv8
	+tobAnsRA+Q8q3qIBUQ/Y9mNsoRzlxvSUfsdh94Wqqxt8jD97PmO4BONj/jfF0gHgIoPGpGO9G4
	nBZuVCjzZVO9v7FJqg/CuzPf7/iD3fKHEbeFXZelooXiukNYaYv0I8fGYo2JDO8PyMyIY9stRYw
	0/Is/js9pM77E3QLeqT1W9QaETnZh6Q8HtGbw5lmu6mQa/YV+cRHY1PHNE6p/4uyEmrIb3DGQpN
	Fip5Gnp/3jgWz/5C8juINQ9NJLIkec+iO+NPhID/iISS7uAxMW3Tro67BXQ==
X-Received: by 2002:a05:7300:8420:b0:351:7f5c:dbe1 with SMTP id 5a478bee46e88-3537e02318amr7699845eec.28.1791652049098;
        Sat, 10 Oct 2026 10:07:29 -0700 (PDT)
X-Received: by 2002:a05:7300:8420:b0:351:7f5c:dbe1 with SMTP id 5a478bee46e88-3537e02318amr7699807eec.28.1791652048453;
        Sat, 10 Oct 2026 10:07:28 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3581f594a41sm9274614eec.23.2026.10.10.10.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 10:07:27 -0700 (PDT)
Message-ID: <d7f5ae97-05f0-487d-a31a-38c14e9c9e12@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 10:07:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f_vfCPWneGZMMkstNdmONP0GMu8Wshov
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2OCBTYWx0ZWRfX3xgaQBZTIQUn
 8NLKKc3HwovEwDhwlC0NkloJxyPVPWN7WV5lVGJ4oguuKgSvTHjt7mocalXe9tFQDc3tmwY5rWW
 Eq4fZgwWae2aOP2QOCTJuDaaDoOZoRk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2OCBTYWx0ZWRfXzXjqVeqkeD/Q
 qyshAMBodSBx6d2ZcKzeMCKvbobSYD7vGoPhsBeH39kUhErMT7jVM19wwBSf3ldSZnnAWGv5Bi6
 A4atIjGmNOHNZocCtAhKBshzP6tfPY9mMVi3UZqX58zSXNMQd1xe3fVT7jabr172ikQXr0fkhNu
 3r0iLT+cA4bZnpEMnS9qlBjcTDqCYJhVMUP6rbdEmsV1o54m+Sa3k1kXXJoYFVkk9xyMyl/Cr5Z
 fc0lVzVCO+ZYApIyDZ97ZB1BoYePGMYdPiyxzb4ac/fRZbuVhw0OES7zxo/RNXXSqDZo4oIu4X9
 mdeV4OHIDmsKovPjc0bG+It2toJbAiMOe5wS7WjwQyWwimFab+kXh/XSltUZ9DwSzRvkaskrBjT
 UgfarQ3mRrCtpk/ydsI39Ebn55Gjq4nYblXBGMOlCuowkTDJGKmIE7HmF7qtGCrkJGCxWXl/GYW
 QC/RutqikyZy5GceBWQ==
X-Proofpoint-GUID: f_vfCPWneGZMMkstNdmONP0GMu8Wshov
X-Authority-Analysis: v=2.4 cv=asknmiZV c=1 sm=1 tr=0 ts=6aca70d2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_100731_669847_378E5883 
X-CRM114-Status: GOOD (  14.16  )
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

On 10/3/2026 2:20 AM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>   remove each IDR entry before freeing its skb, as pointed out by
>   Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>   leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>   wifi: ath10k: avoid IDR mutation during TX cleanup
>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>  7 files changed, 44 insertions(+), 39 deletions(-)
> 

(dropped obsolete codeaurora and quicinc addresses)
Version with the ath10k change updated is in my 'pending' branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=3d806fd957b02ca1fa7991ffaf6c02ddd3dcbfe4

