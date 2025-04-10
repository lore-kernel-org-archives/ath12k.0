Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D26C3601E
	for <ath12k@archiver.kernel.org>; Thu, 10 Apr 2025 18:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3P5K8qIo++EOiyUEYlbHQXKSiyqq7I06DkfJB4A9SY=; b=wtk1JAKo/YboV5OW0hNogcEHuz
	7Fu0g3tPKS/bHMeoLAK0tZMOXCwVceDtfw4HbGPxgb1rIxMGUumGTz2ptaSAOlxSjES/xv0y57r9V
	PR5YeoHkJPshLS6Yt/EoYKjlMLouDAKCw1OSrieGGAD4tRvN+f/8EZ0C88pyx3YZYgO3v+H/ENcvZ
	0T/+w49bQ586aooE0U8x90kT/eV2Rd0SRdQSID37Y6NjtJ5ap0EpDnXIZJZ+OE9LgOuq+1R5RSMJa
	h7FDkCV88SH+MPf7VL1RWG/9jOvLaVglyMrNBusfPU7ivbTo5OJi4upIfBA0o64C/uYx1D87l5YVu
	OvG+x30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wKQ-0000000BUMf-3Aa5
	for ath12k@archiver.kernel.org;
	Thu, 10 Apr 2025 18:08:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vcO-0000000BMWA-3WBU
	for ath12k@lists.infradead.org;
	Thu, 10 Apr 2025 17:23:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFjnfF028856
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 17:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3P5K8qIo++EOiyUEYlbHQXKSiyqq7I06DkfJB4A9SY=; b=e7ejBOiaL/xNwWLp
	VZOLe3WCzQY1MSDHQNqzKapEAntXx4ei//4KdJZUToV2SWi3IKd+3Y5F4khnbI4z
	iT+eagahFJhNg9ljUozGWBX+TlFVghLfUhlov2vUcsDnElXi6lNb5V8TyrFxg5II
	ACJ630wwSYlgGE5Ogap3BM9bfUw3NsPtjLlq72JSyr1WPYV54uLuMVGg0g58DxkK
	4IDOCy2yKvrooKKvp6plMIntdOU7Ef7xfLaddL6A4tWy4XfzfKRmqYdQr5ItxBSe
	/JDuGBZokpFMPKc0A1hv0XbehapPV26g9rP9m4UKw2hEpHxXpbvhvpw1H+RroBQz
	JNTtcA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuqtyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 17:23:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223fd6e9408so14227755ad.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 10:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305791; x=1744910591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3P5K8qIo++EOiyUEYlbHQXKSiyqq7I06DkfJB4A9SY=;
        b=bC9ftxUCUMqnAMFl+f5lQ5x3tiCy5QLAomU/Yw0vmmOexIwWgj5TWg/7jBq+ppJWVC
         3vn9wL8LCA217b6QsBOC4O6H2+Iisq0mGt2R2FIBnTKg1AKPn6tqRISfbc5D2r6tQswM
         MHdUJ9SluiU0NDRx2EdRBpIWxbSr/MvK36MKZwq9G19ldrY0hFJeKjqze0eu5fBT4Ic/
         Eaxj/IS4hKg0uF5cNoMAIZfNy0Zj9IelIh+bZwfXPbswGIjuQUVaEAJSqAxcu2R/YJIV
         M6OX/ijzn8o9Tafa2iRQqEAwmDBMRLbB8CiZffbZhLaVgJGdAORBTL0RYJuts1BvJ8O5
         E5wA==
X-Forwarded-Encrypted: i=1; AJvYcCUzD4QO5kK8SR1F4xHo9DikOIo5eKCQQbQMPaAoYW45qG6DtkUyQUqBngHC6eLQczMXIt2rLck=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzff4UpCmFMpTQENXGUzSK3vJxhZXkiyoaoDI1KOLyk+lOUI5sa
	zBkv+qbgrx/eEwuVYpdNndHm9UnI3Abxe0hv7avd50mKB62vCMcgXMTtCFDScSLcpKwt8z3BeD9
	c/880FG1VEeDZUkMwS585jIpC6kPj4D6VvSy2+Af2b2zlgAsiykgMghVCTTJT
X-Gm-Gg: ASbGncuCNeDaamcECoE03FR6d1pDaTgJDKqj5vWORVwEPqNRKj4KBnQWM6A5V/fG0Rx
	5zy9NsPg6nnbfGy/QbvhK1VGYlTlAL2RcI08TmfVq+emvzox6MP2iASBm8mt4sEmYl199Yt5nnD
	EhjaHYJKOep74c6kU9kTG4p4zAHOZJex9Ye3ww4WEbL11+dvPSfJVj2WorVnsRiadcrjexyQ6Ny
	AXI42Ij6hkuym+ROa+kdyC7bMNAQgy2xmxGro/CdM248aXhHQRsd+co4JqInDLXPj4n9ZVAci2j
	fnlWVdqP1nsaSvNT6fs6L9nMOCK5ry+W3xP9SZ9xFmRK/TYg1W4Jk8N8NtcB
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22b69430257mr54475965ad.1.1744305791355;
        Thu, 10 Apr 2025 10:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsOm6QHNFoIQoa9xAcmypmP2o9HLNTmyw9hqlhL3OGHmNMXVDtTazPYIXiQbNPMKCZ+GHi1A==
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22b69430257mr54475625ad.1.1744305790913;
        Thu, 10 Apr 2025 10:23:10 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.199.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccafa4sm33459025ad.235.2025.04.10.10.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:23:10 -0700 (PDT)
Message-ID: <bb5a6a55-14f9-a854-c8fd-e059d34e309f@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:53:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YYud70YwFWTzklWeta-IP5kQL8SjHUWP
X-Proofpoint-ORIG-GUID: YYud70YwFWTzklWeta-IP5kQL8SjHUWP
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f7fe80 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=wh/sLrVJ8DShde116VVCZg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gMk---j7fasVHRGPvsQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=722 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_102312_886059_CDF31934 
X-CRM114-Status: UNSURE (   8.79  )
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



On 4/9/2025 4:31 PM, Dan Carpenter wrote:
> If the user tries to write more than 32 bytes then it results in memory
> corruption.  Fortunately, this is debugfs so it's limitted to root users.
> 
> Fixes: 3f73c24f28b3 ("wifi: ath12k: Add support to enable debugfs_htt_stats")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the fix!

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

