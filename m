Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F40C531D0
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52Rspb8/zqF+k+WcUxUJBPO6BuLBlYwUBpwGih//88Y=; b=FBs4IenKoRwoTv94Kw5f9M5Mck
	atPJUhjpZUEpo8cIV8YGlva6Vve1RL4I5X8yk9ahNNGY2OnTa/jp1w7CNL/k2dOG6lAo9hP/uaqN6
	CL3Hgm/RWNhWPxtdl16NXcvu5K7nwq2tAK/yEh0tOvJ0jYV78fGMp6wwtOUhx19poL+YD/qloNfld
	vSJLMA7RLL/4jmxxC7OH/HtOrPw7mdOIOtH0VgO7v+GBahERPMcILSkTvU6rBZGYRjECVYDFPiMqO
	G9fWNTjH8fLN8Z40HhBORl5J7mOaHM/HwwVHlo8WW30d5y/v+ihT7L2NcQ+J09pWJypnb0+m+9EFQ
	WRn63BfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDmf-00000001xlc-2HyY;
	Mon, 27 Jul 2026 05:21:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woDma-00000001xlH-0wUO
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 05:21:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g4Nx1768800
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 05:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52Rspb8/zqF+k+WcUxUJBPO6BuLBlYwUBpwGih//88Y=; b=CQYKOLl3K60gTh6R
	XfhEzk8YPaMyisJpFyLkeJZo5NPaxw6sSvdFq1SjrTg1spBCAfbw3n697cNkITzv
	YFR+jzFx5/vh+9Ze1ZoE9Q7rtI/YIDs4rG9JZ5AjETO4JSq5GYS/b120hNJicqp5
	86J11s+3AKzine6z21wSGlsJPdx70PB2Hz3KFBqvU8blpr4AmiXeXWedtYEPkod8
	2wRLKnIDOUzUMjdhrYIgRyK/CP9E0dKbpVC+BtRiXnSLr2HpHZWS/m5BAlkN+ZzT
	8u4pDE1zOvAB1P8wpRkgPkOUcy6jWAykQ2RzIE2uG9FB5Si3zCFHoo27XfdKBTVi
	ZJeJEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajmcpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 05:21:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cccfa32670so30739245ad.2
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 22:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785129702; x=1785734502; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=52Rspb8/zqF+k+WcUxUJBPO6BuLBlYwUBpwGih//88Y=;
        b=Ea2FxwhjzB1HjPmL90hpdmhR0poPFqoNBcOp8AzoD7l0ellzbzV58i5WLxViFs2F5m
         h3ihSFdysL1i2g5HdZQKxkdBDYogx7xAmCB371UZluh/ZbPWJ63coYyzid3gn0Ynp0o2
         9VYSB7k+ztXb/qwUnve6Ugx1VmyHlC2Vai6x6jwPZPFMPDjVdox3R9jhJkxtPkUhnljF
         TmeFeEZ2R690Gu3Ynrz9a+cYoJ+EgP9uJLIs1m0CTeb2i2UvD97w414MqA+t4/Ps0OSJ
         QCNOMuWW0bZr1ja4IZCUCs+o9xOletiKATKzy5ZRBLZ2XgFgrYLvSXq4RSSfrzYJGb+p
         EX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785129702; x=1785734502;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52Rspb8/zqF+k+WcUxUJBPO6BuLBlYwUBpwGih//88Y=;
        b=JCOP+VR5Q/1EhMIYuA9zM4bQO7pNnWzYyJ6dOVpwN9ZULUbmvbuuKyPGKqoiG9TZRV
         5D6AW+fi1N9140qji1XBwQPcMx/HksHoq7Qt29TUh5W7ZbXV1ewiDTsaW0a6XyYQuett
         uKw0d1A2qsU2yxNEvA8GxPxXZ5NZzsJeI5ECkfiRi7UMUzt5l0Km/VEhnpjBVctXjqA7
         sdvxKXhP93GPUh4TTj1CUS/itARC93SMA3gIkWurARwq+LzLFw3jnTg0fn/DejpfB2Dd
         GpvKrZr1P5ku7uTGPCEEEnfeoO0sIt2c6OoG64Tkt4U8loTY41R68gZ7QPxnFi0CogeO
         XlNA==
X-Gm-Message-State: AOJu0YzPypYnIrQv5TEjFk5Tjf9NxmZ2uPuHlzZAOZJCs3Mv/rKKrlr9
	6cNg6Hmg4xa+XSKB+uXQseAPWFUBqsBb7DnsKUpC+VmvIA682TVfgS15gcmw5g6k4gyM2eRejh1
	V9p3jblMIAdnj5xGfJmHJhrDEKNSSo3vqMwMSyuM4OnSKR45b/NeqdRUsshwJ8ZLR
X-Gm-Gg: AR+sD13pqnSA8UzYOIwwvOT/AUJCNZ+IJJHC2fq0y4LGn8KbLbJ/oU/2kR75Q3W6Trv
	DSQplo3jKgtqwhqJGwCP1CyVVQXrxjEwBw+dwBCSBcvnSm86smD3wjIMYGvf5L43yg7hCIg2Vm5
	DSacgvZopxHclbNsuKYZAw1Hw7FZOFM3KTjq9qONVw8LaJXqkiWXaP8yMkwGa0OQBj3PsvWf6Eu
	FhSUix3XFa8LEhNkM9hth8AkXNf31Owy5aMDaPlcKrGQOMffLbQ/TQd5iX3IUNvEE2iWEEMNXKK
	bww+HZWga9iLz9IcmPxka1MvqpMw17UTVgE0Lhsbg0OlV8L0KUvU18GFfk6lvyvtj8O0XWr5956
	hbyrQybN37GAGvSzEVTmSCk0B3Moavxc=
X-Received: by 2002:a17:902:d54f:b0:2ca:6c8:abde with SMTP id d9443c01a7336-2cfde7bd7f9mr64976435ad.18.1785129702630;
        Sun, 26 Jul 2026 22:21:42 -0700 (PDT)
X-Received: by 2002:a17:902:d54f:b0:2ca:6c8:abde with SMTP id d9443c01a7336-2cfde7bd7f9mr64976205ad.18.1785129702254;
        Sun, 26 Jul 2026 22:21:42 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f4a05sm27942455ad.68.2026.07.26.22.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 22:21:41 -0700 (PDT)
Message-ID: <8f87bb32-b67b-4e9c-9ee6-15d7c18308e7@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 13:21:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: validate TLV length in
 process_tpc_stats()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260726-ath12k_wmi_process_tpc_stats-len-check-v1-1-c4ba2f84d9c6@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726-ath12k_wmi_process_tpc_stats-len-check-v1-1-c4ba2f84d9c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J5J1uyWL5SsVWtvHY1_QhLNDBGrPuiqw
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a66eae7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Gn2NXTlqVLSkllhtcaUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: J5J1uyWL5SsVWtvHY1_QhLNDBGrPuiqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1MCBTYWx0ZWRfX3GeyE2zX9aG0
 BHmn9RKuAfR8tPkImRb9J58FklHY+IWbLTNFKGWentaEG+agan1Rlr1cXjSBrFm+SfioDI8T7xQ
 WgKfpHq7TtCpvVRIgIvkr+TknKtZq4dTEgX9lYucmmXuH2lB1emkUzJDMwRGbLOljdEgxpmLBm8
 inSGAczuQabHzH8yG/p6N5+ee4MxhoXn8QihWwKXpFm3n42gZb5bZvQCJ1ZDLN1nfXfYxHwSloI
 MV7/KL2vwiaToTeKuL5zYgbeL9KazECMqeetY03IgNUTIzcX5J/y4B5kC/OjreqPm4CGCEm71O5
 9TQjCPPoLiLnMLOLWMWd8Sk0DuefKLQtwLkRI2kDfCrsKZa0YcG5I65Y5jxWqcETjaDdQDiqLVe
 MZv54pPsKE1m8r+PIzx6G383hcKHV1eHoh+hIGaT9dCZU/2VK1Wphe4XldMkSbYSW6uAStOcGtP
 iulF21fmWKSusQiTGzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1MCBTYWx0ZWRfXy/mYMKWnz1DQ
 KkW0h2pEUAS2i8ieqB39P7nEjU71j/Q7NWoJ/c2IHuoV4giJ2osHXPSWAuP9kEWYNH+2JRpKVUD
 cf2sbqbKgnMVD1zSpLTjd3H7U9zWriQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_222144_305802_3C48F190 
X-CRM114-Status: GOOD (  10.62  )
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



On 7/27/2026 7:02 AM, Jeff Johnson wrote:
> The outer skb->len guard only confirms the SKB is large enough
> to hold the full fixed_param struct, but the TLV's own WMI_TLV_LEN
> field is never checked. Firmware advertising a TLV length shorter
> than sizeof(*fixed_param) causes reads of pdev_id and event_count
> beyond the declared TLV payload.
> 
> Add a check that the TLV length is at least sizeof(*fixed_param)
> before casting and dereferencing the pointer.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

