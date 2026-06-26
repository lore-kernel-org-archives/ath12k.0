Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D9BCDE008
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 01:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fnTORMJ4QuIpYyYVwuCu2i5cmixAmlTRDVih0/eoO8=; b=seiS3ZX+pA7iu+4aD0DqDQLdJy
	N4ud+DE4/DryyzAiMTBc1gX5fweAeHDsd4cpBS/tRhY9oQ5F3H1IDUGGA7EIsaP7JAkj6PuMFf0lq
	/SH2cE9pUU72VejPrFJk0UDLw/CV+m/hKqjtjwNg8Yxoh8oTUWZRUciZ+vmJ0cOBraG8K5Qm6rcff
	RIFF4NQSulC+VLJpTRlca5970xVTr1aojxqawgFjsuS2Rs6AWp1UydDFGoe9Jtfjt4Io2KQKlgwn2
	akKETxN7INYkEWTFDkBF4iXpfWXOCki8OK3QYx6f2OUUFYHnmtjXO1myodt7uO3QWCIUXab5jc/IZ
	eGYqY4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvb7-0000000A9kX-2gr7;
	Fri, 26 Jun 2026 01:43:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcvb4-0000000A9jy-3Ufj
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 01:43:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q18NrM3469860
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/fnTORMJ4QuIpYyYVwuCu2i5cmixAmlTRDVih0/eoO8=; b=IVQBBfkBrhnjc5RC
	Oikyg9/YgEqcoA125TXX1n/ql2obGcg8uCAsYn2bg6HujRg70p+Aq6cMkoh81Ngd
	o8eO9nXuahcN8nHorhCG5Yqzw6UOVHqp08ZWWDgziLZsfTdN08wWP4MCQmdnROuC
	Y/MOn0FMbg0bPihs44Se4gwNVkI6jjjQqJYnE4oPtn0UUn7OlSXZr21IUrzwwlOU
	DyiHdmvwxPkCQWySXyXLLxZsCFyEKYZN0/35v0Sc4G7R6XhP6xh7Edqx73+mqfql
	QzK7W/WBckTSTDVjxUZPX3C0F6TA/K2hMzn5tRNKoLgcpvGnTmdqUPV1BhyN03cD
	du25pQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdr31g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:43:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so241982a12.1
        for <ath12k@lists.infradead.org>; Thu, 25 Jun 2026 18:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782438189; x=1783042989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fnTORMJ4QuIpYyYVwuCu2i5cmixAmlTRDVih0/eoO8=;
        b=VrBhlQRa1BSh6p0nT3UZbLYyEI1cXZnndS7GWZ/tNCMPWW8e7csHqtO5sJY3XJv7i9
         WOWJIAYh9aGw+Knwh1nenY6WQeB7DVz6xq6g25jKlHBnfrIdkdOPkOl2uNFG3MMXMQOg
         SUSWkV1Eb8iyRWGD+QEeVnYSwr50Lw2OtJC/s20w+NHxcfqyT7hwYBEtHj1beOHC5DLe
         vNZqxmbouJPPsmNLyAManLM9YuMYTR1molMBR4rXqe730ss5PTxxx8HyYOznWlyxr3Hd
         +uCC1RR6pvzp8vVukqzPxHWsTUmCVxgXS9WRDP2IyJ4GBEpzVzaSksgjbwSf7sJl8k18
         amvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782438189; x=1783042989;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fnTORMJ4QuIpYyYVwuCu2i5cmixAmlTRDVih0/eoO8=;
        b=Af2FHprvfFwi81SlDc6faZPhrhO2RMB6O5+yLDHtx2rl7u0Y5Qu9EVQV0i1GSZ/QL8
         Qgm5oA1SYuKZ1gn9nZhnknYjpxfbc/qNkDSnH3CldmJsdjFGLLewvX78DPbcTbwxuz7C
         rQwOnL0Zh0zTl3dZPEkpz13Ryn6G1M81oDF/Uj3ZAaVwFQXZduuGnjBb5AlWHFNIWpWs
         V0E1uE03ezcRXbidQ6CQ1HBx8gsPv1LOluXWYKX+7FcJ9XAzkekBoLnHchOF5AAUBooq
         MsFasZs+FqtmItMLjM5Ha9sVpUHGhIAKmDG4W+73kApWapqyvJ1QR6snQH4pf2zA4ZNk
         DrUA==
X-Forwarded-Encrypted: i=1; AFNElJ8fvMbQIm63/ry/mcOqLckDLiSB3PpiYPZP7JHUAqwtv77Nbpe0i2FFVv8VS7waEIKqxrhl45o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfMNc9Y1PPbbLcyDYpmya0s5tb3nfCPowaTmwrEzBHWawisL3f
	DfxeRdnOcYh4NS4y8Av2JlEuGxRXJbBWygzXxljmrFbDJTwMnvzC8MDkKiCCSM1rlaOr2bY8BZ9
	JhxXhj6nGBKtszwgF7QnrwKP/dnfCUTgwb3l/anRerDnbXHp1s0TkqnJWcZY5bj9M
X-Gm-Gg: AfdE7cmk4uo2hEPBcTmHaoOLlTIUn3cy0YDTVSyLZ6hoNyl/Wn5fvIatCg2hRhLouyW
	Q2wxIOO+U3oAhGLlLRZPRmnh0bjhZyI5yn/4nzI96+3NCiChm++YlNjE/kG33Z6rCgxPcemoUwN
	VJ8h7otpl+/cc/RcpYZ1Al208UkcFS9S9GIc4ZQFkHsw/uTJtyDktGXQHZTNeN+HVVMVayv7R2d
	mpauN/YsFyDfC9mcsEx8L8nSZaONC+854h+OXJjvBdmihBbDQbbOO9Dg6xd8xYGmwlMtIadVb6d
	EG213p9WTk8NP9WhHuTlKqoyHJnRKgtRj+VmkuTBJWwm3vnwNgO0Kjfpbumv33CHldEaP8fM0g9
	b6NVKEBdjsa5kEAK3bGMyDjdZfPOl+dXJ+UUtJV/FepaU2rhlJbpAXgiRAkfs5dxwNrxw3158ce
	gD8Zzy21Q=
X-Received: by 2002:a05:6a21:4516:b0:3b2:86cb:929e with SMTP id adf61e73a8af0-3bd4b30f107mr5593986637.46.1782438189165;
        Thu, 25 Jun 2026 18:43:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:4516:b0:3b2:86cb:929e with SMTP id adf61e73a8af0-3bd4b30f107mr5593951637.46.1782438188433;
        Thu, 25 Jun 2026 18:43:08 -0700 (PDT)
Received: from [10.133.33.10] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b96ec739sm2522045a12.2.2026.06.25.18.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 18:43:07 -0700 (PDT)
Message-ID: <9077bc04-9117-47ac-a3cb-a17baee4d4e7@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 09:43:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: advertise ieee_link_id in vdev
 start MLO params
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>,
        Karthik M <karthik.m@oss.qualcomm.com>
References: <20260623-ieee_link_id-v2-1-8a89d71baf58@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623-ieee_link_id-v2-1-8a89d71baf58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3dd92d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yCQnc_su61O_ujFCQIoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAxMSBTYWx0ZWRfXwwPHVOHYAyuY
 1D/sdeDAsY/w8GfQ+ZK/QVCjfVS6749KU+J7xEqPoOxjB4qZPujEw7VkVUGW3IxBS2cEx2BoRVP
 ZZr60RT/oV2A9IQffPzaFtzXA37lrNnjGSlnZkHKsmVeRxQWa5Rd1KKwwzSYPTVCzx8W4hkAn+g
 CDa07GBdiLYvwJSvVjtp1qiy1p28mKTCVv5z4vgEIO+vXCsqI+732kMt8T/R22eeNICgbKCyWq3
 ApdZpUZJu0fM6u6djixsO8j2clbfGqweOtLCHySwopFNhtaau+rNxqncPHuPozqhMI1Fxl7rZY6
 cKHLMeQoHa9sk84ywp1eksi9qyXQ/40GYXDF0j/6CNOOgnQ5h0ePART7BrBWmmrJiVjyXm1MFlX
 Oakkp35GUVOeD10zMbMZYXUz48reKryw8SthGnrbcUZCnVbBVYT0a+iU8VS55Vvo5U2xRAM3IE2
 W22C0uWdS7T/JelqX2w==
X-Proofpoint-ORIG-GUID: FIN2jvoHLyla5jhVIZQedEGiETn1r20e
X-Proofpoint-GUID: FIN2jvoHLyla5jhVIZQedEGiETn1r20e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAxMSBTYWx0ZWRfX7kMYH01s0wKg
 PDqpU9JKQBii61WpD84ZqXxjOIVit3OQiEcdCDjwinQMSehWWD6EEpqWzSOBrvbfyM49z8FOHv7
 X5ZC9PfS5hDhxuO4WHp9noIygz8OllE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_184310_895467_3D65CB4F 
X-CRM114-Status: GOOD (  14.70  )
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



On 6/23/2026 1:46 PM, Manish Dharanenthiran wrote:
> Firmware builds the AP MLD partner profile from the hw_link_id passed in
> the vdev start parameters. However, hw_link_id is not always the same as
> the logical per-MLD ieee_link_id, since ieee_link_id is assigned per MLD
> and not per pdev.
> 
> This matters in mixed MLO and SLO setups. For example:
> 
>   MLD 1 - 5 GHz + 6 GHz (2-link MLO): ieee_link_id 0 and 1
>   MLD 2 - 6 GHz only    (1-link SLO): ieee_link_id 0
>   MLD 3 - 5 GHz only    (1-link SLO): ieee_link_id 0
> 
> The same physical 6 GHz radio can use ieee_link_id 1 for one
> MLD and ieee_link_id 0 for another. Pass the correct ieee_link_id to
> firmware so it can build accurate per-STA profile elements.
> 
> Add ieee_link_id to wmi_vdev_start_mlo_params for the self link and to
> wmi_partner_link_info for each partner link. Populate these fields in
> ath12k_mac_mlo_get_vdev_args() from the corresponding vdev link_id
> before encoding the WMI command.
> 
> Introduce two new flags in ML params to indicate to firmware when
> the new fields are valid:
> 
>   ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID         BIT(18) for the self link
>   ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER BIT(19) for partner links
> 
> Firmware parses ieee_link_id only when the matching flag is set.
> 
> Also fix the debug message by using correct format specifiers and host-endian
> values instead of __le32 values.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
> Signed-off-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
> Co-developed-by: Karthik M <karthik.m@oss.qualcomm.com>
> Signed-off-by: Karthik M <karthik.m@oss.qualcomm.com>
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

