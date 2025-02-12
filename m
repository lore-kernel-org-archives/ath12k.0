Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219F5C02198
	for <ath12k@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfbHxXfLDJVGtgNZIgeGSymwLVT6zSrgg/aja6UrOP4=; b=dc6DjYMh3TTOI9pDsyziw1HQ47
	H3Jp96A2Th37UgBAIm01ri4hzQ1faOQF/yxPmXqsvXNQDroBy7iyugkUX6GATjIXNAMHtRp7CDjfS
	c4pFVYJfnh4YUkF4j15ZO7fIkh+TCUenxIq611356bzgp254eOjb3whrGNN/3L5oOGGZTaX+LiYxt
	7sJwAbn/7ccwvGEQK7A2Ldb0yWKDtMRvV8fYS+qCEj9N/jJwTZIrB6tcE4IqE78zzvYKj5aZxJ6fE
	PvmJz06THFvmush7BnDKszFWjqEi2VSJorpxR9SYFK8b01AlhDSJ7h344E3v2fSDp8RcGhCEkIzoc
	n7WferiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGk-00000008FRc-35TR
	for ath12k@archiver.kernel.org;
	Wed, 12 Feb 2025 17:11:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiG0b-00000008Bbc-3jSo
	for ath12k@lists.infradead.org;
	Wed, 12 Feb 2025 16:54:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C8AVUp003959
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 16:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfbHxXfLDJVGtgNZIgeGSymwLVT6zSrgg/aja6UrOP4=; b=NU8DpwJ8CmbsbmiF
	lsoXBD4n34MNA4ARVp5HzKP90RqInNXWXXHBR6njz5YKZcuXQmpkdHwq6ZNR1OzB
	YZWT9Cq4eZ/FnRIwA4iR2QTNWR2ZK25uc3VlqYxFj8tKQVGL1b+Zl640Jg/jvW1C
	0YNKYpwu5zgJBpM+8klt+0MB9jKIsq6vrVMCA39oKNVjfD9/sOlbS6C5MsA/n6O8
	d1UyD0gybZQ23wBSGlZ7fLXagn8/iUwKRuZVqcIvtC1Ke5MT1hizU0FynsgNpHw+
	vD9lcahJnutDSOTbmbtqgqXt4dA+M/4oSRj7oXhGnt34EPQCXuI12jST2hYEecO+
	tZqHiA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0gv3s1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 16:54:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fbfa786a1aso2850112a91.3
        for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 08:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379282; x=1739984082;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfbHxXfLDJVGtgNZIgeGSymwLVT6zSrgg/aja6UrOP4=;
        b=FNZzZAEOZ5cyHWCnDtToCOoDd6tTsNou650N142NZn8K7kxL2R4lVn9ayGix1YblYf
         HuVnmNNParaeEIqcCPyT314F/YhgmUaU3LkvArVE7mvFMQcQhJ8VRUwszCMHLcJgwQKu
         Sop8QH2Ya0UUKrYCxVPSxvsTF1HkmlkOjOjGktYUihPHPF/R8sfvICiklvQ0BOBBwqfq
         lSHXwXHzAc02T2hwoS4Aano+N5MNO3Hgy8Kj1lRVPmeGWzR1WrcAT7jZfIDnSHb+vZzi
         Zv/+Mb3YCPbcRNbplrZdotDUk5C9FST/2BBJQA+3fq56rwvOqUYP3FhLxdobmYGPOQ5X
         ndOg==
X-Forwarded-Encrypted: i=1; AJvYcCWAOObWMRgYze89laF59QBo+GqP6HluJGfQGXuh4xd2NQAMv8A6LBHxX1yHFHL7v1TaMJAPG6w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzcED/5el3hCtqSwy4AkudHnxkJ1ElLODzT492WMzcoPteYhcd
	MvhgIW3B9Q+uTCTPoe4hsSxFR9Aq8DB4AuqakFFxCDMtahD6WEvp/8DU3Duvh0X66w5C44Ptvpd
	onKjt34guwrucyOyO7rDkG11CD7kSP3SqBB51wqaViV+G1urOMlXsxPqtwQ2O
X-Gm-Gg: ASbGncuDAfMFyMURG+RJQfD5Bh3z8RKoEvwFouWnWCQd6ApCN3L4ytz6k5uF5PWFFuF
	tJua8r2mqWs5THOrO6iqOPeLVWMNbpziRemNKAapb+7EUsWj0kf7CMMxVssHz5IBvYGJpZV3FNF
	5VrNXnHr4dfnC+g3RqJ/7cIyFjEJhkuOJm40SL18bHQKR8H00gTU6Sc3IuwSA7v6Kx9srlXf8Z7
	ftohbrJG100Rww0z6zJEEOVgeNjNSxbM2tQHdueYLzSJMbUw0hfjvmRjnTj5ze+KI+0uJ87e9U2
	iyPLpYPTpfGpOl2QweiYse6/nzHxIJZoj+rvhozUH6AQ+aofj8URtgv9g2Xh
X-Received: by 2002:a17:90b:134f:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2fbf5bb5735mr6133330a91.4.1739379282022;
        Wed, 12 Feb 2025 08:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx+CWks0nvoqMOT5wEtwjJQXwKdPFly96tXraDduozSmPBMM+3wmzaLt6FvkicFgrTncPtIg==
X-Received: by 2002:a17:90b:134f:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2fbf5bb5735mr6133297a91.4.1739379281639;
        Wed, 12 Feb 2025 08:54:41 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf989bdcfsm1721378a91.3.2025.02.12.08.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:54:41 -0800 (PST)
Message-ID: <509cb1aa-a0d9-4444-9a54-0edc0b181d61@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 08:54:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: cleanup ath12k_mac_mlo_ready()
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Kalle Valo
 <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wyXZ6EAESxsmlAK_x4gW3AfPg2teIfCw
X-Proofpoint-GUID: wyXZ6EAESxsmlAK_x4gW3AfPg2teIfCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=728 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_085446_047306_8A8187B2 
X-CRM114-Status: GOOD (  10.12  )
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

On 2/10/2025 6:49 PM, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> This explicitly returns 0 without an error. Also removes goto that
> returned *ret* and simply returns in place.
> 
> Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1642337
> Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")

In the pending branch I changed this to:
Fixes: b716a10d99a2 ("wifi: ath12k: enable MLO setup and teardown from core")

To fix the checkpatch issue:
WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: b716a10d99a2 ("wifi: ath12k: enable MLO setup and teardown from core")'

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=c2f7ae223cd3d781c69337dc804f1fae95789cdd


