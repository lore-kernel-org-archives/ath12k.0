Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F337BC36010
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 04:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7t/ukaTibcNJ932Pv/IkSD21w1/bx2HpuMzZkG0EWw=; b=Rwo7RBR13t1TDypRs+fVKCiXDb
	JB04QqDLNSP0ncCP1UWQGmjs8fLLxMg5nmFhb33mUHGYJUO8T/xCL+qIRzFk7LZW6BVvX0GUVJd+Y
	9ZyIP7IxKc9CBrPLX3WIPY5usrc3hhYR2Fbqe+dM/ny2p1uPvSd7aKZp6J0ESRSNdVpX0PyEZgqKo
	NHN0Zl+vlQGxVaa65mkLIDQP8urtxkMe9fkX3bNoPIbPhXUxka2BMsayKoRZJ+BncB9xaQMRGExYk
	0atoGhDOS++ierqRgV3DPC/HdnHOR8Wvf8nf0JjAbv8mXLsuBNcVd34+X0cXkiwCGSUSO0y362tnb
	tA0Nh31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u35z1-0000000CT6I-39Z8
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 04:27:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u35yy-0000000CT5c-3REw
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 04:27:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFlQfQ028831
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 04:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7t/ukaTibcNJ932Pv/IkSD21w1/bx2HpuMzZkG0EWw=; b=G2+XXULNas2x0X5w
	N6IRTpoaUAaW8cQLdLE+0A2dolCcWBdGFA7JhIWt5jYqDdGSehjEa9xfN6H/RS/3
	JZSKkBnV+WIC6nBcXwVRURYO9CVLRSU8Q4Y25TiQLFhCWwaoV5j/XEJ6ux3nOtqz
	jN9qAhoSUoH0EoQ9FNGRr3ae3+gfPKTvLoddpM1iHbXaQ/j9L5uBwhY7pUQbNcDj
	OwiTxAFG+MIvpiwJ6Ke4fDURA5zC4NkQvI4Lx+7LLu3Nzlf4uMxLcCwNvFmYi3Wr
	AFHjeSr0e3cLWPB3fjRmv1dsCJZc2bCv4rpSuvGirLtAvCGxTQ6eR0kdU5sope4G
	OubmGg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbus5u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 04:27:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ade807fso25068925ad.2
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 21:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744345631; x=1744950431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b7t/ukaTibcNJ932Pv/IkSD21w1/bx2HpuMzZkG0EWw=;
        b=q+j2lbIpaYg7eFMu+PeNHulKD+KPLbeoTtXjrRDdRhopymgS/xBVwowSzOuXYPNsG9
         8oHwaPHOOfLtYIvtpit+AqYt6f4F/7b7Bcb/cQzPXvGgpbrTt0p8ouCh+ByoGuc+mYJy
         p1oMwylwR24eLFUp9z5PE0xoZz2VNYjQEXwlLdCgd3SeklMezNmW42p8SIv7KVUNUin8
         nuf+IuNKL6CHGmEyK8eHxM9a+W6Mhvyd6DvxNJgk4m99wRE5oH/peymCsbRkhhyb/qsh
         H97qtugR2NgDfVV8f5OLk93eqcTe6dtKXAwHG3/uZSu2pf3HBC8Ea9VwsdW4LT64QArq
         ER9w==
X-Forwarded-Encrypted: i=1; AJvYcCU0uMuYjiYktiMm7YF6KKM8ofJr5xGoQnlh/ilSrkdSD3sxj5dTkZxDVA6KFqcqWJwNlLu+Y6A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxTu4e+oT/KktD6RiT/QHfB4yV7cxadYwxPMl10iVhMPeltAlK
	Q5ZQX0Kcc5zjy58ENmrPwFqKJ2/x8YHskNhY58ybtAd7q24tA7HvYAK0BCv+E028wtaNly/qBSS
	cyYRea+yFS3d2jmSNk7sCVHR86ANfCqUGlKSZGWuRLlfRmtbDDNN6bdFXwPjo
X-Gm-Gg: ASbGncvPhrjbE9Zoag+JG1TJ/3Qg/aRzEaj49PkniFhp2lsWaCmALTX0/AYSExu7eB/
	ZrzxPP/Xcuxz77xNDarA8aIPBqlp6cOn4w2WGNngSVvIMrC4nfPJAWa7j6xSz9bbjJx1owIgI49
	S2sH0t5oTgw0m9SaQvxQkwTSHqkmwVaCF6T3QIGrK6JwaT+Y0OI3j5GGusI0uc+PUVfbtX6usHZ
	669H7qc272vieUNo2fIH4A4KQ2KfODApNVihr9mdATzxypoLb6Abr3xHwyKDoK5zfJ9Qo3lkRjp
	5J80ueUnDMPaZ0OT6cnlUAnAucsdPtXWAi/UF6IGxWv/9pUnTCJliA==
X-Received: by 2002:a17:903:19ed:b0:223:4bd6:3869 with SMTP id d9443c01a7336-22bea4ab849mr22176245ad.15.1744345630723;
        Thu, 10 Apr 2025 21:27:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbnfJDdGzfNkx2X+qdl3WNt6aHUv9phaEYx+WIJwz4vw5L0A5BtoeT67/qccGFe/6CIbt2Hw==
X-Received: by 2002:a17:903:19ed:b0:223:4bd6:3869 with SMTP id d9443c01a7336-22bea4ab849mr22176005ad.15.1744345630374;
        Thu, 10 Apr 2025 21:27:10 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb688csm39489505ad.174.2025.04.10.21.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 21:27:10 -0700 (PDT)
Message-ID: <8da15ec7-2f91-a7e6-7291-7d733880d6b8@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 09:57:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: fix invalid access to memory
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250408045327.1632222-1-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408045327.1632222-1-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TxnQ_eVh8yo0ZLyNN0PbeFKYoeDd0-5G
X-Proofpoint-ORIG-GUID: TxnQ_eVh8yo0ZLyNN0PbeFKYoeDd0-5G
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f89a1f cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0XJ0nkoN6fRkH-oyq9IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_212712_891687_5E61F272 
X-CRM114-Status: GOOD (  10.36  )
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



On 4/8/2025 10:23 AM, Sarika Sharma wrote:
> In ath12k_dp_rx_msdu_coalesce(), rxcb is fetched from skb and boolean
> is_continuation is part of rxcb.
> Currently, after freeing the skb, the rxcb->is_continuation accessed
> again which is wrong since the memory is already freed.
> This might lead use-after-free error.
> 
> Hence, fix by locally defining bool is_continuation from rxcb,
> so that after freeing skb, is_continuation can be used.
> 
> Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

