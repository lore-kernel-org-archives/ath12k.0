Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315CFE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKHquatXccdUE/8FhYJaY/jFJDVvrfnYD3Ug+2HTmy8=; b=4ukeb7fRygt6u5TMRfXAF/k+cF
	QwXGXOx6ZE/q8SQBOr2/XMSvnbFZy2aIRFOUpiQYPOSGOlVgDjg6e/0FnxJ6iA6vEB5lXwgPrGOGn
	oZ4x24XtbnP7lQFsJw72XI0K1XR0SyVSVPgKESIYJtalCIyzW8qXER97CF8xCw9ewFeCHI0OHZtOc
	vNG3hs+CjaXSAx+tjUjGq3tEYMyG6ZaV5GmkvD1luKV++0gZo/cqv8E9mztL71uoLGCWvz1dmV0xs
	am5g9gXHK3/k2WKwv0YfubI+7u/ObgkL39kr2VQjZM2bQifZjHdDAx3djSf8twBtqAotsroJVeibG
	+tcM0nWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJekz-00000002fWb-3y7B
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 20:16:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJebI-00000002e6h-1u84
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 20:06:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6HxZHM006909
	for <ath12k@lists.infradead.org>; Fri, 6 Dec 2024 20:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKHquatXccdUE/8FhYJaY/jFJDVvrfnYD3Ug+2HTmy8=; b=S1h+AfyOjqMTTgJ/
	gr+qYBj2xjNG5oh1e2IfKszOwlRWkENgmKr+99r/VoWXnHVMnuzfx7ZDkiw8BdFg
	ydB21ySmgyf0NnVpz9ZCNCFphUNiLBoKRzUvx7h4pfJSqdxyENO8NFgqf/g9wsCj
	4BqVfo8+9ChWx8sDwx7Fa/ItophUj+N6hy9DyEBLvbAermapTb5b4ZEh6p9TS212
	j3ysGxPMUn25LE+ZSC3m0/8+rudAZR89N5z6cfasdgNtMhcVZVhcexN1WhgpCnFZ
	ptcwNvGic89qIDMGo4srVuKOwO9hIv7t8ignhA13kKZcj1lqnZzbFaOd1S7oQobU
	srWnKQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben8c5tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 20:06:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-725b7e1cd5aso907044b3a.0
        for <ath12k@lists.infradead.org>; Fri, 06 Dec 2024 12:06:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733515613; x=1734120413;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKHquatXccdUE/8FhYJaY/jFJDVvrfnYD3Ug+2HTmy8=;
        b=fzoIAVmqOkURviBPyzWS4OXU3OyiuhcO0AA6PkKGGyNy5Sdshq/2yfxoLzgFhcI/gG
         tKPQW2/tegus8PmEX4knam4OtWtNTZvhLhBD9HGNIyuy9zBqXtvl8n7qE3TUaNeF2YJy
         plIm6758TrI824bMFyREFZ34PjKjvlW7Kr4PNR/0OObKZU8esv44U7Nc1tfP78B/uB/J
         BI8QIKOv35epVOIFmsF0GqWldLvO5PKhY8u4OAyd7Glk09W9oOdwR7v7ZhVDjL6DwJHh
         Om70XMgDlMi2NrGqy1JN0XGtXXpchQ4pteAFqR9ZTOmwdlcfW+2L1HaL+EieY0zQZESP
         0X9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHJyULbdZtEddc9zXAqsawT1shASkx8VyZvhgXclD6qBm0JSBS8QexuXYRabE736qu7mQHU0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvqBxyeX352Y5QlrEPgjOyS40M17QV78djNdLC0+44xW3c0ffp
	9PJIOfl55xWuvkzgrGskT/qItHNs2CKWTKlJVxVAgCcRa/dKd9FPEU+5sCsCF4xk54l9zLZl0C/
	+pUTALKBJIbSC9x/URD7UjjNsiiqFfS9fFvy0FDFbM5xaEp5SAoLd7DMJFx2u
X-Gm-Gg: ASbGncsD50Znd04XU23zXIK9N+3x0qXJDeUoZ8BQxmhqC78aOjFMhKx8RKYYT0L0q3z
	GcFNh5DqBgZneuncmD+cEfOjEtoyXN5XQFWbaBWsCrFZlcC2spzXB4jeFlXff4UASkhIE3PrcI0
	NgyMdkRBJiRfy8StHKmIADKISnc1rI49xX+AqTBsk0lg/35/WI2WgM5zqOSnmCoaJoQPx7GzfpC
	zGInEbO02oDri2kj0R1PPuA7Ij7HesXH1J6h5OjJOe9R7P/Ck4CopTcl/mU4u3sxyvGVVfnhcRi
	jnosnOMd3upbVxXwfvtlNOCIrzuozT0wB6EkEoXDEVQ=
X-Received: by 2002:a17:902:ea11:b0:216:282d:c69e with SMTP id d9443c01a7336-216282dd891mr11067685ad.23.1733515613491;
        Fri, 06 Dec 2024 12:06:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH09o+jP8XVNXDbXOcJarG/czPCA5tRwQQW5YRkwI50Z0sDJXkcLgUikTDd6q1KEnYVPVQ8cg==
X-Received: by 2002:a17:902:ea11:b0:216:282d:c69e with SMTP id d9443c01a7336-216282dd891mr11067315ad.23.1733515613088;
        Fri, 06 Dec 2024 12:06:53 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3f0b5sm32531665ad.20.2024.12.06.12.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 12:06:52 -0800 (PST)
Message-ID: <8c019176-6bb5-467c-bcea-10517675de7d@oss.qualcomm.com>
Date: Fri, 6 Dec 2024 12:06:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: ath12k: Fix out-of-bounds read
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>, kvalo@kernel.org,
        ath12k@lists.infradead.org
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241206073542.315095-1-dheeraj.linuxdev@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241206073542.315095-1-dheeraj.linuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n0wxapTMhWv1IVmFEgUZyAvkuZ_LqhWe
X-Proofpoint-GUID: n0wxapTMhWv1IVmFEgUZyAvkuZ_LqhWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_120656_543466_F9B93390 
X-CRM114-Status: GOOD (  25.10  )
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

On 12/5/2024 11:35 PM, Dheeraj Reddy Jonnalagadda wrote:

The subject should be as specific as possible while still fitting on one line.
Ideally the subject should be unique. So at a minimum I'd add "in
ath12k_mac_vdev_create()"

> This patch addresses the Out-of-bounds read issue detected by
> Coverity (CID 1602214). The function ath12k_mac_vdev_create() accesses
> the vif->link_conf array using link_id, which is derived from
> arvif->link_id. In cases where arvif->link_id equals 15, the index

How can arvif->link_id equal 15? Does Coverity actually identify a code path
where this can occur?

> exceeds the bounds of the array, which contains only 15 elements.This

nit: space after .

> results in an out-of-bounds read.
> 
> This issue occurs in the following branch of the code:
> 
>     if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
>         link_id = ffs(vif->valid_links) - 1;
>     else
>         link_id = arvif->link_id;
> 
> When arvif->link_id equals 15 and the else branch is taken, link_id is
> set to 15.
> 
> This patch adds a bounds check to ensure that link_id does not exceed

See
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes>
and specifically:
<quote>
Describe your changes in imperative mood, e.g. “make xyzzy do frotz” instead
of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do frotz”, as
if you are giving orders to the codebase to change its behaviour.
</quote>

So this should start: "Add a bounds check...

> the valid range of the vif->link_conf array. If the check fails, a
> warning is logged, and the function returns an error code (-EINVAL).

again use imperative mood (log a warning, return an error)

> 

Prior to the SOB you should at least have two other tags:
Fixes: <refer to the patch that introduced the bug>
Closes: <the public url of the coverity report>

> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 129607ac6c1a..c19b10e66f4a 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -7725,6 +7725,12 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
>  	else
>  		link_id = arvif->link_id;
>  
> +	if (link_id >= ARRAY_SIZE(vif->link_conf)) {
> +		ath12k_warn(ar->ab, "link_id %u exceeds max valid links for vif %pM\n",
> +			    link_id, vif->addr);
> +		return -EINVAL;
> +	}
> +
>  	link_conf = wiphy_dereference(hw->wiphy, vif->link_conf[link_id]);
>  	if (!link_conf) {
>  		ath12k_warn(ar->ab, "unable to access bss link conf in vdev create for vif %pM link %u\n",


