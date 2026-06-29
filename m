Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33860C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 02:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1KKM8fMshXRyPEZczpywDmW73CgGmBCjoqY13XiGxM=; b=VfCjfNfcR1TWOW31VxslvVpUHu
	sATnEj7G79qTLGqzJhQzkCbHzzDFlH5KfGqpQ/8GGG+9Nw8kwGrZTHB8fIJcKOgf8hL5Jwu6g98Fv
	rrHPTZ+XmfzdRInJHBTC/S5PGUg2CqTidzxc/5R49pkJXIvb3QuN+GtlnQpjvv/uDJkLUFuelcCec
	uW+5G14G3mYXVq1fCpYxEiMjY0HgK3Df+ns9a/xzRRijwqx2YTvbJ/Jl5vp4U+/Nx91x7501R8Q6b
	SeQYGbpOhA0PNnEwHCfZf4k851vff7l0q3JFhEclklILnOsCof/l2RR29xmF1jECDXhkB/O0r+HVM
	h6ymCnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1fo-0000000DZuu-3wUR;
	Mon, 29 Jun 2026 02:24:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1fm-0000000DZuV-3xHw
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 02:24:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM8xrR975828
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s1KKM8fMshXRyPEZczpywDmW73CgGmBCjoqY13XiGxM=; b=KVt0bMgDIVEVGZo1
	cpBvP8U5FayJJIPFi4yeRaLmb+qeuxDM5lYnfiWAFqVXarbPchzBX/tOdK2snIIP
	GUS9MbeR+GrvxF4fs323gPP4k7++MyXfnM4OdmKxWVAhjcmJZP5z2fNlrALEGxd+
	4xv8afSlLoTaq5g5lHc0xTyJiUobjPckJVLpgLc82EDE0ICPOcVpRNpyAipB93VH
	lqbkAAtPbX9/rYbmVvAZWKVAoNPTw275lHFvS+Lv7y8tJtPGfHd8uU72W7GBwuAr
	/GbyVJoCNx6dchIAHzrc7CzY/Daoe7OAHhOIMP7oqsFAGHfXbr5d5DECnJoqK0tx
	NZr1bQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a4589-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 02:24:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845bc2e658aso2001866b3a.3
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 19:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782699873; x=1783304673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1KKM8fMshXRyPEZczpywDmW73CgGmBCjoqY13XiGxM=;
        b=kxufhIGgDGLYei0yiuoS3CKRn35OtnSCc1CYtfln64p60IQwOxbK/gUb4N/fwt/cfC
         vtIc2eRi4/VjHXbY1sMhTuZ1u/wzLqX4PhSSYXFkfZ7tqAfVSSeA8Ok9zEdRzPzEbcfE
         mIh3mnd5Ox6cn+TF2iZSrkdZgBQGqVBvsSsoSouguM01gF9GlJc2ZOMqO2Dc+UjDRiEL
         hDTm2/VQ968EFO9rmzOEV/TZfB6+aXK7CrvgNuqvK55ZNUBkWVxbghe8KxXChMNG9AGA
         k3WzXvn+QXGKmIFq2VpBIaFPczEevVk22B9C8rI+OnnfJUuf+1lCe1c6HO5z++Mw2BjF
         FxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782699873; x=1783304673;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1KKM8fMshXRyPEZczpywDmW73CgGmBCjoqY13XiGxM=;
        b=T7wiIxv/zJwc3hz5IdaXTmEqZNPSiHWPm8kB8Au9HbYt1d2gFr1mb6Uscja6sY3USl
         P4hRhavNJZhM6bm+RYPWqgaq9MzQ+9g1KXkhpa2XO/mSmgZCpx3DAYtYcQvB1u5JY4V+
         uA/KR7QwRcLxNm9ktLVATEMCihwkTRA3sBsILoUwwDVk7B1iuSF7SbQRmUfYLZHiaP/1
         C2iY/dP2w8itPGfxAU/WHBXoMwawv1TgCck1/nPAFYE6TkgrMOWtB0KsW5ZfRrbalmEO
         JV7iQsRsc4GY3T0WsC4BRnG+oaVmJ6ewcl5nteqKOZwIX4XqfaRdOpg5pHEQk4B4VFj1
         MPSA==
X-Forwarded-Encrypted: i=1; AHgh+RqoaduG4osAtqbgotQn1Kt6lGPvFZ9cy63Eb6JYJiCRBbrGLW4+FokuY0I75tTlt1w3iMqrdvY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6h3sHFAUuTpiA68949qxjxoJNoz7CrfzOLpDqtdfZeTKl2M33
	1XVWS0r4FhIzwkyhMor+KGJ6dItqgffOa8q8w7yfmKRzpldDY0uMVGl1GkZZ74oRGQF7hPXrZc8
	mW0UierJp07HGjP4las/CeM/jnVmJuXX8FK3bdawDoT8piAQz7zSETaLkFWKaUi2d
X-Gm-Gg: AfdE7ckhD1dj1ypgbFOYyZAG4Wk4pQO8MVDR/bzk3Wn+24p29TbGEZiQEKpwDSZCWKq
	GinJYB/RJnEbwxeEVZIwtk6lbes3lSVeaR/OeVUEG1rIhenK8aQpfa7TyDqPAtPi4fqUYKkW0ce
	OQtxbIBgh+YKLxZ4N3vkOGAELnAlmd2nkID8FSLIC9fuqMaQn06rUqrdl+8da5YSkkJer8uLh0K
	0trcA51uALwKwp5gltkejiHJTggDi6DdPwx8CzdY+go2cXehhXDS+QRfL+B7+RTrt250kIHDb1V
	zEFbb6KJQ8PyRNN0EXN+XEKJg/wxq5+DqOVR+f1M4xbUela9LF3nh8BnHA8W6kmS6dtRWqAFfro
	+9JunHjQdD5tr9c4RJqOJ1d9W6qqgDKO+313ZN8sZaa4U5X9q2vDV6qqwUSkI77wDfzzUo/QBLN
	aSxlpgyg==
X-Received: by 2002:a05:6a00:400d:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-845e1a31c43mr4488920b3a.52.1782699872806;
        Sun, 28 Jun 2026 19:24:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:400d:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-845e1a31c43mr4488909b3a.52.1782699872341;
        Sun, 28 Jun 2026 19:24:32 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm11383976b3a.36.2026.06.28.19.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:24:32 -0700 (PDT)
Message-ID: <68b96ba9-bb13-48c3-9c57-7bd8ba80f053@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:24:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260626084327.2022076-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxOSBTYWx0ZWRfX6Gt4mzxf79z0
 i/dRLRkvBWSzLgzYpuS+UWBZaVUZOWRe1KrBbPi+QiwM8qUV5KpZELNPh983d7XvcWHxXJr7JfM
 Y+wXhWS6ooP3A/J4HY8VoZbXoaaLAnq5k3Te0bGI77fZsRqdORvlBjuO1qJCJclykmY9d9owGsz
 ZZjhnKNRr1TfLNkbVPWqCP97N6ErkTOjDTL8B0fUqf4rVs3I8Q0Ic9l9v3kHue+epjiCsh3elX2
 JoXmDOmf2smiFakQEnqkY6bBCCpWePOlEDp1fIqPpaT0SP4Tq/iJRnpJPTpLsI29m1gaaurWjcZ
 VlxQ8Bzc07hJnjxFp8FUEQwVmviq3aG9mIl6RKDoumfiekGZnoeRard7ukJuBydqEUPUVKPpgse
 qZzc1Y/akOKj+cb5Ifw2zLql7huHs+kDD2w0jy1A3X1ZEKpU4zlnNAodAEPH7QVlY90V3jFVY7K
 e+ix6yChVtu/rGNh4rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxOSBTYWx0ZWRfX1h7s609KSr1P
 GU9xrNipw4J1+LJmbRw0DjtPEWd+tbm+q7uY7o6uZRhmM/abXKGEnpwuuX0sFC8sStBCyFBGhr5
 gglJwDQN6OjfQEMgJFLzGLhwETtPUic=
X-Proofpoint-GUID: TPAIhvdTi8zJQS6LtOR8SjJ_GmkBX65h
X-Proofpoint-ORIG-GUID: TPAIhvdTi8zJQS6LtOR8SjJ_GmkBX65h
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a41d761 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vXOABIWjEGlRoqXTTScA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_192434_994356_E75902BE 
X-CRM114-Status: GOOD (  13.05  )
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



On 6/26/2026 4:43 PM, Aaradhana Sahu wrote:
> On AHB platforms, firmware operates in two modes: fixed-memory mode where
> firmware uses hardcoded addresses for memory regions such as BDF and does
> not request HOST_DDR memory from the host, and dynamic-memory mode where
> firmware expects the host to provide memory addresses including HOST_DDR
> after the Q6 read-only region and relies on host allocation for all memory
> types.
> 
> Introduce QMI capability negotiation to support both modes. Add a new QMI
> PHY capability flag dynamic_ddr_support which is advertised by firmware to
> indicate it supports dynamic memory mode. When the host detects this
> capability, set the dynamic_mem_support flag in the host capability message
> to signal the host is ready to provide dynamic memory allocation. This
> triggers firmware to send the HOST_DDR memory request and use the
> host-provided address.
> 
> For backward compatibility, if firmware doesn't advertise
> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
> where firmware uses predefined addresses.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


