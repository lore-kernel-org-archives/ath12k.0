Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D31C02181
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 18:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uJ52ubj7XfnuWc9JLHme1AuZ9nGUWqdoxinnTRr+PQ=; b=J6DE+648tl5ZE548+KBg+pysL5
	lFrk/R4ab2Nu/u/8ByULeTD9UwJ7KNoeFeRHA6tvlWzkesLOBtYomPIfOCoGlyokkcR1ZEJRfNPBO
	qrQkJ6TeRHEhgNY9Ps/z0v3mcKb5hXSzXQeeiornhlDKicYJ3suM+qnTyXcpSp5/SNLldZN4wPaNb
	eC06IDjsJ3AsVtBDiFGcDpbi+ulLQ6h4Dt3434hHi92ayixtc1vOERoVv061NdanYxOQIJyDcGDVJ
	BPX9sLCfTDZlb5ezmjrtPidSM8Ut+ILoThV7vmTMOfusFf+Uan436xijPrUhz7u6/C8zAOJVRkHAM
	Xj/HVyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafLU-0000000AyEg-0fdy
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 18:20:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tafKz-0000000AyDO-1yAB
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 18:20:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MFvWit008758
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 18:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uJ52ubj7XfnuWc9JLHme1AuZ9nGUWqdoxinnTRr+PQ=; b=l4X2nVc065Lf4ajZ
	RrOJKl2UVDfMyMHa4tkl/suhYj91+rv7y95TcNgqB3X/wuBWxJlR16ij1ZHW/Rhy
	HYttp4L6nlgeGemDE34SvMpBlxDzP8ri9mmRQVFanUBlALiv6x4SXP1N2ANAVXeA
	osYBXhchOk8hhFYW/rjPX4k9fjgMJt2cJBNLGR35ZdXOOWOiuZBLxUIhxUw5yC/U
	qSTRJxdsyZzWFtLhUFL1WgpuM9rEmdau8fb+SQph0HmX3EPidgoB6FR8FGHb77aU
	xcUeJTSQFH7frJ4MkjEsP8ZZp8rcwckWXfviD/ndccqko1IqJHAygdk2ob2D4mRy
	7V6/cA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44b3ry8bt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 18:20:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f46b7851fcso275780a91.1
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 10:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737570023; x=1738174823;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+uJ52ubj7XfnuWc9JLHme1AuZ9nGUWqdoxinnTRr+PQ=;
        b=rlpPwXyZB9VRpE1k/viushjVx0qG4ccaY9QWTHtZPyPuo/DL9lMMzABw+qUsDQDkJe
         725jw7CRnlrbuIymoZfH/KknBvTx06bG8jxB0D2e6xO7IckylSCLsCO/+Jp9Wp6W4nXe
         VkV7Vy+Fokj21ndnSwcNxUfyLwFnFmDAp/91v6OA3m4QKYQ1sk4GT2RkEtjVO2bKmMeD
         VVYMMB9/8x2EiSMTkkE8G4loTsVHJOEuL6C80qVxXqGDvIFVHrLxaV3CRPrG3Yi6OnC/
         1yl+V3lq9hX9cK64wB4MmXL6IG1MAy7jqArRMq071pjIlyGbTqNYefwB9w7Ru4S9keSB
         liSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSoz+kzxhi20EaaPLHxpyEas0h/UIkUkFRCz5uW6c/OBZ63ZaEh2KoiP5TBQ6O6EQPSE4ww7A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyssm1izc8J4uJEkOb0uSJorO4akhHlb2lM7Fh6J23oIKL5yUoN
	SvtQRqx8b+a4c/zQhGu5HmC32A5zh5wugcn37zbK72Vfg8/GTruIl9J78e5OigbVzM3s0bIPKR2
	L/qeRmAGVXsZSaStdBSFdcwdw40hMV+PmfXd/77UgnzET/zEd0jJw45a7O16ue1ykpXRR
X-Gm-Gg: ASbGncvx4HTzQrhuxMyQ67rsmNfShikdH/vAQpUTY+nteme2Ru+56tVp1lGaauDZ0se
	2pjMkQxrMpK0VszuL9jyICVhbl4uVUrK97G/alI2TAS2uoHUHsS8p7p8bgDbAeZ7BAXqqEoTiV5
	T9fr2w4UDHCcQfCraOB58UQ9M6SGFrQseNYWpRQlVUgoFe7zsnm6UsttFJrIJaLwwnR1xdSPgGA
	yw5HP4Je1nUqoISRbwUpvInLCr6DVgnWauTPwp17gAxjHYxjQbQvxG4eIXZlh1V7wNyJVWLRB0G
	R5TnVHzPVCYbs1va6vhctPOhZrfM7FZJsNoRVSjz+Gpr3fflm1A2SWSMQ/1Wels=
X-Received: by 2002:a17:90b:5201:b0:2ee:d797:40a4 with SMTP id 98e67ed59e1d1-2f782c70204mr32798372a91.8.1737570022929;
        Wed, 22 Jan 2025 10:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbV08zfYZrDeHkqmHseq+n+WM7WC0S7sRRhwWpTsgEUq3IreARUrYMbEj7IzJknYm3ZFHFsg==
X-Received: by 2002:a17:90b:5201:b0:2ee:d797:40a4 with SMTP id 98e67ed59e1d1-2f782c70204mr32798342a91.8.1737570022550;
        Wed, 22 Jan 2025 10:20:22 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6abee96sm2006077a91.31.2025.01.22.10.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 10:20:22 -0800 (PST)
Message-ID: <d0dfce80-3e57-4efe-8552-b18bae9e9437@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 10:20:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx error
 path
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250122160112.3234558-1-nico.escande@gmail.com>
 <101c0824-1c0d-4e5f-bb4c-7d6ef65f1698@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <101c0824-1c0d-4e5f-bb4c-7d6ef65f1698@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3GoOPIbA2U07vmIOlXpV017sbmUyOX1S
X-Proofpoint-GUID: 3GoOPIbA2U07vmIOlXpV017sbmUyOX1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_08,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 mlxlogscore=948 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_102025_534886_38243042 
X-CRM114-Status: GOOD (  11.96  )
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

On 1/22/2025 8:46 AM, Aditya Kumar Singh wrote:
> On 1/22/25 21:31, Nicolas Escande wrote:
>> When vlan support was added, we missed that when
>> ath12k_dp_prepare_htt_metadata returns an error we also need to free the
> 
> nit: Always refer function name with () for clarity.
> 
>> skb holding the metadata before going on with the cleanup process.
>> Compile tested only.
>>
>> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>> ---
> 
> If there's going to be a new version please take care of above nit 
> comment. Otherwise -
> 
> Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> 

I'll fixup () in both subject and description

