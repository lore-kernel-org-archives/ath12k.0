Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C600AC47BDE
	for <ath12k@archiver.kernel.org>; Tue,  6 Jan 2026 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4HKFWWo6W7gPbfh2tN5wFUcJzGeLsVtA756B0bDLos=; b=C292lhDDXv2Q6CVRyHExE2ovJn
	JkcO77tKakKOBxO1D+vFxzF+S/pZG1ENdb3wyXcaY2L3ATY0nQ/MZbK6W6DUG5pe4tdrT/M0lj6ak
	YwC/A2QCHonuRh64fa285Bk26w2QbMLckcmD3DLldCCT7oNgXVU+jie9rED8YklQ9ZGh1AWt2dotX
	ThJc/983IZq+sq7MxdYDEppyMuiH8RPcKppg8Yko2C+9JHfMcC6pUCfSxupvFr8UuDaIG7gvP5f8Z
	GjXdVdoPptI0/UgG7jxkRe9pfbRoLP5Zu3QBtQ07sd5cKJUo08FIvfNSXPKIojKM3D083ovhe9hXk
	pGSDIi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3sY-0000000CkgZ-2Ics;
	Tue, 06 Jan 2026 10:01:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3sV-0000000CkgA-1WRs
	for ath12k@lists.infradead.org;
	Tue, 06 Jan 2026 10:01:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t5wI3295015
	for <ath12k@lists.infradead.org>; Tue, 6 Jan 2026 10:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4HKFWWo6W7gPbfh2tN5wFUcJzGeLsVtA756B0bDLos=; b=ciUsSU+hN0+irebs
	HeY9p2tv99RJ7fijeXMhdb03i+Pr8ewvCkXs3yXV4sN9eS/fXIAVIyqpJ/fcoDwI
	hvLWFX3k+mHxSr5KTqhYp3UPut5BTfaoJ6Il0P44Koqb/tI2KjZTjcJs+2dsUUwD
	qHmDN3LssnS3WyW3YyY/c5/jOtQ64UTMydaot83INJHV9LimEzroZIRDgvSWuJ4k
	0VQ77N+VooGhc2G76dM2ycGCXSqQWZ7PeArFRApgaJG0Bu+banN8DacQp/aFt/UA
	34oMH3DfjhmaA78rvZn74YwLg9aGtT/QlKymOrFakMClP+yT8Q3RLcrZjQEElecg
	thYQdg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00jja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 Jan 2026 10:01:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7f046e16d50so1456148b3a.3
        for <ath12k@lists.infradead.org>; Tue, 06 Jan 2026 02:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767693686; x=1768298486; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j4HKFWWo6W7gPbfh2tN5wFUcJzGeLsVtA756B0bDLos=;
        b=U8TjrXJVpLesGLPrNWzoOjQF7JTZIbHyU/D2/7ZFLCta2OzuziclCwhG6v0JUitQYu
         WLN8sXprZvPx52hddXmggeBtlniykAG1M5/EDfJeXGIe55TbuMu8HmUpIbyWBjWpZWiJ
         9zGFehwz5FiA4aN4lYdim+QOMF04adqFBTChqSN3bLSxJT2ith1R0IQzDix4kh5DmxY1
         Oc8NQEKhcTQ36Vcl3Ofm48e6wF6PoYs1SFzc7B+1uVHYfdweSveX4aS1JMQpkjSMoP9Y
         7xSeh3SzBu6qIihmak+dxKmbP1mwZ4ycpdUYt9uBqbzpwXL+tSYs0OihvqAEqFFVpYYt
         gpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767693686; x=1768298486;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4HKFWWo6W7gPbfh2tN5wFUcJzGeLsVtA756B0bDLos=;
        b=neGnHvpHLz67/kb71x+KroHwejBrqIg58ltGyz5NnWwcxpTwWGSyNoNcsKp/pq2VVJ
         ZhDFXZYfoTSlcWvBYXnxCtebJtti5ali3MMwwoV1rQazbe9zCXNIM9dnmHzrO7r+MMp+
         Z4KEQT21zbFj9hGbQx+V5W+9WWEL/XrFsevdfDpoYaIeVIXbrnMKm01gkySSI+47fRRK
         DI7wC5JSx8nO0VKgEbVytqrpdbz3Yja42h/sVsoQWCUXIMZr5yupFzob6tDbz05tgnkC
         m/+tylXw3dcmTy6c+i7GTFJIMCSkr0oTNDb0QGPlq0a/92++8oRMuBAxfOnt2IuRdBcf
         EP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWKZFthZ15a+aRcEctx9396r+tvnz7RSBtrTC7Uq39fJF7lDC//TuaEg425uJw2yYubVb/XWY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQigcM2xM5kHpEJb3msdC0GtXhkHHtS8NC/QK4GgQe+bFnkGba
	8UnUJ3qQ+Nfrtjx4k4Y9fmENpwRS8ClIXI94SYgQKbUwDx+vOTrsSBSe7eYv0blYW+39XpVJ7oh
	DcDLteNpu2Wn7oJMZGwMdOCX1lRaK9QVpxRsWU5qaDjNHYu/wd8ulQ/xld7VYu9cg
X-Gm-Gg: AY/fxX7xTawTP/YU3jTcJGvR8TrgZ5PXplEDy1+vlCttI3EbAqwQuk3k+b4qK03tNRz
	72/MlSjHsYxensYPvtQhNv7BmYUKshYjntVW7Buv47mNLpNw6Zc+FZYDd3MZEw7fLArLQNaetTV
	IWXQaaPITZmXotYfcVNwbw3F6ANfNvnPeZ1l6AJxcrEmdrEjja5qb3Laiij6oWAYY5ZwIzXreO7
	+RwOHgguHyaVt+vw9/hHriKSDHlDoOGjn4vXCyuIk/MaWWmWc0lf1VpILODkGPENcHfjeLiNDYK
	fyNWJQFO4tP2b7Ym0Cvk84HjWdk2b5Umg1P/R7nYMlIgIeNVAC2zmMJt+PLss7G1ofK38/RXYK7
	XxL9R6tlmsd81nvVyld4quVleCj2eUKHEKU7/yNMqPK81EPi1y9+lkWmbjBOiIKQiGyFeB4mNS+
	U2WohsQQ==
X-Received: by 2002:a05:6a00:1c97:b0:809:33e7:5d89 with SMTP id d2e1a72fcca58-818832c940dmr2279580b3a.64.1767693683504;
        Tue, 06 Jan 2026 02:01:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpJVZcGU/yMmbSm8cCO+VvvqV91A5JT4ce5P4ZY5G0vL39xcSvsOISQdH6C11AWWGi918cYA==
X-Received: by 2002:a05:6a00:1c97:b0:809:33e7:5d89 with SMTP id d2e1a72fcca58-818832c940dmr2279545b3a.64.1767693682930;
        Tue, 06 Jan 2026 02:01:22 -0800 (PST)
Received: from [10.133.33.54] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5301416sm1701367b3a.38.2026.01.06.02.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 02:01:22 -0800 (PST)
Message-ID: <ef342a0e-5f04-442c-aa4a-3375c6023547@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 18:01:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: fix dma_free_coherent() pointer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260106084905.18622-2-fourier.thomas@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260106084905.18622-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4NSBTYWx0ZWRfX6gD2EfI3+b9V
 4iqNod6RpF4SCWeVITDoEHlGkTRc9L9bfoTUxSJOyaMJOJJIRwe3fu6oMGL0zr6AfBVoWSdv2FM
 hFxIYjXddDJYTF2QjZ5HBY7vND593mz1OnAmV+bUcZ1wclY3SjN038nw6SX8Hgt3sUJEwapxLIA
 19HGZUEaFYE0uGwZcv4RZEHtP7Ik51PQ1FwE6HJ20L6hIHrbDbbZZaxknaqzRYQEG7pZN6yZcmh
 DSc98p9GdzBW1/EEEqrRuiB7JdVN3JeQ77gMq60EVV/a3Vq9owA3oLrpPDlMJQRn6l2cZ7YCh02
 13RCdwxgsaTcdD9vGnlRavva9j8Tm5dSSjcJ4adlv/kAwCjunj3AOD89MXxpkMvOHwhjsQgmdgO
 NuiDrbvV46oPgBNy3MknheUeWt2gMbCoKmU75hfxMu+YQf2zXgTB/Z5pO6UjY2pbvUPpA+Gvot3
 dn3KwBd2gHTdDI8olIA==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cdd76 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MvB9iNEEFr4mKuRVMNwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: G_PSAjtY2W1bAFqVnFT9cPeD7Xr2xSiM
X-Proofpoint-GUID: G_PSAjtY2W1bAFqVnFT9cPeD7Xr2xSiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_020127_407122_9BBFAB82 
X-CRM114-Status: GOOD (  15.65  )
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



On 1/6/2026 4:49 PM, Thomas Fourier wrote:
> dma_alloc_coherent() allocates a DMA mapped buffer and stores the
> addresses in XXX_unaligned fields.  Those should be reused when freeing
> the buffer rather than the aligned addresses.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/ce.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
> index 9a63608838ac..4aea58446838 100644
> --- a/drivers/net/wireless/ath/ath12k/ce.c
> +++ b/drivers/net/wireless/ath/ath12k/ce.c
> @@ -984,8 +984,8 @@ void ath12k_ce_free_pipes(struct ath12k_base *ab)
>  			dma_free_coherent(ab->dev,
>  					  pipe->src_ring->nentries * desc_sz +
>  					  CE_DESC_RING_ALIGN,
> -					  pipe->src_ring->base_addr_owner_space,
> -					  pipe->src_ring->base_addr_ce_space);
> +					  pipe->src_ring->base_addr_owner_space_unaligned,
> +					  pipe->src_ring->base_addr_ce_space_unaligned);
>  			kfree(pipe->src_ring);
>  			pipe->src_ring = NULL;
>  		}
> @@ -995,8 +995,8 @@ void ath12k_ce_free_pipes(struct ath12k_base *ab)
>  			dma_free_coherent(ab->dev,
>  					  pipe->dest_ring->nentries * desc_sz +
>  					  CE_DESC_RING_ALIGN,
> -					  pipe->dest_ring->base_addr_owner_space,
> -					  pipe->dest_ring->base_addr_ce_space);
> +					  pipe->dest_ring->base_addr_owner_space_unaligned,
> +					  pipe->dest_ring->base_addr_ce_space_unaligned);
>  			kfree(pipe->dest_ring);
>  			pipe->dest_ring = NULL;
>  		}
> @@ -1007,8 +1007,8 @@ void ath12k_ce_free_pipes(struct ath12k_base *ab)
>  			dma_free_coherent(ab->dev,
>  					  pipe->status_ring->nentries * desc_sz +
>  					  CE_DESC_RING_ALIGN,
> -					  pipe->status_ring->base_addr_owner_space,
> -					  pipe->status_ring->base_addr_ce_space);
> +					  pipe->status_ring->base_addr_owner_space_unaligned,
> +					  pipe->status_ring->base_addr_ce_space_unaligned);
>  			kfree(pipe->status_ring);
>  			pipe->status_ring = NULL;
>  		}

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

