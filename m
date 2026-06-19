Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9181DCD4F26
	for <ath12k@archiver.kernel.org>; Fri, 19 Jun 2026 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvV4yIxaCHiXp08Y1cQIj1hDP306eANdh7HRG2sQqZo=; b=q/q58dPS9Kc5K4mee95SJEYt6+
	/cA+Gg9lQbg+6YB2EsfeiRjKv5KLHjT5Ncl1IYcriQ8jdi+6p22yMdHpmSGEHB4/iuMTCSqQ3KgfC
	S2vc8j4GYFaCYOqBkHAjQOutJ66UALgYjtaPPGOVZcV0l7d2c3k9wGtloB7GXPuSmKKTgQRLG1Qwb
	L0Qf/zj7pFVlQWkZ+++B+Pus6ExHLsH+phewQrtbefuSKMWRW4XMEogIQAkGDfKr6NOn+GpDIrh97
	7I0swlGzKf+9PTHUYpwuQOBWuA/TyRQEAXnU1fG0s4F/UpuKtv8/lIey7/1lTNnFyPJxgfePzDRis
	7SokvsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadx1-00000002rp1-0PDj;
	Fri, 19 Jun 2026 18:28:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadwy-00000002rog-29wh
	for ath12k@lists.infradead.org;
	Fri, 19 Jun 2026 18:28:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHSZKe2417933
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 18:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvV4yIxaCHiXp08Y1cQIj1hDP306eANdh7HRG2sQqZo=; b=RcFqebM4SivsXGHn
	8wG5nVZSA2+Vvm+SCRa29tE5EOv0sseJm0pLeWRDuRcfnlRNLL5SYRMwVn1d4SYv
	HN4oXSvK1Q/Ha5ZYUuwAtu7MSlA63EfCMsC+nIurYCxoXZKGYmoKLwJ2yB69Ksf1
	4WY01h/c7035gKEYx5fXzLQLbMYNyszJk/wNuUlMYFyWvXlZRfg7co57QsF2O0/G
	NlfwA3mQ/4zXQxG3Hne5vPbZ/5Qzj3KJZd3MtJF6HNzlFjUUUJJXEv8ZPRSQOdxn
	8fvpnDuOJ+JMG5ZTsPSDVvmDOFTqdm66IfgtP3WiZmA5wVvPBtYoK1TTqs4O66XO
	dm03KA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5qs9a5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 18:28:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1dece2ecso25485805ad.1
        for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781893698; x=1782498498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SvV4yIxaCHiXp08Y1cQIj1hDP306eANdh7HRG2sQqZo=;
        b=dM69kuoCDNlEIMLf2wSv5f8zEcWz9NkEnzpOnwsjMIgkGQfOfRCiyb+3a9ikcvqPuM
         uU0sD89B7I7Kvsl82XJ+4laoWhlessUdHKeGceMeKmeShX/3LcBOfWqA2mUfylR8ynCk
         7YDCbyxbOwQyYFF3rKL68zqseFP9i1+5dzU0ItZe2u9eR8dF6ydcdHLnkG5uTWEw/9CQ
         0Cw0g+oMRkUwIErFnBXYkx7neOx6lAdNN9qIi9f9CbBGPNEFlxnAumYaRVKEN7WMADVk
         lm6h+zWPTL/mnOdDT+3qo3bbVEYaaOpB0GeNDohB8qcKBwFq+08AQAiCsHba49GQVY9w
         6zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781893698; x=1782498498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvV4yIxaCHiXp08Y1cQIj1hDP306eANdh7HRG2sQqZo=;
        b=PeDahgOVahAHyh2FjJkkdYhIB0K3rkdPk5rFDArlT31HrMGXhOzBjr9DvPpYvHMimi
         vo3pvQlhwu+emM9Yc3M0cisQyYivaBXmwST2LV9p4Mw7h5QrQevnzdbVWO8wYCTm1iMN
         c13zpRVSSAuKKNndUGkG84HwZvCuPVF1vkM3nztwf5p1VOYeyt5abTfy38J6phFnhqP0
         Y5sYuZmqQ09ZNX9W87cZNPLj8UcHnE+9b+vF2PsvpnTmXaAo290vddJVwN9aAtrIsUYq
         cRPKcxhw6LeQLmWk2E/pBiFsX6I43GnQ0OaO2NtI5tn6ephSA/ht1w/b6AAVqqaSZ94/
         c6fw==
X-Forwarded-Encrypted: i=1; AFNElJ88RzF32G/SsofEot/TkKagmn9Myg2El25GkbefQxJdTEAGdwxbuPfgArpJNzHQxTWnlLklqwU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKN08YwPgM+BfjqzJkLQ+F/aVIlEhdKqp5sV8IaHXfUskOUzEj
	ktGfKm3vMLtd6HOeBJoDKf4wn6hBCwN8abJKMYOfASJjMc47f1I4FCD3FXj2WbCNOqbnqvXHt5C
	arGEt6yRAitN6K/u+yURb4Aa4Q237MYnOOyjWlePKHDnqBMj7u+LhdFnLCVRBZsVj
X-Gm-Gg: AfdE7clUkmBq0S/tGTeQ1xmfIqxf1b4fudG5d8VVb2oR/lBxpfiDWG77q1ykFfhCkxj
	jUV5pwixI3U8giQnlbGdPslLAhF78/u6wRWOzgTNkoIWasJvXjsOj0DQIiS5xem2Hs4biJfSJby
	U57fikm44o3ozjOnRi0zJ3xmlX5A1/5o2oqkyLLNISNXWjjrQxr1/s6MCb5pJXi/wFEax8QtMVY
	im34NlcI+H+2djYAAU4UBmAwenUZTQNNlKq2stYEi0yoTJrXXzE/dIxSqvGXnjBOQXnXn5Acj6n
	ysakK8LN0YCrdOwIeh2zg2jQUTySqYCios0xmGFkHUvjlinq0MR5DSF5AyNglSxAfPT5Wgd30qU
	OheoAGShsKSF19LW6LTIiyCP545hJXtzMzjq5GDKsvUyOONiiUfn9CYk=
X-Received: by 2002:a17:902:e80c:b0:2be:fefc:d5b9 with SMTP id d9443c01a7336-2c718f1f1fcmr52163955ad.5.1781893697614;
        Fri, 19 Jun 2026 11:28:17 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:2be:fefc:d5b9 with SMTP id d9443c01a7336-2c718f1f1fcmr52163695ad.5.1781893697093;
        Fri, 19 Jun 2026 11:28:17 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c742fdd411sm1484765ad.0.2026.06.19.11.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 11:28:16 -0700 (PDT)
Message-ID: <c5feff91-9303-492c-a031-1b2a1e7f3b7c@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 23:58:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: advertise ieee_link_id in vdev
 start MLO params
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>,
        Karthik M <karthik.m@oss.qualcomm.com>
References: <20260619-ieee_link_id-v1-1-36cf573cb81d@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260619-ieee_link_id-v1-1-36cf573cb81d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE3NSBTYWx0ZWRfXxZX0LEyjU/8p
 OpSd/x39uYaGGSZUw5w3iOF+8po47BFvXKLig+N/MzLeWxEEZSFbj1pner8C1nmWLfdraXzWgVb
 a39u1GJJ4t+19hNSwnHnc5HVhxbjc00xw/X81Q2UvE3OYTsdFmFjeBCBoJ4LslZRcpxr4+wvohp
 PWvMOwBNKRwI49SB1BU/biqHujEzUjxOatReF9v7sYTojVyT+ARp8UAnQli2AN3xxKI2V0Xr7PG
 QaW8fxUQ4BTrivKM3IIA8q/HnaQOiTur6szcpDWdRyLI7WNAQWVuN5RSXqzWd1naVU/0FR8510v
 nZ7a1OINz/jIK3z34wSfv+4ZAZQDquAo5wpSY1EHar3HaJRbpsFQJoOONOFjhTbD6pJtXKI70aP
 SA1T8ZIZyKjH6ArJ06QgqgIV4yNEcsALAp6SpmPo8asOQTmXsoBvjlfazQTgI/Owbyf1G0C4rsM
 Lj0RQiqXr0odgP3G+Pw==
X-Authority-Analysis: v=2.4 cv=M9R97Sws c=1 sm=1 tr=0 ts=6a358a42 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uAiA4dPe5keY1A96IBkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6qYRSqfAiA51idFRfv4Y7r1ognh95vTL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE3NSBTYWx0ZWRfX5mX9TVGl2Zk5
 krFEE6rj2hoNnTccsv6e7jNpnzwh0geYls8L/3MC+XxNuOSwKGPt4UaikB30jz6lQT35VPaTkls
 BNEE2t99tv/s8wZcu4CNF+kSlp7688A=
X-Proofpoint-GUID: 6qYRSqfAiA51idFRfv4Y7r1ognh95vTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_112820_599537_E63DBA80 
X-CRM114-Status: GOOD (  24.99  )
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

On 6/19/2026 11:25 AM, Manish Dharanenthiran wrote:
> Firmware builds the AP MLD partner profile from the hw_link_id passed in
> the vdev start parameters. However, hw_link_id is not always the same as
> the logical per-MLD ieee_link_id, since ieee_link_id is assigned per MLD
> and not per pdev.
> 
> This matters in mixed MLO and SLO setups. For example:
> 
>    MLD 1 - 5 GHz + 6 GHz (2-link MLO): ieee_link_id 0 and 1
>    MLD 2 - 6 GHz only    (1-link SLO): ieee_link_id 0
>    MLD 3 - 5 GHz only    (1-link SLO): ieee_link_id 0
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
>    ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID         BIT(18) for the self link
>    ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER BIT(19) for partner links
> 
> Firmware parses ieee_link_id only when the matching flag is set.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
> Signed-off-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
> Co-developed-by: Karthik M <karthik.m@oss.qualcomm.com>
> Signed-off-by: Karthik M <karthik.m@oss.qualcomm.com>
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c |  3 +++
>   drivers/net/wireless/ath/ath12k/wmi.c | 32 ++++++++++++++++++++------------
>   drivers/net/wireless/ath/ath12k/wmi.h |  7 +++++++
>   3 files changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index af354bef5c0d..773ecd6da8e5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -11253,6 +11253,8 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
>   
>   	ml_arg->assoc_link = arvif->is_sta_assoc_link;
>   
> +	ml_arg->ieee_link_id = arvif->link_id;
> +
>   	partner_info = ml_arg->partner_info;
>   
>   	links = ahvif->links_map;
> @@ -11276,6 +11278,7 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
>   
>   		partner_info->vdev_id = arvif_p->vdev_id;
>   		partner_info->hw_link_id = arvif_p->ar->pdev->hw_link_id;
> +		partner_info->ieee_link_id = arvif_p->link_id;
>   		ether_addr_copy(partner_info->addr, link_conf->addr);
>   		ml_arg->num_partner_links++;
>   		partner_info++;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 84a31b953db8..a0e8b5678ae3 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -1228,10 +1228,14 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
>   				   le32_encode_bits(arg->ml.mcast_link,
>   						    ATH12K_WMI_FLAG_MLO_MCAST_VDEV) |
>   				   le32_encode_bits(arg->ml.link_add,
> -						    ATH12K_WMI_FLAG_MLO_LINK_ADD);
> +						    ATH12K_WMI_FLAG_MLO_LINK_ADD) |
> +				   cpu_to_le32(ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID);
>   
> -		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "vdev %d start ml flags 0x%x\n",
> -			   arg->vdev_id, ml_params->flags);
> +		ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
> +
> +		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "vdev %d start link_id %d ml flags 0x%x\n",

%u for vdev and link_id ?
Also this part of change is not describe in commit text.

> +			   arg->vdev_id, arg->ml.ieee_link_id,
> +			   le32_to_cpu(ml_params->flags));
>   
>   		ptr += sizeof(*ml_params);
>   
> @@ -1244,19 +1248,23 @@ int ath12k_wmi_vdev_start(struct ath12k *ar, struct wmi_vdev_start_req_arg *arg,
>   		partner_info = ptr;
>   
>   		for (i = 0; i < arg->ml.num_partner_links; i++) {
> +			struct wmi_ml_partner_info *pinfo = &arg->ml.partner_info[i];
> +
>   			partner_info->tlv_header =
>   				ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PARTNER_LINK_PARAMS,
>   						       sizeof(*partner_info));
> -			partner_info->vdev_id =
> -				cpu_to_le32(arg->ml.partner_info[i].vdev_id);
> -			partner_info->hw_link_id =
> -				cpu_to_le32(arg->ml.partner_info[i].hw_link_id);
> +			partner_info->vdev_id = cpu_to_le32(pinfo->vdev_id);
> +			partner_info->hw_link_id = cpu_to_le32(pinfo->hw_link_id);
>   			ether_addr_copy(partner_info->vdev_addr.addr,
> -					arg->ml.partner_info[i].addr);
> -
> -			ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "partner vdev %d hw_link_id %d macaddr%pM\n",
> -				   partner_info->vdev_id, partner_info->hw_link_id,
> -				   partner_info->vdev_addr.addr);
> +					pinfo->addr);
> +			partner_info->flags =
> +				cpu_to_le32(ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER);
> +			partner_info->ieee_link_id = cpu_to_le32(pinfo->ieee_link_id);
> +
> +			ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "partner vdev %d hw_link_id %d macaddr %pM link_id %d ml flags 0x%x\n",

%u for vdev_id, hw_link_id  and ieee_link_id ?

> +				   pinfo->vdev_id, pinfo->hw_link_id,
> +				   pinfo->addr, pinfo->ieee_link_id,
> +				   le32_to_cpu(partner_info->flags));
>   
>   			partner_info++;
>   		}
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index c452e3d57a29..51f3426e1fcd 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -2954,10 +2954,13 @@ struct wmi_vdev_create_mlo_params {
>   #define ATH12K_WMI_FLAG_MLO_EMLSR_SUPPORT		BIT(6)
>   #define ATH12K_WMI_FLAG_MLO_FORCED_INACTIVE		BIT(7)
>   #define ATH12K_WMI_FLAG_MLO_LINK_ADD			BIT(8)
> +#define ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID		BIT(18)
> +#define ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER	BIT(19)
>   
>   struct wmi_vdev_start_mlo_params {
>   	__le32 tlv_header;
>   	__le32 flags;
> +	__le32 ieee_link_id;
>   } __packed;
>   
>   struct wmi_partner_link_info {
> @@ -2965,6 +2968,8 @@ struct wmi_partner_link_info {
>   	__le32 vdev_id;
>   	__le32 hw_link_id;
>   	struct ath12k_wmi_mac_addr_params vdev_addr;
> +	__le32 flags;
> +	__le32 ieee_link_id;
>   } __packed;
>   
>   struct wmi_vdev_delete_cmd {
> @@ -3120,6 +3125,7 @@ struct wmi_ml_partner_info {
>   	bool primary_umac;
>   	bool logical_link_idx_valid;
>   	u32 logical_link_idx;
> +	u32 ieee_link_id;
>   };
>   
>   struct wmi_ml_arg {
> @@ -3127,6 +3133,7 @@ struct wmi_ml_arg {
>   	bool assoc_link;
>   	bool mcast_link;
>   	bool link_add;
> +	u32 ieee_link_id;
>   	u8 num_partner_links;
>   	struct wmi_ml_partner_info partner_info[ATH12K_WMI_MLO_MAX_LINKS];
>   };
> 
> ---
> base-commit: 63abe299b12b317dfee5bcd09037da4668a4431a
> change-id: 20260610-ieee_link_id-3424c332b216
> 
> 



--
Ramesh

