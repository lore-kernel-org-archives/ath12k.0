Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5417E77180
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LRB74TS7aAZ65rDLYYop9ew9kjmQm4OjhhBw9zbRgk=; b=VqkbsOTRqe0btcR+4Ot9LFaIow
	oZIFeslQWjaYgw3XCqH7Im8mXzhai+UVq/oft1dA9UZBqodyayGeYsKtYwrZrHu88IQ7osW6yzjJC
	FsftBIFKuX5GWXi+4W2lO3ntO5U/eSBPMSIMX78r/RHCD2WB4NhcW+BcCY2Tzsu6OKJVU9WQptocD
	3yexZJbudGH8cCWLaikbnP18h9kmhFmc9ThRZgX2BLxrYS4mKCFDj//UqxpprUY2v2MlmLtXgyv4o
	w61xXzBKVy2BXcZtrpUNO7t+qosXUXSZ8d6EtF1CoDwEpD3d+Tj6Vb09K4j0pO3bBUmlLNF/VlGjB
	JOdvpRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKifZ-00000008uCf-2ryp
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:39:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKifW-00000008uB1-2ApW
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:39:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GrRPv029735
	for <ath12k@lists.infradead.org>; Mon, 9 Dec 2024 18:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2LRB74TS7aAZ65rDLYYop9ew9kjmQm4OjhhBw9zbRgk=; b=WvSEN2T7XZ7OPr87
	CtqIgOW1QFxIS9+mpVeCAABeiUfmN9xQcKAZHSfnbMycTvPo61wFh995xlKpT+Uc
	pAOo091tgZAuI7Dt/HsgNlGZ7ps0vt8UAtWLsAesmEfyTc0j5nsrXXeXfvMZVY2i
	dC76RYJ6RyokA69/ghHcrD/mPAeTY80AlrEgr5YIT7/MRLWdJ6/foK5zkcGb6InQ
	PG4s+vKthcTA1VBpce6ubuK0NVPbAI+so+HLzSM1ug7q8A0UY2oISmDj37QEj2E4
	J0wDTt5UDd7p8GblslXy0306nLseW0RzQs4CoH/1x/Eg/ulgaTlG1/jVSTiKLHlQ
	CzfBKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetp189-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 18:39:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21655569152so9822445ad.2
        for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 10:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769579; x=1734374379;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LRB74TS7aAZ65rDLYYop9ew9kjmQm4OjhhBw9zbRgk=;
        b=eKSnV/weiLQg6/ZlAd+5Kz8s0Qdoye1kgNP1kGRX5/ngnLYzDor9jLFXW++trwmlXF
         uIpvYW73UTLqcGKiheDVr0FNzsApE+KzBnVD7p+7svp04H6OPVaQDGjSBzIAthcxaoja
         K2TkM2oyzRJPFo3zyNBEkFjyCIvw1ZPOSadq+SvenZ+VUR9txXIbJ3DknYEChwqUXG59
         3BrNGVCnL4sKltgSdPBU0wOcOzM774czPMcJeFyZqOSppAEhXsaC39/CWXn/v0ofV5ui
         dp14uYe4FotQrWNKGqNgEQErFfETucOxIfKXVavw7B1NoTMo/xnLSfQ4C+n68fsaE0Y0
         Jiww==
X-Forwarded-Encrypted: i=1; AJvYcCVP55CoT4GVSLJ3WvVxjJTnchbGRrej724AtEn4afokNf2oNX5dbgj5WaHR4mxqQr3DJF7DVkE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8D0q50KpEK6JHn2nQBEHp6JKTGYSXctC6yzEYrrq/zvMX554F
	bzovnSeaBZ/qJSKNKfk/pwT+nHEMlyP/07uP4VGrXmgork17HmrbeDAPKtTQKc68YYRygbX2qgg
	uoAfebMWiscGkKNmRtK5MmrDsMymmB6Sm9SpZQ+yyUPEhuj3l6Fllx80S07qf
X-Gm-Gg: ASbGnctPgOD+9CYUz6rm/LjlDCyaEIUJUhKjzdYUsdYRSU6Bc1IgNwdf6mh59cPbYnH
	aRLved3HY15SOybVgomf43G3L1UgN94JYKsS0Uucml2xnl969IcVBqhQZtQTgi6s76tsB95o8R8
	95GU68Y6Kzlpi0pO0Eta88c081KRp/miDTiLWhUz1mvEiUjJqaUi66OUqTC6CAIkBfVKrywgCZp
	FvsYdUyhPvxOT6TpPNirC2ryyxXJ1ZtT552kz4dvd9k3A/5b6WpwLj6edoCWZyfBoYqtRKPKj4k
	bPPXIi7uIhLgOlqiEdUHoPLduEdA7mlhMWOplrjz1rw=
X-Received: by 2002:a17:902:d583:b0:216:5b8b:9062 with SMTP id d9443c01a7336-2166a066e8dmr23508345ad.54.1733769578710;
        Mon, 09 Dec 2024 10:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGRrrYY1+/oEmCNwrACPw6WHa5roX7/eq1nAR1S1hEfaf1ofhqsiOCsZVOVp9LKt0gg0jfRA==
X-Received: by 2002:a17:902:d583:b0:216:5b8b:9062 with SMTP id d9443c01a7336-2166a066e8dmr23508045ad.54.1733769578341;
        Mon, 09 Dec 2024 10:39:38 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216413a6c92sm28572965ad.249.2024.12.09.10.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 10:39:38 -0800 (PST)
Message-ID: <cd5ef876-d849-4d7b-b8b7-94377e8720f0@oss.qualcomm.com>
Date: Mon, 9 Dec 2024 10:39:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 wireless-next] wifi: ath12k: Fix out-of-bounds read in
 ath12k_mac_vdev_create
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>, kvalo@kernel.org,
        ath12k@lists.infradead.org
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241207071306.325641-1-dheeraj.linuxdev@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241207071306.325641-1-dheeraj.linuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Pmyj77446xTZyvgU6dv-UGajQHSaLLIU
X-Proofpoint-ORIG-GUID: Pmyj77446xTZyvgU6dv-UGajQHSaLLIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_103942_681720_CAB05321 
X-CRM114-Status: GOOD (  36.46  )
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

On 12/6/2024 11:13 PM, Dheeraj Reddy Jonnalagadda wrote:
> Add a bounds check to ath12k_mac_vdev_create() to prevent an out-of-bounds
> read in the vif->link_conf array. The function uses link_id, derived from
> arvif->link_id, to index the array. When link_id equals 15, the index
> exceeds the bounds of the array, which contains only 15 elements.
> 
> This issue occurs in the following code branch:
> 
>     if (arvif->link_id == ATH12K_DEFAULT_SCAN_LINK && vif->valid_links)
>         link_id = ffs(vif->valid_links) - 1;
>     else
>         link_id = arvif->link_id;
> 
> When the first condition in the if statement is true and the second
> condition is false, it implies that arvif->link_id equals 15 and
> the else branch is taken, where link_id is set to 15, causing an
> out-of-bounds access when vif->link_conf array is read using link_id
> as index.
> 
> Add a check to ensure that link_id does not exceed the valid range of the
> vif->link_conf array. Log a warning and return -EINVAL if the check fails
> to prevent undefined behavior.
> 
> Changelog:
> 
> v2:
> 	- Updated the commit message as per the reviewer's suggestions
> 	- Clarified the description of the bug in the commit message
> 	- Added Fixes and Closes tags with relevant information

As Kalle already mentioned, the changelog should come "after the cut"
Please refer to:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

Namely:
One good use for the additional comments after the --- marker is for a
diffstat...
Other comments relevant only to the moment or the maintainer, not suitable for
the permanent changelog, should also go here. A good example of such comments
might be patch changelogs which describe what has changed between the v1 and
v2 version of the patch.

> 
> Fixes: 90570ba4610 ("wifi: ath12k: do not return invalid link id for scan link")
> Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602214

there should not be a blank line here

Also I just joined the Coverity "linux" project. I have access to the
dashboard, but don't see that particular CID. Since you've been a member for a
few months, is there something special I need to do to see that CID?
Or is this CID in a project other than "linux"? I ask because I'm looking at
A CID in the latest snapshot of "linux" and the URL is:
https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1636666

So I'm guessing your CID is from a different project?

> 
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> ---

to reiterate, the changelog goes here, with the latest version described first.

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

Note that I don't need you to send a new patch if Kalle ACKs the current one;
I can fixup the patch in the "pending" branch. But I would like to make
sure I can see the CID in Coverity, so please let me know if I'm subscribed to
the correct project.

/jeff

